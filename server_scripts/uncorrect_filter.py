import multiprocessing
import os
import sys
import subprocess
import argparse

parser = argparse.ArgumentParser(description='run FilterUncorrectabledPEfastq.py script')
parser.add_argument('-i',required=True,help='folder of corrected reads')
parser.add_argument('-s',required=True,help='location of FilterUncorrectabledPEfastq.py')

args = vars(parser.parse_args())

def fastq_run(folder_path):
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
            fastq_files_list = [folder_path + "/" + R1_file,folder_path + joined_R2_file, ini_file_name]
            fastp_infile_dict.update({count:fastq_files_list})
    return(fastp_infile_dict)

#multiple processing function
def multiple_fun(num):
    pair_file = fast_dict[num]
    script = args["s"]
    print("processing {} and {}".format(pair_file[0],pair_file[1]))
    os.system("python2 {} -1 {} -2 {} -s {}".format(script,pair_file[0],pair_file[1],pair_file[2]))
    print("processing {} and {}".format(pair_file[0],pair_file[1]))


if __name__ == "__main__":
    
    fastq_folder_path = args["i"]
    fast_dict = fastq_run(fastq_folder_path)
    script = args["s"]
    pool = multiprocessing.Pool(processes = 12)
    pool.map(multiple_fun, range(1,len(fast_dict.keys()) + 1))

    '''
    os.system("cd /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover_filtered/")

    fastq_folder_path = "/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover"
    fast_dict = fastq_run(fastq_folder_path)
    script = "/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/scripts/FilterUncorrectabledPEfastq.py"
    pool = multiprocessing.Pool(processes = 12)
    pool.map(multiple_fun, range(1,len(fast_dict.keys()) + 1))
    '''