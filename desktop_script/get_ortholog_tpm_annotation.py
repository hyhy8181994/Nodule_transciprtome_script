

from typing import Counter


def get_ortholog(input):
    a_list = []
    c_list = []
    out_list = []
    with open(input) as file:
        for l in file:
            row = l.strip("\n").split("\t")
            a_list.append(row[0])
            c_list.append(row[1])
    out_list.append(a_list)
    out_list.append(c_list)
    return(out_list)


def get_ortholog_dict(input1,input2):
    out_dict = {}
    with open(input1) as file:
        for l in file:
            row = l.strip("\n").split("\t")
            out_dict.update({row[0]:row[1]})
    with open(input2) as file:
        for l in file:
            row = l.strip("\n").split("\t")
            out_dict.update({row[0]:row[1]})
    return(out_dict)

def get_specific(input1,input2,input3):
    a_list = []
    c_list = []
    a_specific = []
    c_specific = []
    out_list = []
    with open(input1) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            a_list.append(row[0])
    with open(input2) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            c_list.append(row[0])
    a_ortholog_list = input3[0]
    c_ortholog_list = input3[1]
    for id in a_list:
        if id not in a_ortholog_list:
            a_specific.append(id)
    for id in c_list:
        if id not in c_ortholog_list:
            c_specific.append(id)
    out_list.append(a_specific)
    out_list.append(c_specific)
    return(out_list)


def get_annotation(input_1,input_2,s_list):
    ann_dict = {}
    a_list_a = []
    c_list_a = []
    a_list_n = []
    c_list_n = []
    out_list = []
    with open(input_1) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            ann_dict.update({row[1]:row[-1]})

    with open(input_2) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            ann_dict.update({row[1]:row[-1]})
    for id in s_list[0]:
        try:
            match = ann_dict[id]
            if match == "None":
                a_list_n.append(id)
            elif match == "NA":
                a_list_n.append(id)
            else:
                a_list_a.append(id)
        except:
            a_list_n.append(id)
    for id in s_list[1]:
        try:
            match = ann_dict[id]
            if match == "None":
                c_list_n.append(id)
            elif match == "NA":
                c_list_n.append(id)
            else:
                c_list_a.append(id)
        except:
            c_list_n.append(id)        
    out_list.append(a_list_a)
    out_list.append(a_list_n)
    out_list.append(c_list_a)
    out_list.append(c_list_n)
    
    return(out_list)

def get_tpm(input1,input2):
    out_dict = {}
    out_dict.update({"alfalfa":{}})
    out_dict.update({"clover":{}})
    with open(input1) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            tpm_list = [row[4],row[5],row[6]]
            out_dict["alfalfa"].update({row[0]:tpm_list})
    with open(input2) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            tpm_list = [row[4],row[5],row[6]]
            out_dict["clover"].update({row[0]:tpm_list})
    return(out_dict)

def otholog_table(o_list,a_list,t_dict,up,down,o_dict,out):
    out_file_1 = open(out + "alfalfa_clover_conserved_tpm.txt","w")
    out_file_2 = open(out + "alfalfa_clover_specific_tpm_with_annotation.txt","w")
    out_file_3 = open(out + "alfalfa_clover_specific_tpm_with_no_annotation.txt","w")
    out_file_4 = open(out + "alfalfa_clover_tpm_scatter_DEG.txt", "w")
    out_file_5 = open(out + "alfalfa_clover_tpm_scatter_not_DEG.txt", "w")
    id_list = []
    with open(up) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            ids = row[0]
            id_list.append(ids)
    with open(down) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            ids = row[0]
            id_list.append(ids)
    
    
    for a_id in o_list[0]:
        tpm_list = t_dict["alfalfa"][a_id]
        for t in tpm_list:
            out_file_1.write("{}\t{}\t{}\n".format(a_id,t,"alfalfa"))
    for c_id in o_list[1]:
        tpm_list = t_dict["clover"][c_id]
        for t in tpm_list:
            out_file_1.write("{}\t{}\t{}\n".format(c_id,t,"clover"))
    
    # tpm scatter
    for o_id in id_list:
        clover_id = o_dict[o_id]
        tpm_list_1 = t_dict["alfalfa"][o_id]
        tpm_list_2 = t_dict["clover"][clover_id]
        tpm_list_1 = [float(i) for i in tpm_list_1]
        tpm_list_2 = [float(i) for i in tpm_list_2]
        average_a = sum(tpm_list_1)/len(tpm_list_1)
        average_c = sum(tpm_list_2)/len(tpm_list_2)
        #for t1,t2 in zip(tpm_list_1,tpm_list_2):
        if float(average_a) != 0 and float(average_c) != 0:
            out_file_4.write("{}\t{}\n".format(average_a,average_c))
        else:
            print(average_a)
            print(average_c)
            print("y")
    
    counter = 0
    for a_id,c_id in zip(o_list[0],o_list[1]):
        check = "n"
        tpm_list_1 = t_dict["alfalfa"][a_id]
        tpm_list_2 = t_dict["clover"][c_id]
        for check_id in id_list:
            if a_id == check_id:
                check = "yes"
        if check == "n":
            counter += 1
            tpm_list_3 = t_dict["alfalfa"][a_id]
            tpm_list_4 = t_dict["clover"][c_id]
            tpm_list_3 = [float(i) for i in tpm_list_3]
            tpm_list_4 = [float(i) for i in tpm_list_4]
            average_a1 = sum(tpm_list_3)/len(tpm_list_3)
            average_c1 = sum(tpm_list_4)/len(tpm_list_4)
            #for t1,t2 in zip(tpm_list_3,tpm_list_4):
            if float(average_a1) != 0 and float(average_c1) != 0:
                out_file_5.write("{}\t{}\n".format(average_a1,average_c1))
    
    
    for a_id in a_list[0]:
        tpm_list = t_dict["alfalfa"][a_id]
        for t in tpm_list:
            out_file_2.write("{}\t{}\t{}\n".format(a_id,t,"alfalfa"))
    for c_id in a_list[2]:
        tpm_list = t_dict["clover"][c_id]
        for t in tpm_list:
            out_file_2.write("{}\t{}\t{}\n".format(c_id,t,"clover"))
    for a_id in a_list[1]:
        tpm_list = t_dict["alfalfa"][a_id]
        for t in tpm_list:
            out_file_3.write("{}\t{}\t{}\n".format(a_id,t,"alfalfa"))
    for c_id in a_list[3]:
        tpm_list = t_dict["clover"][c_id]
        for t in tpm_list:
            out_file_3.write("{}\t{}\t{}\n".format(c_id,t,"clover"))


def onetoone(deseq,acount,o_list):
    al_deseq = list(deseq.keys())
    out_file1 = open("/home/rui-huang/Documents/RNA_seq_doc/deseq2/onetoone_deseq.txt","w")
    out_file2= open("/home/rui-huang/Documents/RNA_seq_doc/deseq2/onetoone_notdeseq.txt","w")
    counter = 0
    with open(acount) as file:
        for l in file:
            row = l.strip("\n").split("\t")[0]
            if row in al_deseq:
                out_file1.write(l)
                counter += 1
            else:
                if counter <= 15287:
                    out_file1.write(l)
                counter += 1


def get_onetoone_dict(input):
    out_list = []
    counter = 0
    a_list = []
    c_list = []
    with open(input) as file:
        for l in file:
            row = l.strip("\n").split("\t")
            a_id = row[0]
            c_id = row[1]
            if a_id.count(",") == 0 and c_id.count(",") == 0:
                counter += 1
                a_list.append(a_id)
                c_list.append(c_id)
    out_list.append(a_list)
    out_list.append(c_list)            
    return(out_list)

        


if __name__ == '__main__':
    folder = "/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/"
    up_table = folder + "alfalfa_vs_clover_DE_annotated_up.txt"
    down_table = folder + "alfalfa_vs_clover_DE_annotated_down.txt"
    ortholog_file = "/home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/alfalfa_clover_orthologs_organized_list.txt"
    ortholog_list = get_ortholog(folder + "alfalfa_clover_ortholog_cluster_id_list.txt")
    ortholog_dict = get_ortholog_dict(up_table,down_table)
    specific_list = get_specific(folder + "alfalfa_gene_tpm.txt", folder + "clover_gene_tpm.txt",ortholog_list)
    annotation_list = get_annotation(folder + "alfalfa_filtered_annotations_1.tsv", folder + "clover_filtered_annotations_1.tsv",specific_list)
    tpm_dict = get_tpm(folder + "alfalfa_triplicate_salmon_tpm.txt", folder + "clover_triplicate_salmon_tpm.txt")
    #onetoone(ortholog_dict,"/home/rui-huang/Documents/RNA_seq_doc/deseq2/onetoone_ortholog_file.txt",ortholog_list)
    one_to_one_list = get_onetoone_dict(ortholog_file)
    otholog_table(one_to_one_list,annotation_list,tpm_dict,up_table,down_table,ortholog_dict,folder)
