import pandas as pd
import matplotlib.pyplot as plt
import matplotlib



def main(feature_table, salmon_table):
    tpm_dict = {}
    with open(feature_table) as file:
        counter = 0 
        for l in file:
            if counter != 0:
                info = l.strip("\n").split("\t")
                tpm_dict.update({info[0]:info[7]})
            counter += 1
    with open(salmon_table) as file:
        for l in file:
            info = l.strip("\n").split("\t")
            try:
                tpm_hit = tpm_dict[info[0]]
                tpm_dict.update({info[0]:[tpm_hit,info[3]]})
            except:
                pass
    return(tpm_dict)

def draw_scatter(input_dict,out,plant):
    fig, ax = plt.subplots()
    f_list = []
    s_list = []
    for i in input_dict.values():
        
        f_list.append(float(i[0]))
        s_list.append(float(i[1]))
    x = f_list
    y = s_list
    ax.scatter(x,y, s = 1 )
    ax.set_xlim((-10,1000))
    ax.set_ylim((-10,1000))
    ax.set_xlabel("salmon tpm")
    ax.set_ylabel("feature count tpm")
    fig.savefig("{}/{}_tpm_scatter.png".format(out,plant))
    fig.show()

def draw_line(input,out,plant):
    df = pd.DataFrame.from_dict(input,columns=["salmon","featurecount"],orient="index")
    df = df.sort_values(by = ["salmon"])
    df.to_csv("{}/{}_tpm.csv".format(out,plant))
    print(df)
    
    fig = plt.figure()
    x = list(range(0,len(list(df.index.values))))
    #x = list(df["salmon"])
    y1 = df["featurecount"]
    y2 = df["salmon"]
    plt.plot(x,y2,color='tab:blue',label="salmon")
    #plt.plot(x,y1,color='tab:orange',label="featurecount")
    #ax.set_xlim((0,5000))
    #ax.set_ylim((0,5000))
    #plt.show()
    #ax.set_xlabel("gene")
    #ax.set_ylabel("tpm")
    plt.legend()
    plt.show()
    plt.savefig("{}/{}_tpm_line.png".format(out,plant))
    

def check_TPM_sum (al_table,cl_table):
    df_al = pd.read_table(al_table)
    df_cl = pd.read_table(cl_table)
    

    al_tpm = df_al.iloc[:,4:7].sum()
    cl_tpm = df_cl.iloc[:,4:7].sum()


if __name__ == '__main__':
    '''
    featurecount = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/alfalfa/tpm.txt"
    salmon = "/home/rui-huang/Documents/RNA_seq_doc/salmon/alfalfa/quant.sf"
    out_folder = "/home/rui-huang/Documents/RNA_seq_doc/fig"
    tpm_dictionary = main(featurecount,salmon)
    draw_scatter(tpm_dictionary,out_folder,"alfalfa")
    
    featurecount = "/home/rui-huang/Documents/RNA_seq_doc/featurecount/clover/tpm.txt"
    salmon = "/home/rui-huang/Documents/RNA_seq_doc/salmon/clover/quant.sf"
    out_folder = "/home/rui-huang/Documents/RNA_seq_doc/fig"
    tpm_dictionary = main(featurecount,salmon)
    
    draw_scatter(tpm_dictionary,out_folder,"clover")
    #draw_line(tpm_dictionary,out_folder,"alfalfa")
    '''
    alfalfa_tpm_table = "/home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt"
    clover_tpm_table = "/home/rui-huang/Documents/RNA_seq_doc/clover_triplicate_salmon_tpm.txt"
    check_TPM_sum(alfalfa_tpm_table,clover_tpm_table)
    