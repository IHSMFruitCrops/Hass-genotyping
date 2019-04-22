--------------------------------
##Principal component analyses##


if(!require(adegenet)) install.packages("adegenet") # installation of adegenet package.
library(adegenet) # load adegenet package.


PCA_GL_GbsAvoAllSF6401 <- glPca(GL_GbsAvoAllSF6401) # glPca function- Principal Component Analysis for genlight objects.
## select the number of axes (eigenvalues).
2

## Plot eigenvalues. 
barplot(PCA_GL_GbsAvoAllSF6401$eig, main="eigenvalues", col=heat.colors(length(PCA_GL_GbsAvoAllSF6401$eig)))
## basic plot.
scatter(PCA_GL_GbsAvoAllSF6401, ratio=.1)


## Percentage of variance explained.

eigSSF6401 <- (PCA_GL_GbsAvoAllSF6401$eig)

sum(eigSSF6401) # the sum of all the eigenvalues.

pc1_eigSSF6401 <- eigSSF6401[1]/sum(eigSSF6401) *100 # percentage of variance (PC1).

pc2_eigSSF6401 <-eigSSF6401[2]/sum(eigSSF6401) * 100 # percentage of variance (PC2). 


PCA_GL_GbsAvoAllSF6401.score <- as.data.frame(PCA_GL_GbsAvoAllSF6401$scores) # PCA scores_data frame.

## Add reported horticultural races. 

racesnumbervarieties01_sugIH <- read.table("varietiesGBSAVOSF6401_version12.txt") # txt with IDsample,number, and reported race.
racesvarietiesGBSallsugIH <- as.data.frame(racesnumbervarieties01_sugIH) 

PCA_ScoreVarietyRacessugIH <- cbind(PCA_GL_GbsAvoAllSF6401.score,racesvarietiesGBSallsugIH) # cbind(Take the data frame arguments and combine by columns).
colnames(PCA_ScoreVarietyRacessugIH) <- c("PC1","PC2","Accessions","Number","Races") # change column names to the data frame. 
PCA_ScoreVarietyRacessugIH$Races <- as.factor(PCA_ScoreVarietyRacessugIH$Races)

if(!require(ggplot2)) install.packages("ggplot2") # installation of ggplot2 package.
library(ggplot2) # load ggplot2 package. 

## Plot PCA figure.

i <- ggplot(PCA_ScoreVarietyRacessugIH, aes(PC1 , PC2 , color = Races)) # aes- PCA scores to map to the accessions.
i <- i + geom_point(aes(PC1, PC2, color = Races), size=3) # geom_point - is used to create scatterplots. size= dots size.
i <- i + geom_text(check_overlap = TRUE,aes(label=Accessions,hjust=0,vjust=0),size=4) # geom_text -  adds text directly to the plot. check_overlap- if TRUE, text that overlaps previous text in the same layer will not be plotted.
i <- i + labs(x = paste("PC1",round(pc1_eigSSF6401*100,digits = 1),"%"), y= paste("PC2",round(pc2_eigSSF6401*100,digits = 1),"%")) # labs - The title of the respective axis (for xlab() or ylab())
i <- i + scale_color_manual(values=c("#458B74","#FFB90F","#556B2F","#FF7F50","#2587C8","#A52A2A","#68228B")) # add race colors.
i <- i + theme_bw() # theme_bw - The classic dark-on-light ggplot2 theme.
i


