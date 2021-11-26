#!/bin/bash

#rcorrector script path
script=/home/rui-huang/Documents/Rcorrector-master/run_rcorrector.pl

#output path
out_a=/home/rui-huang/Documents/RNA_seq_doc/corrected_data/alfalfa
out_c=/home/rui-huang/Documents/RNA_seq_doc/corrected_data/clover

#alfalfa 

perl $script -t 24 -1 /home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R1_001.fastq \
-2 /home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R2_001.fastq \
-od $out_a
 
 #clover
 
perl $script -t 24 -1 /home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R1_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R1_001.fastq \
 -2 /home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R2_001.fastq,/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R2_001.fastq \
 -od $out_c
 
