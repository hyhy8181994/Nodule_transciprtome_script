#!/bin/bash



GENOMEDIR=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer



#STAR --runThreadN 24 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuperTrans.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 61000000000 --genomeSAindexNbases 12

#first pass
#STAR --runMode alignReads --runThreadN 24 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
#--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_1_ \
#--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
#/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim.fq

#STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
#--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_4_ \
#--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
#/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim.fq

#STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
#--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_alfalfa_6_ \
#--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim.fq \
#/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim.fq




#second pass
#STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
#--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_1_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_alfalfa_1_SJ.out.tab \
#--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
#/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim.fq

STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_4_ --sjdbFileChrStartEnd $GENOMEDIR/star/first_run_alfalfa_4_SJ.out.tab \
--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim.fq,/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim.fq

#STAR --runMode alignReads --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60 \
#--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/second_run_alfalfa_6_ $GENOMEDIR/star/first_run_alfalfa_6_SJ.out.tab \
#--readFilesIn /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim.fq \
#/media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim.fq
