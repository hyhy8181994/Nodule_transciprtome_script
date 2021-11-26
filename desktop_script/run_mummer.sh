#!/bin/bash

genome=/home/rui-huang/Documents/RNA_seq_doc/blast/M.sativa/final_genome.fasta
transcript=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/Trinity.fasta
mummer=/home/rui-huang/Documents/mummer-4.0.0rc1/nucmer
plot=/home/rui-huang/Documents/mummer-4.0.0rc1/mummerplot

#$mummer $genome $transcript

$plot ./out.delta
