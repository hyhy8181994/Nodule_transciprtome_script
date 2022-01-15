def check_rate(alg,out):
    
    transcript_list = []
    with open(alg,"r") as file:
        for l in file:
            if ">" in l:
                row = l.split(" ")
                transcript_id = row[1]
                transcript_list.append(transcript_id)
    transcript_list = list(set(transcript_list))
    length = len(transcript_list)
    precent = (length/253871)*100
    print("{} % of alfalfa transcript has alignment to genome".format(precent))
if __name__ == '__main__':
    alg_file = "/home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_transcript_genome_alg.delta"
    folder = "/home/rui-huang/Documents/RNA_seq_doc/blast"
    check_rate(alg_file,folder)
    