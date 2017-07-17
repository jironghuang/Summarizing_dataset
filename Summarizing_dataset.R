#Write a function to transform 
#data(package = .packages(all.available = TRUE))
#library(car)
#data(AMSsurvey)

descr_stats = function(data_name){
  dat = get(data_name)

  stats = as.data.frame(matrix(c(rep(0,7)),nrow = 7,ncol = 1))
  
  for(i in 1:(ncol(dat))){
    
    print(i)
    
    if((is.numeric(dat[,i])) & (i == 1)){
      stats[1,i] = sd(dat[,i],na.rm = TRUE)
      stats[2,i] = max(dat[,i],na.rm = TRUE)
      stats[3,i] = min(dat[,i],na.rm = TRUE)
      stats[4,i] = mean(dat[,i],na.rm = TRUE)
      stats[5,i] = quantile(dat[,i], probs = 0.25,na.rm = TRUE)
      stats[6,i] = quantile(dat[,i], probs = 0.75,na.rm = TRUE)
      stats[7,i] = sum(is.na(dat[,i]))
      
      #Create a row or column of ind 
      #stats = c(sd,max,min,mean,perc25,perc75,numNAs)
      #stats = as.data.frame(stats)
      names(stats)[1] = names(dat)[i]
      
      #Rbind or Cbind
    }else if ((is.numeric(dat[,i])) & (i!=1)){
      sd_ind = sd(dat[,i],na.rm = TRUE)
      max_ind = max(dat[,i],na.rm = TRUE)
      min_ind = min(dat[,i],na.rm = TRUE)
      mean_ind = mean(dat[,i],na.rm = TRUE)
      perc25_ind = quantile(dat[,i], probs = 0.25,na.rm = TRUE)
      perc75_ind = quantile(dat[,i], probs = 0.75,na.rm = TRUE)
      numNAs_ind = sum(is.na(dat[,i]))
      
      #Create a row or column of ind 
      stats_ind = c(sd_ind,max_ind,min_ind,mean_ind,perc25_ind,perc75_ind,numNAs_ind)
      stats_ind = as.data.frame(stats_ind)
      names(stats_ind)[1] = names(dat)[i]
      stats = cbind(stats,stats_ind)
    }
  }
  
#remove first row if sum == 0
  if(sum(stats[,1]) == 0){
    stats = stats[,-1]
  }
  
descr = c("sd","max","min","mean","perc25","perc75","numNAs")  
stats = cbind(descr,stats)  

  return(stats)
}#End of function 

# a = descr_stats("AMSsurvey")



