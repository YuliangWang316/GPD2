library(ggplot2)
a<-read.table("C:/Users/xjmik/Downloads/GO_BP.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.01),]
a<-a[1:10,]
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point()+scale_color_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/GO_CC.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
a<-a[1:10,]
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point()+scale_color_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/GO_MF.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
ggplot(a,aes(x=-NES,y=NAME,size=SIZE,color=FDR.q.val))+geom_point()+scale_color_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/KEGG.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill= FDR.q.val), 
                                                      stat = "identity") +scale_fill_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) 
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/Reactome.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
a<-a[1:7,]
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill= FDR.q.val), 
                  stat = "identity") +scale_fill_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)

a<-read.table("C:/Users/xjmik/Downloads/Wiki.txt",sep = "\t",header = TRUE)
a<-a[which(a$FDR.q.val <0.05),]
ggplot()+geom_bar(data =a, aes(x = -NES, y = NAME,fill= FDR.q.val), 
                  stat = "identity") +scale_fill_gradient(low = "Red",high = "Yellow")+ theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA))
remove(a)