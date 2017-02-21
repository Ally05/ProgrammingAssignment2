##Download the file
specdata<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(specdata, "rprog%2Fdata%2Fspecdata.zip")
unzip("rprog%2Fdata%2Fspecdata.zip", exdir="specdata")

##create one repository for all files
files_full<-list.files("specdata", full.names=TRUE)
files_full


##Combine files into one giant file
dat<-data.frame()
for (i in 1:332) {
  dat<- rbind(dat, read.csv(files_full[i]))
}
str(dat)

##Create pollutantmean variable

pollutantmean<-function(directory, pollutant, id=1:332) {
  files_full<-list.files("specdata", full.names=TRUE)
  ##Combine files into one giant file
  dat<-data.frame()
  for (i in 1:332) {
    dat<- rbind(dat, read.csv(files_full[i]))
  }
  dat_subset<-dat[which(dat[, "ID"] %in% id), ]
  mean(dat_subset[[pollutant]], na.rm=TRUE)
}


