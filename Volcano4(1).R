setwd("E:/TEST3/")
diff_gene <- read.table("G2_vs_G3_pos.txt", sep="\t", header=TRUE)
diff_gene=as.data.frame(diff_gene)
gene_list=diff_gene[,c("Fold.change","p.value")]
gene_list$Fold.change<-log2(gene_list$Fold.change)
colnames(gene_list)=c("logFC","padj")
gene_list$threshold = as.factor(abs(gene_list$logFC) > 0.451 & gene_list$padj < 0.05)
colored_point<-gene_list[gene_list$threshold == "TRUE",]
gene_list$threshold<-as.character(gene_list$threshold)
gene_list$threshold[which(gene_list$logFC >0.451 & gene_list$threshold ==TRUE)] <- "UP"
colnames(gene_list)[3]<-"Significant"
gene_list$Significant[which(gene_list$Significant == "TRUE")]<-"Down"
gene_list$Significant[which(gene_list$Significant == "FALSE")]<-"Not Sig"
Mycolors<-c("Blue","Gray","Red")

library("ggplot2")
pdf("vocano_pos.pdf")

g = ggplot(data=gene_list, aes(x=logFC, y=-log10(padj),color=Significant)) + geom_point(alpha=0.8, size=1.75)  + xlim(c(-6, 6)) + ylim(c(0, 4)) +xlab("log2 fold change") + ylab("-log10 p-value") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) + scale_color_manual(values = Mycolors)
print(g)
dev.off()

setwd("E:/TEST3/")
diff_gene <- read.table("G2_vs_G3_neg.txt", sep="\t", header=TRUE)
diff_gene=as.data.frame(diff_gene)
gene_list=diff_gene[,c("Fold.change","p.value")]
gene_list$Fold.change<-log2(gene_list$Fold.change)
colnames(gene_list)=c("logFC","padj")
gene_list$threshold = as.factor(abs(gene_list$logFC) > 0.451 & gene_list$padj < 0.05)
colored_point<-gene_list[gene_list$threshold == "TRUE",]
gene_list$threshold<-as.character(gene_list$threshold)
gene_list$threshold[which(gene_list$logFC >0.451 & gene_list$threshold ==TRUE)] <- "UP"
colnames(gene_list)[3]<-"Significant"
gene_list$Significant[which(gene_list$Significant == "TRUE")]<-"Down"
gene_list$Significant[which(gene_list$Significant == "FALSE")]<-"Not Sig"
Mycolors<-c("Blue","Gray","Red")
library("ggplot2")
pdf("vocano_neg.pdf")

g = ggplot(data=gene_list, aes(x=logFC, y=-log10(padj),color=Significant)) + geom_point(alpha=0.8, size=1.75)  + xlim(c(-8, 8)) + ylim(c(0, 6)) +xlab("log2 fold change") + ylab("-log10 p-value") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) + scale_color_manual(values = Mycolors)
print(g)
dev.off()
