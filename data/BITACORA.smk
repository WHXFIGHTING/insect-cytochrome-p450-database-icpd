
sample_index={"Anopheles_merus","Aphidius_gifuensis","Apis_laboriosa","Atta_colombica","Drosophila_grimshawi","Drosophila_melanogaster","Drosophila_mojavensis","Drosophila_yakuba","Frankliniella_occidentalis"}

rule all:
    input:
        expand("/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/tag/{sample}.txt",sample = sample_index)


rule BITACORA:
    input:
        i1 = "/data1/NFS/home/scau544/whx/370_p450/ncbi/genom/{sample}.genomic.fna"
    output:
        "/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/tag/{sample}.txt"
    params:
        p1 = "{sample}",
        p3 = "/data1/NFS/home/scau544/whx/370_p450/ncbi/gff/{sample}.gff_reformatted.gff3",
        p4 = "/data1/NFS/home/scau544/whx/370_p450/ncbi/pep/{sample}.protein.faa",
        p5 = "/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/{sample}",
        faname = "/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/{sample}/{sample}_db.fasta",
        hmmname = "/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/{sample}/{sample}_db.hmm",
        p6 = "/data1/NFS/home/scau544/whx/370_p450/ncbi/gff/{sample}.gff",
	    folder = "/data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/{sample}",
        p7 = "{sample}.err"
    shell:
        '''

        set +u
        source ~/.bashrc
	    conda activate whx

	    if [ ! -d {params.folder} ]; then
	    mkdir {params.folder}
	    else
	    echo yes
	    fi

        cp /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/p450_db.fasta {params.faname}
        cp /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/HMM/p450_db.hmm {params.hmmname}
        perl /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/Scripts/Tools/reformat_ncbi_gff.pl {params.p6}
        bash /data1/NFS/home/scau544/whx/370_p450/ncbi/bitacora/runBITACORA.sh {params.p1} {input.i1} {params.p3} {params.p4} {params.p5} {params.p7}
        echo $(date) All Done! > {output}


        '''
