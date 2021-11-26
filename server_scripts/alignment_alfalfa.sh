#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=20:00:00
#SBATCH --job-name=bowtie_QC
#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --output=%x-%j.out

module load samtools bowtie2

bowtie2-build SuperDuper.fasta SuperDuper.fasta

bowtie2 -p 12 -q --no-unal -k 20 -x SuperDuper.fasta -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim \
-2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim \
2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam
