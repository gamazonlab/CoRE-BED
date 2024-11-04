# CoRE-BED [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/mjbetti/CoRE-BED/blob/master/LICENSE) 
## Introduction  

CoRE-BED, or Classifier of Regulatory Elements in BED coordinates, is a framework to generate cell and tissue type dependent annotation of regulatory elements. The CoRE-BED classifier is implemented as a decision tree. The tree structure is learned from training data, generating a classifier (i.e., membership in a class of regulatory elements) whose generalizability is evaluated in test data. Each internal node represents an observation that captures the physical properties of chromatin, nucleosome positioning, or access to DNA; each leaf or terminal node is a class of regulatory elements; and each link is a decision. To determine the optimal tree structure, iterative training was  and for the information gain from the classifier using Shannon entropy.

An accompanying command line tool was developed to classify the regulatory identities of regions in any user-provided genomic coordinates file. The 33 major cell and tissue types and 19 epigenomic marks included in the CoRE-BED framework, as well an overview of the model training steps, are depicted below:

![alt text](https://github.com/mjbetti/CoRE-BED/blob/main/Fig1.png?raw=true)

## Cite CoRE-BED 
Betti, M.J., Aldrich, M.C., & Gamazon, E.R. (2023). *Minimum entropy framework identifies a novel class of genomic functional elements and reveals regulatory mechanisms at human disease loci*. doi: 10.1101/2023.06.11.544507. [Preprint](https://www.biorxiv.org/content/10.1101/2023.06.11.544507v2).

Betti, M.J., Aldrich, M.C., & Gamazon, E.R. (2023). CoRE-BED datasets (Version 2). Zenodo. 10.5281/zenodo.7558115

For questions:  michael.j.betti@vanderbilt.edu, eric.gamazon@vumc.org  

## Data availability
Peak calls for H3K27ac, H3K27me3, H3K4me1, H3K4me2, H3K4me3, ATAC-seq, DNase-seq, CTCF, EP300, H2AFZ, H3K36me3, H3K79me2, H3K9ac, H3K9me3, H4K20me1, POL2RA, RAD21, and SMC ChIP-seq experiments across 816 EpiMap biosamples can be downloaded from 10.5281/zenodo.7558115. These served as the reference epigenomes for training and testing the CoRE-BED model.

Included in this dataset are the binarized feature data that are used as direct input into the CoRE-BED model, as well as a reference set of functional predictions across all 816 CoRE-BED biosamples.

## Running the CoRE-BED command line tool for functional prediction
The ```core-bed.py``` script takes in a user-provided genomic coordinates file to be annotated, a reference file containing epigenomic feature information (can be constructed by the user or downloaded from Zenodo), and a trained model (```decision_tree_k9_entropy.depth15.pickle```). Additionally, the user specifies the genome build on which their input coordinates are based (hg19 and hg38 are supported), as well as the cell or tissue(s) of interest on which the functional annotations should be based. If the input file is in a format other than UCSC BED format (i.e. GWAS summary statistics), the ```--bed_cols``` option should be used to specify which numbered columns in the input file contain the chromosome, start, and end coordinates (i.e. ```--bed_cols 1,2,2```). Additionally, use the ```--input_header``` flag if the input file has a header. The following 816 biosamples from EpiMap (encompassing both experimental and imputed data) were used to represent each of the 33 supported human tissue types:
* ```Adipose```: adipose_adipocyte, adipose_34m, adipose_omental_fat_pad_51f, adipose_omental_fat_pad_53f, adipose_subcutaneous_25f, adipose_subcutaneous_41f, adipose_subcutaneous_49f, adipose_subcutaneous_59f, adipose_subcutaneous_81f
* ```Blood and T-cell```: blood_cd4_alpha_beta_memory_t_cell, blood_cd4_alpha_beta_memory_t_cell_blood_origin, blood_cd4_alpha_beta_t_cell, blood_cd4_alpha_beta_t_cell_33f, blood_cd4_alpha_beta_t_cell_21m, blood_cd4_alpha_beta_t_cell_37m, blood_cd4_alpha_beta_t_cell_phorbol, blood_cd4_cd25_alpha_beta_t_cell, blood_cd8_alpha_beta_memory_t_cell, blood_cd8_alpha_beta_t_cell, blood_cd8_alpha_beta_t_cell_33f, blood_cd8_alpha_beta_t_cell_34f, blood_cd8_alpha_beta_t_cell_21m, blood_cd8_alpha_beta_t_cell_28m, blood_cd8_alpha_beta_t_cell_37m, blood_effector_memory_cd4_alpha_beta_t_cell, blood_mononuclear_cell_male, blood_naive_thymus_cd4_alpha_beta_t_cell, blood_naive_thymus_cd4_alpha_beta_t_cell_35f, blood_naive_thymus_cd4_alpha_beta_t_cell_26m, blood_peripheral_mononuclear_cell_28f, blood_peripheral_mononuclear_cell_27m, blood_peripheral_mononuclear_cell_28m, blood_peripheral_mononuclear_cell_32m, blood_peripheral_mononuclear_cell_39m, blood_regulatory_t_cell_35f, blood_regulatory_t_cell_28m, blood_regulatory_t_cell_blood_origin, blood_t_cell, blood_t_cell_21m, blood_t_cell_36m, blood_t_cell_37m, blood_t1_helper_cell, blood_t1_helper_cell_26f, blood_t1_helper_cell_33m, blood_t17_helper_cell, blood_t17_helper_cell_phorbol, blood_t2_helper_cell_26f, blood_t2_helper_cell_33m
* ```Bone```: bone_arm, bone_femur, bone_marrow_stroma, bone_leg, bone_osteoblast
* ```Brain```: brain_ammons_horn_84m, brain_angular_gyrus_75f, brain_angular_gyrus_81m, brain_astrocyte, brain_astrocyte_cerebellum, brain_astrocyte_hippocampus, brain_astrocyte_spinal_cord, brain_embryo_112_days, brain_embryo_56_58_days, brain_embryo_80_days, brain_embryo_105_days_f, brain_embryo_109_days_f, brain_embryo_117_days_f, brain_embryo_120_days_f, brain_embryo_142_days_f, brain_embryo_17_weeks_f, brain_embryo_85_days_f, brain_embryo_96_days_f, brain_embryo_101_days_m, brain_embryo_104_days_m, brain_embryo_105_days_m, brain_embryo_122_days_m, brain_embryo_72_76_days_m, brain_caudate_nucleus_75f, brain_caudate_nucleus_78m, brain_caudate_nucleus_81m, brain_cerebellar_cortex_78_81m, brain_cerebellum_27_35m, brain_cerebellum_53m, brain_cingulate_gyrus_75f, brain_cingulate_gyrus_81m, brain_frontal_cortex_67_80f, brain_frontal_cortex_27_35m, brain_germinal_matrix_20_weeks_m, brain_globus_pallidus_78_84m, brain_inferior_parietal_cortex_84m, brain_hippocampus_75f, brain_hippocampus_73m, brain_medulla_oblongata_78_84m, brain_midbrain_78_84m, brain_middle_frontal_area_75f, brain_middle_frontal_area_81m, brain_middle_frontal_gyrus_78m, brain_occipital_lobe_84m, brain_pons_78m, brain_putamen_78m, brain_substantia_nigra_75f, brain_substantia_nigra_81m, brain_superior_temporal_gyrus_84m, brain_temporal_lobe_75f, brain_temporal_lobe_81m
* ```Cancer```: cancer_prostate_epithelial_22rv1, cancer_pancreas_adenocarcinoma_8988t, cancer_glioblastoma_a172, cancer_lung_epithelial_carcinoma_a549, cancer_lung_epithelial_carcinoma_a549_treated_ethanol_1hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_1hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_10hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_10min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_12hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_15min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_2hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_20min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_25min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_3hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_30min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_4hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_5hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_5min, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_6hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_7hr, cancer_lung_epithelial_carcinoma_a549_treated_dexamethasone_8hr, cancer_muscle_ewing_sarcoma_a673, cancer_adenoid_cystic_carcinoma_acc112, cancer_renal_cell_carcinoma_achn, cancer_neuroblastoma_be2c, cancer_prostate_c4-2b, cancer_colorectal_adenocarcinoma_caco-2, cancer_kidney_clear_cell_carcinoma_caki2, cancer_myelogenous_leukemia_cmk, cancer_melanoma_colo829, cancer_desmoplastic_medulloblastoma_daoy, cancer_acute_lymphoblastic_leukemia_dnd-41, cancer_b_cell_lymphoma_dohh2, cancer_kidney_rhaboid_tumor_g401, cancer_neuroglioma_h4, cancer_glioblastoma_h54, cancer_haploid_myelogenous_leukemia_hap-1, cancer_colorectal_adenocarcinoma_hct116, cancer_cervix_adenocarcinoma_hela-s3, cancer_cervix_adenocarcinoma_hela-s3_g1b_phase, cancer_cervix_adenocarcinoma_hela-s3_treated_interferon_alpha_4hr, cancer_hepatocellular_carcinoma_hepg2, cancer_acute_promyelocytic_leukemia_hl-60, cancer_colorectal_adenocarcinoma_ht-29, cancer_fibrosarcoma_ht1080, cancer_hepatocellular_carcinoma_huh-7.5, cancer_endometrial_adenocarcinoma_ishikawa_treated_dmso_1hr, cancer_endometrial_adenocarcinoma_ishikawa_treated_17b-estradiol_30min, cancer_endometrial_adenocarcinoma_ishikawa_treated_afimoxifene_30min, cancer_myelogenous_leukemia_k562, cancer_myelogenous_leukemia_k562_g1_phase, cancer_myelogenous_leukemia_k562_g2_phase, cancer_myelogenous_leukemia_k562_treated_dmso_72hr, cancer_myelogenous_leukemia_k562_treated_vorinostat_72hr, cancer_myelogenous_leukemia_k562_treated_sodium_butyrate_72hr, cancer_b_cell_lymphoma_karpas-422, cancer_myelogenous_leukemia_kbm-7, cancer_myeloma_kms-11, cancer_acute_lymphoblastic_leukemia_kopt-k1, cancer_prostate_adenocarcinoma_lncap_clone_fgc, cancer_prostate_adenocarcinoma_lncap_clone_fgc_treated_17b_12hr, cancer_acute_lymphoblastic_leukemia_loucy, cancer_colorectal_adenocarcinoma_lovo, cancer_glioblastoma_m059j, cancer_mammary_gland_adenocarcinoma_mcf-7, cancer_mammary_gland_adenocarcinoma_mcf-7_originated_from_mcf-7, cancer_mammary_gland_adenocarcinoma_mcf-7_treated_lactate_24hr, cancer_mammary_gland_adenocarcinoma_mcf-7_treated_estradiol_1hr, cancer_mammary_gland_adenocarcinoma_mcf-7_treated_ctcf_shrna_knockown, cancer_medulloblastoma, cancer_osteosarcoma_mg63, cancer_burkitt_lymphoma_namalwa, cancer_burkitt_lymphoma_namalwa_treated_sendai_virus_2hr, cancer_acute_promyelocytic_leukemia_nb4, cancer_squamous_cell_carcinoma_nci-h226, cancer_large_cell_lung_nci-h460, cancer_myeloma_nci-h929, cancer_testicular_embryonal_carcinoma_nt2_d1, cancer_b_cell_lymphoma_oci-ly1, cancer_b_cell_lymphoma_oci-ly3, cancer_b_cell_lymphoma_oci-ly7, cancer_pancreas_duct_epithelial_carcinoma_panc1, cancer_parathyroid_adenoma_62m, cancer_prostate_adenocarcinoma_pc-3, cancer_lung_adenocarcinoma_pc-9, cancer_renal_cell_adenocarcinoma_rcc_7860, cancer_renal_cell_carcinoma, cancer_colon_carcinoma_rko, cancer_melanoma_rpmi-7951, cancer_plasma_cell_myeloma_rpmi8226, cancer_rhabdomyosarcoma_sjcrh30, cancer_osteosarcoma_sjsa1, cancer_melanoma_sk-mel-5, cancer_neuroblastoma_sk-n-dz, cancer_neuroblastoma_sk-n-dz_treated_dmso_72hr, cancer_neuroepithelioma_sk-n-mc, cancer_neuroblastoma_sk-n-sh, cancer_neuroblastoma_sk-n-sh_treated_retinoic_acid_48hr, cancer_b_cell_lymphoma_su-dhl-6, cancer_colorectal_adenocarcinoma_sw480, cancer_mammary_gland_ductal_carcinoma_t47d, cancer_mammary_gland_ductal_carcinoma_t47d_treated_17b-estradiol_30min, cancer_prostate_epithelial_carcinoma_vcap, cancer_eye_retinoblastoma_weri-rb-1
* ```Digestive```: digestive_colon_mucosa_56f, digestive_colon_mucosa_73f, digestive_duodenum_mucosa_59m, digestive_duodenum_mucosa_76m, digestive_esophagus_30f, digestive_esophagus_34m, digestive_esophagus_muscularis_mucosa_53f, digestive_esophagus_muscularis_mucosa_37m, digestive_esophagus_squamous_epithelium_53f, digestive_esophagus_squamous_epithelium_37m, digestive_gastroesophageal_sphincter_53f, digestive_large_intestine_embryo_103_days_f, digestive_large_intestine_embryo_105_days_f, digestive_large_intestine_embryo_107_days_f, digestive_large_intestine_embryo_108_days_f, digestive_large_intestine_embryo_110_days_f, digestive_large_intestine_embryo_120_days_f, digestive_large_intestine_embryo_91_days_f, digestive_large_intestine_embryo_98_days_f, digestive_large_intestine_embryo_105_days_m, digestive_large_intestine_embryo_108_days_m, digestive_large_intestine_embryo_113_days_m, digestive_large_intestine_embryo_115_days_m, digestive_large_intestine_embryo_91_days_m, digestive_rectum_mucosa_50f, digestive_rectum_mucosa_61f, digestive_rectum_mucosa_59m, digestive_stomach_mucosa_59m, digestive_peyers_patch_53f, digestive_peyers_patch_37m, digestive_peyers_patch_54m, digestive_sigmoid_colon_51f, digestive_sigmoid_colon_53f, digestive_sigmoid_colon_34m, digestive_sigmoid_colon_54m, digestive_sigmoid_colon_3m, digestive_small_intestine_30f, digestive_small_intestine_105_days_f, digestive_small_intestine_107_days_f, digestive_small_intestine_108_days_f, digestive_small_intestine_110_days_f, digestive_small_intestine_120_days_f, digestive_small_intestine_91_days_f, digestive_small_intestine_98_days_f, digestive_small_intestine_34m, digestive_small_intestine_3m, digestive_small_intestine_105_days_m, digestive_small_intestine_108_days_m, digestive_small_intestine_115_days_m, digestive_small_intestine_87_days_m, digestive_small_intestine_91_days_m, digestive_stomach_101_days, digestive_stomach_30f, digestive_stomach_51f, digestive_stomach_53f, digestive_stomach_f, digestive_stomach_105_days_f, digestive_stomach_107_days_f, digestive_stomach_108_days_f, digestive_stomach_121_days_f, digestive_stomach_147_days_f, digestive_stomach_96_days_f, digestive_stomach_98_days_f, digestive_stomach_34m, digestive_stomach_54m, digestive_stomach_3m, digestive_stomach_108_days_m, digestive_stomach_127_days_m, digestive_stomach_58_76_days_m, digestive_stomach_91_days_m, digestive_transverse_colon_51f, digestive_transverse_colon_53f, digestive_transverse_colon_37m, digestive_transverse_colon_54m
* ```Endocrine```: endocrine_adrenal_gland_96_days, endocrine_adrenal_gland_30f, endocrine_adrenal_gland_51f, endocrine_adrenal_gland_53f, endocrine_adrenal_gland_108_days_f, endocrine_adrenal_gland_113_days_f, endocrine_adrenal_gland_85_days_f, endocrine_adrenal_gland_34m, endocrine_adrenal_gland_37m, endocrine_adrenal_gland_54m, endocrine_adrenal_gland_101_days_m, endocrine_adrenal_gland_108_days_m, endocrine_adrenal_gland_85_days_m, endocrine_adrenal_gland_97_days_m, endocrine_pancreas_59, endocrine_pancreas_45m, endocrine_pancreas_46m, endocrine_ovary_30f, endocrine_ovary_51f, endocrine_ovary_53f, endocrine_ovary_embryo_f, endocrine_testis_37m, endocrine_testis_54m, endocrine_testis_embryo_m, endocrine_thyroid_gland_51f, endocrine_thyroid_gland_53f, endocrine_thyroid_gland_37m, endocrine_thyroid_gland_54m
* ```Endothelial```: endothelial_brain_microvascular, endothelial_dermis_blood_vessel_adult_f, endothelial_dermis_blood_vessel_newborn_m, endothelial_dermis_microvascular_lymphatoc_vessel_f, endothelial_dermis_microvascular_lymphatoc_vessel_m, endothelial_umbilical_vein_newborn_m, endothelial_umbilical_vein_newborn, endothelial_glomerulus, endothelial_kidney_capillary_113_days_f, endothelial_lung_microvascular_f, endothelial_pulmonary_artery_f
* ```Epithelial```: epithelial_amnion, epithelial_bronchial, epithelial_bronchial_f_treated_retinoic_acid, epithelial_choroid_plexus, epithelial_colon, epithelial_esophagus, epithelial_prostate, epithelial_prostate_m, epithelial_proximal_tubule, epithelial_foreskin_keratinocyte_newborn_m, epithelial_foreskin_keratinocyte_newborn_2-4_days_m, epithelial_foreskin_keratinocyte_newborn_2-4_days_m_treated_calcium_2.5_days, epithelial_foreskin_keratinocyte_newborn_2-4_days_m_treated_calcium_5.5_days, epithelial_glomerulus_visceral_3, epithelial_proximal_tubule_hk-2, epithelial_pancreatic_duct_dpde6-e6e7, epithelial_bone_marrow_hs-27a, epithelial_iris_pigment, epithelial_keratinocyte_f, epithelial_kidney, epithelial_glomerulus_43_62_m, epithelial_tubule_80f_62m, epithelial_tubule_80f_treated_cisplatin, epithelial_skin_leg_53f, epithelial_skin_leg_37m, epithelial_mammary_luminal_33f, epithelial_mammary_f, epithelial_mammary_18f, epithelial_mammary_50f, epithelial_breast_mcf_10a, epithelial_breast_mcf_10a_treated_tamoxifen_24hr, epithelial_breast_mcf_10a_treated_tamoxifen_6hr, epithelial_mammary_myoepithelial_33f, epithelial_mammary_myoepithelial_36f, epithelial_non-pigmented_ciliary, epithelial_renal_cortical, epithelial_retinal, epithelial_prostate_rwpe1, epithelial_prostate_rwpe2, epithelial_skin_of_body_82_days_f
* ```ESC-deriv```: esc_deriv_bipolar_neuron_gm23338_origin_treated_doxycycline_4_days, esc_deriv_cardiac_mesoderm_h7-hesc_origin, esc_deriv_cardiac_muscle_rues2_origin, esc_deriv_ectodermal, esc_deriv_endodermal, esc_deriv_endodermal_hues64_origin, esc_deriv_hepatocyte_h9_origin, esc_deriv_mesenchymal_stem_h1-hesc_origin, esc_deriv_mesendoderm_h1-hesc_origin, esc_deriv_mesodermal_hues64_origin, esc_deriv_neural_crest_h1-hesc_origin, esc_deriv_neural_progenitor_h1-hesc_origin, esc_deriv_neuron_h9_origin, esc_deriv_smooth_muscle_h9_origin, esc_deriv_trophoblast_h1-hesc_origin
* ```ESC```: esc_elf-1, esc_es-i3, esc_h1-hesc, esc_h7-hesc, esc_h9, esc_hues48, esc_hues6, esc_hues64, esc_ucsf-4
* ```Eye```: eye_56_days_76_days_m, eye_76_days_f, eye_125_days_103_days_m, eye_74_days_85_days, eye_89_days_f
* ```Heart```: heart_aorta_30f, heart_aorta_34m, heart_ascending_aorta_51f, heart_ascending_aorta_53f, heart_coronary_artery_51f, heart_coronary_artery_53f, heart_101_days, heart_59_days_76_days_f, heart_80_days, heart_96_days, heart_103_days_f, heart_105_days_f, heart_110_days_f, heart_116_days_98_days_f, heart_116_days_117_days_f, heart_147_days_f, heart_91_days_f, heart_left_ventricle_53f, heart_left_ventricle_101_days_103_days_f, heart_left_ventricle_136_days_f, heart_left_ventricle_34m, heart_left_ventricle_3m, heart_27m_35m, heart_3m, heart_105_days_m, heart_110_days_m, heart_120_days_m, heart_72_days_76_days_m, heart_91_days_m, heart_96_days_m, heart_right_ventricle_101_days_103_days_f, heart_right_ventricle_34m, heart_right_ventricle_3m, heart_left_atrium_101_days_f, heart_right_atrium_51f, heart_right_atrium_53f, heart_right_atrium_34m, heart_thoracic_aorta_37m, heart_thoracic_aorta_54m, heart_tibial_artery_53f, heart_tibial_artery_37m
* ```HSC and B-cell```: hsc_and_b_cell_b_cell, hsc_and_b_cell_b_cell_27f, hsc_and_b_cell_b_cell_27f_43f, hsc_and_b_cell_b_cell_34f, hsc_and_b_cell_b_cell_43f, hsc_and_b_cell_b_cell_21m, hsc_and_b_cell_b_cell_37m, hsc_and_b_cell_cd14_monocyte_f, hsc_and_b_cell_cd14_monocyte_34f, hsc_and_b_cell_cd14_monocyte_21m, hsc_and_b_cell_cd14_monocyte_37m, hsc_and_b_cell_cd1c_myeloid_dendritic, hsc_and_b_cell_cmp_cd34, hsc_and_b_cell_cmp_cd34_f, hsc_and_b_cell_cmp_cd34_27f, hsc_and_b_cell_cmp_cd34_33f, hsc_and_b_cell_cmp_cd34_50f, hsc_and_b_cell_cmp_cd34_m, hsc_and_b_cell_cmp_cd34_adult_m, hsc_and_b_cell_cmp_cd34_23m, hsc_and_b_cell_cmp_cd34_36m, hsc_and_b_cell_cmp_cd34_37m, hsc_and_b_cell_cmp_cd34_42m, hsc_and_b_cell_cmp_cd34_43m, hsc_and_b_cell_cmp_cd34_49m, hsc_and_b_cell_germinal_center, hsc_and_b_cell_mpp, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_20_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_11_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_13_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_15_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_17_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_18_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_4_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_6_days, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocortisone_succinate_ligand_il3_8_days, hsc_and_b_cell_lymphocyte_jurkat_clone_e61, hsc_and_b_cell_lymphocyte_naive_b_cell, hsc_and_b_cell_nk_34f, hsc_and_b_cell_nk_21m, hsc_and_b_cell_nk_37m, hsc_and_b_cell_neutrophil, hsc_and_b_cell_neutrophil_m
* ```iPSC```: ipsc_cwru1_m, ipsc_gm23338_53m_gm23248_origin, ipsc_ips_df_19.11_newborn_m, ipsc_ips_df_19.7_newborn_m, ipsc_ips_df_14.7_newborn_m, ipsc_ips_df_6.9_newborn_m, ipsc_ips-11a_36m, ipsc_ips-15b_48f, ipsc_ips-18a_48f, ipsc_ips-18c_48f, ipsc_ips-20b_55m, ipsc_ips-nihi11_71m_ag20443_origin, ipsc_ips-nihi7_85f_ag08395_origin, ipsc_l1-s8, ipsc_l1-s8r
* ```Kidney```: kidney_hek293, kidney_hek293t, kidney_59_days_59_days_f, kidney_80_days, kidney_105_days_f, kidney_108_days_f, kidney_121_days_f, kidney_76_days_f_76_days_m, kidney_85_days_f, kidney_50m, kidney_67m, kidney_105_days_m, kidney_85_days_m, kidney_87_days_m, kidney_left_107_days_f, kidney_left_110_days_f, kidney_left_147_days_f, kidney_left_59_days_f_91_days_m, kidney_left_87_days_f, kidney_left_89_days_f, kidney_left_115_days_m, kidney_left_87_days_m, kidney_left_96_days_m, kidney_left_renal_cortex_interstitium_105_days_m, kidney_left_renal_cortex_interstitium_120_days_m, kidney_left_renal_pelvis_105_days_m, kidney_left_renal_pelvis_120_days_m, kidney_renal_cortex_interstitium_103_days_f, kidney_renal_cortex_interstitium_120_days_f, kidney_renal_cortex_interstitium_89_days_f, kidney_renal_cortex_interstitium_96_days_f, kidney_renal_cortex_interstitium_108_days_m, kidney_renal_cortex_interstitium_113_days_m, kidney_renal_cortex_interstitium_127_days_m, kidney_renal_cortex_interstitium_91_days_m, kidney_renal_cortex_interstitium_97_days_m, kidney_renal_pelvis_103_days_f, kidney_renal_pelvis_105_days_f, kidney_renal_pelvis_89_days_f, kidney_renal_pelvis_96_days_f, kidney_renal_pelvis_108_days_m, kidney_renal_pelvis_113_days_m, kidney_renal_pelvis_127_days_m, kidney_renal_pelvis_91_days_m, kidney_renal_pelvis_97_days_m, kidney_right_107_days_f, kidney_right_117_days_f, kidney_right_147_days_f, kidney_right_87_days_f, kidney_right_98_days_f, kidney_right_108_days_m, kidney_right_115_days_m, kidney_right_87_days_m, kidney_right_91_days_m, kidney_right_96_days_m, kidney_right_renal_cortex_interstitium_105_days_m, kidney_right_renal_cortex_interstitium_120_days_m, kidney_right_renal_pelvis_105_days_m, kidney_right_renal_pelvis_120_days_m
* ```Liver```: liver_hepatic_stellate_cell_59f, liver_hepatocyte, liver_59_days_80_days, liver_25f, liver_101_days_113_days_f, liver_31m, liver_78m, liver_right_lobe_53f
* ```Lung```: lung_left_105_days_f, lung_left_107_days_f, lung_left_108_days_f, lung_left_110_days_f, lung_left_117_days_f, lung_left_91_days_f, lung_left_98_days_f, lung_left_105_days_m, lung_left_113_days_m, lung_left_115_days_m, lung_left_87_days_m, lung_left_91_days_m, lung_left_96_days_m, lung_101_days, lung_112_days, lung_67_days, lung_80_days_76_days_m, lung_30f, lung_108_days_f, lung_120_days_f, lung_76_days_f, lung_82_days_f, lung_85_days_f, lung_96_days_f, lung_3m, lung_103_days_m, lung_108_days_m, lung_54_days_58_days_m, lung_82_days_m, lung_right_105_days_f, lung_right_107_days_f, lung_right_108_days_f, lung_right_110_days_f, lung_right_117_days_f, lung_right_91_days_f, lung_right_98_days_f, lung_right_105_days_m, lung_right_115_days_m, lung_right_87_days_m, lung_right_96_days_m, lung_left_upper_lobe_51f, lung_left_upper_lobe_53f, lung_left_upper_lobe_37m
* ```Lymphoblastoid```: lymphoblastoid_gm06990, lymphoblastoid_gm08714, lymphoblastoid_gm10248, lymphoblastoid_gm10266, lymphoblastoid_gm12864, lymphoblastoid_gm12865, lymphoblastoid_gm12875, lymphoblastoid_gm12878, lymphoblastoid_gm12891, lymphoblastoid_gm12892, lymphoblastoid_gm18507, lymphoblastoid_gm19238, lymphoblastoid_gm19239, lymphoblastoid_gm19240
* ```Mesench```: mesench_adipocyte_msc_origin, mesench_msc_dedifferentiated_amniotic_fluid_origin, mesench_embryonic_facial_prominence_53_days_58_days, mesench_msc_adipose_origin
* ```Muscle```: muscle_cardiac_myocyte, muscle_forelimb_108_days_f, muscle_gastrocnemius_medialis_51f, muscle_gastrocnemius_medialis_53f, muscle_gastrocnemius_medialis_37m, muscle_gastrocnemius_medialis_54m, muscle_leg_hindlimb_120_days_m, muscle_arm_101_days, muscle_arm_105_days_f, muscle_arm_115_days_f, muscle_arm_120_days_f, muscle_arm_85_days_f, muscle_arm_98_days_f, muscle_arm_101_days_m, muscle_arm_104_days_m, muscle_arm_105_days_m, muscle_arm_113_days_m, muscle_arm_115_days_m, muscle_arm_120_days_m, muscle_arm_127_days_m, muscle_arm_96_days_m, muscle_arm_97_days_m, muscle_back_105_days_f, muscle_back_113_days_f, muscle_back_115_days_f, muscle_back_85_days_f, muscle_back_98_days_f, muscle_back_101_days_m, muscle_back_104_days_m, muscle_back_105_days_m, muscle_back_108_days_m, muscle_back_127_days_m, muscle_back_91_days_m, muscle_back_96_days_m, muscle_back_97_days_m, muscle_leg_105_days_f, muscle_leg_110_days_f, muscle_leg_113_days_f, muscle_leg_115_days_f, muscle_leg_85_days_f, muscle_leg_101_days_m, muscle_leg_104_days_m, muscle_leg_105_days_m, muscle_leg_115_days_m, muscle_leg_127_days_m, muscle_leg_96_days_m, muscle_leg_97_days_m, muscle_trunk_113_days_f, muscle_trunk_115_days_f, muscle_trunk_120_days_f, muscle_trunk_121_days_f, muscle_psoas_30f, muscle_psoas_27m_35m, muscle_psoas_34m, muscle_psoas_3m, muscle_skeletal_cell, muscle_skeletal_tissue, muscle_skeletal_tissue_72f, muscle_skeletal_tissue_54m, muscle_tongue_59_days_f_76_days_f, muscle_tongue_72_days_m
* ```Myosatellite```: myosat_skeletal_muscle_myoblast_lhcn-m2, myosat_myocyte_lhcn-m2_origin, myosat_myotube_skeletal_muscle_myoblast_origin, myosat_skeletal_muscle_myoblast, myosat_skeletal_muscle_myoblast_22m, myosat_skeletal_muscle_satellite_cell_mesoderm_origin_f
* ```Neurosphere```: neurosph_15_weeks_ganglionic_eminence_origin, neurosph_17_weeks_f_ganglionic_cortex_origin, neurosph_17_weeks_f_ganglionic_eminence_origin, neurosph_olfactory_cell_line
* ```Other```: other_breast_epithelium_51f, other_breast_epithelium_53f, other_epidermal_melanocyte, other_foreskin_melanocyte_newborn_m, other_limb_embryo_53_days_56_days, other_limb_embryo_58_days_59_days
* ```Pancreas```: pancreas_body_51f, pancreas_body_53f, pancreas_body_37m, pancreas_body_54m, pancreas_islet_precursor_cell, pancreas_30f, pancreas_34m
* ```Placenta and EMM```: placenta_and_eem_amnion_16_weeks_m, placenta_and_eem_amnion_stem_cell, placenta_and_eem_chorion, placenta_and_eem_chorion_40_weeks_f, placenta_and_eem_chorion_16_weeks_m, placenta_and_eem_chorionic_villus_16_weeks, placenta_and_eem_chorionic_villus_40_weeks_f, placenta_and_eem_chorionic_villus_16_weeks_m, placenta_and_eem_chorionic_villus_38_weeks_m, placenta_and_eem_trophoblast_htr-8_svneo, placenta_and_eem_placenta_102_days, placenta_and_eem_placenta_16_weeks, placenta_and_eem_placenta_53_days, placenta_and_eem_placenta_56_days_59_days, placenta_and_eem_placenta_101_days_f_105_days_m, placenta_and_eem_placenta_105_days_f, placenta_and_eem_placenta_108_days_f, placenta_and_eem_placenta_113_days_f, placenta_and_eem_placenta_85_days_f, placenta_and_eem_placenta_85_days_m, placenta_and_eem_placenta_91_days_m, placenta_and_eem_placental_basal_plate_40_weeks_f, placenta_and_eem_placental_basal_plate_38_weeks_m, placenta_and_eem_trophoblast_cell_17_weeks_18_weeks, placenta_and_eem_trophoblast_cell_21_weeks, placenta_and_eem_trophoblast_cell_23_weeks, placenta_and_eem_trophoblast_cell_39_weeks_40_weeks, placenta_and_eem_trophoblast_20_weeks_f, placenta_and_eem_trophoblast_40_weeks_f, placenta_and_eem_umbilical_cord_59_days_76_days_m
* ```PNS```: pns_spinal_cord_108_days_f, pns_spinal_cord_113_days_f, pns_spinal_cord_59_days_f_72_days_m, pns_spinal_cord_87_days_f, pns_spinal_cord_89_days_f, pns_spinal_cord_105_days_m, pns_spinal_cord_96_days_m, pns_tibial_nerve_51f, pns_tibial_nerve_53f, pns_tibial_nerve_37m
* ```Reproductive```: reproductive_prostate_gland_37m, reproductive_prostate_gland_54m, reproductive_uterus_53f, reproductive_vagina_51f, reproductive_vagina_53f
* ```Sm. Muscle```: sm_muscle_colon_56f, sm_muscle_colon_77f, sm_muscle_duodenum_59m, sm_muscle_duodenum_73m, sm_muscle_rectum_50f, sm_muscle_brain_vasculature_smooth_cell, sm_muscle_stomach_84f, sm_muscle_stomach_59m
* ```Spleen```: spleen_112_days, spleen_30f, spleen_53f, spleen_34m, spleen_54m, spleen_3m
* ```Stromal```: stromal_skin_fibroblast_ag04449, stromal_lung_fibroblast_ag04450, stromal_skin_fibroblast_ag08395, stromal_lung_fibroblast_ag08396, stromal_skin_fibroblast_ag08396, stromal_gingival_fibroblast_ag09319, stromal_skin_fibroblast_ag10803, stromal_skin_fibroblast_ag20443, stromal_skin_fibroblast_bj, stromal_brain_pericyte, stromal_cardiac_fibroblast, stromal_cardiac_fibroblast_f, stromal_cardiac_fibroblast_94_days_f_98_days_f, stromal_skin_fibroblast_eh, stromal_skin_fibroblast_el, stromal_skin_fibroblast_elr, stromal_breast_fibroblast_17f, stromal_breast_fibroblast_26f, stromal_dermis_fibroblast, stromal_dermis_fibroblast_f, stromal_dermis_fibroblast_none_f, stromal_gingival_fibroblast, stromal_lung_fibroblast, stromal_lung_fibroblast_11f_45m, stromal_lung_fibroblast_45m, stromal_mammary_fibroblast_f, stromal_peridontal_ligament_fibroblast_m, stromal_pulmonary_artery_fibroblast, stromal_skin_fibroblast_abdomen_97_days_m, stromal_aorta_fibroblast_f, stromal_conjunctiva_fibroblast, stromal_villous_mesenchyme_fibroblast, stromal_foreskin_fibroblast_newborn_m, stromal_skin_fibroblast_gm03348, stromal_skin_fibroblast_gm04503, stromal_skin_fibroblast_gm04504, stromal_skin_fibroblast_gm23248, stromal_foreskin_fibroblast_hff-myc_foreskin_fibroblast_origin, stromal_lung_fibroblast_imr-90, stromal_lung_fibroblast_97_days_m, stromal_bone_marrow_m, stromal_lung_fibroblast_wi38
* ```Thymus```: thymus_embryo_f, thymus_105_days_f, thymus_110_days_f, thymus_113_days_f, thymus_147_days_f, thymus_98_days_f, thymus_3m, thymus_104_days_m, thymus_108_days_m, thymus_113_days_m, thymus_127_days_m
* ```Urinary```: urinary_bladder_34m, urinary_bladder_76_days_m, urinary_urothelium_cell_line

## Dependencies
All dependencies (including ```python``` (3.7), ```requests```, ```pybedtools```, ```pandas```, ```tabix```, ```ucsc-bigwigmerge```, ```ucsc-bigwigtobedgraph```, ```MACS2```, and ```scikit-learn```) can be easily installed as an Anaconda environment using the included ```core-bed_env.yml``` file:
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

python core-bed.py --help

usage: core-bed_final.py [-h] -i INPUT -m MODEL [-s SEPARATOR] -g REF_GENOME
                         -o OUTPUT -t TISSUE [-r REF_DIR] [--write_summary]
                         [--write_anno_only] [--bed_cols BED_COLS]
                         [--input_header] [-v]

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        the input bed file (required)
  -m MODEL, --model MODEL
                        saved decision tree model file in pickle format
                        (required)
  -s SEPARATOR, --separator SEPARATOR
                        the character separating values in the input file (default:
                        '\t')
  -g REF_GENOME, --ref_genome REF_GENOME
                        the human reference genome build on which the
                        input coordinates are based (required) (valid options:
                        GRCh38/hg38 or GRCh37/hg19)
  -o OUTPUT, --output OUTPUT
                        the path of the output file)
  -t TISSUE, --tissue TISSUE
                        the tissue of interest (required) (valid multi-sample
                        options: adipose, blood, bone, brain, cancer,
                        digestive, endocrine, endothelial, esc_deriv, esc,
                        eye, heart, hsc_and_b_cell, ipsc, kidney, liver, lung,
                        lymphoblastoid, mesench, muscle, myosat, neurosph,
                        other, pancreas, placenta_and_emm, pns, reproductive,
                        sm_muscle, spleen, stromal, thymus, urinary, all;
                        valid single-sample options: adipose_adipocyte,
                        adipose_34m, adipose_omental_fat_pad_51f,
                        adipose_omental_fat_pad_53f, adipose_subcutaneous_25f,
                        adipose_subcutaneous_41f, adipose_subcutaneous_49f,
                        adipose_subcutaneous_59f, adipose_subcutaneous_81f,
                        blood_cd4_alpha_beta_memory_t_cell,
                        blood_cd4_alpha_beta_memory_t_cell_blood_origin,
                        blood_cd4_alpha_beta_t_cell,
                        blood_cd4_alpha_beta_t_cell_33f,
                        blood_cd4_alpha_beta_t_cell_21m,
                        blood_cd4_alpha_beta_t_cell_37m,
                        blood_cd4_alpha_beta_t_cell_phorbol,
                        blood_cd4_cd25_alpha_beta_t_cell,
                        blood_cd8_alpha_beta_memory_t_cell,
                        blood_cd8_alpha_beta_t_cell,
                        blood_cd8_alpha_beta_t_cell_33f,
                        blood_cd8_alpha_beta_t_cell_34f,
                        blood_cd8_alpha_beta_t_cell_21m,
                        blood_cd8_alpha_beta_t_cell_28m,
                        blood_cd8_alpha_beta_t_cell_37m,
                        blood_effector_memory_cd4_alpha_beta_t_cell,
                        blood_mononuclear_cell_male,
                        blood_naive_thymus_cd4_alpha_beta_t_cell,
                        blood_naive_thymus_cd4_alpha_beta_t_cell_35f,
                        blood_naive_thymus_cd4_alpha_beta_t_cell_26m,
                        blood_peripheral_mononuclear_cell_28f,
                        blood_peripheral_mononuclear_cell_27m,
                        blood_peripheral_mononuclear_cell_28m,
                        blood_peripheral_mononuclear_cell_32m,
                        blood_peripheral_mononuclear_cell_39m,
                        blood_regulatory_t_cell_35f,
                        blood_regulatory_t_cell_28m,
                        blood_regulatory_t_cell_blood_origin, blood_t_cell,
                        blood_t_cell_21m, blood_t_cell_36m, blood_t_cell_37m,
                        blood_t1_helper_cell, blood_t1_helper_cell_26f,
                        blood_t1_helper_cell_33m, blood_t17_helper_cell,
                        blood_t17_helper_cell_phorbol,
                        blood_t2_helper_cell_26f, blood_t2_helper_cell_33m,
                        bone_arm, bone_femur, bone_marrow_stroma, bone_leg,
                        bone_osteoblast, brain_ammons_horn_84m,
                        brain_angular_gyrus_75f, brain_angular_gyrus_81m,
                        brain_astrocyte, brain_astrocyte_cerebellum,
                        brain_astrocyte_hippocampus,
                        brain_astrocyte_spinal_cord, brain_embryo_112_days,
                        brain_embryo_56_58_days, brain_embryo_80_days,
                        brain_embryo_105_days_f, brain_embryo_109_days_f,
                        brain_embryo_117_days_f, brain_embryo_120_days_f,
                        brain_embryo_142_days_f, brain_embryo_17_weeks_f,
                        brain_embryo_85_days_f, brain_embryo_96_days_f,
                        brain_embryo_101_days_m, brain_embryo_104_days_m,
                        brain_embryo_105_days_m, brain_embryo_122_days_m,
                        brain_embryo_72_76_days_m, brain_caudate_nucleus_75f,
                        brain_caudate_nucleus_78m, brain_caudate_nucleus_81m,
                        brain_cerebellar_cortex_78_81m,
                        brain_cerebellum_27_35m, brain_cerebellum_53m,
                        brain_cingulate_gyrus_75f, brain_cingulate_gyrus_81m,
                        brain_frontal_cortex_67_80f,
                        brain_frontal_cortex_27_35m,
                        brain_germinal_matrix_20_weeks_m,
                        brain_globus_pallidus_78_84m,
                        brain_inferior_parietal_cortex_84m,
                        brain_hippocampus_75f, brain_hippocampus_73m,
                        brain_medulla_oblongata_78_84m, brain_midbrain_78_84m,
                        brain_middle_frontal_area_75f,
                        brain_middle_frontal_area_81m,
                        brain_middle_frontal_gyrus_78m,
                        brain_occipital_lobe_84m, brain_pons_78m,
                        brain_putamen_78m, brain_substantia_nigra_75f,
                        brain_substantia_nigra_81m,
                        brain_superior_temporal_gyrus_84m,
                        brain_temporal_lobe_75f, brain_temporal_lobe_81m,
                        cancer_prostate_epithelial_22rv1,
                        cancer_pancreas_adenocarcinoma_8988t,
                        cancer_glioblastoma_a172,
                        cancer_lung_epithelial_carcinoma_a549, cancer_lung_epi
                        thelial_carcinoma_a549_treated_ethanol_1hr, cancer_lun
                        g_epithelial_carcinoma_a549_treated_dexamethasone_1hr,
                        cancer_lung_epithelial_carcinoma_a549_treated_dexameth
                        asone_10hr, cancer_lung_epithelial_carcinoma_a549_trea
                        ted_dexamethasone_10min, cancer_lung_epithelial_carcin
                        oma_a549_treated_dexamethasone_12hr, cancer_lung_epith
                        elial_carcinoma_a549_treated_dexamethasone_15min, canc
                        er_lung_epithelial_carcinoma_a549_treated_dexamethason
                        e_2hr, cancer_lung_epithelial_carcinoma_a549_treated_d
                        examethasone_20min, cancer_lung_epithelial_carcinoma_a
                        549_treated_dexamethasone_25min, cancer_lung_epithelia
                        l_carcinoma_a549_treated_dexamethasone_3hr, cancer_lun
                        g_epithelial_carcinoma_a549_treated_dexamethasone_30mi
                        n, cancer_lung_epithelial_carcinoma_a549_treated_dexam
                        ethasone_4hr, cancer_lung_epithelial_carcinoma_a549_tr
                        eated_dexamethasone_5hr, cancer_lung_epithelial_carcin
                        oma_a549_treated_dexamethasone_5min, cancer_lung_epith
                        elial_carcinoma_a549_treated_dexamethasone_6hr, cancer
                        _lung_epithelial_carcinoma_a549_treated_dexamethasone_
                        7hr, cancer_lung_epithelial_carcinoma_a549_treated_dex
                        amethasone_8hr, cancer_muscle_ewing_sarcoma_a673,
                        cancer_adenoid_cystic_carcinoma_acc112,
                        cancer_renal_cell_carcinoma_achn,
                        cancer_neuroblastoma_be2c, cancer_prostate_c4-2b,
                        cancer_colorectal_adenocarcinoma_caco-2,
                        cancer_kidney_clear_cell_carcinoma_caki2,
                        cancer_myelogenous_leukemia_cmk,
                        cancer_melanoma_colo829,
                        cancer_desmoplastic_medulloblastoma_daoy,
                        cancer_acute_lymphoblastic_leukemia_dnd-41,
                        cancer_b_cell_lymphoma_dohh2,
                        cancer_kidney_rhaboid_tumor_g401,
                        cancer_neuroglioma_h4, cancer_glioblastoma_h54,
                        cancer_haploid_myelogenous_leukemia_hap-1,
                        cancer_colorectal_adenocarcinoma_hct116,
                        cancer_cervix_adenocarcinoma_hela-s3,
                        cancer_cervix_adenocarcinoma_hela-s3_g1b_phase, cancer
                        _cervix_adenocarcinoma_hela-s3_treated_interferon_alph
                        a_4hr, cancer_hepatocellular_carcinoma_hepg2,
                        cancer_acute_promyelocytic_leukemia_hl-60,
                        cancer_colorectal_adenocarcinoma_ht-29,
                        cancer_fibrosarcoma_ht1080,
                        cancer_hepatocellular_carcinoma_huh-7.5, cancer_endome
                        trial_adenocarcinoma_ishikawa_treated_dmso_1hr, cancer
                        _endometrial_adenocarcinoma_ishikawa_treated_17b-estra
                        diol_30min, cancer_endometrial_adenocarcinoma_ishikawa
                        _treated_afimoxifene_30min,
                        cancer_myelogenous_leukemia_k562,
                        cancer_myelogenous_leukemia_k562_g1_phase,
                        cancer_myelogenous_leukemia_k562_g2_phase,
                        cancer_myelogenous_leukemia_k562_treated_dmso_72hr, ca
                        ncer_myelogenous_leukemia_k562_treated_vorinostat_72hr
                        , cancer_myelogenous_leukemia_k562_treated_sodium_buty
                        rate_72hr, cancer_b_cell_lymphoma_karpas-422,
                        cancer_myelogenous_leukemia_kbm-7,
                        cancer_myeloma_kms-11,
                        cancer_acute_lymphoblastic_leukemia_kopt-k1,
                        cancer_prostate_adenocarcinoma_lncap_clone_fgc, cancer
                        _prostate_adenocarcinoma_lncap_clone_fgc_treated_17b_1
                        2hr, cancer_acute_lymphoblastic_leukemia_loucy,
                        cancer_colorectal_adenocarcinoma_lovo,
                        cancer_glioblastoma_m059j,
                        cancer_mammary_gland_adenocarcinoma_mcf-7, cancer_mamm
                        ary_gland_adenocarcinoma_mcf-7_originated_from_mcf-7, 
                        cancer_mammary_gland_adenocarcinoma_mcf-7_treated_lact
                        ate_24hr, cancer_mammary_gland_adenocarcinoma_mcf-7_tr
                        eated_estradiol_1hr, cancer_mammary_gland_adenocarcino
                        ma_mcf-7_treated_ctcf_shrna_knockown,
                        cancer_medulloblastoma, cancer_osteosarcoma_mg63,
                        cancer_burkitt_lymphoma_namalwa, cancer_burkitt_lympho
                        ma_namalwa_treated_sendai_virus_2hr,
                        cancer_acute_promyelocytic_leukemia_nb4,
                        cancer_squamous_cell_carcinoma_nci-h226,
                        cancer_large_cell_lung_nci-h460,
                        cancer_myeloma_nci-h929,
                        cancer_testicular_embryonal_carcinoma_nt2_d1,
                        cancer_b_cell_lymphoma_oci-ly1,
                        cancer_b_cell_lymphoma_oci-ly3,
                        cancer_b_cell_lymphoma_oci-ly7,
                        cancer_pancreas_duct_epithelial_carcinoma_panc1,
                        cancer_parathyroid_adenoma_62m,
                        cancer_prostate_adenocarcinoma_pc-3,
                        cancer_lung_adenocarcinoma_pc-9,
                        cancer_renal_cell_adenocarcinoma_rcc_7860,
                        cancer_renal_cell_carcinoma,
                        cancer_colon_carcinoma_rko, cancer_melanoma_rpmi-7951,
                        cancer_plasma_cell_myeloma_rpmi8226,
                        cancer_rhabdomyosarcoma_sjcrh30,
                        cancer_osteosarcoma_sjsa1, cancer_melanoma_sk-mel-5,
                        cancer_neuroblastoma_sk-n-dz, cancer_neuroblastoma_sk-
                        n-dz_treated_dmso_72hr, cancer_neuroepithelioma_sk-n-
                        mc, cancer_neuroblastoma_sk-n-sh,
                        cancer_neuroblastoma_sk-n-
                        sh_treated_retinoic_acid_48hr,
                        cancer_b_cell_lymphoma_su-dhl-6,
                        cancer_colorectal_adenocarcinoma_sw480,
                        cancer_mammary_gland_ductal_carcinoma_t47d, cancer_mam
                        mary_gland_ductal_carcinoma_t47d_treated_17b-estradiol
                        _30min, cancer_prostate_epithelial_carcinoma_vcap,
                        cancer_eye_retinoblastoma_weri-rb-1,
                        digestive_colon_mucosa_56f,
                        digestive_colon_mucosa_73f,
                        digestive_duodenum_mucosa_59m,
                        digestive_duodenum_mucosa_76m,
                        digestive_esophagus_30f, digestive_esophagus_34m,
                        digestive_esophagus_muscularis_mucosa_53f,
                        digestive_esophagus_muscularis_mucosa_37m,
                        digestive_esophagus_squamous_epithelium_53f,
                        digestive_esophagus_squamous_epithelium_37m,
                        digestive_gastroesophageal_sphincter_53f,
                        digestive_large_intestine_embryo_103_days_f,
                        digestive_large_intestine_embryo_105_days_f,
                        digestive_large_intestine_embryo_107_days_f,
                        digestive_large_intestine_embryo_108_days_f,
                        digestive_large_intestine_embryo_110_days_f,
                        digestive_large_intestine_embryo_120_days_f,
                        digestive_large_intestine_embryo_91_days_f,
                        digestive_large_intestine_embryo_98_days_f,
                        digestive_large_intestine_embryo_105_days_m,
                        digestive_large_intestine_embryo_108_days_m,
                        digestive_large_intestine_embryo_113_days_m,
                        digestive_large_intestine_embryo_115_days_m,
                        digestive_large_intestine_embryo_91_days_m,
                        digestive_rectum_mucosa_50f,
                        digestive_rectum_mucosa_61f,
                        digestive_rectum_mucosa_59m,
                        digestive_stomach_mucosa_59m,
                        digestive_peyers_patch_53f,
                        digestive_peyers_patch_37m,
                        digestive_peyers_patch_54m,
                        digestive_sigmoid_colon_51f,
                        digestive_sigmoid_colon_53f,
                        digestive_sigmoid_colon_34m,
                        digestive_sigmoid_colon_54m,
                        digestive_sigmoid_colon_3m,
                        digestive_small_intestine_30f,
                        digestive_small_intestine_105_days_f,
                        digestive_small_intestine_107_days_f,
                        digestive_small_intestine_108_days_f,
                        digestive_small_intestine_110_days_f,
                        digestive_small_intestine_120_days_f,
                        digestive_small_intestine_91_days_f,
                        digestive_small_intestine_98_days_f,
                        digestive_small_intestine_34m,
                        digestive_small_intestine_3m,
                        digestive_small_intestine_105_days_m,
                        digestive_small_intestine_108_days_m,
                        digestive_small_intestine_115_days_m,
                        digestive_small_intestine_87_days_m,
                        digestive_small_intestine_91_days_m,
                        digestive_stomach_101_days, digestive_stomach_30f,
                        digestive_stomach_51f, digestive_stomach_53f,
                        digestive_stomach_f, digestive_stomach_105_days_f,
                        digestive_stomach_107_days_f,
                        digestive_stomach_108_days_f,
                        digestive_stomach_121_days_f,
                        digestive_stomach_147_days_f,
                        digestive_stomach_96_days_f,
                        digestive_stomach_98_days_f, digestive_stomach_34m,
                        digestive_stomach_54m, digestive_stomach_3m,
                        digestive_stomach_108_days_m,
                        digestive_stomach_127_days_m,
                        digestive_stomach_58_76_days_m,
                        digestive_stomach_91_days_m,
                        digestive_transverse_colon_51f,
                        digestive_transverse_colon_53f,
                        digestive_transverse_colon_37m,
                        digestive_transverse_colon_54m,
                        endocrine_adrenal_gland_96_days,
                        endocrine_adrenal_gland_30f,
                        endocrine_adrenal_gland_51f,
                        endocrine_adrenal_gland_53f,
                        endocrine_adrenal_gland_108_days_f,
                        endocrine_adrenal_gland_113_days_f,
                        endocrine_adrenal_gland_85_days_f,
                        endocrine_adrenal_gland_34m,
                        endocrine_adrenal_gland_37m,
                        endocrine_adrenal_gland_54m,
                        endocrine_adrenal_gland_101_days_m,
                        endocrine_adrenal_gland_108_days_m,
                        endocrine_adrenal_gland_85_days_m,
                        endocrine_adrenal_gland_97_days_m,
                        endocrine_pancreas_59, endocrine_pancreas_45m,
                        endocrine_pancreas_46m, endocrine_ovary_30f,
                        endocrine_ovary_51f, endocrine_ovary_53f,
                        endocrine_ovary_embryo_f, endocrine_testis_37m,
                        endocrine_testis_54m, endocrine_testis_embryo_m,
                        endocrine_thyroid_gland_51f,
                        endocrine_thyroid_gland_53f,
                        endocrine_thyroid_gland_37m,
                        endocrine_thyroid_gland_54m,
                        endothelial_brain_microvascular,
                        endothelial_dermis_blood_vessel_adult_f,
                        endothelial_dermis_blood_vessel_newborn_m,
                        endothelial_dermis_microvascular_lymphatoc_vessel_f,
                        endothelial_dermis_microvascular_lymphatoc_vessel_m,
                        endothelial_umbilical_vein_newborn_m,
                        endothelial_umbilical_vein_newborn,
                        endothelial_glomerulus,
                        endothelial_kidney_capillary_113_days_f,
                        endothelial_lung_microvascular_f,
                        endothelial_pulmonary_artery_f, epithelial_amnion,
                        epithelial_bronchial,
                        epithelial_bronchial_f_treated_retinoic_acid,
                        epithelial_choroid_plexus, epithelial_colon,
                        epithelial_esophagus, epithelial_prostate,
                        epithelial_prostate_m, epithelial_proximal_tubule,
                        epithelial_foreskin_keratinocyte_newborn_m,
                        epithelial_foreskin_keratinocyte_newborn_2-4_days_m, e
                        pithelial_foreskin_keratinocyte_newborn_2-4_days_m_tre
                        ated_calcium_2.5_days, epithelial_foreskin_keratinocyt
                        e_newborn_2-4_days_m_treated_calcium_5.5_days,
                        epithelial_glomerulus_visceral_3,
                        epithelial_proximal_tubule_hk-2,
                        epithelial_pancreatic_duct_dpde6-e6e7,
                        epithelial_bone_marrow_hs-27a,
                        epithelial_iris_pigment, epithelial_keratinocyte_f,
                        epithelial_kidney, epithelial_glomerulus_43_62_m,
                        epithelial_tubule_80f_62m,
                        epithelial_tubule_80f_treated_cisplatin,
                        epithelial_skin_leg_53f, epithelial_skin_leg_37m,
                        epithelial_mammary_luminal_33f, epithelial_mammary_f,
                        epithelial_mammary_18f, epithelial_mammary_50f,
                        epithelial_breast_mcf_10a,
                        epithelial_breast_mcf_10a_treated_tamoxifen_24hr,
                        epithelial_breast_mcf_10a_treated_tamoxifen_6hr,
                        epithelial_mammary_myoepithelial_33f,
                        epithelial_mammary_myoepithelial_36f, epithelial_non-
                        pigmented_ciliary, epithelial_renal_cortical,
                        epithelial_retinal, epithelial_prostate_rwpe1,
                        epithelial_prostate_rwpe2,
                        epithelial_skin_of_body_82_days_f, esc_deriv_bipolar_n
                        euron_gm23338_origin_treated_doxycycline_4_days,
                        esc_deriv_cardiac_mesoderm_h7-hesc_origin,
                        esc_deriv_cardiac_muscle_rues2_origin,
                        esc_deriv_ectodermal, esc_deriv_endodermal,
                        esc_deriv_endodermal_hues64_origin,
                        esc_deriv_hepatocyte_h9_origin,
                        esc_deriv_mesenchymal_stem_h1-hesc_origin,
                        esc_deriv_mesendoderm_h1-hesc_origin,
                        esc_deriv_mesodermal_hues64_origin,
                        esc_deriv_neural_crest_h1-hesc_origin,
                        esc_deriv_neural_progenitor_h1-hesc_origin,
                        esc_deriv_neuron_h9_origin,
                        esc_deriv_smooth_muscle_h9_origin,
                        esc_deriv_trophoblast_h1-hesc_origin, esc_elf-1,
                        esc_es-i3, esc_h1-hesc, esc_h7-hesc, esc_h9,
                        esc_hues48, esc_hues6, esc_hues64, esc_ucsf-4,
                        eye_56_days_76_days_m, eye_76_days_f,
                        eye_125_days_103_days_m, eye_74_days_85_days,
                        eye_89_days_f, heart_aorta_30f, heart_aorta_34m,
                        heart_ascending_aorta_51f, heart_ascending_aorta_53f,
                        heart_coronary_artery_51f, heart_coronary_artery_53f,
                        heart_101_days, heart_59_days_76_days_f,
                        heart_80_days, heart_96_days, heart_103_days_f,
                        heart_105_days_f, heart_110_days_f,
                        heart_116_days_98_days_f, heart_116_days_117_days_f,
                        heart_147_days_f, heart_91_days_f,
                        heart_left_ventricle_53f,
                        heart_left_ventricle_101_days_103_days_f,
                        heart_left_ventricle_136_days_f,
                        heart_left_ventricle_34m, heart_left_ventricle_3m,
                        heart_27m_35m, heart_3m, heart_105_days_m,
                        heart_110_days_m, heart_120_days_m,
                        heart_72_days_76_days_m, heart_91_days_m,
                        heart_96_days_m,
                        heart_right_ventricle_101_days_103_days_f,
                        heart_right_ventricle_34m, heart_right_ventricle_3m,
                        heart_left_atrium_101_days_f, heart_right_atrium_51f,
                        heart_right_atrium_53f, heart_right_atrium_34m,
                        heart_thoracic_aorta_37m, heart_thoracic_aorta_54m,
                        heart_tibial_artery_53f, heart_tibial_artery_37m,
                        hsc_and_b_cell_b_cell, hsc_and_b_cell_b_cell_27f,
                        hsc_and_b_cell_b_cell_27f_43f,
                        hsc_and_b_cell_b_cell_34f, hsc_and_b_cell_b_cell_43f,
                        hsc_and_b_cell_b_cell_21m, hsc_and_b_cell_b_cell_37m,
                        hsc_and_b_cell_cd14_monocyte_f,
                        hsc_and_b_cell_cd14_monocyte_34f,
                        hsc_and_b_cell_cd14_monocyte_21m,
                        hsc_and_b_cell_cd14_monocyte_37m,
                        hsc_and_b_cell_cd1c_myeloid_dendritic,
                        hsc_and_b_cell_cmp_cd34, hsc_and_b_cell_cmp_cd34_f,
                        hsc_and_b_cell_cmp_cd34_27f,
                        hsc_and_b_cell_cmp_cd34_33f,
                        hsc_and_b_cell_cmp_cd34_50f,
                        hsc_and_b_cell_cmp_cd34_m,
                        hsc_and_b_cell_cmp_cd34_adult_m,
                        hsc_and_b_cell_cmp_cd34_23m,
                        hsc_and_b_cell_cmp_cd34_36m,
                        hsc_and_b_cell_cmp_cd34_37m,
                        hsc_and_b_cell_cmp_cd34_42m,
                        hsc_and_b_cell_cmp_cd34_43m,
                        hsc_and_b_cell_cmp_cd34_49m,
                        hsc_and_b_cell_germinal_center, hsc_and_b_cell_mpp, hs
                        c_and_b_cell_mpp_25m_treated_erythropoietin_hydrocorti
                        sone_succinate_ligand_il3_20_days, hsc_and_b_cell_mpp_
                        25m_treated_erythropoietin_hydrocortisone_succinate_li
                        gand_il3_11_days, hsc_and_b_cell_mpp_25m_treated_eryth
                        ropoietin_hydrocortisone_succinate_ligand_il3_13_days,
                        hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydrocor
                        tisone_succinate_ligand_il3_15_days, hsc_and_b_cell_mp
                        p_25m_treated_erythropoietin_hydrocortisone_succinate_
                        ligand_il3_17_days, hsc_and_b_cell_mpp_25m_treated_ery
                        thropoietin_hydrocortisone_succinate_ligand_il3_18_day
                        s, hsc_and_b_cell_mpp_25m_treated_erythropoietin_hydro
                        cortisone_succinate_ligand_il3_4_days, hsc_and_b_cell_
                        mpp_25m_treated_erythropoietin_hydrocortisone_succinat
                        e_ligand_il3_6_days, hsc_and_b_cell_mpp_25m_treated_er
                        ythropoietin_hydrocortisone_succinate_ligand_il3_8_day
                        s, hsc_and_b_cell_lymphocyte_jurkat_clone_e61,
                        hsc_and_b_cell_lymphocyte_naive_b_cell,
                        hsc_and_b_cell_nk_34f, hsc_and_b_cell_nk_21m,
                        hsc_and_b_cell_nk_37m, hsc_and_b_cell_neutrophil,
                        hsc_and_b_cell_neutrophil_m, ipsc_cwru1_m,
                        ipsc_gm23338_53m_gm23248_origin,
                        ipsc_ips_df_19.11_newborn_m,
                        ipsc_ips_df_19.7_newborn_m,
                        ipsc_ips_df_14.7_newborn_m, ipsc_ips_df_6.9_newborn_m,
                        ipsc_ips-11a_36m, ipsc_ips-15b_48f, ipsc_ips-18a_48f,
                        ipsc_ips-18c_48f, ipsc_ips-20b_55m, ipsc_ips-
                        nihi11_71m_ag20443_origin, ipsc_ips-
                        nihi7_85f_ag08395_origin, ipsc_l1-s8, ipsc_l1-s8r,
                        kidney_hek293, kidney_hek293t,
                        kidney_59_days_59_days_f, kidney_80_days,
                        kidney_105_days_f, kidney_108_days_f,
                        kidney_121_days_f, kidney_76_days_f_76_days_m,
                        kidney_85_days_f, kidney_50m, kidney_67m,
                        kidney_105_days_m, kidney_85_days_m, kidney_87_days_m,
                        kidney_left_107_days_f, kidney_left_110_days_f,
                        kidney_left_147_days_f,
                        kidney_left_59_days_f_91_days_m,
                        kidney_left_87_days_f, kidney_left_89_days_f,
                        kidney_left_115_days_m, kidney_left_87_days_m,
                        kidney_left_96_days_m,
                        kidney_left_renal_cortex_interstitium_105_days_m,
                        kidney_left_renal_cortex_interstitium_120_days_m,
                        kidney_left_renal_pelvis_105_days_m,
                        kidney_left_renal_pelvis_120_days_m,
                        kidney_renal_cortex_interstitium_103_days_f,
                        kidney_renal_cortex_interstitium_120_days_f,
                        kidney_renal_cortex_interstitium_89_days_f,
                        kidney_renal_cortex_interstitium_96_days_f,
                        kidney_renal_cortex_interstitium_108_days_m,
                        kidney_renal_cortex_interstitium_113_days_m,
                        kidney_renal_cortex_interstitium_127_days_m,
                        kidney_renal_cortex_interstitium_91_days_m,
                        kidney_renal_cortex_interstitium_97_days_m,
                        kidney_renal_pelvis_103_days_f,
                        kidney_renal_pelvis_105_days_f,
                        kidney_renal_pelvis_89_days_f,
                        kidney_renal_pelvis_96_days_f,
                        kidney_renal_pelvis_108_days_m,
                        kidney_renal_pelvis_113_days_m,
                        kidney_renal_pelvis_127_days_m,
                        kidney_renal_pelvis_91_days_m,
                        kidney_renal_pelvis_97_days_m,
                        kidney_right_107_days_f, kidney_right_117_days_f,
                        kidney_right_147_days_f, kidney_right_87_days_f,
                        kidney_right_98_days_f, kidney_right_108_days_m,
                        kidney_right_115_days_m, kidney_right_87_days_m,
                        kidney_right_91_days_m, kidney_right_96_days_m,
                        kidney_right_renal_cortex_interstitium_105_days_m,
                        kidney_right_renal_cortex_interstitium_120_days_m,
                        kidney_right_renal_pelvis_105_days_m,
                        kidney_right_renal_pelvis_120_days_m,
                        liver_hepatic_stellate_cell_59f, liver_hepatocyte,
                        liver_59_days_80_days, liver_25f,
                        liver_101_days_113_days_f, liver_31m, liver_78m,
                        liver_right_lobe_53f, lung_left_105_days_f,
                        lung_left_107_days_f, lung_left_108_days_f,
                        lung_left_110_days_f, lung_left_117_days_f,
                        lung_left_91_days_f, lung_left_98_days_f,
                        lung_left_105_days_m, lung_left_113_days_m,
                        lung_left_115_days_m, lung_left_87_days_m,
                        lung_left_91_days_m, lung_left_96_days_m,
                        lung_101_days, lung_112_days, lung_67_days,
                        lung_80_days_76_days_m, lung_30f, lung_108_days_f,
                        lung_120_days_f, lung_76_days_f, lung_82_days_f,
                        lung_85_days_f, lung_96_days_f, lung_3m,
                        lung_103_days_m, lung_108_days_m,
                        lung_54_days_58_days_m, lung_82_days_m,
                        lung_right_105_days_f, lung_right_107_days_f,
                        lung_right_108_days_f, lung_right_110_days_f,
                        lung_right_117_days_f, lung_right_91_days_f,
                        lung_right_98_days_f, lung_right_105_days_m,
                        lung_right_115_days_m, lung_right_87_days_m,
                        lung_right_96_days_m, lung_left_upper_lobe_51f,
                        lung_left_upper_lobe_53f, lung_left_upper_lobe_37m,
                        lymphoblastoid_gm06990, lymphoblastoid_gm08714,
                        lymphoblastoid_gm10248, lymphoblastoid_gm10266,
                        lymphoblastoid_gm12864, lymphoblastoid_gm12865,
                        lymphoblastoid_gm12875, lymphoblastoid_gm12878,
                        lymphoblastoid_gm12891, lymphoblastoid_gm12892,
                        lymphoblastoid_gm18507, lymphoblastoid_gm19238,
                        lymphoblastoid_gm19239, lymphoblastoid_gm19240,
                        mesench_adipocyte_msc_origin,
                        mesench_msc_dedifferentiated_amniotic_fluid_origin,
                        mesench_embryonic_facial_prominence_53_days_58_days,
                        mesench_msc_adipose_origin, muscle_cardiac_myocyte,
                        muscle_forelimb_108_days_f,
                        muscle_gastrocnemius_medialis_51f,
                        muscle_gastrocnemius_medialis_53f,
                        muscle_gastrocnemius_medialis_37m,
                        muscle_gastrocnemius_medialis_54m,
                        muscle_leg_hindlimb_120_days_m, muscle_arm_101_days,
                        muscle_arm_105_days_f, muscle_arm_115_days_f,
                        muscle_arm_120_days_f, muscle_arm_85_days_f,
                        muscle_arm_98_days_f, muscle_arm_101_days_m,
                        muscle_arm_104_days_m, muscle_arm_105_days_m,
                        muscle_arm_113_days_m, muscle_arm_115_days_m,
                        muscle_arm_120_days_m, muscle_arm_127_days_m,
                        muscle_arm_96_days_m, muscle_arm_97_days_m,
                        muscle_back_105_days_f, muscle_back_113_days_f,
                        muscle_back_115_days_f, muscle_back_85_days_f,
                        muscle_back_98_days_f, muscle_back_101_days_m,
                        muscle_back_104_days_m, muscle_back_105_days_m,
                        muscle_back_108_days_m, muscle_back_127_days_m,
                        muscle_back_91_days_m, muscle_back_96_days_m,
                        muscle_back_97_days_m, muscle_leg_105_days_f,
                        muscle_leg_110_days_f, muscle_leg_113_days_f,
                        muscle_leg_115_days_f, muscle_leg_85_days_f,
                        muscle_leg_101_days_m, muscle_leg_104_days_m,
                        muscle_leg_105_days_m, muscle_leg_115_days_m,
                        muscle_leg_127_days_m, muscle_leg_96_days_m,
                        muscle_leg_97_days_m, muscle_trunk_113_days_f,
                        muscle_trunk_115_days_f, muscle_trunk_120_days_f,
                        muscle_trunk_121_days_f, muscle_psoas_30f,
                        muscle_psoas_27m_35m, muscle_psoas_34m,
                        muscle_psoas_3m, muscle_skeletal_cell,
                        muscle_skeletal_tissue, muscle_skeletal_tissue_72f,
                        muscle_skeletal_tissue_54m,
                        muscle_tongue_59_days_f_76_days_f,
                        muscle_tongue_72_days_m,
                        myosat_skeletal_muscle_myoblast_lhcn-m2,
                        myosat_myocyte_lhcn-m2_origin,
                        myosat_myotube_skeletal_muscle_myoblast_origin,
                        myosat_skeletal_muscle_myoblast,
                        myosat_skeletal_muscle_myoblast_22m, myosat_skeletal_m
                        uscle_satellite_cell_mesoderm_origin_f,
                        neurosph_15_weeks_ganglionic_eminence_origin,
                        neurosph_17_weeks_f_ganglionic_cortex_origin,
                        neurosph_17_weeks_f_ganglionic_eminence_origin,
                        neurosph_olfactory_cell_line,
                        other_breast_epithelium_51f,
                        other_breast_epithelium_53f,
                        other_epidermal_melanocyte,
                        other_foreskin_melanocyte_newborn_m,
                        other_limb_embryo_53_days_56_days,
                        other_limb_embryo_58_days_59_days, pancreas_body_51f,
                        pancreas_body_53f, pancreas_body_37m,
                        pancreas_body_54m, pancreas_islet_precursor_cell,
                        pancreas_30f, pancreas_34m,
                        placenta_and_eem_amnion_16_weeks_m,
                        placenta_and_eem_amnion_stem_cell,
                        placenta_and_eem_chorion,
                        placenta_and_eem_chorion_40_weeks_f,
                        placenta_and_eem_chorion_16_weeks_m,
                        placenta_and_eem_chorionic_villus_16_weeks,
                        placenta_and_eem_chorionic_villus_40_weeks_f,
                        placenta_and_eem_chorionic_villus_16_weeks_m,
                        placenta_and_eem_chorionic_villus_38_weeks_m,
                        placenta_and_eem_trophoblast_htr-8_svneo,
                        placenta_and_eem_placenta_102_days,
                        placenta_and_eem_placenta_16_weeks,
                        placenta_and_eem_placenta_53_days,
                        placenta_and_eem_placenta_56_days_59_days,
                        placenta_and_eem_placenta_101_days_f_105_days_m,
                        placenta_and_eem_placenta_105_days_f,
                        placenta_and_eem_placenta_108_days_f,
                        placenta_and_eem_placenta_113_days_f,
                        placenta_and_eem_placenta_85_days_f,
                        placenta_and_eem_placenta_85_days_m,
                        placenta_and_eem_placenta_91_days_m,
                        placenta_and_eem_placental_basal_plate_40_weeks_f,
                        placenta_and_eem_placental_basal_plate_38_weeks_m,
                        placenta_and_eem_trophoblast_cell_17_weeks_18_weeks,
                        placenta_and_eem_trophoblast_cell_21_weeks,
                        placenta_and_eem_trophoblast_cell_23_weeks,
                        placenta_and_eem_trophoblast_cell_39_weeks_40_weeks,
                        placenta_and_eem_trophoblast_20_weeks_f,
                        placenta_and_eem_trophoblast_40_weeks_f,
                        placenta_and_eem_umbilical_cord_59_days_76_days_m,
                        pns_spinal_cord_108_days_f,
                        pns_spinal_cord_113_days_f,
                        pns_spinal_cord_59_days_f_72_days_m,
                        pns_spinal_cord_87_days_f, pns_spinal_cord_89_days_f,
                        pns_spinal_cord_105_days_m, pns_spinal_cord_96_days_m,
                        pns_tibial_nerve_51f, pns_tibial_nerve_53f,
                        pns_tibial_nerve_37m, reproductive_prostate_gland_37m,
                        reproductive_prostate_gland_54m,
                        reproductive_uterus_53f, reproductive_vagina_51f,
                        reproductive_vagina_53f, sm_muscle_colon_56f,
                        sm_muscle_colon_77f, sm_muscle_duodenum_59m,
                        sm_muscle_duodenum_73m, sm_muscle_rectum_50f,
                        sm_muscle_brain_vasculature_smooth_cell,
                        sm_muscle_stomach_84f, sm_muscle_stomach_59m,
                        spleen_112_days, spleen_30f, spleen_53f, spleen_34m,
                        spleen_54m, spleen_3m,
                        stromal_skin_fibroblast_ag04449,
                        stromal_lung_fibroblast_ag04450,
                        stromal_skin_fibroblast_ag08395,
                        stromal_lung_fibroblast_ag08396,
                        stromal_skin_fibroblast_ag08396,
                        stromal_gingival_fibroblast_ag09319,
                        stromal_skin_fibroblast_ag10803,
                        stromal_skin_fibroblast_ag20443,
                        stromal_skin_fibroblast_bj, stromal_brain_pericyte,
                        stromal_cardiac_fibroblast,
                        stromal_cardiac_fibroblast_f,
                        stromal_cardiac_fibroblast_94_days_f_98_days_f,
                        stromal_skin_fibroblast_eh,
                        stromal_skin_fibroblast_el,
                        stromal_skin_fibroblast_elr,
                        stromal_breast_fibroblast_17f,
                        stromal_breast_fibroblast_26f,
                        stromal_dermis_fibroblast,
                        stromal_dermis_fibroblast_f,
                        stromal_dermis_fibroblast_none_f,
                        stromal_gingival_fibroblast, stromal_lung_fibroblast,
                        stromal_lung_fibroblast_11f_45m,
                        stromal_lung_fibroblast_45m,
                        stromal_mammary_fibroblast_f,
                        stromal_peridontal_ligament_fibroblast_m,
                        stromal_pulmonary_artery_fibroblast,
                        stromal_skin_fibroblast_abdomen_97_days_m,
                        stromal_aorta_fibroblast_f,
                        stromal_conjunctiva_fibroblast,
                        stromal_villous_mesenchyme_fibroblast,
                        stromal_foreskin_fibroblast_newborn_m,
                        stromal_skin_fibroblast_gm03348,
                        stromal_skin_fibroblast_gm04503,
                        stromal_skin_fibroblast_gm04504,
                        stromal_skin_fibroblast_gm23248,
                        stromal_foreskin_fibroblast_hff-
                        myc_foreskin_fibroblast_origin,
                        stromal_lung_fibroblast_imr-90,
                        stromal_lung_fibroblast_97_days_m,
                        stromal_bone_marrow_m, stromal_lung_fibroblast_wi38,
                        thymus_embryo_f, thymus_105_days_f, thymus_110_days_f,
                        thymus_113_days_f, thymus_147_days_f,
                        thymus_98_days_f, thymus_3m, thymus_104_days_m,
                        thymus_108_days_m, thymus_113_days_m,
                        thymus_127_days_m, urinary_bladder_34m,
                        urinary_bladder_76_days_m,
                        urinary_urothelium_cell_line
  -r REF_DIR, --ref_dir REF_DIR
                        The path of the reference file directory
  --write_summary       Write out a summary of regulatory counts as a .txt
                        file
  --write_anno_only     Instead of the entire input file appended with an annotation
                        column, write out only the annotation column
  --bed_cols BED_COLS   If the input is not in traditional UCSC BED format,
                        specify the column numbers of chr, start, and end
                        separated by commas
  --input_header        Use if the input file has a header
  -v, --verbose         Return logging as terminal output
```

A run of CoRE-BED to annotate a set of GWAS summary statistics with functional predictions for a single tissue type would look something like the following:
```
python core-bed.py \
-i input_gwas_summary_stats_based_on_hg38.txt \
-m ~/CoRE-BED/decision_tree_k9_entropy.depth15.pickle \
-g hg38 \
-t blood \
-o annotated_input_gwas_summary_stats_based_on_hg38.txt \
-r ~/core-bed_ref_hg38 \
-v \
--bed_cols 3,4,4 \
--input_header
```
...with each of the user-specified arguments specifying:
* ```-i``` or ```--input```\
An input set of genomic coordinates to be functionally annotated
* ```-m``` or ```--input```\
The trained decision tree model parameters in pickle format
* ```-g``` or ```--ref_genome```\
The reference genome build on which the input coordinates are based
* ```-t``` or ```--tissue```\
The tissue type(s) on which the predicted functional annotations will be based
* ```-o``` or ```--output```\
The desired name of the output file
* ```-v``` or ```--verbose```\
Print progress out to the console
* ```--bed_cols```\
The columns of the input file (1-indexed) containing the chr, start coordinate, and end coordinate. For files containing only a single variant coordinate (common for GWAS summary statistics), specify this same column for both the start and end coordinate.
* ```--input_header```\
Specifies that the input file does have a header\
\
The final output file will retain all of the columns of the original input, with a newly appended column of CoRE-BED functional annotations.\
\
Some file types (such as full GWAS summary statistics) are so are large enough to make a sequential run of CoRE-BED across multiple tissues too time-consuming. In this case, it is recommended to run functional predictions for each tissue individually in parallel as a separate job, combining the results at the end. In SLURM, this parallelization would look something like the following:
```
tissue_array=("adipose_adipocyte" "adipose_34m" "adipose_omental_fat_pad_51f" "adipose_omental_fat_pad_53f" "adipose_subcutaneous_25f" "adipose_subcutaneous_41f" "adipose_subcutaneous_49f" "adipose_subcutaneous_59f" "adipose_subcutaneous_81f)
SCRIPT_DIR=/home/bettimj/CoRE-BED
IN_FILE=uk_biobank/hypertension/phecode-401-both_sexes.tsv

for tissue in ${tissue_array[@]}; do
	sbatch \
	--job-name=$tissue\_anno \
	--account=lab \
	--nodes=1 \
	--ntasks=1 \
	--cpus-per-task=1 \
	--mem=64G \
	--time=0-05:00:00 \
	--wrap="python $SCRIPT_DIR\/core-bed.py \
	-i $IN_FILE \
	-m ~/CoRE-BED/decision_tree_k9_entropy.depth15.pickle \
	-g hg19 \
	-t $tissue \
	-o phecode-401-both_sexes.func_anno.$tissue\.tsv  \
	-r ~/core-bed_ref_hg19 \
	-v \
	--bed_cols 1,2,2 \
	--input_header"
done
```

## CoRE-BED score for SNP-to-gene linking
Code for computing CoRE-BED scores for cS2G and T2D SNPs can be found in the ```core-bed_score``` directory.
