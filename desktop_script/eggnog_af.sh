#!/bin/bash
script=/home/rui-huang/Documents/eggnog-mapper/emapper.py

$script --cpu 12 -i /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep --output alfalfa_query_seqs.fa --output_dir /home/rui-huang/Documents/RNA_seq_doc/eggnog -m diamond --tax_scope 33090 --target_orthologs all
