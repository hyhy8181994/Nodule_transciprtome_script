#!/bin/bash



alfalfa=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/protein
clover=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/protein

folder=/home/rui-huang/Documents/RNA_seq_doc/orthofinder

mkdir -p $folder

mkdir -p $foler/alfalfa

cd $foler/alfalfa

orthofinder -f $alfalfa -t 24 -a 24
