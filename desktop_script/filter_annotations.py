import pandas as pd
import argparse


parser = argparse.ArgumentParser(description='Remove repetitve gene annotations from isoforms of genes')
parser.add_argument('-i',required=True,help='input annotation tsv file')
parser.add_argument('-o',required=True,help='output folder (abs path)')
parser.add_argument('-n',required=True,help='name of plant (alfalfa or clover)')
parser.add_argument('--eggnog',required=True,help='eggnog annotation file')
parser.add_argument('--pfam',required=True,help='preprocessed pfam hmmsearch result')
parser.add_argument('--tigr',required=True,help='preprocessed TIGRFAM hmmsearch result')
parser.add_argument('-m',required=False,default="all",help="two filtering mode: all or one")

args = vars(parser.parse_args())

def filter(input,output,eggnog,pfam,tigre,na,mo):
    main_dict = {}
    sub_dict = {}
    gene_id_list = []
    with open(input,"r") as f:
        counter = 0
        for l in f:
            if counter != 0:
                info = l.strip("\n").split("\t")
                sub = info[0:7]
                main_dict.update({info[0]:info[1::]})
                gene_id = sub[0].split("_i")[0]
                sub_dict.update({sub[0]:sub[1::]})
                gene_id_list.append(gene_id)       
            else:
                header = l
                
            counter += 1

    #sub_df = pd.DataFrame.from_dict(sub_dict,orient="index")
    #sub_df["id"] = gene_id_list
    #sub_df.drop_duplicates(keep = False, inplace = True)
    #sub_df.to_csv(output + "/" + na + "_filtered_annotations.tsv", index= True, sep= "\t")
    group_dict = {}
    for index, row in sub_dict.items():
        gene_id = index.split("_i")[0]
        add_row = row
        add_row.insert(0,index)
        
        try:
            old_row = group_dict[gene_id]
            old_row.append(add_row)
        except:
            group_dict.update({gene_id:[add_row]})
    
    #backup code
    '''
    test_dict = {}
    for key, item in group_dict.items():
        for i in item:
            id = i[0].split("_i")[0]
            if i.count("None") != 5:
                if i[2] != "None":
                    test_dict.update({id:i})
                    break
                else:
                    if i[3] != "None" and i[4] != "None" and i[5] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[3] != "None" and i[4] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[3] != "None" and i[5] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[3] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[4] != "None" and i[5] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[4] != "None":
                        test_dict.update({id:i})
                        break
                    elif i[5] != "None":
                        test_dict.update({id:i})
                        break
    '''
    
 
    #load eggnog hit score
    eggnog_dict = {}
    with open(eggnog,"r") as file:
        for l in file:
            info = l.strip("\n").split("\t")[0:4]
            eggnog_dict.update({info[0]:[info[1],info[3]]})

    #load pfam hit score
    pfam_dict = {}
    with open(pfam,"r") as file:
        for l in file:
            info = l.strip("\n").split(" ")
            pfam_dict.update({info[0]:[info[3],info[5]]})

    #load tigre hit score
    tigre_dict = {}
    with open(tigre,"r") as file:
        for l in file:
            info = l.strip("\n").split(" ")
            tigre_dict.update({info[0]:[info[3],info[5]]})

    score_dict = {}
    for key, item in group_dict.items():
        for i in item:
            if mo == "all":
                changed_id_name = i[0].split("_i")[0] + "/" + i[1] #uncomment if want isoforms have same annotations but in different contigs
            elif mo == "one":
                changed_id_name = i[1]
            score = 0
            if i[2] != "None": # blast
                score += 7
            if i[3] != "None": # eggnog
                score += 3
            if i[4] != "None": # pfam
                score += 2
            if i[5] != "None": # tigre
                score += 0.5
            try:
                hit_score = score_dict[changed_id_name][0]
                if hit_score < score:
                    score_dict.update({changed_id_name:[score,i[0],i[2:7]]})
                else:
                    pass
                '''
                elif hit_score == 7 and score == 5.5:
                    changed_id_name_1 = changed_id_name + "/1"
                    score_dict.update({changed_id_name_1:[score,i[0],i[2:7]]})
                elif hit_score == score:
                    hit_score_list = score_dict[changed_id_name][2]
                    id = score_dict[changed_id_name][1]
                    if i[3] != hit_score_list[1]:
                        if i[3] != "None" and hit_score_list[1] != "None":
                            if eggnog_dict[i[0]][1] > eggnog_dict[id][1]: #eggnog score comparsion
                                score_dict.update({changed_id_name:[score,i[0],i[2:7]]})
                    elif i[3] == "None" and hit_score_list[1] == "None":
                        if i[4] != hit_score_list[2]:
                            if i[4] != "None" and hit_score_list[2] != "None": #pfam score comparsion
                                if pfam_dict[i[0]][1] > pfam_dict[id][1]:
                                    score_dict.update({changed_id_name:[score,i[0],i[2:7]]})
                    elif i[4] == "None" and hit_score_list[4] == "None": #tigre score comparsion
                        if i[5] != hit_score_list[3]:
                            if tigre_dict[i[0]][1] > tigre_dict[id][1]:
                                score_dict.update({changed_id_name:[score,i[0],i[2:7]]})
                    else:
                        score_dict.update({changed_id_name:[score,i[0],i[2:7]]})
                    '''
                
            except:
                score_dict.update({changed_id_name:[score,i[0]]})
          
    print(len(score_dict.keys()))



    count_list = []
    file = open(output + "/" + na + "_filtered_annotations_1.tsv","w")
    file.write(header)
    for gene,row in score_dict.items():
        main_info = main_dict[row[1]]
        num_none = main_info.count("None")
        if num_none != 15:
            file.write("{}\t{}\n".format(row[1],"\t".join(main_info)))
            count_list.append(gene)
    print("\n {} annotation remained \n".format(len(count_list)))
    


       
    
if __name__ == '__main__':
    alfalfa_ann = args['i']
    #clover_ann = '/home/rui-huang/Documents/RNA_seq_doc/blast/clover_annotations.tsv'
    folder = args["o"]
    eggnog_file = args["eggnog"] #"/home/rui-huang/Documents/RNA_seq_doc/eggnog/alfalfa_query_seqs.fa.emapper.annotations"
    pfam_file = args["pfam"] #"/home/rui-huang/Documents/RNA_seq_doc/pfam/alfalfa_pfam_search_cut.out"
    tigre_file = args["tigr"] #"/home/rui-huang/Documents/RNA_seq_doc/HMM/alfalfa_tigrfam_cut.out"
    mode = args["m"]
    filter(alfalfa_ann,folder,eggnog_file,pfam_file,tigre_file,args["n"],mode)
    #filter(clover_ann,folder,"clover")
    