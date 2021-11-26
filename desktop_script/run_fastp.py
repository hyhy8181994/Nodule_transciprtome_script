import os
import sys
import subprocess
import argparse

parser = argparse.ArgumentParser(description='run fastq for paired reads of alfalfa and clover')
parser.add_argument('-i',required=True,help='folder of raw reads')
parser.add_argument('-o',required=True,help='output folder')

args = vars(parser.parse_args())
#set up fastq files for fastp software
#pile up the pairs of fastq files (R1 and R2)
def fastq_run(folder_path,output_folder):
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
            split_file_name_R2[4] = "R2"
            joined_R2_file = "_".join(split_file_name_R2)
            fastq_files_list = [R1_file,joined_R2_file]
            fastp_infile_dict.update({count:fastq_files_list})
    #print(fastp_infile_dict)
    for num in range(1,len(fastp_infile_dict.keys()) + 1):
        pair_file = fastp_infile_dict[num]
        #no further trimming
        os.system("fastp -i {} -o {} -I {} -O {} -w 16 -V -h -r --cut_right -W 4 -M 15 -c --detect_adapter_for_pe".format(folder_path + pair_file[0],output_folder + "out_" + pair_file[0],folder_path + pair_file[1],output_folder + "out_" + pair_file[1])) #fastp command line without trimming paired, 24 threads, verbose, html reports, per read cutting by quality score (move a sliding window from front to tail, if meet one window with mean quality < threshold) with defualt cut_right_window_size and cut_right_mean_quality set as 15, enable base correction for PE data with default setting

if __name__ == "__main__":
    fastq_folder_path = args["i"] + "/"
    fastp_trimmed_output_folder = args["o"] + "/"
    if not os.path.exists(fastp_trimmed_output_folder):
        os.makedirs(fastp_trimmed_output_folder)
    fastq_run(fastq_folder_path,fastp_trimmed_output_folder)
    
            
        