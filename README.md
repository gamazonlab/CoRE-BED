# CoRE-BED
## Introduction
CoRE-BED, or Classifier of Regulatory Elements in BED coordinates, is a Python-based tool developed to classify the regulatory identities of regions in any genomic coordinates file. Based on each coordinate's overlap (or lack thereof) with annotated transcription start sites (TSSs); H3K4me1, H3K4me3, H3K27ac, H3K27me3, and H3K36me3 histone marks, as well as DNAse I hypersensitive (DHS) sites, it will be classified as either an active promoter, bivalent promoter, silenced promoter, gene body in an unclassified active chromatin region within the specified range limit of a TSS (default: 2 kb upstream and 2 kb downstream), gene body in an unclassified inactive chromatin region within the specified range limit of a TSS, non-gene body in an unclassified active chromatin region within the specified range limit of a TSS, non-gene body in an unclassified inactive chromatin region within the specified range limit of a TSS, active enhancer, poised enhancer, primed enhancer, gene body in an unclassified active chromatin region beyond the specified range limit of a TSS, gene body in an unclassified inactive chromatin region beyond the specified range limit of a TSS, non-gene body in an unclassified active chromatin region beyond the specified range limit of a TSS, or non-gene body in an unclassified inactive chromatin region beyond the specified range limit of a TSS. This classification method can be best visualized as a tree structure:

<img width="1019" alt="Screen Shot 2021-06-04 at 11 22 23 AM" src="https://user-images.githubusercontent.com/63562495/120833220-262fdf00-c527-11eb-8a39-d2238db37f5b.png">

The main script ```core-bed.py``` takes in a user-provided genomic coordinates file and downloads all reference files (transcription start site coordinates, as well as H3K4me1, H3K4me3, H3K27ac, and H3K27me3 histone ChIP-seq peak coordinates generated by the ENCODE Consortium) based on the user-specified human genome build and tissue type. If your input file is in a format other than UCSC BED format (i.e. GWAS summary statistics), use the ```--bed_cols``` option to specify which numbered columns in your file contain the chromosome, start, and end coordinates (i.e. ```--bed_cols 1,2,2```). Additionally, use the ```--input_header``` flag if your non-UCSC BED input has a header. The following biological samples from ENCODE were used to represent each of the 28 supported tissue types, roughly approximating the full set of GTEx tissues:
* ```Adipose```\
**hg38**: *Homo sapiens* subcutaneous abdominal adipose tissue tissue nuclear fraction female adult (49 years) and *Homo sapiens* omental fat pad tissue female adult (51 years) (DNase-seq only)\
**hg19**: *Homo sapiens* subcutaneous abdominal adipose tissue tissue nuclear fraction female adult (49 years) and *Homo sapiens* omental fat pad tissue female adult (53 years) (DNase-seq only))
* ```Adrenal_gland```\
**hg38**: *Homo sapiens* adrenal gland tissue male embryo (97 days) and *Homo sapiens* adrenal gland tissue embryo (96 days) (DNase-seq only)\
**hg19**: *Homo sapiens* adrenal gland tissue male embryo (97 days) and *Homo sapiens* adrenal gland tissue embryo (96 days) (DNase-seq only)
* ```Artery```\
**hg38**: *Homo sapiens* aorta tissue male adult (34 years) and *Homo sapiens* aorta tissue female adult (41 years) (DNase-seq only)\
**hg19**: *Homo sapiens* aorta tissue male adult (34 years) and *Homo sapiens* coronary artery tissue female adult (53 years) (DNase-seq only)
* ```Blood```\
**hg38**: *Homo sapiens* peripheral blood mononuclear cell male adult (39 years) and *Homo sapiens* K562 (DNase-seq only)\
**hg19**: *Homo sapiens* peripheral blood mononuclear cell male adult (39 years) and *Homo sapiens* K562 (DNase-seq only)
* ```Breast```\
**hg38**: *Homo sapiens* breast epithelium tissue female adult (53 years) and *Homo sapiens* breast epithelium tissue female adult (51 years) (DNase-seq only)\
**hg19**: *Homo sapiens** breast epithelium tissue female adult (53 years) and *Homo sapiens* MCF-7 (DNase-seq only)
* ```Cultured_fibroblast```\
**hg38**: *Homo sapiens* IMR-90\
**hg19**: *Homo sapiens* IMR-90
* ```EBV_transformed_lymphocyte```\
**hg38**: *Homo sapiens* GM12878\
**hg19**: *Homo sapiens* GM12878
* ```ES```\
**hg38**: *Homo sapiens* H1 embryonic stem cell\
**hg19**: *Homo sapiens* H1 embryonic stem cell
* ```Esophagus_muscularis_mucosa```\
**hg38**: *Homo sapiens* esophagus muscularis mucosa tissue female adult (51 years) and Homo sapiens esophagus muscularis mucosa tissue male adult (37 years) (DNase-seq only)\
**hg19**: *Homo sapiens* esophagus muscularis mucosa tissue female adult (51 years) and *Homo sapiens* esophagus muscularis mucosa tissue male adult (37 years) (DNase-seq only)
* ```Esophagus_squamous_epithelium```\
**hg38**: *Homo sapiens* esophagus squamous epithelium tissue female adult (51 years) and *Homo sapiens* esophagus squamous epithelium tissue male adult (37 years) (DNase-seq only)\
**hg19**: *Homo sapiens* esophagus squamous epithelium tissue female adult (51 years) and *Homo sapiens* esophagus squamous epithelium tissue male adult (37 years) (DNase-seq only)
* ```Heart```\
**hg38**: *Homo sapiens* heart left ventricle tissue female adult (53 years)\
**hg19**: *Homo sapiens* heart left ventricle tissue female adult (53 years)
* ```Intestine```\
**hg38**: *Homo sapiens* sigmoid colon tissue male adult (37 years) and *Homo sapiens* sigmoid colon tissue female adult (53 years) (DNase-seq only)\
**hg19**: *Homo sapiens* sigmoid colon tissue male adult (37 years) and *Homo sapiens* sigmoid colon tissue female adult (53 years) (DNase-seq only)
* ```iPS```\
**hg38**: *Homo sapiens* iPS DF 19.11\
**hg19**: *Homo sapiens* iPS DF 19.11
* ```Kidney```\
**hg38**: *Homo sapiens* kidney tissue male adult (67 years) and *Homo sapiens* kidney tissue female embryo (120 days) (H3K27me3 and DNase-seq only)\
**hg19**: *Homo sapiens* kidney tissue male adult (67 years) and *Homo sapiens* kidney tissue female embryo (120 days) (H3K27ME3 and DNase-seq only)
* ```Liver```\
**hg38**: *Homo sapiens* liver tissue male adult (32 years) and Homo sapiens liver tissue female embryo (101 days) and female embryo (113 days) (DNase-seq only)\
**hg19**: *Homo sapiens* liver tissue male adult (32 years) and *Homo sapiens* liver tissue female embryo (101 days) and female embryo (113 days) (DNase-seq)
* ```Lung```\
**hg38**: *Homo sapiens* upper lobe of left lung tissue female adult (51 years)\
**hg19**: *Homo sapiens* upper lobe of left lung tissue female adult (51 years) and *Homo sapiens* upper lobe of left lung tissue male adult (37 years) (DNase-seq only)
* ```Neuron```\
**hg38**: *Homo sapiens* SK-N-SH\
**hg19**: *Homo sapiens* SK-N-SH and *Homo sapiens* tibial nerve tissue female adult (51 years) (DNase-seq only)
* ```Ovary```\
**hg38**: *Homo sapiens* ovary tissue female adult (30 years)\
**hg19**: *Homo sapiens* ovary tissue female adult (30 years)
* ```Pancreas```\
**hg38**: *Homo sapiens* pancreas tissue female adult (41 years)\
**hg19**: *Homo sapiens* pancreas tissue male adult (34 years)
* ```Prostate```\
**hg38**: *Homo sapiens* prostate gland tissue male adult (37 years)\
**hg19**: *Homo sapiens* prostate gland tissue male adult (37 years) and *Homo sapiens* epithelial cell of prostate (DNase-seq only)
* ```Skeletal_muscle```\
**hg38**:, *Homo sapiens* muscle of leg tissue female embryo (110 days) and *Homo sapiens* muscle of leg tissue female embryo (115 days) (DNase-seq only)\
**hg19**: *Homo sapiens* muscle of leg tissue female embryo (110 days) and *Homo sapiens* muscle of leg tissue female embryo (115 days) (DNase-seq only)
* ```Skin```\
**hg38**: *Homo sapiens* suprapubic skin tissue male adult (37 years) and *Homo sapiens* foreskin fibroblast male newborn (DNase-seq only)\
**hg19**: *Homo sapiens* suprapubic skin tissue male adult (37 years) and *Homo sapiens* foreskin fibroblast male newborn (DNase-seq only)
* ```Spleen```\
**hg38**: *Homo sapiens* spleen tissue male adult (37 years) and Homo sapiens spleen tissue embryo (112 days) (DNase-seq only)\
**hg19**: *Homo sapiens* spleen tissue male adult (37 years) and *Homo sapiens* spleen tissue embryo (112 days) (DNase-seq only)
* ```Stomach```\
**hg38**: Homo sapiens stomach tissue male adult (37 years) and Homo sapiens stomach tissue male adult (34 years) (DNase-seq only)\
**hg19**: *Homo sapiens* stomach tissue male adult (37 years) and *Homo sapiens* stomach tissue male adult (34 years) (DNase-seq only)
* ```Testis```\
**hg38**: *Homo sapiens* testis tissue male adult (37 years) and Homo sapiens testis tissue male adult (54 years) (DNase-seq only)\
**hg19**: *Homo sapiens* testis tissue male adult (37 years) and *Homo sapiens* testis tissue male adult (54 years) (DNase-seq only)
* ```Thyroid```\
**hg38**: *Homo sapiens* thyroid gland tissue female adult (51 years)\
**hg19**: *Homo sapiens* thyroid gland tissue female adult (51 years) and *Homo sapiens* thymus tissue female embryo (147 days) (DNase-seq only)
* ```Uterus```\
**hg38**: *Homo sapiens* uterus tissue female adult (51 years) and *Homo sapiens* uterus tissue female adult (53 years) (DNase-seq only)\
**hg19**: *Homo sapiens* uterus tissue female adult (51 years) and *Homo sapiens* HeLa-S3 (DNase-seq only)
* ```Vagina```\
**hg38**: *Homo sapiens* vagina tissue female adult (51 years)\
**hg19**: *Homo sapiens* vagina tissue female adult (51 years)\
\
In addition to these 28 provided tissue options, CoRE-BED also allows users to specify any other reference tissue of their choosing via the following additional tissue argument options:
* ```User_specified_file```\
Indicates that the user will provide their own H3K4me1, H3K4me3, H3K27ac, H3K27me3, and H3K36me3 histone ChIP-seq, as well as DNase-seq, reference file paths using the ```--user_4me1```, ```--user_4me3```, ```--user_27ac```, ```--user_27me3```, ```--user_36me3```, and ```--user_dnase``` arguments, respectively.
* ```User_specified_url```\
Indicates that the user will provide their own H3K4me1, H3K4me3, H3K27ac, H3K27me3, and H3K36me3 histone ChIP-seq, as well as DNase-seq, URLs of reference files to be downloaded using the ```--user_4me1```, ```--user_4me3```, ```--user_27ac```, ```--user_27me3```, ```--user_36me3```, and ```--user_dnase``` arguments, respectively.

Upon preparation of all reference files, the BED containing transcription start sites (TSSs) is modified by subtracting 2 kb from each start coordinate and adding 2 kb to each end coordinate. The script then uses these modified TSS coordinates to determine whether each input coordinate overlaps with a genomic interval within 2 kb of a TSS. Those input coordinates that do have overlap are considered "candidate promoters" and those that do not are considered "candidate enhancers."

For the set of candidate promoters, the script next determines whether each coordinate overlaps with the H3K4me3, a histone modification commonly associated with promoter regions in active chromatin. Those that do overlap with H3K4me3 are subsequently evaluated for overlap with H3K27me3, a repressive histone mark. If a coordinate has both H3K4me3 and H3K27me3, it is classified as a "bivalent promoter," meaning that while not presently active, it is "poised" to become either active or more permanently repressed by losing one of the two histone marks. If no H3K27me3 is present, then the element is classified as an "active promoter."

Conversely, coordinates that do not have any overlap with H3K4me3 are next evaluated for overlap with H3K27me3. Elements that are marked with only H3K27me3 are classified as "silenced promoters." For those coordinates that do not overlap with either H3K4me3 or H3K27me3, overlap with H3K36me3, a histone mark associated with gene bodies, as well as with DNase I hypersensitive (DHS) sites (assayed using DNase-seq) is next assessed. Regions overlapping with both H3K36me3 and DHS sites are classified as "unclassified active chromatin; gene_body; within_2kb_of_tss," those overlapping with H3K36me3 but not DHS sites are classified as "unclassified inactive chromatin; gene_body; within_2kb_of_tss," regions that harbor no H3K36me3 but do overlap with a DHS site are termed "unclassified active chromatin within_2kb_of_tss," and those with neither of the two marks are classified as "unclassified inactive chromatin within_2kb_of_tss."

With our set of candidate enhancers, CoRE-BED will search for overlap with three enhancer-associated histone marks, H3K4me1, H3K27ac, and H3K27me3. The script first determines whether there is any overlap with H3K4me1, a mark commonly used to denote the presence of an enhancer. If H3K4me1 is present, then we next search for co-localization of the active mark H3K27ac. If both marks localize at a single element, then we classify this as an "active enhancer." Otherwise, CoRE-BED will search for overlap with the repressive mark H3K27me3. Elements that show a co-localization of H3K4me1 and H3K27me3 will be classified as "poised enhancers," while those marked with only H3K4me1 are classified as "primed enhancers." 

The remaining coordinates that do not have any overlap with H3K4me1, H3K27ac, or H3K27me3 are assessed for overlap with H3K36me3 and DHS sites, in the same way that the unclassified candidate promoter regions were. Coordinates that overlap both H3K36me3 and DHS sites are classified as "unclassified active chromatin; gene_body; beyond_2kb_of_tss," those overlapping with H3K36me3 but not DHS sites are classified as "unclassified inactive chromatin; gene_body; beyond_2kb_of_tss," regions that harbor no H3K36me3 but do overlap with a DHS site are termed "unclassified active chromatin beyond_2kb_of_tss," and those with neither of the two marks are classified as "unclassified inactive chromatin beyond_2kb_of_tss."


## Dependencies
All dependencies (including ```python``` (3.6), ```requests```, ```pybedtools```, and ```pandas```) can be easily installed as an Anaconda environment using the included ```core-bed_env.yml``` file:
```
conda env create -f core-bed_env.yml
```
...and then activated using the following command:
```
conda activate core-bed_env
```

## Usage
Use the ```-h``` or ```--help``` flag to view all available options:
```
python core-bed.py -h

usage: core-bed.py [-h] -i INPUT -g REF_GENOME -t TISSUE
                   [-ud TSS_DISTANCE_UPSTREAM] [-dd TSS_DISTANCE_DOWNSTREAM]
                   [-o OUTPUT] [--no_multianno] [--bed_cols BED_COLS]
                   [--input_header] [--user_4me1 USER_4ME1]
                   [--user_4me3 USER_4ME3] [--user_27ac USER_27AC]
                   [--user_27me3 USER_27ME3] [--user_36me3 USER_36ME3]
                   [--user_dnase USER_DNASE] [-v]

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        the input bed file (required)
  -g REF_GENOME, --ref_genome REF_GENOME
                        the human reference genome build on which the input
                        coordinates are based (required) (valid options:
                        GRCh38/hg38 and GRCh37/hg19)
  -t TISSUE, --tissue TISSUE
                        the tissue of interest (required) (valid options:
                        Adipose, Adrenal_gland, Artery, Blood, Breast,
                        Cultured_fibroblast, EBV_transformed_lymphocyte, ES,
                        Esophagus_muscularis_mucosa,
                        Esophagus_squamous_epithelium, Heart, Intestine, iPS,
                        Kidney, Liver, Lung, Neuron, Ovary, Pancreas,
                        Prostate, Skeletal_muscle, Skin, Spleen, Stomach,
                        Testis, Thyroid, Uterus, Vagina, User_provided_files,
                        User_provided_urls)
  -ud TSS_DISTANCE_UPSTREAM, --tss_distance_upstream TSS_DISTANCE_UPSTREAM
                        the upstream boundary distance from a TSS (default: 2000 bp)
  -dd TSS_DISTANCE_DOWNSTREAM, --tss_distance_downstream TSS_DISTANCE_DOWNSTREAM
                        the downstream boundary distance from a TSS (default: 2000 bp)
  -o OUTPUT, --output OUTPUT
                        the name of the output file
  --no_multianno        if a coordinate overlaps with multiple regions, keep
                        the most significant occurance
  --bed_cols BED_COLS   if the input is not in traditional UCSC BED format,
                        specify the column numbers of chr, start, and end
                        separated by commas
  --input_header        indicate whether the input file has a header (indicate
                        true or false)
  --user_4me1 USER_4ME1
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided H3K4me1 ChIP-seq peaks
  --user_4me3 USER_4ME3
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided H3K4me3 ChIP-seq peaks
  --user_27ac USER_27AC
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided H3K27ac ChIP-seq peaks
  --user_27me3 USER_27ME3
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided H3K27me3 ChIP-seq peaks
  --user_36me3 USER_36ME3
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided H3K36me3 ChIP-seq peaks
  --user_dnase USER_DNASE
                        if the User_provided_files or User_provided_urls
                        tissue option is specified, specify either the path or
                        URL of the user-provided DNase-seq peaks
  -v, --verbose         return logging as terminal output
```

A run of the CoRE-BED method to annotate a set of GWAS summary statistics would look something like the following:
```
python core-bed.py \
-i input_gwas_summary_stats_based_on_hg38.txt \
-g hg38 \
-t blood \
-o annotated_input_gwas_summary_stats_based_on_hg38.txt \
-v \
--no_multianno \
--bed_cols 3,4,4 \
--input_header
```
...with each of the user-specified arguments specifying:
* ```-i``` or ```--input```\
A set of genomic coordinates in UCSC BED format (https://genome.ucsc.edu/FAQ/FAQformat.html)
* ```-g``` or ```--ref_genome```\
The reference genome build on which the input coordinates are based
* ```-t``` or ```--tissue```\
The tissue type to which the input coordinates will be compared
* ```-o``` or ```--output```\
The desired name of the output file (default is ```out.bed```)
* ```-v``` or ```--verbose```\
Enable verbosity (i.e. print the script progress out to the console)
* ```--no_multianno```\
If a coordinate overlaps with multiple regions, keep the most significant occurance (i.e. If a coordinate overlaps with both an active promoter and unclassified inactive chromatin region within 2 kb of a TSS, only the active promoter will be retained in the final annotation set.)
* ```--bed_cols```\
The columns of the input file (1-indexed) containing the chr, start coordinate, and end coordinate. For files containing only a single variant coordinate (common for GWAS summary statistics), specify this same column for both the start and end coordinate.
* ```--input_header```\
Specifies that the input file does have a header\
\
The final output file will retain all of the columns of the original input, with a newly appended column of CoRE-BED functional annotations.

## References
Dale RK, Pedersen BS, Quinlan AR. Pybedtools: a flexible Python library for manipulating genomic datasets and annotations. Bioinformatics. 2011;27: 3423–3424.

Mas G, Blanco E, Ballaré C, Sansó M, Spill YG, Hu D, et al. Promoter bivalency favors an open chromatin architecture in embryonic stem cells. Nat Genet. 2018;50: 1452–1462.

McKinney, Wes. 2010. “Data Structures for Statistical Computing in Python.” Proceedings of the 9th Python in Science Conference. https://doi.org/10.25080/majora-92bf1922-00a.

Sha K, Boyer LA. The chromatin signature of pluripotent cells. StemBook. Cambridge (MA): Harvard Stem Cell Institute; 2009.

Shlyueva D, Stampfel G, Stark A. Transcriptional enhancers: from properties to genome-wide predictions. Nat Rev Genet. 2014;15: 272–286.
