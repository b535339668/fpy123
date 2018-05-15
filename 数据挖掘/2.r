library(lattice)
iris<-read.table("iris.txt",sep = ",")
names(iris)=c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
xyplot(iris[,3] ~ iris[,4], data = iris, groups = iris[,5],
       auto.key=list(corner=c(1,0)))
#中心化
mean_i<-matrix(ncol=4)
for(i in 1:4){mean_i[,i]=mean(iris[,i])}
mean_iris<-matrix(nrow = 150,ncol=4)
for(i in 1:4){mean_iris[,i]=iris[,i]-mean_i[,i]}
#归一化
autonorm<-function(data){
  min<-min(data)
  max<-max(data)
  for(i in 1:length(data))
    data[i]<-(data[i]-min)/(max-min)
  return(data)
}
dataRK<-apply(mean_iris[,1:4],2,autonorm)
data_k<-dataRK^2
#核矩阵
data_kernel=data_k%*%t(data_k)
plot(data_kernel)
