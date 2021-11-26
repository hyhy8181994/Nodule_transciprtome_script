#!/bin/bash

#need to change gtf_to_alignment_gff3.pl and gtf_genome_to_cdna_fasta.pl, transcript_id to trans_id

#alfalfa

alfalfa=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa_1
clover=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover_1

alfalfa_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lace
clover_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lace

util=/home/rui-huang/Documents/TransDecoder/util


#$util/gtf_to_alignment_gff3.pl $alfalfa_super/trinity_genes.gtf > $alfalfa_super/trinity_genes.gff3

#$util/gtf_genome_to_cdna_fasta.pl $alfalfa_super/trinity_genes.gtf $alfalfa_super/trinity_genes.fasta > $alfalfa_super/transcript.fasta

TransDecoder.LongOrfs -t $alfalfa_super/transcript.fasta -O $alfalfa -m 15

#$util/gtf_to_alignment_gff3.pl $clover_super/trinity_genes.gtf > $clover_super/trinity_genes.gff3

#$util/gtf_genome_to_cdna_fasta.pl $clover_super/trinity_genes.gtf $clover_super/trinity_genes.fasta > $clover_super/transcript.fasta

TransDecoder.LongOrfs -t $clover_super/transcript.fasta -O $clover -m 15
