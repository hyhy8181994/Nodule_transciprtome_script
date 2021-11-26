import os
import sys
import subprocess
import multiprocessing

def get_files(folder_path,output_folder):
    fastp_infile_dict = dict()
    count = 0
    for f in os.listdir(folder_path):  # loop the fastq files
        split_file_name = f.split("_")
        if "pair" in split_file_name:
            in_fastq_file = f
            out_file_name_R1 = "_".join(split_file_name[1:4]) + "_R1.fastq"
            print(out_file_name_R1)
if __name__ == "__main__":
    fastq_folder_path = "/home/rui-huang/Documents/RNA_seq_doc/interlacer/alfalfa/"
    out_path = "/home/rui-huang/Documents/RNA_seq_doc/deinterlacer/alfalfa"
    get_files(fastq_folder_path,out_path)