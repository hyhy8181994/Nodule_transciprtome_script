import pickle as pk
import argparse

parser = argparse.ArgumentParser(description='Annotate DEGs')

parser.add_argument('-up',required=True,help='filtered deseq2 output file for alfalfa (up_deseq2.txt)')
parser.add_argument('-down',required=True,help='filtered deseq2 output file for clover (down_deseq2.txt)')
parser.add_argument('-o',required=True,help='output folder')
parser.add_argument("-b",required=True,help="a binary file produced from assign_ortholog_group.py (alfalfa_clover_ortholog_translation.dat)")
parser.add_argument('-aa',required=True,help='alfalfa annotation file (e.g. alfalfa_filtered_annotations_1.tsv)')
parser.add_argument('-ca',required=True,help='cover annotation file (e.g. clover_filtered_annotations_1.tsv)')
args = vars(parser.parse_args())

def annotation(al_annotation,cl_annotation,orth_dict,deseq2,out,dir):
    al_dict = {}
    cl_dict = {}
    with open(al_annotation) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            if info[2] != "None":
                GO = info[10].strip(" ")
                if GO == "nan":
                    GO = "None"
            elif info[2] == "None" and info[3] != "None":
                GO = info[12].strip(" ")
            prediction = info[-1]
            al_dict.update({info[1]:[GO,prediction]})
    with open(cl_annotation) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            if info[2] != "None":
                GO = info[10].strip(" ")
                if GO == "nan":
                    GO = "None"
            elif info[2] == "None" and info[3] != "None":
                GO = info[12].strip(" ")
            prediction = info[-1]
            cl_dict.update({info[1]:[GO,prediction]})

    out_file = open(out + "/alfalfa_vs_clover_DE_annotated_{}.txt".format(dir),"w")
    ortholog_tran_dict = pk.load(open(orth_dict,"rb"))
    
    with open(deseq2_file) as file:
        lines = file.readlines()
        header = ["alfalfa_id","clover_id","log2foldchange","alfalfa_GO","clover_GO","alfalfa_functional_prediction","clover_functional_prediction"]
        lines = lines[1::]
        out_file.write("\t".join(header) + "\n")
        for l in lines:
            info = l.strip("\n").split("\t")
            alfalfa_id = info[0]
            clover_id = ortholog_tran_dict[alfalfa_id]
            log2foldchang = info[2]
            try:
                al_an = al_dict[alfalfa_id]
            except:
                al_an = ["None","None"]
            try:
                cl_an = cl_dict[clover_id]
            except:
                cl_an = ["None","None"]

            out_file.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(alfalfa_id,clover_id,log2foldchang,al_an[0],cl_an[0],al_an[1],cl_an[1]))

if __name__ == '__main__':
    
    '''
    alfalfa_annotation = "/home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_filtered_annotations_1.tsv"
    clover_annotation = "/home/rui-huang/Documents/RNA_seq_doc/blast/clover_filtered_annotations_1.tsv"
    
    ortholog_dict = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/alfalfa_clover_ortholog_translation.dat"
    deseq2_file = "/home/rui-huang/Documents/RNA_seq_doc/deseq2/up_deseq2.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/deseq2"
    '''
    deseq2_file = args["up"]
    ortholog_dict = args["b"]
    alfalfa_annotation = args["aa"]
    clover_annotation = args["ca"]
    folder = args["o"]
    
    annotation(alfalfa_annotation,clover_annotation,ortholog_dict,deseq2_file,folder,"up")
    
    
    deseq2_file = args["down"]
    
    
    annotation(alfalfa_annotation,clover_annotation,ortholog_dict,deseq2_file,folder,"down")
