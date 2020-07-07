rankall<-function(outcome,num="best"){
  
  data<-read.csv("outcome-of-care-measures.csv",na.strings = c("Not Available"))
  state_factor<-data[,7]
  j<-1
  for(state in levels(state_factor)){
    
  index<-which(state_factor==state)
  if (length(index)==0)
  {
    stop("invalid state")
  }
  
  s<-as.character(data[,7])
  state_ind<-which(s==state)
  data_state<-data[state_ind,]
  hospital<-data_state[,2]
  
  if (outcome=="heart attack")
  {
    rate<-data_state[,11]
  }
  else{
    if (outcome=="heart failure")
    {
      rate<-data_state[,17]
    }
    else{
      if (outcome=="pneumonia")
      {
        rate<-data_state[,23]
      }else{
        stop("invalid outcome")
      }
    }
  }
  
  ind<-which(is.na(rate)==FALSE)
  rate<-rate[ind]
  rate<-as.double(rate)
  hospital_mod<-hospital[ind]
  
  X1<-data_state$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[ind]
  X2<-data_state$Hospital.Name[ind]
  X3<-data_state$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[ind]
  X4<-data_state$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[ind]
  
  if (num=="best"){
    ind2<-which(rate==min(rate))
    hospital_mod<-hospital_mod[ind2]
    if (length(hospital_mod)>1){
      sorted<-order(hospital_mod)
      H<-hospital_mod[sorted[1]]
    }else{H<-hospital_mod}
  }else{
    if(num=="worst"){
      ind2<-which(rate==max(rate))
      hospital_mod<-hospital_mod[ind2]
      if (length(hospital_mod)>1){
        sorted<-order(hospital_mod)
        H<-hospital_mod[sorted[1]]
      }else{H<-hospital_mod}
    }else{
      if(outcome=="heart attack"){
        index<-order(X1,X2)
      }
      if(outcome=="heart failure"){
        index<-order(X3,X2)
      }
      if(outcome=="pneumonia"){
        index<-order(X4,X2)
      }
      H<-X2[index[num]]
    }
  }
  if (j==1)
  {
    df_old<-data.frame(H,state)
  }
  else{
    df_new<-data.frame(H,state)
    df_old<-rbind(df_old,df_new)
  }
  j=j+1
  }
 return(df_old)
}


