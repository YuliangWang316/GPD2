library(dplyr)
library(patchwork)
library(Seurat)
library(ggplot2)
library(ggpubr)

pbmc.data<-read.table("E:/TEST3/protein_G3_G1.txt",sep = "\t",header = TRUE,row.names = 1)
pbmc.data<-pbmc.data[,1:20]
pbmc.metadata<-as.data.frame(colnames(pbmc.data))
pbmc.metadata$Group<-c(rep("G1",10),rep("G3",10))
colnames(pbmc.metadata)<-c("barcode","Group")
rownames(pbmc.metadata)<-pbmc.metadata$barcode
pbmc.data<-na.omit(pbmc.data)
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k",meta.data = pbmc.metadata)
pbmc <- NormalizeData(pbmc)
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)
Idents(pbmc)<-pbmc@meta.data$Group
pbmc.markers <- FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0, logfc.threshold = 0)
pbmc.markers %>%
  group_by(cluster) %>%
  top_n(n = 244, wt = avg_log2FC) -> top10
DoHeatmap(pbmc, features = c(top10$gene),group.colors = c("Red","Blue"),angle = 30) +NoLegend()+scale_fill_gradientn(colors = c("blue", "white", "red"),na.value = "white")
