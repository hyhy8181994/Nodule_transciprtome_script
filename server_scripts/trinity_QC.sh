#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=20:00:00
#SBATCH --job-name=bowtie_QC_2
#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --output=%x-%j.out

module load samtools bowtie2


#alfalfa=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/transcriptome_assembly/alfalfa/Trinity.fasta
clover=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/transcriptome_assembly/clover/Trinity.fasta


bowtie2 -p 10 -q --no-unal -k 20 -x $clover -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R1_001.fastq -2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R2_001.fastq 2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam 


