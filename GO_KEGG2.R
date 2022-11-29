library(ggplot2)
a<-read.table("C:/Users/xjmik/Downloads/GO_BP.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.01),]
a<-a[1:10,]
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point(color="Red")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/GO_CC.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
a<-a[1:10,]
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point(color="Red")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/GO_MF.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
a$NAME[7]<-"GO_MF_OXIDOREDUCTASE_ACTIVITY_SIMILAR_COMPOUND"
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point(color="Red")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/KEGG.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill="Red"), 
                                                      stat = "identity") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) 
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/Reactome.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
a<-a[1:7,]
a$NAME[6]<-"REACTOME_RESPIRATORY_ELECTRON_TRANSPORT"
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill= "Red"), 
                  stat = "identity") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/Wiki.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill= "Red"), 
                  stat = "identity") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)
