import os
import sys
import subprocess

#this script is used to recreate the trimmomatic trimming in trinity software process

def trimmomatic(folder_path,output_folder):
    #set up the dictionary as pairs of fastq files
    fastp_infile_dict = dict()
    count = 0
    for f in os.listdir(folder_path):  # loop the fastq files
        split_file_name = f.split("_")
        if "R1" in split_file_name:
            count += 1
            R1_file = f
            split_file_name_R1 = R1_file.split("_")
            split_file_name_R2 = split_file_name_R1 
            split_file_name_R2[5] = "R2"
            split_file_name_R2[8] = "2.fq"
            joined_R2_file = "_".join(split_file_name_R2)
            fastq_files_list = [R1_file,joined_R2_file]
            fastp_infile_dict.update({count:fastq_files_list})
    #print(fastp_infile_dict)
    for num in range(1,len(fastp_infile_dict.keys()) + 1):
        pair_file = fastp_infile_dict[num]
        #no further trimming
        os.system("trimmomatic PE -phred33 ")

if __name__ == "__main__":
    fastq_path = "/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/alfalfa/fastq/"
    output = "/home/rui-huang/Documents/RNA_seq_doc/trimmomatic_data/alfalfa/"
    trimmomatic(fastq_path,output)