library(ggplot2)
a<-read.table("E:/TEST3/gsea_report_for_Myc1_1670514888757.tsv.txt",sep = "\t",header = TRUE)

a<-a[1:20,]
a$NAME <- factor(a$NAME,levels=rev(a$NAME))
ggplot(a,aes(x=NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point(color="Red")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
ggplot()+geom_bar(data =a, aes(x = NES, y = NAME,fill="Red"), 
                  stat = "identity") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) 
remove(a)
