#!/bin/bash

source ~/.bashrc
conda activate snakemake
cd /data1/NFS/home/whx/P450_database/blast

start_time=$(date +%s)

#snakemake --dag -n -p -s blast.py| dot -Tpdf > test.pdf
snakemake -s blast.py --cluster "qsub -l nodes=1:ppn=20 -o p450_o.log -e p450_e.log" -j 10 --latency-wait 5 
end_time=$(date +%s)

duration=$((end_time - start_time))

echo "脚本执行耗时：$duration 秒"