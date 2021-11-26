import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='creat table of NCR peptide sequence and their raw counts and tpm from each replicate, and a tab separate file of NCR sequence id, average tpm and plant name')

parser.add_argument('-i',required=True,help='NCR peptide sequence fasta file')
parser.add_argument('-t',required=True,help='merged salmon tpm table (e.g. alfalfa_triplicate_tpm.txt)')
parser.add_argument('-o',required=True,help='output folder')
parser.add_argument("-p",required=True,help="plant name")
args = vars(parser.parse_args())

def get_NCR_info(sequence,NCR_table):
    info_list = []
    temp_dict = {}
    main_dict = {}
    with open(sequence) as file:
        for l in file:
            if ">" in l:
                info_list.append(l.strip(">").strip("\n"))
    with open(NCR_table) as file:
        for l in file:
            info = l.strip("\n").split("\t")
            temp_dict.update({info[0]:info[2:6]})
    for i in info_list:
        hit = temp_dict[i]
        cluster_id = hit[0]
        try:
            main_hit = main_dict[cluster_id]
            main_hit.append([i,hit[1],hit[2],hit[3]])
            main_dict.update({cluster_id:main_hit})
        except:
            main_dict.update({cluster_id:[[i,hit[1],hit[2],hit[3]]]})
    return(main_dict)

def NCR_get_tpm(seq,table,tpm,out,plant):
    NCR_id_dict = get_NCR_info(seq,table)
    output_file = open(out + "/" + plant + "_NCR_tpm_exon_tpm.txt","w")
    output_file.write("Geneid\tChr\tStart\tEnd\tStrand\tLength\tCount\ttpm\n")
    count_dict = {}
    with open(tpm) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            info = l.strip("\n").split("\t")
            transcript = info[0]
            position = [float(info[2]),float(info[3])]
            strand = info[4]
            info_change = []
            try:
                NCR_hit = NCR_id_dict[transcript]
                
                temp_compare_list = []
                
                for i in NCR_hit:
                    if strand == i[3]:
                        temp_compare_list.append(i)
                position_compare_dict = {}
                if len(temp_compare_list) > 1:
                    for i in temp_compare_list:
                        po = [float(i[1]),float(i[2])]
                        if position[0] < po[0] and position[1] > po[1]: # read include the NCR seuences
                            info_change = info
                            info_change[0] = i[0]
                            break
                        elif position[0] > po[0] and position[1] < po[1]: #NCR sequence includes the read
                            info_change = info
                            info_change[0] = i[0]
                            break
                        elif position[1] > po[0] and position[1] < po[1]: # overlap left
                            info_change = info
                            info_change[0] = i[0]
                            break
                        elif po[1] > position[0] and po[1] < position[1]: # overlap right
                            info_change = info
                            info_change[0] = i[0]
                            break
                        elif po[0] >= position[1]: # reads at left side of NCR sequence
                            dis = float(po[0]) - float(position[1])
                            position_compare_dict.update({dis:[i]})
                        elif position[0] >= po[1]:
                            dis = float(position[0]) - float(po[0])
                            position_compare_dict.update({dis:[i]})
                        else:
                            pass
                elif len(temp_compare_list) == 1:
                    info_change = info
                    info_change[0] = i[0]
                else:
                    pass
                
                    
                if len(info_change) == 0:
                    if len(position_compare_dict.values()) != 0:
                        sorted_dis = list(position_compare_dict.keys())
                        sorted_dis.sort()
                        info_change = info
                        info_change[0] = position_compare_dict[sorted_dis[0]][0]
                    else:
                        pass
                    #left distance or right distance
                    
                    #save distances from each NCR bit into dictionary
                    #find the shortest distance
                    #use index to identify the id
                
                #write file
                #print(info_change)
                if len(info_change) != 0:
                    count_dict.update({info_change[0]:info_change})
                    wirte_line = "\t".join(info_change)
                    output_file.write(wirte_line + "\n")        

            except:
                pass
    print("Find {} NCR genes have reads match".format(len(count_dict.values())))        
    
    output_file.close()

def merge_NCR_reads(NCR_tpm,out,plant):
    tpm_dict = {}
    tpm_df = pd.read_table(NCR_tpm)
    NCR_id_list = list(set(list(tpm_df["Geneid"])))
    out_file = open(out + "/" + plant + "_NCR_merged_tpm.txt","w")
    out_file.write("Geneid\tChr\tStart\tEnd\tStrand\tLength\tCount\n")
    for index,row in tpm_df.iterrows():
        row_info = list(row)
        try:
            hit = tpm_dict[row_info[0]][0]
            hit.append(row_info[2])
            hit.append(row_info[3])
            count_hit = tpm_dict[row_info[0]][1]
            count_hit.append(row_info[6])
            chr_hit = tpm_dict[row_info[0]][2]
            chr_hit.append(row_info[1])
            strand_hit = tpm_dict[row_info[0]][3]
            strand_hit.append(row_info[4])
            tpm_dict.update({row_info[0]:[hit,count_hit,chr_hit,strand_hit]})
        except:
            tpm_dict.update({row_info[0]:[[row_info[2],row_info[3]],[row_info[6]],[row_info[1]],[row_info[4]]]})
    for NCR in NCR_id_list:
        position_list = tpm_dict[NCR][0]
        position_list.sort()
        new_position = [position_list[0],position_list[-1]]
        new_length = new_position[1]-new_position[0] + 1
        sum_count = sum(tpm_dict[NCR][1])
        chr = tpm_dict[NCR][2][0]
        strand = tpm_dict[NCR][3][0]
        out_file.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(NCR,chr,new_position[0],new_position[1],strand,new_length,sum_count))
        

def NCR_gene_count(seq,salmon,out,plant):
    NCR_seq_list = []
    with open(seq) as file:
        for l in file:
            if ">" in l:
                seq_header = l.strip("\n").strip(">")
                NCR_seq_list.append(seq_header)
                #cluster_id = seq_header.split("_")[1]
                
    out_file = open(out + "/" + plant + "_NCR_gene_level_count.txt","w")
    out_file_1 = open(out + "/" + plant + "_NCR_salmon_tpm.txt","w")
    out_file_2 = open(out + "/" + plant + "NCR_salmon_tpm_single.txt","w")
    tpm_dict = {}
    salmon_dict = {}
    counter = 0
    '''
    with open(tpm_table) as file:
        for l in file:
            counter += 1
            if counter == 1:
                out_file.write(l)
            else:
                info = l.strip("\n").split("\t")
                tpm_dict.update({info[0]:info[1::]})
    '''
    
    counter = 0
    with open(salmon) as file:
        for l in file:
            counter += 1
            if counter == 1:
                out_file_1.write(l)
            info = l.strip("\n").split("\t")
            salmon_dict.update({info[0]:info})
    #print(salmon_dict)
    
    NCR_cluster_dict = {}
    for NCR in NCR_seq_list:
        cluster_id = NCR.split("_")[1]
        out_line_1 = "None"
        try:
            number = NCR_cluster_dict[cluster_id] + 1
            NCR_cluster_dict.update({cluster_id:number})
        except:
            NCR_cluster_dict.update({cluster_id:1})
        
        
    for NCR in NCR_seq_list:
        cluster_id = NCR.split("_")[1]
        out_line_1 = "None"    
        try:
            ''' 
            out_line = tpm_dict[cluster_id]
            out_line.insert(0,NCR)
            out_line[1] = cluster_id
            out_file.write("\t".join(out_line) + "\n")
            '''
            out_line_1 = salmon_dict[cluster_id]  
            try:
                div_num = NCR_cluster_dict[cluster_id]
                if div_num != 1:
                    temp_list = [float(i) for i in out_line_1[1::]]
                    temp_list = [i/div_num for i in temp_list]
                    temp_list.insert(0,out_line_1[0])
                    out_line_1 = [str(i) for i in temp_list]
                    
            except:
                pass
        except:
            pass
        

        if out_file_1 != "None":
            out_line_1[0] = NCR
            out_file_1.write("\t".join(out_line_1) + "\n")
            for i in out_line_1[4:7]:
                out_file_2.write("{}\t{}\t{}\n".format(out_line_1[0],i,plant))
        
    

    


if __name__ == '__main__':
    
    '''
    NCR_alfalfa_seq = "/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/alfalfa_NCR_seq_noDup.fa"
    #NCR_alfalfa_table = "/home/rui-huang/Documents/RNA_seq_doc/spada_alfalfa/61_final.tbl"
    #tpm_alfalfa_table = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/alfalfa/tpm_3.txt"
    #tpm_alfalfa_gene_table = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_tpm.txt"
    salmon_table = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/alfalfa"
    #NCR_get_tpm(NCR_alfalfa_seq,NCR_alfalfa_table,tpm_alfalfa_table,folder,"alfalfa")
    #alfalfa_NCR_tpm = folder + "/" + "alfalfa_NCR_tpm_exon_tpm.txt"
    #merge_NCR_reads(alfalfa_NCR_tpm,folder,"alfalfa")
    '''
    NCR_alfalfa_seq = args["i"]
    salmon_table = args["t"]
    folder = args["o"]
    plant_name = args["p"]    
    NCR_gene_count(NCR_alfalfa_seq,salmon_table,folder,plant_name)



    

    