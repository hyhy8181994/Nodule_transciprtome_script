from Bio import SeqIO
import pandas as pd

def table(fasta_file, mature,PI,matrix):
    out_file_1 = open("./mature_NCR_tab.txt","w")
    out_check = open("./delect_id.txt",'w')
    mature_dict = {}
    record = SeqIO.parse(open(mature),"fasta")
    for N_id in record:
        mature_dict.update({N_id.id.split(";")[0].strip(">"):N_id.seq})
        out_file_1.write("{}\t{}\n".format(N_id.id.split(";")[0].strip(">"),N_id.seq))
    
    matrix_df = pd.read_csv(matrix)
    id_order = list(matrix_df.iloc[:,0])
    
    PI_dict = {}           
    with open(PI) as file:
        
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split(",")
            PI_dict.update({info[0]:info[1]}) 
    
    id_list = []
    length_list = []
    n_cys_list = []
    PI_list = []
    for id in id_order:
        length = len(mature_dict[id])
        n_cys = mature_dict[id].count("C")
        PI_value = PI_dict[id]
        #normalize cys num
        if int(n_cys) > 6:
            n_cys = 6
            #print(id)
        elif int(n_cys) == 5:
            n_cys = 5
            #print(id)
        elif int(n_cys) < 4:
            n_cys = "no"
        if length > 75:
            print(id)
        
        if n_cys != 'no':
            id_list.append(id)
            length_list.append(length)
            n_cys_list.append(n_cys)
            PI_list.append(PI_value)
        else:
            out_check.write(id + "\n")
    
    main_df = pd.DataFrame(id_list, columns=["id"])
    main_df["length"] = length_list
    main_df["n_cys"] = n_cys_list
    main_df["PI"] = PI_list
    main_df.to_csv("./NCR_data_table.txt",index=False)    
        


if __name__ == '__main__':

    NCR_fasta = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_merge.fasta"
    NCR_mature = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_mature.fasta"
    PI_table = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_PI_table.txt"
    alignment_matrix = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/alg_data_matrix.txt"
    table(NCR_fasta, NCR_mature, PI_table, alignment_matrix)


