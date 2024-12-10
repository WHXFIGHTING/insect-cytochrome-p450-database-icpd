#!/bin/bash

source ~/.bashrc
conda activate snakemake
cd /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/res

start_time=$(date +%s)

#snakemake --dag -n -p -s /data1/NFS/home/scau544/whx/p450_database/bitacora-BITACORA-v1.4.1/script/BITACORA.py| dot -Tpdf > test.pdf
snakemake -s /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/script/BITACORA.py --cluster "qsub -l nodes=1:ppn=60 -o p450_o.log -e p450_e.log" -j 1 --latency-wait 5 --keep-going
#snakemake -s /data1/NFS/home/scau544/whx/p450_database/bitacora-BITACORA-v1.4.1/script/BITACORA.py -j 1
end_time=$(date +%s)

duration=$((end_time - start_time))

echo "脚本执行耗时：$duration 秒"
