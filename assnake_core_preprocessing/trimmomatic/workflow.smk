rule tmtic:
    input:
        first=wc_config['fastq_gz_R1_wc'],
        second=wc_config['fastq_gz_R2_wc'],
        params=os.path.join(config['assnake_db'], "presets/trimmomatic/{preset}.json")
    output:
        r1=wc_config['fastq_gz_tmtic_R1_wc'],
        r2=wc_config['fastq_gz_tmtic_R2_wc'],
        u =wc_config['fastq_gz_tmtic_S_wc']
    params:
        u1=wc_config['fastq_gz_tmtic_unpaired1_wc'],
        u2=wc_config['fastq_gz_tmtic_unpaired2_wc']
    log: "{fs_prefix}/{df}/reads/{preproc}__tmtic_{preset}/{df_sample}.log"
    threads: 8#config['assnake-core-preprocessing']['results']['trimmomatic']['threads']
    wildcard_constraints:    
        params="[\w\d_-]+",
    conda: 'env_0.38.yaml'
    wrapper: "file://"+os.path.join(config['assnake-core-preprocessing']['install_dir'], 'trimmomatic/wrapper.py')