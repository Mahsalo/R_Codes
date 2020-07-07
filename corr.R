corr<-function(directory,threshold=0)
{
  complete_list<-complete(directory,1:332)
  ind<-which(complete_list$X2>=threshold)
  
  temp = list.files(pattern="*.csv")
  correlation<-matrix(rep(0,length(ind)))
  j=1
  for (i in 1:length(temp))
  {
    filename<-temp[i]
    id_char<-substring(filename,1,3)
    id<-as.numeric(id_char)
    X<-read.csv(temp[i])
    ind_complete<-which(complete.cases(X)==TRUE)
   
    if (length(ind_complete)>=threshold)
    {
      X_complete<-X[ind_complete,]
      firstVec<-X_complete$sulfate
      SecondVec<-X_complete$nitrate
      correlation[j]<-cor(firstVec,SecondVec)
      j=j+1
    }

    }
  print(correlation)
}