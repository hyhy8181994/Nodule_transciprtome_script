#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=30:00:00
#SBATCH --job-name=star_alfalfa_twopass
#SBATCH --cpus-per-task=24
#SBATCH --mem=90G
#SBATCH --output=%x-%j.out

star=/home/rhuang06/projects/def-gd38/rhuang06/software/STAR/bin/Linux_x86_64_static/STAR

GENOMEDIR=/home/rhuang06/scratch/alfalfa_lace

#$star --runThreadN 48 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuperTrans.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 61000000000 --genomeSAindexNbases 12

#first pass
$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_1_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_4_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_6_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim




#second pass
$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_1 --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_alfalfa_1_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_4_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_alfalfa_4_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_6_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_alfalfa_6_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim

