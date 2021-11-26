import os
import sys
import subprocess
import argparse

parser = argparse.ArgumentParser(description='run trim galore')
parser.add_argument('-i',required=True,help='location of input reads')
parser.add_argument('-o',required=True,help='output folder')
parser.add_argument('-s',required=True,help='location of trim_galore script')

args = vars(parser.parse_args())
def trim(folder_path,out_path):
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
            ini_file_name = split_file_name_R1[1:5]
            joined_R2_file = "_".join(split_file_name_R2)
            ini_file_name = "_".join(ini_file_name)
            fastq_files_list = [folder_path + "/" + R1_file,folder_path + "/" + joined_R2_file, ini_file_name]
            fastp_infile_dict.update({count:fastq_files_list})
    for num in range(1,len(fastp_infile_dict.keys()) + 1):
        pair_file = fastp_infile_dict[num]
        script= args["s"]
        #no further trimming
        os.system("perl {} --paired --fastqc -j 12 --phred33 --output_dir {} --length 25 -q 20 --stringency 1 -e 0.1 {} {}".format(script,out_path,pair_file[0],pair_file[1]))

if __name__ == '__main__':
    #correct_path = "/home/rui-huang/Documents/RNA_seq_doc/corrected_reads/alfalfa/"
    #out_folder = "/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/alfalfa/"
    #trim(correct_path,out_folder)

    correct_path = args["i"]
    out_folder = args["o"]
    trim(correct_path,out_folder)