#!/bin/bash

signalP=/home/rui-huang/Documents/spada_soft/signalP/signalp
out=/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence

$signalP -s notm -t euk -f summary -n $out/NCR_signal.gff -m $out/NCR_mature.fasta -v /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/NCR_merge.fasta > /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/signal_short.out
