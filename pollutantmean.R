###setwd('/Users/mahsa/Desktop/Post_Doc_Research/Workshops and Tutorials/Coursera_Courses/specdata_R_HW1/')

pollutantmean<-function(directory,pollutant,id)
{
  sumVal<-0
  cnt<-0

  for (i in id)
  {
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

    if (pollutant=="sulfate")
    {
      X_p<-data$sulfate
      ind<-which(is.na(X_p)==FALSE)
      X<-X_p[ind]
      cnt<-length(ind)+cnt
      sumVal<-sumVal+sum(X)
    }
    else if (pollutant=="nitrate")
    {
      X_p<-data$nitrate
      ind<-which(is.na(X_p)==FALSE)
      X<-X_p[ind]
      cnt<-length(ind)+cnt
      sumVal<-sumVal+sum(X)
    }
  }
meanVal<-sumVal/cnt  
print(meanVal)
}
