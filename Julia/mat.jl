# defining sizes
matSize = 250
iter = 30

# initialising matrices
mat1 = zeros(Int32,matSize,matSize)
mat2 = zeros(Int32,matSize,matSize)
ans = zeros(Int32,matSize,matSize)
times = zeros(Float64,iter)

function CPUtime_us()
    rusage = Libc.malloc(4*sizeof(Clong) + 14*sizeof(UInt64))  # sizeof(uv_rusage_t); this is different from sizeof(rusage)
    ccall(:uv_getrusage, Cint, (Ptr{Nothing},), rusage)
    utime = UInt64(1000000)*unsafe_load(convert(Ptr{Clong}, rusage + 0*sizeof(Clong))) +    # user CPU time
                            unsafe_load(convert(Ptr{Clong}, rusage + 1*sizeof(Clong)))
    stime = UInt64(1000000)*unsafe_load(convert(Ptr{Clong}, rusage + 2*sizeof(Clong))) +    # system CPU time
                            unsafe_load(convert(Ptr{Clong}, rusage + 3*sizeof(Clong)))
    ttime = utime + stime  # total CPU time
    Libc.free(rusage)
    return ttime
end

for q = 1:iter 
    for i = 1:matSize
        for j = 1:matSize 
            mat1[i,j] = convert(Int32, rand(0:1))
            mat2[i,j] = convert(Int32, rand(0:1))
        end
    end
    s = CPUtime_us()
    for i = 1:matSize
        for j = 1:matSize 
            for k =1:matSize
                ans[i,j] = ans[i,j] + mat1[i,k] * mat2[k,j]
            end
        end
    end
    e = CPUtime_us()
    times[q] = convert(Float64, (e-s))/1e6
end
using DelimitedFiles
writedlm(ARGS[1],times)
