import os
import subprocess
import pandas as pd
import pickle as pk



def contig_ann (ann_df,out,name):
    main_dict = {}
    df = pd.read_csv(ann_df)
    sub_df = df.loc[:,["contig_id","blast_hit_loci_id","eggnog_match_seq","pfam_id","tigr_id"]]
    for index, row in sub_df.iterrows():
        contig_id = row["contig_id"]
        #print(contig_id)
        try:
            item = main_dict[contig_id]
            main_dict.update({contig_id:[[row["blast_hit_loci_id"],row["eggnog_match_seq"],row["pfam_id"],row["tigr_id"]],item]})
        except:
            main_dict.update({contig_id:[row["blast_hit_loci_id"],row["eggnog_match_seq"],row["pfam_id"],row["tigr_id"]]})
    pk.dump(main_dict,open(out + name + "_contig_ann.dat","wb"))


if __name__ == "__main__":
    alfalfa_ann = "/home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_annotations.csv"
    clover_ann = "/home/rui-huang/Documents/RNA_seq_doc/blast/clover_annotations.csv"

    folder = '/home/rui-huang/Documents/RNA_seq_doc/blast/'

    contig_ann(alfalfa_ann,folder,"alfalfa")
    contig_ann(clover_ann,folder,"clover")
