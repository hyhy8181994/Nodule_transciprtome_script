import pickle as pk
import pandas as pd
from numpy import mean
from statistics import median


def get_tpm(alfalfa,clover):
    total_dict = {"alfalfa":{}, "clover": {}}
    with open(alfalfa) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            al_id = info[0]
            al_tpm = info[4:7]
            total_dict["alfalfa"].update({al_id:al_tpm})

    with open(clover) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            cl_id = info[0]
            cl_tpm = info[4:7]
            total_dict["clover"].update({cl_id:cl_tpm})
    return(total_dict)

def get_id(fasta):
    id_list = {}
    with open(fasta) as file:
        for l in file:
            if ">" in l:
                id = l.strip("\n").strip(">")
                cluster = id.split("_")[1]
                try:
                    hit = id_list[cluster]
                    hit.append(id)
                    id_list.update({cluster:hit})
                except:
                    id_list.update({cluster:[id]})
                
    return(id_list)

def get_NCR(orth,alfalfa,clover,group,tpm,out):
    ortholog_dict = pk.load(open(orth,"rb"))
    al_id_dict = get_id(alfalfa)
    cl_id_dict = get_id(clover)
    group_dict = {}
    out_file = open(out + "/NCR_ortholog_tpm.txt","w")
    out_file_1 = open(out + "/NCR_ortholog_tpm_single.txt","w")
    counter_yes = 0
    counter_no = 0
    counter_total = 0
    counter_maybe = 0
    with open(group) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split(",")
            group_dict.update({info[0]:info[1]})
    for keys,values in ortholog_dict.items():
        al_NCR = "None"
        cl_NCR = "None"
        
        try:
            al_NCR = al_id_dict[keys]
            try:
               cl_NCR = cl_id_dict[values]
            except:
                pass
        except:
            pass

        if al_NCR != "None" and cl_NCR != "None":
            for a in al_NCR:
                al_tpm = "None"
                cl_tpm = "None"
                for c in cl_NCR:
                    try:
                        
                        al_tpm = tpm["alfalfa"][a]
                        
                    except:
                        pass
                    try:
                        cl_tpm = tpm["clover"][c]
                    except:    
                        pass

                    
                    out_file.write("{}\t{}\t{}\t{}\n".format(a,"\t".join(al_tpm),c,"\t".join(cl_tpm)))
                    for al in al_tpm:
                        out_file_1.write("{}\t{}\t{}\t{}\n".format(a,c,al,"alfalfa"))
                    for cl in cl_tpm:
                        out_file_1.write("{}\t{}\t{}\t{}\n".format(a,c,cl,"clover"))

        if al_NCR != "None" and cl_NCR != "None":
            al_group = []
            cl_group = []
            for i in al_NCR:
                al_group.append(group_dict[i])
            for i in cl_NCR:
                cl_group.append(group_dict[i])
            
        
            counter_total += 1
            if len(al_group) == 1 and len(cl_group) == 1:
                if al_group[0] == cl_group[0]:
                    counter_yes += 1
                elif al_group[0] > cl_group[0]:
                    if float(al_group[0]) - float(cl_group[0]) == 1:
                       counter_maybe += 1
                    else:
                        counter_no += 1

                elif al_group[0] < cl_group[0]:
                    if float(cl_group[0]) - float(al_group[0]) == 1:
                       counter_maybe += 1
                    else:
                        counter_no += 1
                else:
                    counter_no += 1

            elif len(al_group) > len(cl_group):
                if cl_group in al_group:
                    counter_yes += 1
                else:
                    counter_no += 1
            elif len(al_group) < len(cl_group):
                if al_group in cl_group:
                    counter_yes += 1
                else:
                    counter_no += 1
            
    print("total NCR orthologs {}".format(counter_total))
    print("same with clustering {}".format(counter_yes))
    print("close to clustering {}".format(counter_maybe))
    print("different {}".format(counter_no))
        
                
def cluster_summary(cluster,tpm,data,out):
    cluster_df  =  pd.read_csv(cluster)
    max_cluster = max(cluster_df["group"].unique())
    cluster_dict = {}
    out_file = open(out + "/NCR_cluster_summary_table.txt", "w")
    out_file.write("group\tplant\tNCR_num\ttpm_mean\ttpm_median\tlength_mean\tlength_median\tn_cys_mean\tn_cys_median\tPI_mean\tPI_median\n")
    for index,rows in cluster_df.iterrows():
        line = list(rows)
        for n in range(1,max_cluster + 1):
            if rows[1] == n:
                try:
                    hit = cluster_dict[n]
                    hit.append(rows[0])
                    cluster_dict.update({n:hit})
                except: 
                    cluster_dict.update({n:[rows[0]]})
    data_df = pd.read_csv(data)
    data_dict = {}
    for index,rows in data_df.iterrows():
        line = list(rows)
        data_dict.update({line[0]:line[1::]})
    for num in range(1,10):
        cluster_list = cluster_dict[num]
        alfalfa_list = []
        clover_list = []
        alfalfa_tpm_list = []
        clover_tpm_list = []
        for c in cluster_list:
            tpm_hit = "None"
            try:
                tpm_hit = tpm["alfalfa"][c]
                alfalfa_list.append(c)
                if tpm_hit != "None":
                    for t in tpm_hit:
                        alfalfa_tpm_list.append(t)
            except:
                pass
            try:
                tpm_hit = tpm["clover"][c]
                clover_list.append(c)
                if tpm_hit != "None":
                    for t in tpm_hit:
                        clover_tpm_list.append(t)
            except:
                pass
            
        alfalfa_tpm_list = [float(i) for i in alfalfa_tpm_list]
        clover_tpm_list = [float(i) for i in clover_tpm_list]
        alfalfa_length_list = []
        clover_length_list = []
        alfalfa_Cys_list = []
        clover_Cys_list = []
        alfalfa_PI_list = []
        clover_PI_list = []
        for al in alfalfa_list:
            data_list = data_dict[al]
            data_list = [float(i) for i in data_list]
            alfalfa_length_list.append(data_list[0])
            alfalfa_Cys_list.append(data_list[1])
            alfalfa_PI_list.append(data_list[2])
        for cl in clover_list:
            data_list = data_dict[cl]
            
            data_list = [float(i) for i in data_list]
            clover_length_list.append(data_list[0])
            clover_Cys_list.append(data_list[1])
            clover_PI_list.append(data_list[2]) 
        al_num_NCR = len(alfalfa_list)
        cl_num_NCR = len(clover_list)
        
        al_mean_tpm = mean(alfalfa_tpm_list)
        cl_mean_tpm = mean(clover_tpm_list)
        al_median_tpm = median(alfalfa_tpm_list)
        cl_median_tpm = median(clover_tpm_list)

        al_mean_length = mean(alfalfa_length_list)
        cl_mean_length = mean(clover_length_list)
        al_median_length = median(alfalfa_length_list)
        cl_median_length = median(clover_length_list)

        al_mean_cys = mean(alfalfa_Cys_list)
        cl_mean_cys = mean(clover_Cys_list)
        al_median_cys = median(alfalfa_Cys_list)
        cl_median_cys = median(clover_Cys_list)

        al_mean_PI = mean(alfalfa_PI_list)
        cl_mean_PI = mean(clover_PI_list)
        al_median_PI = median(alfalfa_PI_list)
        cl_median_PI = median(clover_PI_list)
        
        out_file.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(num,"alfalfa",al_num_NCR,al_mean_tpm,al_median_tpm,al_mean_length,al_median_length,al_mean_cys,al_median_cys,al_mean_PI,al_median_PI))
        out_file.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(num,"clover",cl_num_NCR,cl_mean_tpm,cl_median_tpm,cl_mean_length,cl_median_length,cl_mean_cys,cl_median_cys,cl_mean_PI,cl_median_PI))
        




        
    

        


if __name__ == '__main__':
    ortholog_file = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/all_ortholog.dat"
    alfalfa_NCR = "/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/alfalfa_NCR_seq_noDup.fa"
    clover_NCR = "/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/clover_NCR_seq_noDup.fa"
    group_file = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/cluster_assignment.txt"
    alfalfa_NCR_tpm = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/alfalfa/total_count/alfalfa_NCR_salmon_tpm.txt"
    clover_NCR_tpm = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/clover/total_count/clover_NCR_salmon_tpm.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering"
    NCR_data_table = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_data_table.txt"
    tpm_dict = get_tpm(alfalfa_NCR_tpm,clover_NCR_tpm)
    get_NCR(ortholog_file,alfalfa_NCR,clover_NCR,group_file,tpm_dict,folder)

    cluster_summary(group_file,tpm_dict,NCR_data_table,folder)
    
    #group_file = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters/cluster_assignment_length.txt"
    #cluster_summary(group_file,tpm_dict,NCR_data_table,folder)
    #group_file = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters/cluster_assignment_cys.txt"
    #cluster_summary(group_file,tpm_dict,NCR_data_table,folder)
    #group_file = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters/cluster_assignment_PI.txt"
    #cluster_summary(group_file,tpm_dict,NCR_data_table,folder)
    