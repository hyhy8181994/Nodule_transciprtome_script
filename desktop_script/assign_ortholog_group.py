import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
from numpy import log10
from numpy import mean
import pickle as pk
import argparse

parser = argparse.ArgumentParser(description='Extract one_to_one ortholog from ortholofinder output (use alfalfa_vs_clover file), \
create a table of raw counts and tpm of orthologs for differential expression analysis, \
calculate the length of alfalfa and clover genes also for differential expression analysis')

parser.add_argument('-i',required=True,help='ortholofinder output (alfalfa__v__clover.tsv)')
parser.add_argument('-o',required=True,help='output folder')
parser.add_argument('-at',required=True,help='alfalfa gene id and trans id tab separate file')
parser.add_argument('-ct',required=True,help='clover gene id and trans id tab separate file')
parser.add_argument('-as',required=True,help='salmon_merge.py alfalfa tpm output file (e.g. alfalfa_triplicate_salmon_tpm.txt)')
parser.add_argument('-cs',required=True,help='salmon_merge.py clover tpm output file (e.g. clover_triplicate_salmon_tpm.txt)')
parser.add_argument('-al',required=True,help='salmon_merge.py alfalfa gene length info file (e.g. alfalfa_length.txt)')
parser.add_argument('-cl',required=True,help='salmon_merge.py clover gene length info file (e.g. alfalfa_length.txt)')
args = vars(parser.parse_args())


def ortholog_group(orth_file,af_trans_list,cl_trans_list,al_tpm,cl_tpm,out):
    alfalfa_ortholog_dict = {}
    clover_ortholog_dict = {}
    total_dict = {}
    alfalfa_out = open(out + "/onetoone_ortholog_file.txt","w")
    ortholog_count = open(out + "/orthologs_count.txt","w") # id transcript count file
    ortholog_geneid = open(out + "/orthologs_geneid.txt","w") #id average tpm file 
    #clover_out = open(out + "/" + "clover_ortholog_file.txt","w")
    header = ["alfalfa_geneid","alfalfa_1_count","alfalfa_4_count","alfalfa_6_count","clover_2_count","clover_3_count","clover_5_count\n"]
    header_1 = ["alfalfa_geneid","clover_geneid","alfalfa_1_count","alfalfa_4_count","alfalfa_6_count","clover_2_count","clover_3_count","clover_5_count\n"]
    header_2 = ["alfalfa_geneid","average_tpm","clover_geneid","average_tpm\n"]
    alfalfa_out.write("\t".join(header))
    ortholog_count.write("\t".join(header_1))
    ortholog_geneid.write("\t".join(header_2))
    #clover_out.write("clover_transid\talfalfa_geneid\taverage_tpm\talfalfa_geneid\taverage_tpm\tortholog_group\n")
    al_trans_dict = {}
    cl_trans_dict ={}
    al_tpm_dict = {}
    cl_tpm_dict = {}
    ortholog_id_dict = {}


    with open(af_trans_list) as file:
        for l in file:
            info = l.strip("\n").split(" ")
            al_trans_dict.update({info[3]:info[1]})
    with open(cl_trans_list) as file:
        for l in file:
            info = l.strip("\n").split(" ")
            cl_trans_dict.update({info[3]:info[1]})
    #print(trans_dict)
    
    #read alfalfa tpm table
    with open(al_tpm) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            al_tpm_dict.update({info[0]:info[1::]})
    #read clover tpm table
    with open(cl_tpm) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            cl_tpm_dict.update({info[0]:info[1::]})
    
    
    with open(orth_file) as file:
        lines = file.readlines()
        lines = lines[1::]
        alfalfa_id_dict = {}
        clover_id_dict = {}
        for l in lines:
            info = l.strip("\n").split("\t")
            ortholog_group = info[0]
            alfalfa_id_list = info[1]
            clover_id_list = info[2]
            alfalfa_id = alfalfa_id_list.split(",")
            clover_id = clover_id_list.split(",")
            alfalfa_gene_id_list = alfalfa_id_list.split(",")
            clover_gene_id_list = clover_id_list.split(",")
            alfalfa_gene_id_list = list(set([al_trans_dict[i.split(".p")[0].strip(" ")] for i in alfalfa_gene_id_list]))
            clover_gene_id_list = list(set([cl_trans_dict[i.split(".p")[0].strip(" ")] for i in clover_gene_id_list]))
            
            if len(alfalfa_gene_id_list) == 1 and len(clover_gene_id_list) == 1:
                
                try:
                    hit = alfalfa_id_dict[alfalfa_gene_id_list[0]]
                    if hit == clover_gene_id_list[0]:
                        pass
                    else:
                        alfalfa_id_dict.pop(alfalfa_gene_id_list[0])
                except:
                    alfalfa_id_dict.update({alfalfa_gene_id_list[0]:clover_gene_id_list[0]})
    
    #pk.dump(alfalfa_id_dict,open(out + "/all_ortholog.dat","wb"))

    mark_alfalfa_dict = list(alfalfa_id_dict.keys())            
    
    for key,value in alfalfa_id_dict.items():
        try:
            hit_1 = clover_id_dict[value]
            if hit_1 != key:
                mark_alfalfa_dict.pop(key)
        except:
            clover_id_dict.update({value:key})

           
    
    for id in mark_alfalfa_dict:
        alfalfa_ortholog_dict.update({id:alfalfa_id_dict[id]})

        #gene_id_a = al_trans_dict[id.split(".p")[0].strip(" ")]
        clover_id_wirte = alfalfa_ortholog_dict[id]     
        
        try:
            tpm_1 = al_tpm_dict[id][0:3]
                        
        except:
            tpm_1 = ["0"]*3
        try:
            tpm_2 = cl_tpm_dict[alfalfa_id_dict[id]][0:3]
        except:
            tpm_2 = ["0"]*3


        alfalfa_out.write("{}\t{}\t{}\n".format(id,"\t".join(tpm_1),"\t".join(tpm_2)))
        ortholog_count.write("{}\t{}\t{}\t{}\n".format(id,clover_id_wirte,"\t".join(tpm_1),"\t".join(tpm_2)))
        ortholog_geneid.write("{}\t{}\t{}\t{}\n".format(id,al_tpm_dict[id][3],clover_id_wirte,al_tpm_dict[id][7]))
            
    pk.dump(alfalfa_ortholog_dict,open(out + "/alfalfa_clover_ortholog_translation.dat","wb"))
    
    
    
    return(alfalfa_ortholog_dict)
    
def get_average_length(al_df,cl_df,ortholog_dict,o_table,out):
    al_df = pd.read_csv(al_df)
    cl_df = pd.read_csv(cl_df)
    total_length_list = []
    al_dict = dict(zip(al_df["alfalfaGeneid"],al_df["Length"]))
    cl_dict = dict(zip(cl_df["cloverGeneid"],cl_df["Length"]))
    out_file = open(out + "/ortholog_avglength.txt", "w")
    one_df = pd.read_table(o_table)    
    header = ["alfalfa_geneid","alfalfa_1_count","alfalfa_4_count","alfalfa_6_count","clover_2_count","clover_3_count","clover_5_count\n"]

    out_file.write("{}\n".format("\t".join(header)))
    for id in one_df["alfalfa_geneid"]:
        length_list = [al_dict[id],cl_dict[ortholog_dict[id]]]
        average_length = mean(length_list)
        total_length_list.append(average_length)
        
        #get average use average_length
       
        alfalfa_length = [str(average_length)]*3
        #clover_length = [str(total_length_list[1])]*3
        
        out_file.write("{}\t{}\t{}\n".format(id,"\t".join(alfalfa_length),"\t".join(alfalfa_length)))

        #out_file.write()

    
    #total_df = pd.DataFrame(ortholog_dict.keys(),columns = ["alfalfa_Geneid"])
    #total_df["average_length"] = total_length_list
    #total_df.to_csv(out + "/ortholog_length.txt", index= False)

'''
#draw scatter plot of alfalfa gene tpm vs. clover gene tpm    
def draw_scatter(table,out):
    df = pd.read_table(table)
    
    fig, ax = plt.subplots()
    
    x = log10(df.iloc[:,1])
    y = log10(df.iloc[:,3])
    ax.scatter(x,y, s = 1)
    ax.set_xlabel("alfalfa log10 tpm")
    ax.set_ylabel("clover log10 tpm")
    #ax.set_xlim((0,500))
    #ax.set_ylim((0,500))
    fig.show()
    fig.savefig("{}/ortholog_tpm_scatter.png".format(out))
'''    

                

if __name__ == '__main__':
    '''
    ortholog_file = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/Orthologues/Orthologues_alfalfa/alfalfa__v__clover.tsv"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1"
    alfalfa_trans_id_list = "/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer/alfalfa_transid_2.txt"
    clover_trans_id_list = "/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer/clover_transid_2.txt"
    alfalfa_tpm = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt"
    clover_tpm = "/home/rui-huang/Documents/RNA_seq_doc/clover_triplicate_salmon_tpm.txt"
    '''
    ortholog_file = args["i"]
    folder = args["o"]
    alfalfa_trans_id_list = args["at"]
    clover_trans_id_list = args["ct"]
    alfalfa_tpm = args["as"]
    clover_tpm = args["cs"]

    
    alfalfa_ortholog_dict = ortholog_group(ortholog_file,alfalfa_trans_id_list,clover_trans_id_list,alfalfa_tpm,clover_tpm,folder)
    
    '''
    onetoone_table = folder + "/onetoone_ortholog_file.txt"
    alfalfa_length_df = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_length.txt"
    clover_length_df = "/home/rui-huang/Documents/RNA_seq_doc/clover_length.txt"
    '''
    onetoone_table = folder + "/onetoone_ortholog_file.txt"
    alfalfa_length_df = args["al"]
    clover_length_df = args["cl"]

    get_average_length(alfalfa_length_df,clover_length_df,alfalfa_ortholog_dict,onetoone_table,folder)
    
    
    '''
    orhtolog_table = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/orthologs_count.txt"
 
    ortholog_table = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/orthologs_geneid.txt"
    draw_scatter(ortholog_table,folder)
    '''
    