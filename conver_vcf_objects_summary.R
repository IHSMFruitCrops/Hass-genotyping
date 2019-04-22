------------------------------------------------------------------------
##Converting the dataset to Genelight(GL), genind(GI) and genclone(GC)## 


if(!require(vcfR)) install.packages("vcfR") # installation of a package to work with vcf format.
library("vcfR")# load vcfR package.

GbsAvoAllSF6401 <- read.vcfR("allAVOmerge1_2GBS_SF6401_NoMiss_Bia_SNP_C_D1000bp_Bia.recode.vcf")

##converting dataset to different objects:

if(!require(poppr)) install.packages("poppr") # installation of poppr package.
library("poppr") # load poppr package.

##converting dataset to GeneLight(GL) object:

GL_GbsAvoAllSF6401 = vcfR2genlight(GbsAvoAllSF6401)
ploidy(GL_GbsAvoAllSF6401) = 2

##converting dataset to genind(GI) object:

GI_GbsAvoAllSF6401 = vcfR2genind(GbsAvoAllSF6401)

##converting dataset to En genclone(GC) object:

GC_GbsAvoAllSF6401 = poppr::as.genclone(GI_GbsAvoAllSF6401)

##summary of the dataset:

resumenAllSF6401 <- summary(GI_GbsAvoAllSF6401)

##expected heterozygosity average:

resumenALLSF6401Hexp <- resumenAllSF6401$Hexp
mean(resumenALLSF6401Hexp) 

##observed heterozygosity average: 

resumenALLSF6401Hobs <- resumenAllSF6401$Hobs
mean(resumenALLSF6401Hobs)


##minor allele frequency:

m.freqSF6401 <- minorAllele(GI_GbsAvoAllSF6401)
mean(m.freqSF6401)
