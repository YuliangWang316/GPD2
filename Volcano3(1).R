setwd("E:/TEST3/")
diff_gene <- read.table("protein_G3_G1.txt", sep="\t", header=TRUE, row.names=1)
diff_gene=as.data.frame(diff_gene)
gene_list=diff_gene[,c("G3_vs_G1ratio","p.value")]
gene_list$G3_vs_G1ratio<-log10(gene_list$G3_vs_G1ratio)
colnames(gene_list)=c("logFC","padj")
gene_list$threshold = as.factor(abs(gene_list$logFC) > 0.1 & gene_list$padj < 0.05)
colored_point<-gene_list[gene_list$threshold == "TRUE",]
Spgenes<-colored_point[rownames(colored_point) == "GPD2" ,]
gene_list$threshold<-as.character(gene_list$threshold)
gene_list$threshold[which(rownames(gene_list) == "GPD2" )]<-"GPD2"
gene_list$threshold[which(gene_list$logFC >0.1 & gene_list$threshold ==TRUE)] <- "UP"
colnames(gene_list)[3]<-"Significant"
gene_list$Significant[which(gene_list$Significant == "TRUE")]<-"Down"
gene_list$Significant[which(gene_list$Significant == "FALSE")]<-"Not Sig"
Mycolors<-c("Blue","Black","Gray","Red")
library("ggplot2")
pdf("vocano.pdf")

g = ggplot(data=gene_list, aes(x=logFC, y=-log10(padj),color=Significant)) + geom_point(alpha=0.8, size=1.75)  + xlim(c(-1, 1)) + ylim(c(0, 7.5)) +xlab("log2 fold change") + ylab("-log10 p-value") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) + scale_color_manual(values = Mycolors)
print(g)
dev.off()
