
sample_index={"Acyrthosiphon_pisum"}

rule all:
    input:
        expand("/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/第一批/24_7_20修订/BLAST/{sample}_blast.txt",sample = sample_index)


rule blast:
    input:
        i1 = "/data1/NFS/home/whx/P450_database/filt_data/{sample}_filt.fa"
    output:
        "/data1/NFS/home/whx/P450_database/filt_data/res/{sample}_blast.txt"
    shell:
        '''

        set +u
        source ~/.bashrc
	    conda activate blast

        blastp -query {input.i1} -db /data1/NFS/database/nr_Insecta/nr_Insecta -num_threads 20 -evalue 1e-5 -out {output} -outfmt "6 std stitle" -max_hsps 1 -num_alignments 10



        '''

