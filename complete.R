complete<-function(directory,id)
{
  X<-matrix(rep(0,length(id)*2),length(id),2)
  j<-0
  for(i in id){
    
    ##reading the files
    new_id<-as.character(i)
    cnt_id<-nchar(new_id)
    if(cnt_id==1)
    {
      id_modified<-paste("00",i,sep="")
    }
    else if (cnt_id==2)
    {
      id_modified<-paste("0",i,sep="")
    }
    else if (cnt_id==3)
    {
      id_modified<-i
    }
    
    filename=paste(id_modified,"csv",sep=".")
    data<-read.csv(filename,header = TRUE)
    
    indx<-which(complete.cases(data)==TRUE)
    nobs<-length(indx)
    j<-j+1
    X[j,1]<-i
    X[j,2]<-nobs
  }
X_dat<-data.frame(X)  
#print(X_dat)  
}
