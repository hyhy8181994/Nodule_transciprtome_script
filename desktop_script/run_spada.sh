#!/bin/bash

script=/home/rui-huang/Documents/spada_soft/spada/spada.pl

$script -c ./config.txt -d /home/rui-huang/Documents/RNA_seq_doc/spada_alfalfa --fas /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer/SuperDuper.fasta -g /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/supertranscripts.wOrfs.gff3 --hmm /home/rui-huang/Documents/spada_soft/spada/hmm.crp --org Mtruncatula --sp --thread 12

$script -c ./config.txt -d /home/rui-huang/Documents/RNA_seq_doc/spada_clover --fas /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer/SuperDuper.fasta -g /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/supertranscripts.wOrfs.gff3 --hmm /home/rui-huang/Documents/spada_soft/spada/hmm.crp --org Mtruncatula --sp --thread 12
