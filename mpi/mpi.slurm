#!/bin/bash -l
#SBATCH --job-name=parallel_vector_mpi
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:01:00
#SBATCH --output=out.log

module load python numpy mpi4py

time srun -N 1 -n 12 python matrix_add.py
time srun -N 1 -n 24 python matrix_add.py
time srun -N 2 -n 48 python matrix_add.py
