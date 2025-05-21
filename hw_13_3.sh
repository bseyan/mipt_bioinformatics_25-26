#!/bin/bash
#SBATCH --job-name=rna_seq_trimming
#SBATCH --cpus-per-task=16
#SBATCH --mem=40gb
#SBATCH --time=01:00:00
#SBATCH --output=slurm_trimming.log
#SBATCH --dependency=afterok:<qc_before_job_id>

BASE_DIR=~/hw_13
RAW_FASTQ_DIR=${BASE_DIR}/before_trimming
TRIMMED_DIR=${BASE_DIR}/after_trimming

fastp \
  -i ${RAW_FASTQ_DIR}/Erik_mat_CD4_MiLab_S52_R1_001.fastq.gz \
  -I ${RAW_FASTQ_DIR}/Erik_mat_CD4_MiLab_S52_R2_001.fastq.gz \
  -f 15 -t 10 \
  -o ${TRIMMED_DIR}/Erik_mat_CD4_MiLab_S52_R1_001_trimmed.fastq.gz \
  -O ${TRIMMED_DIR}/Erik_mat_CD4_MiLab_S52_R2_001_trimmed.fastq.gz \
  --compression 6

cd ${TRIMMED_DIR}
fastqc *.gz -o ${TRIMMED_DIR}

multiqc . -o ${TRIMMED_DIR}/multiqc_after_trimming

