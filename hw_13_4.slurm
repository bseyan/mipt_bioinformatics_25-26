#!/bin/bash
#SBATCH --job-name=star_mapping
#SBATCH --cpus-per-task=16
#SBATCH --mem=128gb
#SBATCH --time=01:00:00
#SBATCH --output=/home/vbogomolov/hw/hw_13/hm_rna_seq/logs/star.logs
#SBATCH --partition=short

BASE_DIR=/home/vbogomolov/hw_13
TRIMMED_DIR=${BASE_DIR}/after_trimming
GENOME_DIR="/projects/mipt_dbmp_biotechnology/GRCh38/"
OUTPUT_DIR="${BASE_DIR}/alignment"

mkdir -p ${OUTPUT_DIR}

STAR_BIN=/home/vbogomolov/.conda/envs/hw13/bin/STAR

${STAR_BIN} \
  --runThreadN 32 \
  --runMode alignReads \
  --genomeDir $GENOME_DIR \
  --readFilesCommand zcat \
  --readFilesIn \
    ${TRIMMED_DIR}/Erik_mat_CD4_MiLab_S52_R1_001_trimmed.fastq.gz \
    ${TRIMMED_DIR}/Erik_mat_CD4_MiLab_S52_R2_001_trimmed.fastq.gz \
  --outFileNamePrefix ${OUTPUT_DIR}/RNA_ \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts
