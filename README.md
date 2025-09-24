# **Cavefish Structural Variation Analysis**
Custom scripts used for analysis of structural variants in _Astyanax mexicanus_ cavefish

-------------------------------------------------------------------------------------------------------------------

## ***Calculating deletion allele frequencies in each population from Vg/GIRAFFE VCF output*** </font>

**`calculate_deletion_allelefreqs.pl`**

This script allows you to calculate deletion allele frequencies for each population from a Vg/GIRAFFE VCF output file (subset to only deletion variants). The script is flexible for use in any analysis without editing as long as you provide an appropriate keyfile and VCF. 

<ins> Script Usage </ins>
```
perl calculate_deletion_allelefreqs.pl -i [input VCF file] -k [key file] -o [output file]
```

<ins> Keyfile </ins> 

The script will use this file to determine all populations it needs to calculate a frequency for and which samples in the VCF belong to each population. Please see `GIRAFFE_vcf_keyfile.txt` for a full example. 

The Keyfile should follow the following format, with each line representing a sample in your analysis and all fields tab-delimited:
```
sample column in VCF (0-indexed value)  sample ID  population (must use consistent syntax across samples)
```


<ins> A few notes on assumptions made by this script </ins>
1. This script technically works when multi-allelic sites are joined or when listed separately. In the case of joined multi-allelic sites, the script calculates the "overall variant frequency", i.e., all alternate alleles are counted towards the variant frequency. For example, while a genotype of 0/0 is considered homozygous reference, both 0/1 and 0/2 would be considered heterozygous alternate (despite technically being different alternate alleles). This script works best on a VCF that has been filtered to only contain your variants of interest rather than a large-scale VCF containing many variant types.
2. This script requires that more alleles are genotyped than missing (.) in order to output a frequency estimate for a given population. Otherwise, it will print a frequency of NA. This is to increase the likelihood that the estimated frequency is representative of the real population and not based on just a few genotyped alleles.

-------------------------------------------------------------------------------------------------------------------


## ***Identifying regions of the genome under selection with diploS/HIC***

<ins> Dependency versions </ins>  
```
keras        2.15.0  
tensorflow   2.15.0  
python       3.9.18  
numpy        1.26.4  
pandas       2.2.2  
scipy        1.13.1
```
(program run from a conda environment, see https://github.com/kr-colab/diploSHIC/tree/master for tips on installation) 

Step 1: Make simulated dataset   

Step 2: Compute summary statistics and feature vectors on simulated data   

Step 3: Train diploS/HIC convoluted neural network and generate model   

Step 4: Run diploS/HIC on empirical data (VCFs of popgen data)  

Step 5: Get sweep predictions in 5kb windows across the genome  

