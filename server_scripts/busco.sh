#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=24:00:00
#SBATCH --job-name=busco
#SBATCH --cpus-per-task=12
#SBATCH --mem=50G
#SBATCH --output=%x-%j.out

module load nixpkgs/16.09  gcc/7.3.0  openmpi/3.1.4 gcccore/.5.4.0 intel/2018.3 icc/.2016.4.258, ifort/.2016.4.258

module load busco

corset=/home/rhuang06/projects/def-gd38/rhuang06/software/corset
bam_alfalfa=/home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/sorted_bowtie2.bam
bam_clover=/home/rhuang06/scratch/trinity_new_assembly/clover/assembly/sorted_bowtie2.bam


cd /home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/
$corset -D 99999999999 $bam_alfalfa

cd /home/rhuang06/scratch/trinity_new_assembly/clover/assembly/
$corset -D 99999999999 $bam_clover
