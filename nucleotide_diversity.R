##Nucleotide diversity##

if(!require(PopGenome)) install.packages("PopGenome") # installation of PopGenome package
library("PopGenome")# load PopGenome package.

#First, we create a new folder where we will keep out vcf file. The name of our folder is 00_popgenomeallavo.

Genome.AVOallSF6401 <- readData("00_popgenomeaallavo", format="VCF")



# According our results in DAPC analysis, the populations were stablished.



# K=3

Genome.classK301 <- set.populations(Genome.AVOallSF6401,list(c("COLL31","HASS38","REGA11","MALU85","RINT12","RYAN13","EDRA63","GWEN40","REED89","FUER16", "MRTO08","SHEP42","114218","NN1068","TX5344","BL6620","PINK45","NABA21","CILF46","LAHA24","NIML09","LYON25","ALCA74","GRAC26","LIND50","MUGR27","NN6310","871728","822552","GEM77","JEWE29","MIKE30","555254","H28757","HASS55","IRIE34","002835"),c("COLL1","TRAP2","YON3","WEST5","POLL6","CHOQ9","MONR10","CATA11","MELE12","SEMI14","BUTL16","FUCH17","BERN18","BETA19","RUSS22","LISA23","LARG24","WALDIN28","COLL36","RR8691","G692","RURO36"),c("VERO04","DUSA33","BACO39","TELE66","THOM90","LAPI93","CABU95","TOCA96","GOTT04","NECR31","HANS05","TEAG60")))

get.sum.data(Genome.classK301) # calculate some summary data.

Genome.classK301@populations #groups 


Genome.classK301 <- F_ST.stats(Genome.classK301,detail = TRUE)
# diversities
Genome.classK301_2 <- neutrality.stats(Genome.classK301, FAST = TRUE)
Genome.classK301_2@populations # groups.
Genome.classK301_2@Pi # Nei's diversity.
Genome.classK301_2@theta_Watterson # Theta watterson.
Genome.classK301_2@theta_Watterson[1]
Genome.classK301_2@theta_Watterson[2]
Genome.classK301_2@theta_Watterson[3]
Genome.classK301_2@nuc.F_ST.pairwise # Fixation index.

# K=4

Genome.classK401 <-set.populations(Genome.AVOallSF6401,list(c("YON3","CHOQ9","MONR10","MELE12","SEMI14","FUCH17","LISA23","LARG24","COLL36","114218","RR8691","G692","RURO36","ALCA74"),c("COLL31","HASS38","REGA11","MALU85","RINT12","RYAN13","EDRA63","GWEN40","REED89","FUER16","MRTO08","SHEP42","NN1068","TX5344","BL6620","PINK45","NABA21","CILF46","LAHA24","NIML09","LYON25","GRAC26","LIND50","MUGR27","NN6310","871728","822552","GEM77","JEWE29","MIKE30","555254","H28757","HASS55","IRIE34","002835"),c("COLL1","TRAP2","WEST5","POLL6","CATA11","BUTL16","BERN18","BETA19","RUSS22","WALDIN28"),c("VERO04","DUSA33","BACO39","TELE66","THOM90","LAPI93","CABU95","TOCA96","GOTT04","NECR31","HANS05","TEAG60")))

get.sum.data(Genome.classK401) # calculate some summary data.

Genome.classK401@populations #groups


Genome.classK401 <- F_ST.stats(Genome.classK401,detail = TRUE) # Print diversities
Genome.classK401_2 <- neutrality.stats(Genome.classK401, FAST = TRUE)
Genome.classK401_2@populations # groups.
Genome.classK401_2@Pi # Nei's diversity.
Genome.classK401_2@theta_Watterson # Theta watterson.
Genome.classK401_2@theta_Watterson[1]
Genome.classK401_2@theta_Watterson[2]
Genome.classK401_2@theta_Watterson[3]
Genome.classK401_2@nuc.F_ST.pairwise # Fixation index.

# K=5

Genome.classK501 <- set.populations(Genome.AVOallSF6401,list(c("YON3","CHOQ9","MONR10","MELE12","SEMI14","FUCH17","LISA23","LARG24","COLL36","RR8691","G692","RURO36"),c("COLL1","TRAP2","WEST5","POLL6","CATA11","BUTL16","BERN18","BETA19","RUSS22","WALDIN28"),c("MALU85","REED89","MRTO08","114218","NN1068","NABA21","NIML09","ALCA74","LIND50","MUGR27","NN6310","822552","MIKE30"),c("COLL31","HASS38","REGA11","RINT12","RYAN13","EDRA63","GWEN40","FUER16","SHEP42","TX5344","BL6620", "PINK45", "CILF46", "LAHA24","LYON25","GRAC26","871728","GEM77","JEWE29","555254","H28757","HASS55","IRIE34","002835"),c("VERO04","DUSA33","BACO39","TELE66","THOM90","LAPI93","CABU95","TOCA96","GOTT04","NECR31","HANS05","TEAG60")))

get.sum.data(Genome.classK501) # calculate some summary data.

Genome.classK501 <- F_ST.stats(Genome.classK501,detail = TRUE) # Print diversities
Genome.classK501_2 <- neutrality.stats(Genome.classK501, FAST = TRUE)
Genome.classK501_2@populations # groups
Genome.classK501_2@Pi # Nei's diversity.
Genome.classK501_2@theta_Watterson # Theta watterson.
Genome.classK501_2@nuc.F_ST.pairwise  # Fixation index.


