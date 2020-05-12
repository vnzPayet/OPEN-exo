#Graphique ligne 171


      
res <- PCA(datatemp, quanti.sup=13:16, quali.sup=17,graph=F)
par(mfrow=c(1,1),mar=c(4,4,2,2))
barplot(res$eig[,2],ylab="Inertie %",names.arg = paste("Axe",1: nrow(res$eig)),las=2,cex.axis=0.3,cex.lab=1, main = "Graphique indiquant l'inertie des individus")

legend(x="topleft",legend=c("Individus"),fill=c("grey"))



