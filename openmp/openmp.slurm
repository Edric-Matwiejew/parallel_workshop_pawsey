#!/bin/bash -l
#SBATCH --job-name=parallel_vector_openmp
#SBATCH --partition=workq
#SBATCH --nodes=1
#SBATCH --time=00:01:00
#SBATCH --output=output.log

module load gcc

gfortran -fopenmp matrix_add.f90 -o vector_add

time srun -N 1 -n 1 -c 1 ./matrix_add
time srun -N 1 -n 1 -c 12 ./matrix_add
time srun -N 1 -n 1 -c 24 ./matrix_add
