import pandas as pandas
import os

def table (inpath,outpath):
    file_list = os.listdir(inpath)
    for file in file_list:
        name = file.split("_")[1:6]
        name = "_".join(name)
        print(name)
        with open(inpath + file,"r") as f:
            for line in f:
                if "Total reads processed" in line:
                    total_reads_pro = line.split(":")[1]
                    total_reads_pro = total_reads_pro.strip(" ")
                    total_reads_pro = total_reads_pro.strip("\n")
                    total_reads_pro = total_reads_pro.split(",")
                    total_reads_pro = "".join(total_reads_pro)
                    total_reads_pro = int(total_reads_pro)
                    

if __name__ == '__main__':
    alfalfa_path = "/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/alfalfa/report/"
    clover_path = "/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/clover/report/"
    output = "/home/rui-huang/Documents/RNA_seq_doc/Table/"
    table(alfalfa_path,output)