#! /bin/bash
#$ -S /bin/bash
#$ -N lamplink
## -q imppc@curri7
#$ -q imppc
#$ -V
## -l exclusive
#$ -o /imppc/labs/dnalab/xduran/fim/output/lung/assoc_0.1/assoc_ld.log
#$ -e /imppc/labs/dnalab/xduran/fim/output/lung/assoc_0.1/assoc_ld.err
#$ -m be
#$ -M xduran@igtp.catz

/imppc/labs/dnalab/xduran/fim/bin/lamplink/lamplink-linux-1.11 --allow-no-sex --bfile /imppc/labs/dnalab/xduran/fim/data/lung/assoc/lung --comb /imppc/labs/dnalab/xduran/fim/output/lung/assoc_0.1/assoc --lamp-ld-remove --out /imppc/labs/dnalab/xduran/fim/output/lung/assoc_0.1/assoc_ld --lamp-r2 0.5