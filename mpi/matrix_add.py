from mpi4py import MPI
import numpy as np

COMM = MPI.COMM_WORLD

size = COMM.Get_size()
rank = COMM.Get_rank()

n = 48000
n_local = n//size

A_local = np.full((n_local,n_local), 1, dtype = np.float64)
B_local = np.full((n_local,n_local), 2, dtype = np.float64)
C_local = np.zeros((n_local, n_local), dtype = np.float64)

C_local = A_local + B_local

if rank != 0:
	C = None
else:
	C = np.empty(n*n, dtype = np.float64)

COMM.Gather(C_local, C)

C = np.reshape(C, (n,n))
