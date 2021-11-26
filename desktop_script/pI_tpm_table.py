import pandas as pd

def pI_tpm(table,out):
    main_dict = {}
    with open(table) as file:
        for l in file:
            info = l.strip("\n").split("\t")
            main_dict.update({info[0]:info[1::]})
    df = pd.read_table(table)
    df.columns = ["id","plant","tpm","length","n_cys","pI","group"]
    plant_list = list(set(list(df["plant"])))
    pI_plant_dict = {}
    out_file = open(out + "/cluster_NCR_type_tpm.txt","w")
    out_file.write("id\tplant\ttpm\tlenght\tn_cys\tpI\tgroup\ttype\n")
    for plant in plant_list:
        plant_df = df[df["plant"] == plant]
        anionic_list = []
        netrual_list = []
        cationic_list = []
        pI_name_list = ["anionic","neutral","cationic"]
        for index,row in plant_df.iterrows():
            row_list = list(row)
            pI = float(row_list[5])
            if pI < 6:
                anionic_list.append(row_list[0])
            elif pI >= 6 and pI <= 8:
                netrual_list.append(row_list[0])
            elif pI > 8:
                cationic_list.append(row_list[0])
        pI_plant_dict.update({"anionic":anionic_list})
        pI_plant_dict.update({"neutral":netrual_list})
        pI_plant_dict.update({"cationic":cationic_list})
        for p in pI_name_list:
            id_list = pI_plant_dict[p]
            for i in id_list:
                tpm_line = main_dict[i]
                out_file.write(i + "\t" + "\t".join(tpm_line) + "\t" + p + "\n")


    
    
    
    
                


if __name__ == '__main__':
    NCR_table = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters/NCR_cluster_all_table.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering"
    
    pI_tpm(NCR_table,folder)
    