#!/bin/bash



GENOMEDIR=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer



#STAR --runThreadN 24 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuperTrans.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 99000000000 --genomeSAindexNbases 12


#first pass
STAR --runMode alignReads --runThreadN 24 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_2_ \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim.fq
'''
STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_3_ \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim.fq
'''
STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_clover_5_ \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim.fq



'''
#second pass
STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_2 --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_2_SJ.out.tab \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim.fq

STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_3_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_3_SJ.out.tab \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim.fq

'''

STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM Unsorted --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_clover_5_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_clover_5_SJ.out.tab \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim.fq
