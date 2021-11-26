import pandas as pd
import os
import subprocess
from BCBio import GFF

def blast_di(cds,pro,out):
    main_dict = {}
    hit_dict = {}
    #dir = subprocess.check_output("pwd")
    with open(cds,"r") as file:
        lines = file.readlines()
        for l in lines:
            contig_info = l.strip("\n").split("\t")
            main_dict.update({contig_info[0]:[contig_info[1],contig_info[11]]})
    with open(pro,"r") as file:
        lines = file.readlines()
        for l in lines:
            contig_info = l.strip("\n").split("\t")
            try: 
                cds_hit = main_dict[contig_info[0]]
                if cds_hit[0] == contig_info[1]:
                    if int(cds_hit[1]) >= 50 or int(contig_info[11]) >= 50:
                        hit_dict.update({contig_info[0]:contig_info[1]})
            except:
                pass
    blast_df = pd.DataFrame.from_dict(hit_dict, orient= "index")
    blast_df.to_csv(out + "clover_bihit.csv")



def translate(file):
    with open(file) as f:
        for l in f.readlines():
            info = l.strip("\n")
            info = info.split(" ")
            loc_id = info[0]
            geneid = [i for i in info if "gn=" in i][0].strip("gn=")
            sp_geneid = geneid.split(",")
            if len(sp_geneid) > 1:
                try:
                    gene_name = [i for i in sp_geneid if "|" in i][0].split("|")
                    if len(gene_name) > 2:
                        gene_name = "/".join(gene_name[0,1]) 
                        print(gene_name)
                except:
                    gene_name = sp_geneid[0]
                    gene_id = sp_geneid[1]
            else:
                gene_name = "NA"
    

if __name__ == "__main__":
    alfalfa_cds = "/media/rhuang06/1FBD-E57B/blast/alfalfa_medicago_cds.outfmt6"
    alfalfa_pro = "/media/rhuang06/1FBD-E57B/blast/alfalfa_medicago_pro.outfmt6"
    folder = "/media/rhuang06/1FBD-E57B/"
    clover_cds = "/media/rhuang06/1FBD-E57B/blast/clover_medicago_cds.outfmt6"
    clover_pro = "/media/rhuang06/1FBD-E57B/blast/clover_medicago_pro.outfmt6"
    
    #blast_di(alfalfa_cds,alfalfa_pro,folder)
    #blast_di(clover_cds,clover_pro,folder)
    idfile = "/media/rhuang06/1FBD-E57B/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.id.txt"
    translate(idfile)


    

