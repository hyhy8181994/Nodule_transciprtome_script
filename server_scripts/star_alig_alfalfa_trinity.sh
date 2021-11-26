#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=20:00:00
#SBATCH --job-name=star_alfalfa_trinity
#SBATCH --cpus-per-task=24
#SBATCH --mem=90G
#SBATCH --output=%x-%j.out



star=/home/rhuang06/projects/def-gd38/rhuang06/software/STAR/bin/Linux_x86_64_static/STAR

GENOMEDIR=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/supertranscript/new_lace

mkdir -p $GENOMEDIR/star_index
mkdir -p $GENOMEDIR/star

$star --runThreadN 48 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/trinity_genes.fasta --sjdbGTFfile $GENOMEDIR/trinity_genes.gtf --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 88000000000 --genomeSAindexNbases 12


$star --runMode alignReads --twopassMode Basic --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim
