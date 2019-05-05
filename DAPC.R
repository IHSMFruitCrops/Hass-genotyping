
##Discriminant analysis of principal components (DAPC)## 


if(!require(adegenet)) install.packages("adegenet") # installation of adegenet package.  
library("adegenet") # load adegenet package.

if(!require(ggplot2)) install.packages("ggplot2") # installation of adegenet package.  
library("ggplot2") # load adegenet ggplot.

# Find.Cluster: Cluster Identification Using Successive K-Means

find.clust.GL_GbsAvoAllSF6401 <- find.clusters(GL_GbsAvoAllSF6401, max.n.clust=40) # max.n.clust: an integer indicating the maximum number of clusters to be tried.

# choose the number PCs to retain (>=1):
65
# choose the number of clusters (>=2):
3

names(find.clust.GL_GbsAvoAllSF6401) 
head(find.clust.GL_GbsAvoAllSF6401$grp) 
popu3AVOALLSF6401 <- find.clust.GL_GbsAvoAllSF6401$grp # group memberships.
find.clust.GL_GbsAvoAllSF6401$size # group sizes.

## Add population DAPC 3.

AVOSF6401_extdata = read.table("popu3dapc01.txt", header = FALSE) # txt: IDsample and groups.

AVOPOPDATAsf6401 = AVOSF6401_extdata[match(colnames(GbsAvoAllSF6401@gt)[-1],AVOSF6401_extdata$V1),]; # match: function returns a vector of the position of first occurrence of the vector1 in vector2.

names(AVOPOPDATAsf6401) = c("AccesionsID","POPULATIONS3") # Add "AccesionsID" and "POPULATIONS3 as names of AVOPOPDATAsf6401_vectors.

pop(GL_GbsAvoAllSF6401) = AVOPOPDATAsf6401$POPULATIONS3

DAPC_AVOSF6401<- dapc(GL_GbsAvoAllSF6401,find.clust.GL_GbsAvoAllSF6401$grp,n.pca = 5,n.da = 2) # n.pca: PCs to retain. Checked with cross-validation.n.da: number discriminant functions to retain.

dapc.resultsk3 <- as.data.frame(DAPC_AVOSF6401$posterior) # data frame of membership probabilities based on the retained discriminant functions.
dapc.resultsk3$pop <- pop(GL_GbsAvoAllSF6401) # groups.
dapc.resultsk3$indNames <- rownames(dapc.resultsk3) # samples ID.

if(!require(reshape2)) install.packages("reshape2") # installation of reshape2
library(reshape2) # load reshape2 package.

dapc.resultsk3 <- melt(dapc.resultsk3) # melt: reorganizes the data frame into the required data frame format.
mdatak3 <- melt(dapc.resultsk3, id=c("pop","indNames","variable","value"))
colnames(mdatak3) <- c("Original_Pop","Sample","Assigned_Pop","Posterior_membership_probability")

## Compoplot

pruebaCk3 <- ggplot(mdatak3, aes(x=Sample, y=Posterior_membership_probability, fill=Assigned_Pop))
pruebaCk3 <- pruebaCk3 + geom_bar(stat='identity') #geom_bar: makes the height of the bar proportional to the number of cases in each group.
pruebaCk3 <- pruebaCk3 + scale_fill_manual(values = c("#FFB90F","#68228B","#FF7F50")) 
pruebaCk3 <- pruebaCk3 + facet_grid(~Original_Pop, scales = "free") #face_grid: forms a matrix of panels defined by row and column faceting variables.
pruebaCk3 <- pruebaCk3 + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))
pruebaCk3



-----------------
##population 4##
-----------------  


find.clust.GL_GbsAvoAllSF6401pop4 <- find.clusters(GL_GbsAvoAllSF6401, max.n.clust=40,n.pca = 65, n.clust = 4) # max.n.clust: an integer indicating the maximum number of clusters to be tried.

names(find.clust.GL_GbsAvoAllSF6401pop4)
head(find.clust.GL_GbsAvoAllSF6401pop4$grp)
popu4AVOALLSF6401 <- find.clust.GL_GbsAvoAllSF6401pop4$grp # group memberships.
find.clust.GL_GbsAvoAllSF6401pop4$size # group sizes.

##add population DAPC 4.

AVOSF6401_extdata = read.table("popu4dapc01.txt", header = FALSE) # txt: IDsamples and groups.

AVOPOPDATAsf6401K4 = AVOSF6401_extdata[match(colnames(GbsAvoAllSF6401@gt)[-1],AVOSF6401_extdata$V1),]; # match: function returns a vector of the position of first occurrence of the vector1 in vector2.

names(AVOPOPDATAsf6401K4) = c("AccesionsID","POPULATIONS4") # Add "AccesionsID" and "POPULATIONS4 as names of AVOPOPDATAsf6401_vectors.

pop(GL_GbsAvoAllSF6401) = AVOPOPDATAsf6401K4$POPULATIONS4

DAPC_AVOSF6401pop4<- dapc(GL_GbsAvoAllSF6401,find.clust.GL_GbsAvoAllSF6401pop4$grp, n.pca = 5,n.da = 2) # n.pca: PCs to retain. Checked with cross-validation.n.da: number discriminant functions to retain.

dapc.resultsk4 <- as.data.frame(DAPC_AVOSF6401pop4$posterior) # data frame of membership probabilities based on the retained discriminant functions.
dapc.resultsk4$pop <- pop(GL_GbsAvoAllSF6401) # groups.
dapc.resultsk4$indNames <- rownames(dapc.resultsk4) # samples ID.

dapc.resultsk4 <- melt(dapc.resultsk4) # melt: reorganizes the data frame into the required data frame format.
mdatak4 <- melt(dapc.resultsk4, id=c("pop","indNames","variable","value"))

colnames(mdatak4) <- c("Original_Pop","Sample","Assigned_Pop","Posterior_membership_probability")

## Compoplot

pruebaCk4 <- ggplot(mdatak4, aes(x=Sample, y=Posterior_membership_probability, fill=Assigned_Pop))
pruebaCk4 <- pruebaCk4 + geom_bar(stat='identity') #geom_bar: makes the height of the bar proportional to the number of cases in each group.
pruebaCk4 <- pruebaCk4 + scale_fill_manual(values = c("#FF7F50","#FFB90F","#2587C8","#FF7F50","#68228B"))
pruebaCk4 <- pruebaCk4 + facet_grid(~Original_Pop, scales = "free") #face_grid: forms a matrix of panels defined by row and column faceting variables.
pruebaCk4 <- pruebaCk4 + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))
pruebaCk4


--------------------
### population 5 ###
--------------------

find.clust.GL_GbsAvoAllSF6401pop5 <- find.clusters(GL_GbsAvoAllSF6401, max.n.clust=40,n.pca = 65, n.clust = 5) # max.n.clust: an integer indicating the maximum number of clusters to be tried.

names(find.clust.GL_GbsAvoAllSF6401pop5)
head(find.clust.GL_GbsAvoAllSF6401pop5$grp)
popu5AVOALLSF6401 <- find.clust.GL_GbsAvoAllSF6401pop5$grp
find.clust.GL_GbsAvoAllSF6401pop5$size

## Add population DAPC 5

AVOSF6401_extdatak5 = read.table("popu5dapc01.txt", header = FALSE) # txt: IDsample and group memberships.

AVOPOPDATAsf6401k5 = AVOSF6401_extdatak5[match(colnames(GbsAvoAllSF6401@gt)[-1],AVOSF6401_extdatak5$V1),]; # match: function returns a vector of the position of first occurrence of the vector1 in vector2.

names(AVOPOPDATAsf6401k5) = c("AccesionsID","POPULATIONS5") # Add "AccesionsID" and "POPULATIONS5 as names of AVOPOPDATAsf6401k5_vectors.

pop(GL_GbsAvoAllSF6401) = AVOPOPDATAsf6401k5$POPULATIONS5


DAPC_AVOSF6401pop5<- dapc(GL_GbsAvoAllSF6401,find.clust.GL_GbsAvoAllSF6401pop5$grp, n.pca = 5, n.da = 2)# n.pca: PCs to retain. Checked with cross-validation.n.da: number discriminant functions to retain.

dapc.resultsk5 <- as.data.frame(DAPC_AVOSF6401pop5$posterior) # data frame of membership.
dapc.resultsk5$pop <- pop(GL_GbsAvoAllSF6401) # groups.
dapc.resultsk5$indNames <- rownames(dapc.resultsk5) # samples ID.


dapc.resultsk5 <- melt(dapc.resultsk5) # melt: reorganizes the data frame into the required data frame format.


mdatak5 <- melt(dapc.resultsk5, id=c("pop","indNames","variable","value")) # melt: reorganizes the data frame into the required data frame format.

colnames(mdatak5) <- c("Original_Pop","Sample","Assigned_Pop","Posterior_membership_probability")


## Compoplot

pruebaCk5 <- ggplot(mdatak5, aes(x=Sample, y=Posterior_membership_probability, fill=Assigned_Pop))
pruebaCk5 <- pruebaCk5 + geom_bar(stat='identity') #geom_bar: makes the height of the bar proportional to the number of cases in each group.
pruebaCk5 <- pruebaCk5 + scale_fill_manual(values = c("#2587C8","#458B74","#FF7F50","#FFB90F","#68228B"))
pruebaCk5 <- pruebaCk5 + facet_grid(~Original_Pop, scales = "free") #face_grid: forms a matrix of panels defined by row and column faceting variables.
pruebaCk5 <- pruebaCk5 + theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 11))
pruebaCk5

