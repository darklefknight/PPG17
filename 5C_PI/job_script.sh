#!/bin/bash


#Jobscript, eine Mpi Anwendung startet
## Ankahl der Rechenknoten:
#SBATCH -N 10
##Anzahl der Prozesse Pro knoten:
#SBATCH --ntasks-per-node=4
##Anzahl der Threads pro Prozess (für uns immer =1)
#SBATCH --cpus-per-task=1
## Welche Knoten sollen benutzt werden:
#SBATCH --partition=west


## wohin soll der Output des programms geschrieben weren
#SBATCH --output=job.out


## Einrichten der mpi und score-p Umgebung:
export MPICH_NEMESIS_NETMOD=tcp

spack load -r mpi scorep

export SCOREP_ENABLE_TRACING=true
export SCOREP_TIMER='gettimeofday'


## Ausführen der Anwendung:
mpiexec ./main.x
