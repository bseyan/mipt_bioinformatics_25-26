#!/bin/sh
#SBATCH --job-name=stringtie_transcripts
#SBATCH --cpus-per-task=34
#SBATCH --mem=128gb
#SBATCH --time=1:55:00
#SBATCH --output=/home/aandreeva/hw/hw_13/hm_rna_seq/logs/stringtie.logs
#SBATCH --partition=short

stringtie -o erik.gtf RNA_Aligned.sortedByCoord.out.bam 