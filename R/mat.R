# define sizes
matSize = 250
iter = 30

# initialise matrices and vector
mat1 = matrix(0,nrow=matSize,ncol=matSize)
mat2 = matrix(0,nrow=matSize,ncol=matSize)
ans = matrix(0,nrow=matSize,ncol=matSize)
times = matrix(0,nrow=iter,ncol=1)

for(q in 1:iter){  
  for(i in 1:matSize){
    for(j in 1:matSize){
      mat1[i,j] = as.integer(floor(2*runif(1,0,1)))
      mat1[i,j] = as.integer(floor(2*runif(1,0,1)))
      ans[i,j] = as.integer(0)
    }
  }
  
  start = proc.time()
  for(i in 1:matSize){
    for(j in 1:matSize){
      for(k in 1:matSize){
        ans[i,j] = ans[i,j] + mat1[i,k] * mat2[k,j]
      }
    }
  }
  end = proc.time()
  
  times[q] = end[1]-start[1]
}

args = commandArgs(trailingOnly = T)
write(times,args[1])
