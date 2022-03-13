import numpy as np
import time as t
import sys as s

matSize = 250
iters = 10
times = np.zeros(iters)

for q in range(iters):
	mat1 = np.zeros([matSize,matSize])  
	mat2 = np.zeros([matSize,matSize])  
	ans = np.zeros([matSize,matSize])

	for i in range(matSize):
		for j in range(matSize):
			mat1[i,j] = np.intc(np.random.randint(0,2))
			mat2[i,j] = np.intc(np.random.randint(0,2))
			ans[i,j] = np.intc(0)
	
	start = t.perf_counter()
	for i in range(matSize):
		for j in range(matSize):
			for k in range(matSize):
				ans[i,j] = ans[i,j] + mat1[i,k] * mat2[k,j]
	times[q] = t.perf_counter() - start

results = open(s.argv[1], "w")

for i in range(iters):
	results.write(str(times[i])+"\n")

results.close()
