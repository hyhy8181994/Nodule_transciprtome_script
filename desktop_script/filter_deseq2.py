import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='Filter deseq2 output')

parser.add_argument('-i',required=True,help='deseq2 output file (alfalfa_vs_clover_DE.txt)')
parser.add_argument('-o',required=True,help='output folder')


def filter(infile,out):
    df = pd.read_csv(infile)
    counter = 0
    counter_1 = 0
    counter_2 = 0
    out_file = open(out + "/up_deseq2.txt","w")
    column_list = df.columns.to_list()
    out_file.write("\t".join(column_list) + "\n")
    out_file_1 = open(out + "/down_deseq2.txt","w")
    out_file_1.write("\t".join(column_list) + "\n")
    for index, row in df.iterrows():
        info = list(row)
        if "MK" not in info[0]:
            if info[5] < 0.05:
                counter += 1
                if info[2] >= 5:
                    info_1 = [str(i) for i in info]
                    out_file.write("\t".join(info_1) + "\n")
                    
                    counter_1 += 1
                if info[2] <= -5:
                    info_1 = [str(i) for i in info]
                    out_file_1.write("\t".join(info_1) + "\n")
                    counter += 1
                    counter_2 += 1
    print("total DEGs {}\n".format(counter))
    print("up-regulated in alfalfa {}".format(counter_1))
    print("up-regulated in clover {}".format(counter_2))
if __name__ == '__main__':
    '''
    deseq_file = "/home/rui-huang/Documents/RNA_seq_doc/deseq2/alfalfa_vs_clover_DE.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/deseq2"
    '''
    
    deseq_file = parser["i"]
    folder = parser["o"]
    filter(deseq_file,folder)
    