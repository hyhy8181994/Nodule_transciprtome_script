
def NCR_table(input,out,plant):
    out_file_1 = open(out + "/NCR_peptide_pI_counts_{}.txt".format(plant),"w")
    out_file_2 = open(out + "/NCR_peptide_PI_tpm_{}.txt".format(plant),"w")
    count_1 = 0
    count_2 = 0
    count_3 = 0
    count_4 = 0
    count_5 = 0
    count_6 = 0
    count_7 = 0
    count_8 = 0
    count_9 = 0
    count_10 = 0
    count_11 = 0
    count_12 = 0
    count_13 = 0
    count_14 = 0
    count_15 = 0
    count_16 = 0
    count_17 = 0
    tpm_1 = 0
    tpm_2 = 0
    tpm_3 = 0
    tpm_4 = 0
    tpm_5 = 0
    tpm_6 = 0
    tpm_7 = 0
    tpm_8 = 0
    tpm_9 = 0
    tpm_10 = 0
    tpm_11 = 0
    tpm_12 = 0
    tpm_13 = 0
    tpm_14 = 0
    tpm_15 = 0
    tpm_16 = 0
    tpm_17 = 0
    with open(input) as file:
        lines = file.readlines()
        lines = lines[1::]
        for l in lines:
            row = l.strip("\n").split("\t")
            tpm = float(row[2])
            pI = float(row[5])
            if row[1] == plant:
                if pI >= 2.5 and pI <= 3.0:
                    count_1 += 1
                    tpm_1 += tpm
                elif pI > 3 and pI <= 3.5:
                    count_2 += 1
                    tpm_2 += tpm
                elif pI > 3.5 and pI <= 4.0:
                    count_3 += 1
                    tpm_3 += tpm
                elif pI > 4.0 and pI <= 4.5:
                    count_4 += 1
                    tpm_4 += tpm
                elif pI > 4.5 and pI <= 5.0:
                    count_5 += 1
                    tpm_5 += tpm
                elif pI > 5.0 and pI <= 5.5:
                    count_6 += 1
                    tpm_6 += tpm
                elif pI > 5.5 and pI <= 6.0:
                    count_7 += 1
                    tpm_7 += tpm
                elif pI > 6.0 and pI <= 6.5:
                    count_8 += 1
                    tpm_8 += tpm
                elif pI > 6.5 and pI <= 7.0:
                    count_9 += 1
                    tpm_9 += tpm
                elif pI > 7.0 and pI <= 7.5:
                    count_10 += 1
                    tpm_10 += tpm
                elif pI > 7.5 and pI <= 8.0:
                    count_11 += 1
                    tpm_11 += tpm
                elif pI > 8.0 and pI <= 8.5:
                    count_12 += 1
                    tpm_12 += tpm
                elif pI > 8.5 and pI <= 9.0:
                    count_13 += 1
                    tpm_13 += tpm
                elif pI > 9.0 and pI <= 9.5:
                    count_14 += 1
                    tpm_14 += tpm
                elif pI > 9.5 and pI <= 10.0:
                    count_15 += 1
                    tpm_15 += tpm
                elif pI > 10.0 and pI <= 10.5:
                    count_16 += 1
                    tpm_16 += tpm
                elif pI > 10.5 and pI <= 11.0:
                    count_17 += 1
                    tpm_17 += tpm
    out_file_1.write("{}\t{}\n".format("2.5-3",count_1))
    out_file_1.write("{}\t{}\n".format("3-3.5",count_2))
    out_file_1.write("{}\t{}\n".format("3.5-4",count_3))
    out_file_1.write("{}\t{}\n".format("4-4.5",count_4))
    out_file_1.write("{}\t{}\n".format("4.5-5",count_5))
    out_file_1.write("{}\t{}\n".format("5-5.5",count_6))
    out_file_1.write("{}\t{}\n".format("5.5-6",count_7))
    out_file_1.write("{}\t{}\n".format("6-6.5",count_8))
    out_file_1.write("{}\t{}\n".format("6.5-7",count_9))
    out_file_1.write("{}\t{}\n".format("7-7.5",count_10))
    out_file_1.write("{}\t{}\n".format("7.5-8",count_11))
    out_file_1.write("{}\t{}\n".format("8-8.5",count_12))
    out_file_1.write("{}\t{}\n".format("8.5-9",count_13))
    out_file_1.write("{}\t{}\n".format("9-9.5",count_14))
    out_file_1.write("{}\t{}\n".format("9.5-10",count_15))
    out_file_1.write("{}\t{}\n".format("10-10.5",count_16))
    out_file_1.write("{}\t{}\n".format("10.5-11",count_17))

    out_file_2.write("{}\t{}\n".format("2.5-3",tpm_1))
    out_file_2.write("{}\t{}\n".format("3-3.5",tpm_2))
    out_file_2.write("{}\t{}\n".format("3.5-4",tpm_3))
    out_file_2.write("{}\t{}\n".format("4-4.5",tpm_4))
    out_file_2.write("{}\t{}\n".format("4.5-5",tpm_5))
    out_file_2.write("{}\t{}\n".format("5-5.5",tpm_6))
    out_file_2.write("{}\t{}\n".format("5.5-6",tpm_7))
    out_file_2.write("{}\t{}\n".format("6-6.5",tpm_8))
    out_file_2.write("{}\t{}\n".format("6.5-7",tpm_9))
    out_file_2.write("{}\t{}\n".format("7-7.5",tpm_10))
    out_file_2.write("{}\t{}\n".format("7.5-8",tpm_11))
    out_file_2.write("{}\t{}\n".format("8-8.5",tpm_12))
    out_file_2.write("{}\t{}\n".format("8.5-9",tpm_13))
    out_file_2.write("{}\t{}\n".format("9-9.5",tpm_14))
    out_file_2.write("{}\t{}\n".format("9.5-10",tpm_15))
    out_file_2.write("{}\t{}\n".format("10-10.5",tpm_16))
    out_file_2.write("{}\t{}\n".format("10.5-11",tpm_17))



if __name__ == '__main__':
    folder = "/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering/NCR_clusters/"
    data_table = "cluster_NCR_type_tpm.txt"
    NCR_table(folder + data_table,folder,"alfalfa")
    NCR_table(folder + data_table,folder,"clover")
    