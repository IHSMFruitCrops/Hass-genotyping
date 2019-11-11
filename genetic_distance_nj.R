##dendrogram_genetic distance##

if(!require(poppr)) install.packages("poppr") # installation of poppr package.
library("poppr") # load poppr package.
if(!require(ape)) install.packages("ape") # installation of ape package.
library("ape") # load ape package.

njGBSallSF6401.bitwise_2R <- aboot(GL_GbsAvoAllSF6401, tree = "nj", distance = bitwise.dist, sample = 2000, showtree = TRUE, quiet = T, root = FALSE)

njGBSallSF6401.bitwise_2R_70 <- aboot(GL_GbsAvoAllSF6401, tree = "nj", distance = bitwise.dist, sample = 2000, showtree = TRUE, cutoff = 70, quiet = T, root = FALSE)

# aboot function - Bootstrapped dendrograms. 
# nj - neighbor-joining tree.
# distance = bitwise.dist, distances available for SNP markers. 
# cutoff = setting the cutoff value to return the bootstrap values on the nodes.


##To plot Figtree software (version 1.3.1, http://tree.bio.ed.ac.uk (2009)) was used, but nexus format was needed. 

write.nexus(njGBSallSF6401.bitwise_2R, file="ProvestiNexus2R")
write.nexus(njGBSallSF6401.bitwise_2R_70, file = "ProvestiNexus2R_70")
