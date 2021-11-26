from Bio import SeqIO

def record2dict(record):
    out_dict = {}
    for r in record:
        out_dict.update({r.id:r.seq})
    return(out_dict)
    


merge_file = SeqIO.parse(open("/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_merge.fasta"),"fasta")
alfalfa_file = SeqIO.parse(open("/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/alfalfa_NCR_seq_noDup.fa"),"fasta")
clover_file = SeqIO.parse(open("/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/clover_NCR_seq_noDup.fa"),"fasta")

merge_dict = record2dict(merge_file)
alfalfa_dict = record2dict(alfalfa_file)
clover_dict = record2dict(clover_file)




for keys,values in alfalfa_dict.items():
    try:
        merge_dict[keys]
    except:
        print(keys)



for keys,values in clover_dict.items():
    try:
        merge_dict[keys]
    except:
        print(keys)
