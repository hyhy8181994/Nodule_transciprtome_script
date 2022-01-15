import pandas as pd
import pickle as pk


def zero_list(l):
    length = len(l)
    out_list = [0]*length
    return(out_list)

def get_top_gene(infile,annotation,orth,plant):
    outfile = open("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/conserved_{}_tpm_descend_with_annotation.txt".format(plant),"w")
    outfile_1 = open("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/specific_{}_tpm_descend_with_annotation.txt".format(plant),"w")
    outfile_2 = open("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/conserved_{}_raw_tpm_.txt".format(plant),"w")
    outfile_3 = open("/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/specific_{}_raw_tpm_.txt".format(plant),"w")
    outfile.write("Geneid\tAverage_tpm\tFunctional_prediction\tGO\n")
    ann_df = pd.read_table(annotation)
    prediction_dict = dict(zip(ann_df["contig_id"],ann_df["predicted_function"]))
    blast_GO_dict = dict(zip(ann_df["contig_id"],ann_df["blast_ontology_terms"]))
    egg_GO_dict = dict(zip(ann_df["contig_id"],ann_df["eggnog_hit_ontology_terms"]))

    ortholog_dict = pk.load(open(orth,"rb"))
    alfalfa_orth_list = list(ortholog_dict.keys())
    clover_orth_list = list(ortholog_dict.values())
    alfalfa_orth_dict = dict(zip(alfalfa_orth_list,zero_list(alfalfa_orth_list)))
    clover_orth_dict = dict(zip(clover_orth_list,zero_list(clover_orth_list)))
    if plant == "alfalfa":
        orth_dict = alfalfa_orth_dict
    elif plant == "clover":
        orth_dict = clover_orth_dict

    df = pd.read_table(infile)
    sorted_df = df#.sort_values(["Average_tpm"],ascending=False)
    tpm_only_df = sorted_df[["Geneid","Average_tpm"]]
    id_list = list(tpm_only_df["Geneid"])
    tpm_list = list(tpm_only_df["Average_tpm"])
    tpm_dict = {}
    for index,row in sorted_df.iterrows():
        tpm_replicate = [str(row[4]),str(row[5]),str(row[6])]
        tpm_dict.update({row[0]:tpm_replicate})

    for id,tpm in zip(id_list,tpm_list):
        
        try:
            prediction = prediction_dict[id]
        except:
            prediction = "None"
        try:
            blast_GO = blast_GO_dict[id]
        except:
            blast_GO = "None"
        try:
            egg_GO = egg_GO_dict[id]
        except:
            egg_GO = "None"
        if blast_GO != "None" and egg_GO == "None":
            GO_term = blast_GO
        elif blast_GO == "None" and egg_GO != "None":
            GO_term = egg_GO
        elif blast_GO == "None" and egg_GO == "None":
            GO_term = "None"
        elif blast_GO != "None" and egg_GO != "None":
            merge = str(blast_GO) + "," + str(egg_GO)
            merge = list(set(merge.split(",")))
            GO_term = ",".join(merge)
        else:
            GO_term = "None"
        try:
            orth_id = orth_dict[id]
            outfile.write("{}\t{}\t{}\t{}\n".format(id,tpm,prediction,GO_term))
            outfile_2.write("{}\t{}\n".format(id,"\t".join(tpm_dict[id])))
        except:
            orth_id = id
            outfile_1.write("{}\t{}\t{}\t{}\n".format(id,tpm,prediction,GO_term))
            outfile_3.write("{}\t{}\n".format(id,"\t".join(tpm_dict[id])))

        


if __name__ == '__main__':
    
    alfalfa_gene = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt"
    clover_gene = "/home/rui-huang/Documents/RNA_seq_doc/clover_triplicate_salmon_tpm.txt"
    alfalfa_ann = "/home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_filtered_annotations_1.tsv"
    clover_ann = "/home/rui-huang/Documents/RNA_seq_doc/blast/clover_filtered_annotations_1.tsv"
    ortholog_file = "/home/rui-huang/Documents/RNA_seq_doc/top_gene_tpm/alfalfa_clover_ortholog_translation.dat"
    get_top_gene(alfalfa_gene,alfalfa_ann,ortholog_file,"alfalfa")
    get_top_gene(clover_gene,clover_ann,ortholog_file,"clover")