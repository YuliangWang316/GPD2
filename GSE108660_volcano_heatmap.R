setwd("E:/TEST3/")
diff_gene <- read.table("GSE108660.top.table.tsv", sep="\t", header=TRUE, row.names=1)
diff_gene=as.data.frame(diff_gene)
gene_list=diff_gene[,c("P.Value","logFC")]
# gene_list$G3_vs_G1ratio<-log10(gene_list$G3_vs_G1ratio)
colnames(gene_list)=c("padj","logFC")
gene_list$threshold = as.factor(abs(gene_list$logFC) > 0.1 & gene_list$padj < 0.05)
colored_point<-gene_list[gene_list$threshold == "TRUE",]
Spgenes<-colored_point[rownames(colored_point) == "A_33_P3354569" ,]
gene_list$threshold<-as.character(gene_list$threshold)
gene_list$threshold[which(rownames(gene_list)=="A_33_P3354569" )]<-"GPD2"
gene_list$threshold[which(gene_list$logFC >0.1 & gene_list$threshold ==TRUE)] <- "UP"
colnames(gene_list)[3]<-"Significant"
gene_list$Significant[which(gene_list$Significant == "TRUE")]<-"Down"
gene_list$Significant[which(gene_list$Significant == "FALSE")]<-"Not Sig"
Mycolors<-c("Yellow","Black","Gray","Red")
library("ggplot2")
pdf("vocano.pdf")

g = ggplot(data=gene_list, aes(x=logFC, y=-log10(padj),color=Significant)) + geom_point(alpha=0.8, size=1.75)  + xlim(c(-5, 5)) + ylim(c(0, 7)) +xlab("log2 fold change") + ylab("-log10 p-value") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) + scale_color_manual(values = Mycolors)
print(g)
dev.off()

library(dplyr)
library(patchwork)
library(Seurat)
library(ggplot2)
library(ggpubr)

pbmc.data<-read.table("E:/TEST3/GSE108660.txt",sep = "\t",header = TRUE,row.names = 1)
pbmc.data<-pbmc.data[,1:10]
pbmc.metadata<-as.data.frame(colnames(pbmc.data))
pbmc.metadata$Group<-c(rep("AF",5),rep("SR",5))
colnames(pbmc.metadata)<-c("barcode","Group")
rownames(pbmc.metadata)<-pbmc.metadata$barcode
pbmc.data<-na.omit(pbmc.data)
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k",meta.data = pbmc.metadata)
pbmc <- NormalizeData(pbmc)
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)
Idents(pbmc)<-pbmc@meta.data$Group
genes<-rownames(gene_list[which(gene_list$padj<0.0001 |abs(gene_list$logFC) > 3),])
DoHeatmap(pbmc, features = ,group.colors = c("Red","Yellow"),angle = 30) +NoLegend()+scale_fill_gradientn(colors = c("Yellow", "white", "red"),na.value = "white")
