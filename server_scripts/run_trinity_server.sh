#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=32:00:00
#SBATCH --job-name=new_trinity_RNA_seq_2
#SBATCH --cpus-per-task=24
#SBATCH --mem=100G
#SBATCH --output=%x-%j.out

#ssh -Y rhuang06@graham.computecanada.ca

#load modules
module load scipy-stack
module load trinity samtools
module load StdEnv/2020  gcc/9.3.0  openmpi/4.0.3
module load salmon/1.3.0 bowtie2 jellyfish

mkdir -p /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/
mkdir -p /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa
mkdir -p /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover

#cd /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa

#alfalfa
#Trinity --seqType fq --left /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq \
#--right /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq \
#--trimmomatic --quality_trimming_params "SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:25" --max_memory 100G --CPU 24


cd /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover

#clover

Trinity --seqType fq --left /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq \
--right /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq --output /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa \
--trimmomatic --quality_trimming_params "SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:25" --max_memory 100G --CPU 24




