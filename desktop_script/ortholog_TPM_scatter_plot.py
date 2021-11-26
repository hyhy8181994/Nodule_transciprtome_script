import pandas as pd
import matplotlib.pyplot as plt
from numpy import log10

#draw scatter plot of alfalfa gene tpm vs. clover gene tpm    
def draw_scatter(table,out):
    alfalfa_tpm_list = []
    clover_tpm_list = []
    with open(table,"r") as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            if float(row[1]) != 0 and float(row[3]) != 0:
                alfalfa_tpm_list.append(float(row[1]) )
                clover_tpm_list.append(float(row[3]))

    if len(alfalfa_tpm_list) == len(clover_tpm_list):
        print("same length")
    
    out_file = open(out + "/ortholog_tpm_no_zero.txt","w")
    out_file.write("alfalfa_tpm\tclover_tpm\n")
    for a,c in zip(alfalfa_tpm_list,clover_tpm_list):
        out_file.write("{}\t{}\n".format(a,c))
    #plt.style.use('fivethirtyeight')
    fig, ax = plt.subplots()
    
    x = log10(alfalfa_tpm_list)
    y = log10(clover_tpm_list)
    ax.scatter(x,y, s = 1, color = "black")
    ax.set_xlabel("alfalfa log10 tpm")
    ax.set_ylabel("clover log10 tpm")
    #ax.set_xlim((0,500))
    #ax.set_ylim((0,500))
    #fig.show()
    fig.savefig("{}/ortholog_tpm_scatter.png".format(out))
    

folder = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1"
ortholog_table = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/orthologs_geneid.txt"
draw_scatter(ortholog_table,folder)