best<-function(state,outcome){

  
  data<-read.csv("outcome-of-care-measures.csv",na.strings = c("Not Available"))
  state_factor<-data[,7]
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
    ind2<-which(rate==min(rate))
    hospital_mod<-hospital_mod[ind2]
    if (length(hospital_mod)>1){
      sorted<-order(hospital_mod)
      H<-hospital_mod[sorted[1]]
    }else{H<-hospital_mod}
  
  print(H)
  
}