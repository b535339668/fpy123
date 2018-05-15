#读取数据并做均值运算
data <- read.table("magic04.txt",sep=",",header=F)
dm<-matrix(nrow=1,ncol = 10)
 for (i in 1:10) { dm[,i]=mean(data[,i]) }

#中心数据矩阵
 dt<-matrix(nrow = 19020,ncol = 10)
 for (i in 1:10) {dt[,i]=datem[,i]-1*dm[,i]}  
 t_dt<-matrix(nrow = 10,ncol = 19020)
 t_dt=t(dt)
 
 inner=t_dt%*%dt*(1/19020)
 Inner

dt<-matrix(nrow = 19020,ncol = 10)
 for (i in 1:10) {dt[,i]=datem[,i]-1*dm[,i]}  
 t_dt<-matrix(nrow = 10,ncol = 19020)
 t_dt=t(dt)
 
 inner=t_dt%*%dt*(1/19020)
#外积样本协方差矩阵
 tcrossprod(inner)

#相关性散点图
cosdata<-crossprod(dt[,1],dt[,2])/
   (sqrt(sum(dt[,1]^2))*sqrt(sum(dt[,2]^2)))
 ggplot(data[,1:2], aes(x = data[,2], y = data[,1]))+
   geom_point()+geom_smooth(method = lm)

#正态分布概率密度图
 hist(data[,1],freq=FALSE)
 lines(density(data[,1]),col="blue")

#variance计算与计较
 c=array()
 for (i in 1:10) { c[i]=var(data[,i]) }
 for (j in 1:10) { if(c[j]==max(c)) print(paste("属性",j,"方差最大为",max(c))) 
   if(c[j]==min(c)) print(paste("属性",j,"方差最小为",min(c)))}
