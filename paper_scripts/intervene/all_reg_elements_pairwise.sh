intervene pairwise \
-i /home/bettimj/gamazon_rotation/abc_enhancers/intervene_core_bed/core-bed_impute/merged_inputs/merged_unique_AllPredictions.AvgHiC.ABC0.015.minus150.ForABCPaperV3.lifted_hg38.bed \
/home/bettimj/gamazon_rotation/abc_enhancers/intervene_core_bed/core-bed_impute/merged_inputs/merged_all_promoters_enhancers_5000_1000.bed \
/home/bettimj/gamazon_rotation/abc_enhancers/intervene_core_bed/core-bed_impute/merged_inputs/merged_all_regulatory_elements_epimap_5000_1000.sorted.uniq.lifted_hg38.bed \
/home/bettimj/gamazon_rotation/abc_enhancers/intervene_core_bed/core-bed_impute/merged_inputs/merged_all_epimap_enh_18_CALLS_segments_hg38.sorted.bed \
/home/bettimj/gamazon_rotation/abc_enhancers/intervene_core_bed/core-bed_impute/merged_inputs/merged_gtexv8_fine-mapped_hc_eqtls.sorted.bed \
--names="ABC_enhancers","CoRE-BED_regulatory_elements","CoRE-BED_Impute_regulatory_elements","EpiMap_ChromHMM_enhancers","GTEx_v8_fine-mapped_eQTLs" \
--compute=frac \
--htype=number