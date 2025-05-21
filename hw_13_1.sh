#!/bin/bash
#SBATCH --job-name=rna_seq_setup
#SBATCH --cpus-per-task=4
#SBATCH --mem=10gb
#SBATCH --time=00:10:00
#SBATCH --output=slurm_setup.log

BASE_DIR=~/hw_13
RAW_FASTQ_DIR=${BASE_DIR}/before_trimming
TRIMMED_DIR=${BASE_DIR}/after_trimming
ALIGN_DIR=${BASE_DIR}/alignment_results

mkdir -p ${RAW_FASTQ_DIR} ${TRIMMED_DIR} ${ALIGN_DIR}

cd ${RAW_FASTQ_DIR}
ln -sf /projects/mipt_dbmp_biotechnology/rnaseq_map_star/raw_data/Erik_mat_CD4_MiLab_S52_R1_001.fastq.gz.
ln -sf /projects/mipt_dbmp_biotechnology/rnaseq_map_star/raw_data/Erik_mat_CD4_MiLab_S52_R2_001.fastq.gz.
