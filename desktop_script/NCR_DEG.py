import pandas as pd

def NCR_DEG(DEG_up,DEG_down,NCR,out):
    up_df = pd.read_table(DEG_up)
    down_df = pd.read_table(DEG_down)
    NCR_df = pd.read_table(NCR)
    up_dict = dict(zip(up_df.iloc[:,0],up_df.iloc[:,2]))
    down_dict = dict(zip(down_df.iloc[:,0],down_df.iloc[:,2]))
    up_list = []
    down_list = []
    for i in NCR_df.iloc[:,0]:
        change_id = i.split("_")[1]
        try:
            up_dict[change_id]
            up_list.append(i)
        except:
            try:
                down_dict[change_id]
                down_list.append(i)
            except:
                pass
    print(len(up_list))
    print(len(down_list))

if __name__ == '__main__':
    DEG_file_up = "/home/rui-huang/Documents/RNA_seq_doc/deseq2/up_deseq2_2-5.txt"
    DEG_file_down = "/home/rui-huang/Documents/RNA_seq_doc/deseq2/down_deseq2_2-5.txt"
    NCR_ortholog = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_ortholog_tpm.txt"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering"
    NCR_DEG(DEG_file_up,DEG_file_down,NCR_ortholog,folder)
    