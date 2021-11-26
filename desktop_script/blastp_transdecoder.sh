#!/bin/bash

alfalfa=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/alfalfa
clover=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/clover
uniprot=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/uniport

blastp -query $alfalfa/longest_orfs.pep  \
    -db $uniprot/uniprot_sprot.fasta  -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 24 > $uniprot/blastp.outfmt6
