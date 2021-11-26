import pandas as pd
import os
import sys
import subprocess

def cor_table(in_path,out_path):
    file_list = os.listdir(in_path)
    line_dict = {}
    for file in file_list:
        name = file.split(".")[0]
        name = name.split("_")[1:5]
        #open(table_path + "corrected_table.csv","w")
        with open(in_path + file, 'r') as f:
            column_name = []
            stats = []
            if "alfalfa" in name:
                number = name[2]
                for l in f:
                    line = l.split(":")
                    column_name.append(line[0])
                    stats.append(int(line[1].strip("\n")))
                line_dict.update({"alfalfa_" + number : stats})
            if "clover" in name:
                number = name[2]
                for l in f:
                    line = l.split(":")
                    column_name.append(line[0])
                    stats.append(int(line[1].strip("\n")))
                line_dict.update({"clover_" + number : stats}) 
    df = pd.DataFrame.from_dict(line_dict)
    df.index = column_name
    df.to_csv(table_path + "correct_table.csv", index=True)
if __name__ == '__main__':
    cor_path = "/home/rui-huang/Documents/RNA_seq_doc/corrected_reads/log/"
    table_path = "/home/rui-huang/Documents/RNA_seq_doc/Table/"
    cor_table(cor_path,table_path)