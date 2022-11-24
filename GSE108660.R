library(GEOquery)
gds <- getGEO("GSE108660")
exp<-cbind(gds$GSE108660_series_matrix.txt.gz@assayData$exprs,as.data.frame(gds$GSE108660_series_matrix.txt.gz@featureData@data$GeneSymbol))
exp<-na.omit(exp)
colname_exp<-c(gds$GSE108660_series_matrix.txt.gz@phenoData@data$title,"Symbol")
colnames(exp)<-colname_exp
write.table(exp,"GSE108660.txt",sep = "\t")

