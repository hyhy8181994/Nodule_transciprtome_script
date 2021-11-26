import pandas as pd


def NCR_group_tpm(alfalfa,clover,group,single_file,PI,out,name):
    cluster_df = pd.read_csv(group)
    cluster_dict = dict(zip(cluster_df.iloc[:,0],cluster_df.iloc[:,1]))
    
    alfalfa_df = pd.read_table(alfalfa)
    clover_df = pd.read_table(clover)
    
    alfalfa_tpm_dict = dict(zip(alfalfa_df["Geneid"],alfalfa_df["Average_tpm"]))
    clover_tpm_dict = dict(zip(clover_df["Geneid"],clover_df["Average_tpm"]))
    PI_dict = {}
    with open(PI) as file:
        lines = file.readlines()
        for l in lines:
            info = l.strip("\n").split(",")
            PI_dict.update({info[0]:info[1::]})
    num_clust = len(set(list(cluster_df.iloc[:,1]))) + 1

    out_file_PI = open(out + "/NCR_PI_table_with_cluster.txt","w")
    out_file_PI.write("id,PI,group,plant\n")
    for num in range(1,num_clust):
        out_file = open("{}/NCR_cluster_{}_tpm.txt".format(out,num),"w")
        sub_list = list(cluster_df.loc[cluster_df.iloc[:,1] == num].iloc[:,0])
        tpm = ""
        plant = ""
        PI_value = ""
        length = ""
        n_cys = ""
        for i in sub_list:
            try:
                tpm = alfalfa_tpm_dict[i]
                plant = "alfalfa"
                try:
                    PI_value = PI_dict[i][2]
                    try:
                        length = PI_dict[i][0]
                        try:
                            n_cys = PI_dict[i][1]
                        except:
                            pass
                    except:
                        pass
                except:
                    pass
            except:
                try:
                    tpm = clover_tpm_dict[i]
                    plant = "clover"
                    try:
                        PI_value = PI_dict[i][2]
                        try:
                            length = PI_dict[i][0]
                            try:
                                n_cys = PI_dict[i][1]
                            except:
                                pass
                        except:
                            pass
                    except:
                        pass
                except:
                    pass
            if tpm != "":
                if PI_value != "":
                    out_file.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(i,plant,tpm,length,n_cys,PI_value,num))
            if PI_value != "":
                out_file_PI.write("{},{},{},{}\n".format(i,PI_value,num,plant)) #make NCR PI table with cluster assignment
        

       
    

    single_df = pd.read_table(single_file)
    cluster_list = []
    for i in single_df.iloc[:,0]:
        cluster_list.append(cluster_dict[i])
    single_df["group"] = cluster_list

    single_df.to_csv(out + "/NCR_single_with_group_{}.txt".format(name),sep = "\t",index = False)

    

if __name__ == '__main__':
    alfalfa_NCR = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/alfalfa/total_count/alfalfa_NCR_salmon_tpm.txt"
    clover_NCR = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/clover/total_count/clover_NCR_salmon_tpm.txt"
    cluster = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/cluster_assignment.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters"
    single_NCR = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_single_tpm.txt"
    NCR_PI_table = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_data_table.txt"
    NCR_group_tpm(alfalfa_NCR,clover_NCR,cluster,single_NCR,NCR_PI_table,folder,"all")
    '''
    cluster = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/cluster_assignment_length.txt"
    
    NCR_group_tpm(alfalfa_NCR,clover_NCR,cluster,single_NCR,folder,"length")

    cluster = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/cluster_assignment_cys.txt"
    
    NCR_group_tpm(alfalfa_NCR,clover_NCR,cluster,single_NCR,folder,"cys")

    cluster = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/cluster_assignment_PI.txt"
    
    NCR_group_tpm(alfalfa_NCR,clover_NCR,cluster,single_NCR,folder,"PI")
    '''

    