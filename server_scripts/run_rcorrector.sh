#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=60:00:00
#SBATCH --job-name=rcorrector
#SBATCH --cpus-per-task=24
#SBATCH --mem=64G
#SBATCH --output=%x-%j.out


module load nixpkgs/16.09  gcc/7.3.0
module load rcorrector

#rcorrector script path
#script=/home/rui-huang/Documents/Rcorrector-master/run_rcorrector.pl

unzip /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/tcag-data.zip

gunzip -d /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/*.gz

#output path
out_a=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/alfalfa
out_c=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover

/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX

mkdir -p $out_a
mkdir -p $out_c

#alfalfa 

rcorrector -t 48 -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R1_001.fastq \
-2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R2_001.fastq \
-od $out_a
 
 #clover
rcorrector -t 48 -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R1_001.fastq \
 -2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R2_001.fastq \
 -od $out_c
 
