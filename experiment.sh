#!/bin/bash
echo "Updating repository to latest"
git pull
echo "Deleting previous experiment results"
rm -r results
mkdir results

for((counter=1;counter<=$1;counter++))
do
cd ./C && gcc mat.c -o c-mat && ./c-mat "./c-results${counter}.txt" && cd .. && echo "C-lang Complete"

cd ./fortran && gfortran mat.f90 -o f-mat && ./f-mat "./f-results${counter}.txt" && cd .. && echo "Fortran-lang Complete"

cd ./Julia && julia mat.jl "./j-results${counter}.txt" && cd .. && echo "Julia-lang Complete"

cd ./R && Rscript mat.R "./r-results${counter}.txt" && cd .. && echo "R-lang Complete"

cd ./Python && python3 mat.py "./p-results${counter}.txt" && cd .. && echo "Python-lang Complete"

mv "./C/c-results${counter}.txt" ./results/ && mv "./fortran/f-results${counter}.txt" ./results && mv "./R/r-results${counter}.txt" ./results/ && mv "./Python/p-results${counter}.txt" ./results/ && mv "./Julia/j-results${counter}.txt" ./results/
done
echo "Experiment Complete"
