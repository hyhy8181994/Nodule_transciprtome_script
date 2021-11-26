#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=24:00:00
#SBATCH --job-name=corset
#SBATCH --cpus-per-task=12
#SBATCH --mem=50G
#SBATCH --output=%x-%j.out

module load samtools

corset=/home/rhuang06/projects/def-gd38/rhuang06/software/corset
bam_alfalfa=/home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/sorted_bowtie2.bam
bam_clover=/home/rhuang06/scratch/trinity_new_assembly/clover/assembly/sorted_bowtie2.bam


cd /home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/
$corset -D 99999999999 $bam_alfalfa

cd /home/rhuang06/scratch/trinity_new_assembly/clover/assembly/
$corset -D 99999999999 $bam_clover
