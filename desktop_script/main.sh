#!/bin/bash


script_folder=/home/rui-huang/Documents/RNA_seq_doc/scripts
raw_reads_folder=/home/rui-huang/Documents/RNA_seq_doc/tcag-data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX

Trimmed_data_folder=/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data
#----------------------check quality of raw reads
python run_fastp.py -i $raw_reads_folder -o $Trimmed_data_folder

#----------------------run Rcorrector
#this step was run in computecanada server
#Use trinity_input_file_setup.py to generate the input files list
out_a=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/alfalfa
out_c=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover

rcorrector -t 48 -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R1_001.fastq \
-2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S23_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S4_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_4_S5_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_1_S22_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/alfalfa_6_S6_L005_R2_001.fastq \
-od $out_a
 
 #clover
rcorrector -t 48 -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R1_001.fastq \
 -2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S2_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_3_S20_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S1_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S3_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_5_S21_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/raw_data/Y90GYN2/DIC15727.20210113/201224_D00430_0430_ACE9TTANXX/clover_2_S19_L004_R2_001.fastq \
 -od $out_c
 
#----------------------run uncorrect_filter.py to set up FilterUncorrectabledPEfastq.py which will remove reads have the unfixable error 

correct_reads_alfalfa=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/alfalfa
correct_reads_clover=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/corrected_data/clover
filter_script=/home/rui-huang/Documents/RNA_seq_doc/scripts/TranscriptomeAssemblyTools-master/FilterUncorrectabledPEfastq.py

#alfalfa
python uncorrect_filter.py -i $correct_reads_alfalfa -s $filter_script
#clover
python uncorrect_filter.py -i $correct_reads_clover -s $filter_script

#run trim galore to remove adaptor
trim_galore_outpath_alfalfa=/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/alfalfa
trim_galore_outpath_clover=/home/rui-huang/Documents/RNA_seq_doc/Trimmed_data/clover
trim_galore_script=/home/rui-huang/Documents/TrimGalore/trim_galore

#alfalfa
python run_trim_gelore.py -i $correct_reads_alfalfa -o $trim_galore_outpath_alfalfa -s $trim_galore_script

#clover
python run_trim_gelore.py -i $correct_reads_clover -o $trim_galore_outpath_clover -s $trim_galore_script

#----------------------run trinity assembly with trimmomatic setup
#this step was also run in server
#Use trinity_input_file_setup.py to generate the input files list
#alfalfa
Trinity --seqType fq --left /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq \
--right /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/alfalfa/fastq/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq \
--trimmomatic --quality_trimming_params "SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:25" --max_memory 100G --CPU 24


#clover

Trinity --seqType fq --left /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq \
--right /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/clover/fastq/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq --output /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa \
--trimmomatic --quality_trimming_params "SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:25" --max_memory 100G --CPU 24


#----------------------use bowtie2 to check the alignment rate of assemblies
#this step was also run in server
alfalfa_trinity=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/transcriptome_assembly/alfalfa/Trinity.fasta
clover_trinity=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/transcriptome_assembly/clover/Trinity.fasta

bowtie2 -p 10 -q --no-unal -k 20 -x $alfalfa_trinity -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R1_001.fastq -2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R2_001.fastq 2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam 

bowtie2 -p 10 -q --no-unal -k 20 -x $clover_trinity -1 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R1_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R1_001.fastq -2 /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S1_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S20_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_3_S2_L005_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S21_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_2_S19_L004_R2_001.fastq,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/Trimmed_data/Trimmed_data/clover/out_clover_5_S3_L005_R2_001.fastq 2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam 

#run Trinity_stats.pl to check basic stats


#----------------------run corset clusters
#this step was also run in server
corset=/home/rhuang06/projects/def-gd38/rhuang06/software/corset
bam_alfalfa=/home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/sorted_bowtie2.bam
bam_clover=/home/rhuang06/scratch/trinity_new_assembly/clover/assembly/sorted_bowtie2.bam


cd /home/rhuang06/scratch/trinity_new_assembly/alfalfa/assembly/
$corset -D 99999999999 $bam_alfalfa

cd /home/rhuang06/scratch/trinity_new_assembly/clover/assembly/
$corset -D 99999999999 $bam_clover
#The corset output cluster.txt was needed for lace

#----------------------Run Lace to produce supertranscript
#need -a option to produce Trans gtf file. don't use tidy option
#conda activate lace
#alfalfa
Lace --cores 12 -a --outputDir /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/Trinity.fasta /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/clusters.txt
#clover
Lace --cores 12 -a --outputDir /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/Trinity.fasta /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/clusters.txt


#----------------------run star alignment to check alignment rate
#this step was also run in server
#the parameters was refer to arabidopsis 

star=/home/rhuang06/projects/def-gd38/rhuang06/software/STAR/bin/Linux_x86_64_static/STAR

GENOMEDIR=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/supertranscript/lacer

##alfalfa
#create index 
$star --runThreadN 48 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuper.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 61000000000 --genomeSAindexNbases 12


$star --runMode alignReads --twopassMode Basic --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/alfalfa/trimmed_reads/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim


##clover
GENOMEDIR=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/supertranscript/lacer

#create index
$star --runThreadN 48 --runMode genomeGenerate --genomeDir $GENOMEDIR/star_index --genomeFastaFiles $GENOMEDIR/SuperDuper.fasta --sjdbGTFfile $GENOMEDIR/SuperDuper.gff --sjdbGTFtagExonParentTranscript gene_id --limitGenomeGenerateRAM 88000000000 --genomeSAindexNbases 12


$star --runMode alignReads --twopassMode Basic --runThreadN 48 --genomeDir $GENOMEDIR/star_index --outSAMtype BAM SortedByCoordinate --alignIntronMax 6000 --alignIntronMin 60\
--outSAMunmapped Within --outFileNamePrefix $GENOMEDIR/star/first_run_ \
--readFilesIn /home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim \
/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim,/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/trinity_new_assembly/clover/trimmed_reads/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim


#----------------------run busco to check completeness of assemblies
#Need a configure file in its defalut folder
#use fabales dataset


#alfalfa
busco -i /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/lacer/SuperDuper.fasta -l /home/rui-huang/Documents/RNA_seq_doc/scripts/busco/fabales_odb10.2020-08-05/fabales_odb10 -m transcriptome --out alfalfa_super_corset -f -c 12

#clover
busco -i /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/lacer/SuperDuper.fasta -l /home/rui-huang/Documents/RNA_seq_doc/scripts/busco/fabales_odb10.2020-08-05/fabales_odb10 -m transcriptome --out clover_super_corset -f -c 12

#also run the same thing with viridiplantae dataset
#alfalfa
busco -i /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/lacer/SuperDuper.fasta -l /home/rui-huang/Documents/RNA_seq_doc/scripts/busco_viridiplantae/viridiplantae_odb10.2020-09-10/viridiplantae_odb10 -m transcriptome --out alfalfa_super_corset -f -c 12
#clover
busco -i /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/lacer/SuperDuper.fasta -l /home/rui-huang/Documents/RNA_seq_doc/scripts/busco_viridiplantae/viridiplantae_odb10.2020-09-10/viridiplantae_odb10 -m transcriptome --out clover_super_corset -f -c 12

#use package provided python script to generate plot

python generate_plot.py -wd /home/rui-huang/Documents/RNA_seq_doc/busco/summary_table

#Use seqstats to generate stats of assemblies
##don't need any parameters

#----------------------Run transdecoder to predict gene coding region
#refer to the example step they provided in github for supertranscripts (https://github.com/TransDecoder/TransDecoder/blob/master/sample_data/supertranscripts_example/runMe.sh)

#if in gtf file, the transript id is written in trans_id, need to change gtf_to_alignment_gff3.pl and gtf_genome_to_cdna_fasta.pl, transcript_id to trans_id
#my $trans_id = $atts{trans_id}


alfalfa_transdecoder_out=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa
clover_transdecoder_out=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover

alfalfa_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer
clover_super=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer

util=/home/rui-huang/Documents/TransDecoder/util
uniprot=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/uniport
#alfalfa

#covert gff to gff3 file
$util/gtf_to_alignment_gff3.pl $alfalfa_super/SuperDuperTrans.gff > $alfalfa_super/SuperDuperTrans.gff3

#extract all transcripts
$util/gtf_genome_to_cdna_fasta.pl $alfalfa_super/SuperDuperTrans.gff $alfalfa_super/SuperDuper.fasta > $alfalfa_super/transcript.fasta

#generate Long orfs
TransDecoder.LongOrfs -t $alfalfa_super/transcript.fasta -O $alfalfa_transdecoder_out -m 15

##run blastp for transdecoder prediction
blastp -query $alfalfa_transdecoder_out/longest_orfs.pep  \
    -db $uniprot/uniprot_sprot.fasta  -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 12 > $uniprot/blastp_alfalfa_all.outfmt6

#Final predcition
TransDecoder.Predict --single_best_only -t $alfalfa_super/transcript.fasta \
--retain_blastp_hits /home/rui-huang/Documents/RNA_seq_doc/transdecoder/uniport/blastp_alfalfa_all.outfmt6 \
-O /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa

#generate Gff3 file for predictions
$util/cdna_alignment_orf_to_genome_orf.pl $alfalfa_transdecoder_out/transcript.fasta.transdecoder.gff3 $alfalfa_super/SuperDuperTrans.gff3 $alfalfa_super/transcript.fasta > $alfalfa_transdecoder_out/supertranscripts.wOrfs.gff3


#clover
$util/gtf_to_alignment_gff3.pl $clover_super/SuperDuperTrans.gff > $clover_super/SuperDuperTrans.gff3

$util/gtf_genome_to_cdna_fasta.pl $clover_super/SuperDuperTrans.gff $clover_super/SuperDuper.fasta > $clover_super/transcript.fasta

TransDecoder.LongOrfs -t $clover_super/transcript.fasta -O $clover_transdecoder_out -m 15


##run blastp for transdecoder prediction


blastp -query $clover_transdecoder_out/longest_orfs.pep  \
    -db $uniprot/uniprot_sprot.fasta  -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 12 > $uniprot/blastp_clover_all.outfmt6

TransDecoder.Predict --single_best_only -t $clover_transdecoder_out/transcript.fasta \
--retain_blastp_hits /home/rui-huang/Documents/RNA_seq_doc/transdecoder/uniport/blastp_clover_all.outfmt6 \
-O /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover

$util/cdna_alignment_orf_to_genome_orf.pl $clover_transdecoder_out/transcript.fasta.transdecoder.gff3 $clover_super/SuperDuperTrans.gff3 $clover_super/transcript.fasta > $clover_transdecoder_out/supertranscripts.wOrfs.gff3


#----------------blast aginist S. meliloti genome to check contanimation
#make database
makeblastdb -in /home/rui-huang/Documents/RNA_seq_doc/blast/S_melilotiu_genome/uniprot-proteome_UP000001976.fasta -parse_seqids -dbtype nucl

blastp -query /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/lacer/SuperDuper.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/blast/S_melilotiu_genome/uniprot-proteome_UP000001976.fasta  -max_target_seqs 1 \
-outfmt 6 -evalue 1e-1 -num_threads 12 > alfalfa_smeliloti.outfmt6

blastp -query /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/lacer/SuperDuper.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/blast/S_melilotiu_genome/uniprot-proteome_UP000001976.fasta  -max_target_seqs 1 \
-outfmt 6 -evalue 1e-1 -num_threads 12 > clover_smeliloti.outfmt6


##----------------------annotation step

#------------- blast bi-directional hit on M. truncatula genome

#make database
makeblastdb -in /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta -parse_seqids -dbtype prot

makeblastdb -in /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/new_alfalfa_pep.fasta -parse_seqids -dbtype prot

makeblastdb -in /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/new_clover_pep.fasta -parse_seqids -dbtype prot

#prepare protein sequence file for blast. The isoforms of genes are removed, only the isoform has the longest 

python remove_isoform.py -i /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep -o /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa

python remove_isoform.py -i /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep -o /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover

#alfalfa blast aginist M. truncatula
blastp -query /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/new_alfalfa_pep.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-2 -num_threads 12 > alfalfa_medicago_pro_A.outfmt6
#M. truncatula blast aginist alfalfa
blastp -query /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/new_alfalfa_pep.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-2 -num_threads 12 > alfalfa_medicago_pro_M.outfmt6

#clover blast aginist M. truncatula
blastp --query /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/new_clover_pep.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-2 -num_threads 12 > clover_medicago_pro_C.outfmt6
#M. trincatula blast aginist clover
blastp -query /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/new_clover_pep.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-2 -num_threads 24 > clover_medicago_pro_M.outfmt6


#-----------------eggnog blast
egg_script=/home/rui-huang/Documents/eggnog-mapper/emapper.py

#alfalfa
$egg_script --cpu 12 -i /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep --output alfalfa_query_seqs.fa --output_dir /home/rui-huang/Documents/RNA_seq_doc/eggnog -m diamond --tax_scope 33090 --target_orthologs all

#clover
$egg_script --cpu 12 -i /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep --output clover_query_seqs.fa --output_dir /home/rui-huang/Documents/RNA_seq_doc/eggnog -m diamond --tax_scope 33090 --target_orthologs all

#----------------HMM search on Pfam database

pfam=/home/rui-huang/Documents/RNA_seq_doc/pfam
#make hmm database
makehmmerdb $pfam/Pfam-A.hmm

#alfalfa
hmmsearch --cpu 12 -E 0.00001 --tblout $pfam/alfalfa_pfam_scan_out.out $pfam/Pfam-A.hmm /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep 

#clover
hmmsearch --cpu 12 -E 0.00001 --tblout $pfam/clover_pfam_scan_out.out $pfam/Pfam-A.hmm /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep

#format hmm output to space separate (Use format_hmm_result.sh scripts) (only the first 5 columns were selected)
awk '!/#/' $1 | awk '{print $1,$2,$3,$4,$5,$6}' > $1_1 # this is just the code. run the format_hmm_result.sh

#--------------- HMM search on TIGRFAM
tiger=/home/rui-huang/Documents/RNA_seq_doc/HMM/TIGRFAM
#make hmm database
makehmmerdb $tiger/TIGRFAMs_15.0_HMM.LIB

#alfalfa
hmmsearch --cpu 12 -E 0.00001 --tblout ./alfalfa_tigrfam.out $tiger/TIGRFAMs_15.0_HMM.LIB /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep

#clover
hmmsearch --cpu 12 -E 0.00001 --tblout ./clover_pfam.domtblout $tiger/TIGRFAMs_15.0_HMM.LIB /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep

#----------------make annotation files (a tsv file and several binary files)

##preprations
### generate tsv version of M. truncatula annotation gff3 file 
#use atag script conda activate agat

agat_convert_sp_gff2tsv.pl -gff /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/MtrunA17r5.0-ANR-EGN-r1.7.gff3 -o /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/MtrunA17r5.0-ANR-EGN-r1.7.tsv

###generate list of gene id based on transdecoder output

grep ">" /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/transcript.fasta.transdecoder.pep | awk '{print $1}' | sed 's/>//g' > /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/alfalfa_gene_id.txt

grep ">" /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/transcript.fasta.transdecoder.pep | awk '{print $1}' | sed 's/>//g' > /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/clover_gene_id.txt

### extract accession id and names from pfam

grep -A2 "NAME" $pfam/Pfam-A.hmm > Pfam_name.txt

###format pfam and tigr hmm output
awk '!/#/' $1 | awk '{print $1,$2,$3,$4,$5,$6}' > $1_1 # this is just the example code. run the format_hmm_result.sh

###generate gene id and transid list based on Lace produced gff file
awk '{print $9 $10 $11 $12}' $alfalfa_super/SuperDuperTrans.gff | sed 's/gene_id//g' | sed 's/trans_id//g' | sed 's/"//g' | sed 's/;/\t/g' | uniq > alfalfa_transid_2.txt

awk '{print $9 $10 $11 $12}' $clover_super/SuperDuperTrans.gff | sed 's/gene_id//g' | sed 's/trans_id//g' | sed 's/"//g' | sed 's/;/\t/g' | uniq > clover_transid_2.txt

###generate list of M. truncatula protein sequence headers
grep ">" /home/rui-huang/Documents/RNA_seq_doc/blast/Medicago_truncatula_genome/proteome/MtrunA17r5.0-ANR-EGN-r1.7.prot.fasta | sed 's/>//g' > MtrunA17r5.0-ANR-EGN-r1.7.prot.id.txt


#run bidir.py to organize all annotations files into a tsv file and several binary files for later 
#becasue there are too many input files are needed to this script. It will be better to just adjust paths in the script 
python bidir.py

#run contig_translate.py to generate a binary file for later
python contig_translate.py

#filter the repetitive annotations of isoforms in annotation file
python filter_annotations.py -i /home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_annotations.tsv -o /home/rui-huang/Documents/RNA_seq_doc/blast --eggnog /home/rui-huang/Documents/RNA_seq_doc/eggnog/alfalfa_query_seqs.fa.emapper.annotations --pfam /home/rui-huang/Documents/RNA_seq_doc/pfam/alfalfa_pfam_search_cut.out --tigr /home/rui-huang/Documents/RNA_seq_doc/HMM/alfalfa_tigrfam_cut.out -n alfalfa -m all

python filter_annotations.py -i /home/rui-huang/Documents/RNA_seq_doc/blast/clover_annotations.tsv -o /home/rui-huang/Documents/RNA_seq_doc/blast --eggnog /home/rui-huang/Documents/RNA_seq_doc/eggnog/clover_query_seqs.fa.emapper.annotations --pfam /home/rui-huang/Documents/RNA_seq_doc/pfam/clover_pfam_search_cut.out --tigr /home/rui-huang/Documents/RNA_seq_doc/HMM/clover_tigrfam_cut.out -n clover -m all

#---------------------------spada pipeline
#Need to make the config.txt for the software (follow the instruction)


spada_script=/home/rui-huang/Documents/spada_soft/spada/spada.pl
#alfalfa
$spada_script -c ./config.txt -d /home/rui-huang/Documents/RNA_seq_doc/spada_alfalfa --fas /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer/SuperDuper.fasta -g /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/supertranscripts.wOrfs.gff3 --hmm /home/rui-huang/Documents/spada_soft/spada/hmm.crp --org Mtruncatula --sp --thread 12
#clover
$spada_script -c ./config.txt -d /home/rui-huang/Documents/RNA_seq_doc/spada_clover --fas /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer/SuperDuper.fasta -g /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/supertranscripts.wOrfs.gff3 --hmm /home/rui-huang/Documents/spada_soft/spada/hmm.crp --org Mtruncatula --sp --thread 12


#extract sequences from output files
#run extract_seq.py script in the spada output folder. It will generate the seq.fasta file contains all sequences from spada output
#then use https://arn.ugr.es/srnatoolbox/helper/removedup/ to remove any repeated sequences

#run hmm search the checked sequences on pfam database
#alfalfa
hmmscan --cpu 12 -E 0.00001 --tblout $pfam/alfalfa_cys.out $pfam/Pfam-A.hmm /home/rui-huang/Documents/RNA_seq_doc/spada_alfalfa/seq_noDup.fa
#clover
hmmscan --cpu 12 -E 0.00001 --tblout $pfam/clover_cys.out $pfam/Pfam-A.hmm /home/rui-huang/Documents/RNA_seq_doc/clover_spada/seq_noDup.fa

#use formate_hmm_result.sh to format the output
#filter NCR peptides
#alfalfa
python spada_filter.py -t /home/rui-huang/Documents/RNA_seq_doc/spada_alfalfa/61_final.tbl -hmm /home/rui-huang/Documents/RNA_seq_doc/pfam/alfalfa_cys.out_1 -o /home/rui-huang/Documents/RNA_seq_doc/pfam/ -n alfalfa

#clover
python spada_filter.py -t /home/rui-huang/Documents/RNA_seq_doc/clover_spada/61_final.tbl -hmm /home/rui-huang/Documents/RNA_seq_doc/pfam/clover_cys.out_1 -o /home/rui-huang/Documents/RNA_seq_doc/pfam/ -n clover

#blast check of NCR peptides sequences to remove high simlarity sequences
blastp -query /home/rui-huang/Documents/RNA_seq_doc/pfam/alfalfa_NCR_seq.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/pfam/alfalfa_NCR_seq.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-5 -num_threads 24 > alfalfa_NCR_blast.txt

blastp -query /home/rui-huang/Documents/RNA_seq_doc/pfam/clover_NCR_seq.fasta  \
-db /home/rui-huang/Documents/RNA_seq_doc/pfam/clover_NCR_seq.fasta -culling_limit 1 \
-outfmt 6 -evalue 1e-5 -num_threads 24 > clover_NCR_blast.txt

#use the NCR_check.py script to check high similar sequences
python NCR_check.py -i alfalfa_NCR_blast.txt
python NCR_check.py -i clvoer_NCR_blast.txt
#The removal of sequences were done manually

#Run clustal O to check the N terminal sequence peptide and cys motif
clustal_O=/home/rui-huang/Documents/spada_soft/clustal-omega-1.2.4/bin/clustalo

$clustal_O -i alfalfa_NCR_seq.fasta -o alfalfa_NCR_alg.fasta
$clustal_O -i clover_NCR_seq.fasta -o clover_NCR_alg.fasta

#Use Jalview to visualize the aligment

#merge the alfalfa and clover NCR peptide
cat alfalfa_NCR_seq.fasta clover_NCR_seq.fasta > NCR_merge.fasta

##Use singalP to extract mature peptide sequence of NCR peptides
signalP=/home/rui-huang/Documents/spada_soft/signalP/signalp
out=/home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence

$signalP -s notm -t euk -f summary -n $out/NCR_signal.gff -m $out/NCR_mature.fasta -v /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/NCR_merge.fasta > /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/signal_short.out

#final check of NCR peptide sequences
# alfalfa
python NCR_final_check.py -i /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/alfalfa_NCR_seq_noDup.fa
# clover
python NCR_final_check.py -i /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/clover_NCR_seq_noDup.fa
#manually check the reported NCR peptide sequences



######################Transcript abundance estimate

alfalfa=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer
clover=/home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer

alfalfa_gff=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/supertranscripts.wOrfs.gff3
clover_gff=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_clover/supertranscripts.wOrfs.gff3

out=/home/rui-huang/Documents/RNA_seq_doc/salmon

#build salmon index
salmon index -i $alfalfa/alfalfa_transcripts.idx -t $alfalfa/SuperDuper.fasta -k 31 -p 24

salmon index -i $clover/clover_transcripts.idx -t $clover/SuperDuper.fasta -k 31 -p 24

#alfalfa

salmon quant -p 24 -o $out/alfalfa_1 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S4_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_1_S22_L004_R2_001.cor_val_2.fq.P.qtrim.fq


salmon quant -p 24 -o $out/alfalfa_4 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S5_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_4_S23_L004_R2_001.cor_val_2.fq.P.qtrim.fq



salmon quant -p 24 -o $out/alfalfa_6 -l A -g $alfalfa_gff -i $out/alfalfa_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/alfalfa/unfixrm_alfalfa_6_S6_L005_R2_001.cor_val_2.fq.P.qtrim.fq


#clover
salmon quant -p 24 -o $out/clover_2 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S1_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_2_S19_L004_R2_001.cor_val_2.fq.P.qtrim.fq



salmon quant -p 24 -o $out/clover_3 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R1_001.cor_val_1.fq.P.qtrim.fq \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S2_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_3_S20_L004_R2_001.cor_val_2.fq.P.qtrim.fq


salmon quant -p 24 -o $out/clover_5 -l A -g $clover_gff -i $out/clover_transcripts.idx --validateMappings \
-1 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R1_001.cor_val_1.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R1_001.cor_val_1.fq.P.qtrim.fq  \
-2 /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S3_L005_R2_001.cor_val_2.fq.P.qtrim.fq /media/rui-huang/HHD1/RNA_seq_doc/trimmomatic_data/clover/unfixrm_clover_5_S21_L004_R2_001.cor_val_2.fq.P.qtrim.fq


##merge salmon outputs of each plant replicate

#alfalfa
python salmon_merge.py -i /home/rui-huang/Documents/RNA_seq_doc/salmon -o /home/rui-huang/Documents/RNA_seq_doc -p alfalfa

#clover
python salmon_merge.py -i /home/rui-huang/Documents/RNA_seq_doc/salmon -o /home/rui-huang/Documents/RNA_seq_doc -p clover


##################one-to-one ortholog prediction

#copy alfalfa and clover proteome in to /home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/protein
alfalfa=/home/rui-huang/Documents/RNA_seq_doc/transdecoder/new_alfalfa/protein
folder=/home/rui-huang/Documents/RNA_seq_doc/orthofinder

mkdir -p $folder

mkdir -p $foler/alfalfa

cd $foler/alfalfa

orthofinder -f $alfalfa -t 24 -a 24
#run orthofinder in default mode

#extract one-to-one ortholog from orthofinder output (alfalfa_v_clover.tsv), create table of one-to-one ortholog id, raw counts and tpm values (also other two tables [orthologs_count.txt and orthologs_geneid.txt for ploting]) and a table of alfalfa and clover gene length table. Those two tables are all needed for deseq2 differential expression analysis

python assign_ortholog_group.py -i /home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/Orthologues/Orthologues_alfalfa/alfalfa__v__clover.tsv -o /home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1 -at /home/rui-huang/Documents/RNA_seq_doc/new_assembly/alfalfa_assembly/new_lacer/alfalfa_transid_2.txt -ct /home/rui-huang/Documents/RNA_seq_doc/new_assembly/clover_assembly/new_lacer/clover_transid_2.txt -as /home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt -cs /home/rui-huang/Documents/RNA_seq_doc/clover_triplicate_salmon_tpm.txt -al /home/rui-huang/Documents/RNA_seq_doc/alfalfa_length.txt -cl /home/rui-huang/Documents/RNA_seq_doc/clover_length.txt

#################differential expression analysis

#run deseq2.R 
#Note this R script is not a automatic script. Need two files in working directory: onetoone_ortholog_file.txt and ortholog_length.txt


#filter deseq2 results, only extract the DEGs > 5 and < -5

python filter_deseq2.py -i /home/rui-huang/Documents/RNA_seq_doc/deseq2/alfalfa_vs_clover_DE.txt -o /home/rui-huang/Documents/RNA_seq_doc/deseq2

#give annotations to DEGs

python assign_DEG_annotations.py -up /home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_filtered_annotations_1.tsv -down /home/rui-huang/Documents/RNA_seq_doc/blast/clover_filtered_annotations_1.tsv -b /home/rui-huang/Documents/RNA_seq_doc/OrthoFinder/Results_Apr23_1/alfalfa_clover_ortholog_translation.dat -aa /home/rui-huang/Documents/RNA_seq_doc/blast/alfalfa_filtered_annotations_1.tsv -ca /home/rui-huang/Documents/RNA_seq_doc/blast/clover_filtered_annotations_1.tsv -o /home/rui-huang/Documents/RNA_seq_doc/deseq2

#################NCR peptide clustering

#assign TPM to NCR peptides genes

#alfalfa NCR peptide 
python NCR_tpm.py -i /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/alfalfa_NCR_seq_noDup.fa -t /home/rui-huang/Documents/RNA_seq_doc/alfalfa_triplicate_salmon_tpm.txt -o /home/rui-huang/Documents/RNA_seq_doc -p alfalfa

#clover NCR peptide
python NCR_tpm.py -i /home/rui-huang/Documents/RNA_seq_doc/pfam/NCR_high_confidence/clover_NCR_seq_noDup.fa -t /home/rui-huang/Documents/RNA_seq_doc/clover_triplicate_salmon_tpm.txt -o /home/rui-huang/Documents/RNA_seq_doc -p clover

##create two tables (one has all raw counts, tpm values, average count and average tpm, one just has id, average tpm and plant name)

#predict pI values of each NCR peptides )
#use pIR.R R script need (tab separate NCR mature peptide id and sequences)
#the output file is NCR_PI_table.txt

# run clustering.R script (the first part) to output alignment distance matrix (file name is alg_data_matrix.txt)

# run make_NCR_clustering_table.py to create a NCR peptide data table for clustering
python3 make_NCR_clustering_table.py
#that output file is NCR_data_table.txt

#then run the rest of the clustering.R script to create the cluster_assignment.txt file

# run NCR_clusters_tpm.pyto create NCR peptide tpm with group assignment table


# run make_NCR_peptide_table.py to create NCR peptide data table








