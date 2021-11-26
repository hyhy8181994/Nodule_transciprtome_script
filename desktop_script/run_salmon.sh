#!/bin/bash

alfalfa=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer
clover=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer

alfalfa_bam=/home/rui-huang/Documents/RNA_seq_doc/star_alfalfa/two_pass_super_id/second_run_Aligned.sortedByCoord.out.bam
clover_bam=/home/rui-huang/Documents/RNA_seq_doc/star_clover/two_pass/second_run_Aligned.sortedByCoord.out.bam

alfalfa_gff=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/supertranscripts.wOrfs.gff3
clover_gff=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/supertranscripts.wOrfs.gff3

out=/home/rui-huang/Documents/RNA_seq_doc/salmon

#build salmon index
salmon index -i $alfalfa/alfalfa_transcripts.idx -t $alfalfa/SuperDuper.fasta -k 31 -p 24

salmon index -i $clover/clover_transcripts.idx -t $clover/SuperDuper.fasta -k 31 -p 24

#alfalfa

salmon quant -p 24 -o $out/alfalfa_1 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim.fq


salmon quant -p 24 -o $out/alfalfa_4 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim.fq



salmon quant -p 24 -o $out/alfalfa_6 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim.fq


#clover
salmon quant -p 24 -o $out/clover_2 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim.fq



salmon quant -p 24 -o $out/clover_3 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim.fq


salmon quant -p 24 -o $out/clover_5 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim.fq  \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim.fq



