#!/bin/bash

#ssh -Y rhuang06@graham.computecanada.ca
#/home/rhuang06/projects/def-gd38/rhuang06 dir in graham.computecanada.ca
#/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq dir of the RNA seq folder in server

#/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data
#/home/rhuang06/scratch



#set up current dir
script_path=$(pwd -L)
cd ../tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/ # dir of RNA seq data
RNA_path=$(pwd -L) #path for raw data

cd $script_path 

mkdir -p ../RNA_seq_QC # make dir for raw data fastqc output
cd ../RNA_seq_QC 
raw_fastqc_path=$(pwd -L) # fastqc output folder for raw data

cd ../../FastQC # locate to fastqc software folder
fastqc_path=$(pwd -L)
#run fastqc for raw data
##./fastqc $RNA_path/* -o $raw_fastqc_path -t 16

cd $script_path
#run fastp for preprocessing
##python3 ./run_fastp.py



#run fastqc again for preprocessed data
cd ../Trimmed_data
Trimmed_data_path=$(pwd -L)
cd ..$script_path
mkdir -p ../preprocessed_data_QC
cd ./preprocessed_data_QC
preprocessed_data_QC_path=$(pwd -L) #fastQC output folder for preprocessed data from fastp
cd $fastqc_path

#./fastqc $Trimmed_data_path/* -o $preprocessed_data_QC_path -t 16 # run fastqc

cd $Trimmed_data_path
mkdir -p ./alfalfa
mkdir -p ./clover

mv *_alfalfa_* ./alfalfa
mv *_clover_* ./clover

