#!/bin/bash
#SBATCH --account=def-gd38
#SBATCH --time=00:01:00
#SBATCH --job-name=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --output=%x-%j.out


module load gcc/5.4.0 blast+/2.6.0 hmmer/3.1b2 augustus/3.2.3/ emboss/6.6.0 r/3.5.0 scipy-stack
#activate virtual env
source ~/busco_env/bin/activate

export AUGUSTUS_CONFIG_PATH=~/augustus_config
export BUSCO_CONFIG_FILE=/home/rhuang06/projects/def-gd38/rhuang06/alfalfa_clover_RNA_seq/scripts/config.ini

busco
