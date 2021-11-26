#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=24:00:00
#SBATCH --job-name=uncorrect_filter
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --output=%x-%j.out


script=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/scripts/uncorrect_filter.py

mkdir -p /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/alfalfa_filtered/

mkdir -p /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover_filtered/

cd /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/alfalfa_filtered/


python3 $script





