import os
import argparse

parser = argparse.ArgumentParser(description='Filter NCR peptides based on spada output')
parser.add_argument('-t',required=True,help='spada output tbl file ')
parser.add_argument('-hmm',required=True,help='hmm result')
parser.add_argument('-o',required=True,help='output folder (abs path)')
parser.add_argument('-n',required=True,help='name of plant (alfalfa or clover)')

args = vars(parser.parse_args())


def NCR_filter(table,hmm,out,na):
    counter = 0
    counter_1 = 0
    id_list = []
    spada_table_dict = {}
    with open(table,"r") as f:
        for l in f:
            counter += 1
            if counter > 1:
                info = l.strip("\n").split("\t")
                print(info)
                id = info[0]
                family = info[1]
                contig = info[2]
                E_score = info[6]
                E_score = float(E_score)
                hmm_score = float(info[8])
                seqence = info[10]
                if E_score <= 1e-5:
                    if hmm_score > 50:
                        counter_1 += 1
                        id_list.append(id)
                        spada_table_dict.update({id:[family,contig,seqence]})
    print("find {} high confidence cys rich peptide from spada output in {}".format(len(spada_table_dict.keys()),na))
    #print(spada_table_dict)
    counter_non = 0
    counter_total = 0
    hmm_hit_dict = {}
    with open(hmm,"r") as f:
        for l in f:
            if "#" not in l:
                info = l.strip("\n").split(" ")
                #print(info)
                acc_id = info[1]
                seq_id = info[2]
                bit_score = float(info[5])
                name = info[0]
                #print(seq_id)
                if bit_score >= 50:
                    counter_total += 1
                    if "Nodulin" in name:
                        try:
                            sec_hit = hmm_hit_dict[seq_id]
                            if bit_score < sec_hit[2]:
                                hmm_hit_dict.update({seq_id:[acc_id,name,bit_score]})
                        except:
                            hmm_hit_dict.update({seq_id:[acc_id,name,bit_score]})
                    else:
                        counter_non += 1
                
    print("find {} high confidence of Cys rich peptides from hmm pfam hit in {}".format(counter_total,na))
    print("find {} other Cys rich peptides in {}".format(counter_non,na))    
    file = open(out + "/" + na + "_NCR_seq.fasta","w+")
    ncr_hit_list = []
    for key,item in spada_table_dict.items():
        #print(key)
        try:
            hmm_hit_dict[key]
            ncr_hit_list.append(key)
            file.write(">" + key + "\n")
            file.write(item[2] + "\n")
        except:
            pass
    file.close()
    
    

            
    


if __name__ == '__main__':
    
    alfalfa_table = args['t']
    #clover_table = "/home/rui-huang/Documents/RNA_seq_doc/clover_spada/61_final.tbl"

    alfalfa_hmm = args['hmm']
    #clover_hmm = "/home/rui-huang/Documents/RNA_seq_doc/pfam/clover_cys.out_1"

    out_path = args['o']
    #run script to reformat the hmm table

    #os.system("./format_hmm_result.sh {}".format(alfalfa_hmm))
    #os.system("./format_hmm_result.sh {}".format(alfalfa_hmm))

    NCR_filter(alfalfa_table,alfalfa_hmm,out_path,args['n'])
    #NCR_filter(clover_table,clover_hmm,out_path,"clover")