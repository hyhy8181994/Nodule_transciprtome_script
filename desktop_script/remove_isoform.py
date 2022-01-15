import os
from Bio import SeqIO
import argparse


parser = argparse.ArgumentParser(description='Remove isoforms of genes based on the metadata provided from transdecoder (for blast)')
parser.add_argument('-i',required=True,help='input fasta file')
parser.add_argument('-o',required=True,help='output folder (abs path)')


args = vars(parser.parse_args())

def remove_iso(fasta,out,na):
    fasta_dict = SeqIO.to_dict(SeqIO.parse(fasta, "fasta"))
    
    length_dict = {}
    with open(fasta,"r") as f:
        for l in f:
            if ">" in l:
                seq = ""
                info = l.strip("\n")
                header = l.strip(">").split(" ")
                name = header[0]
                if "TRINITY" in name:
                    contig_name = "_".join(name.split("_")[:4])
                else:
                    contig_name = ".".join(name.split(".")[:2])
                length = float(header[5].split(":")[1])
                try:
                    contig_length = length_dict[contig_name][1]
                    if length > contig_length:
                        length_dict.update({contig_name:[name,length]})
                except:
                    length_dict.update({contig_name:[name,length]})
    
    file = open(out + "new_" + na + "_pro.fasta", "w+")
    for key, item in length_dict.items():
        info = fasta_dict[item[0]]
        file.write(">"+ info.description + "\n")
        file.write(str(info.seq)+ "\n")
    file.close()

    file = open(out + na + "_gene_id.txt", "w+")
    for key, item in length_dict.items():
        info = fasta_dict[item[0]]
        file.write(info.id + "\n")
    file.close()
        



   
            






if __name__ == "__main__":
    
    alfalfa_fasta = args["i"]
    folder_alfalfa = args["o"] + "/"
    remove_iso(alfalfa_fasta,folder_alfalfa,"alfalfa")
    #clover_fasta = "/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep"
    #folder_clover = "/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/"
    #remove_iso(clover_fasta,folder_clover,"clover")