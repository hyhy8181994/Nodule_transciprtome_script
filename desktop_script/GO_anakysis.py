import pandas as pd

def get_all_GO(infile,out,type):
    df = pd.read_table(infile)
    alfalfa_GO = list(df["GO"])
    #clover_GO = list(df["clover_GO"])

    alfalfa_id = list(df["Geneid"])
    #clover_id = list(df["clover_id"])
    
    
    
    with open(out + "/{}_GOterm.txt".format(type),"w") as file:
        for i,id in zip(alfalfa_GO,alfalfa_id):
            if i != "None" and i != "nan":
                try:
                    temp_list = i.split(",")
                    for t in temp_list:
                        file.write(id + "\t" + t.strip(" ") + "\n")
                except:
                    pass
    '''
    with open(out + "/clover_GOterm_"+ type + ".txt","w") as file:

        for i,id in zip(clover_GO,clover_id):
            if i != "None":
                temp_list = i.split(",")
                for t in temp_list:
                    file.write(id + "\t" + t.strip(" ") + "\n")
    '''
        

def load_GO_obo(infile):
    GO_term_dict = {}
    file = open(infile,"r")
    for l in file:
        if "[Term]" in l:
            for num in range(1,21):
                next_line = next(file,num)
                if next_line == "\n":
                    break
                if "id: " in next_line:
                    GO_id = next_line.strip("\n").split(": ")[1]
                
def intersection(lst1, lst2):
    lst3 = [value for value in lst1 if value in lst2]
    return lst3

def GO_merge(infile,out):
    out_file = open(out + "/merge_GO_up.txt","w")
    with open(infile) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            id = info[0]
            merge_list = info[3].split(",")
            temp_list = info[4].split(",")
            for i in temp_list: 
                merge_list.append(i)
            try:
                merge_list.remove("None")
            except:
                pass
            merge_list = list(set(merge_list))
            for i in merge_list:
                if i != "None":
                    out_file.write("{}\t{}\n".format(id,i.strip(" ")))
            #ovrelap = intersection(info[3].split(","),info[4].split(","))
            #print(info[3].split(","))
            #print(info[4].split(","))
            
if __name__ == '__main__':
    GO_file = "/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/conserved_alfalfa_tpm_descend_with_annotation.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm"
    
    get_all_GO(GO_file,folder,"alfalfa_conserve")
    
    #GO_bob = "/home/rui-huang/Documents/RNA_seq_doc/GO/go-basic.obo"
    #load_GO_obo(GO_bob)

    #Deseq_ann = "/home/rui-huang/Documents/RNA_seq_doc/deseq2/alfalfa_vs_clover_DE_annotated_up.txt"
    #GO_merge(Deseq_ann,folder)
