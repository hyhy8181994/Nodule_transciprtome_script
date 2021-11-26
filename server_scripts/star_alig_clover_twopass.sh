#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=30:00:00
#SBATCH --job-name=star_clover_twopass
#SBATCH --cpus-per-task=24
#SBATCH --mem=90G
#SBATCH --output=%x-%j.out

star=/home/rhuang06/projects/def-gd38/rhuang06/software/STAR/bin/Linux_x86_64_static/STAR

GENOMEDIR=/home/rhuang06/scratch/clover_lace

#$star --runThreadN 48 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuperTrans.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 88000000000 --genomeSAindexNbases 12

#first pass
$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_2_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_5_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_3_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim



#second pass
$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_2_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_2_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_5_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_5_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim

$star --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_3_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_3_SJ.out.tab\
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim
