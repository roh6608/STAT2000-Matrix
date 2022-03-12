#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define MAT_SIZE 250
#define ITER 30

int main(int argc, char *argv[]){
	int i, j, k, q;
	int mat1[MAT_SIZE][MAT_SIZE], mat2[MAT_SIZE][MAT_SIZE], ans[MAT_SIZE][MAT_SIZE];
	clock_t start, end;
	FILE *results;

	results = fopen(argv[1], "w");

	for(q=0;q<ITER;q++){
		for(i=0;i<MAT_SIZE;i++){
			for(j=0;j<MAT_SIZE;j++){
				mat1[i][j] = rand() % 2;
				mat2[i][j] = rand() % 2;
				ans[i][j] = 0;
			}
		}

	start = clock();
	for(i=0;i<MAT_SIZE;i++){
		for(j=0;j<MAT_SIZE;j++){
			for(k=0;k<MAT_SIZE;k++){
				ans[i][j] = ans[i][j] + mat1[i][k] * mat2[k][j];
			}
		}
	}
	end = clock();
	fprintf(results,"%f\n",((double)end-(double)start)/CLOCKS_PER_SEC);
	}
	fclose(results);

	return 0;
}
