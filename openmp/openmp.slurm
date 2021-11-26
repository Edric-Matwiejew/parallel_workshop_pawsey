#!/bin/bash -l
#SBATCH --job-name=parallel_vector_openmp
#SBATCH --partition=workq
#SBATCH --nodes=1
#SBATCH --time=00:01:00
#SBATCH --output=output.log

module load gcc

gfortran -fopenmp vector_add.f90 -o vector_add

time srun -N 1 -n 1 -c 1 ./vector_add
time srun -N 1 -n 1 -c 12 ./vector_add
time srun -N 1 -n 1 -c 24 ./vector_add

