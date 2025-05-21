#!/bin/bash
#SBATCH --job-name=rna_seq_qc_before
#SBATCH --cpus-per-task=8
#SBATCH --mem=20gb
#SBATCH --time=00:30:00
#SBATCH --output=slurm_qc_before.log
#SBATCH --dependency=afterok:<setup_job_id>

BASE_DIR=~/hw_13
RAW_FASTQ_DIR=${BASE_DIR}/before_trimming

fastqc ${RAW_FASTQ_DIR}/*.fastq.gz -o ${RAW_FASTQ_DIR}

multiqc ${RAW_FASTQ_DIR} -o ${RAW_FASTQ_DIR}/multiqc_before_trimming
