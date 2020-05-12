link <- "http://factominer.free.fr/course/donnees/AnaDo_JeuDonnees_TemperatFrance.csv"
datatemp <- read.table(link, h=TRUE, sep=";", dec=".", row.names=1, encoding="latin1")
dd <- as_tibble(datatemp)
head(datatemp)
temp<-unlist(datatemp[,1:12])
villes<-factor(rep(row.names(datatemp),12))
med<-tapply(temp,villes,mean)
villes2<-factor(villes,levels(villes)[order(med)])
boxplot(temp~villes2,las=2,col="red",ylab="Températures mensuelles",cex.lab=1,cex.axis=0.7, xlab = "Villes") 

