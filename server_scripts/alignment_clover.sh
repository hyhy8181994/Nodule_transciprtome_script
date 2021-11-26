#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=20:00:00
#SBATCH --job-name=bowtie_QC
#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --output=%x-%j.out

module load samtools bowtie2

bowtie2-build SuperDuper.fasta SuperDuper.fasta

bowtie2 -p 12 -q --no-unal -k 20 -x SuperDuper.fasta -1 /home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim \
-2 /home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/scratch/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim \
2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam
