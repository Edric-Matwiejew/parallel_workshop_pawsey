#!/bin/bash


#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --partition=gpuq

#module load gcc/8.3.0 cuda/10.2

module load singularity cuda
export SINGULARITYENV_CUDA_HOME=$CUDA_HOME

time srun singularity exec --nv -C python mnist.py
