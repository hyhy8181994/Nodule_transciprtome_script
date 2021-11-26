#!/bin/bash

#need to change gtf_to_alignment_gff3.pl and gtf_genome_to_cdna_fasta.pl, transcript_id to trans_id

#alfalfa

alfalfa=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa
clover=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover

alfalfa_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer
clover_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer

util=/home/rui-huang/Documents/TransDecoder/util
gffread=/home/rui-huang/Documents/gffread/gffread

#$util/gtf_to_alignment_gff3.pl $alfalfa_super/SuperDuperTrans.gff > $alfalfa_super/SuperDuperTrans.gff3

#util/gff3_gene_to_gtf_format.pl $alfalfa_super/SuperDuperTrans.gff $alfalfa_super/SuperDuper.fasta > $alfalfa_super/SuperDuperTrans.gtf

$gffread -E $alfalfa_super/SuperDuperTrans.gff -T -o $alfalfa_super/SuperDuperTrans.gtf

#$util/gtf_genome_to_cdna_fasta.pl $alfalfa_super/SuperDuperTrans.gff $alfalfa_super/SuperDuper.fasta > $alfalfa_super/transcript.fasta

#TransDecoder.LongOrfs -t $alfalfa_super/transcript.fasta -O $alfalfa -m 15

#$util/cdna_alignment_orf_to_genome_orf.pl $alfalfa/transcript.fasta.transdecoder.gff3 $alfalfa_super/SuperDuperTrans.gff3 $alfalfa_super/transcript.fasta > $alfalfa/supertranscripts.wOrfs.gff3

#$util/gff3_gene_to_gtf_format.pl $clover_super/SuperDuperTrans.gff $clover_super/SuperDuper.fasta > $clover_super/SuperDuperTrans.gtf

#$util/gtf_to_alignment_gff3.pl $clover_super/SuperDuperTrans.gff > $clover_super/SuperDuperTrans.gff3

#$util/gtf_genome_to_cdna_fasta.pl $clover_super/SuperDuperTrans.gff $clover_super/SuperDuper.fasta > $clover_super/transcript.fasta

#TransDecoder.LongOrfs -t $clover_super/transcript.fasta -O $clover -m 15

#$util/cdna_alignment_orf_to_genome_orf.pl $clover/transcript.fasta.transdecoder.gff3 $clover_super/SuperDuperTrans.gff3 $clover_super/transcript.fasta > $clover/supertranscripts.wOrfs.gff3
