#!/bin/bash
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno18/lab3/lab-git
#SBATCH -J cut_fastq
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --hint=compute_bound

FASTQ_DIR=/home/alumno18/lab3/lab-git

FILES=($FASTQ_DIR/*.fastq)

echo "Archivos detectados:"
printf "%s\n" "${FILES[@]}"

echo "Lanzando 4 procesos en paralelo..."

# Ejecuta el script file-cut.sh en paralelo con srun, 1 tarea = 1 CPU
for f in "${FILES[@]}"; do
    srun -n1 ./file-cut.sh "$f" &
done

wait

echo "Todos los archivos han sido procesados."

