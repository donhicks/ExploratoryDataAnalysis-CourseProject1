plot1 <-function(){
  ##check working directory
  file<-"household_power_consumption.txt"
  wf<-paste0(getwd(),"/",file)
    
  ##read the outcome data
  d = read.table(wf,header=TRUE, 
                 sep=";", na.strings=c("?"),
                 col.names=c("Date", "Time","Global_active_power","Global_reactive_power",
                             "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                 fill=FALSE,blank.lines.skip = TRUE,
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                 strip.white=TRUE)
  d$Date<- as.Date(d$Date,"%d/%m/%Y")
  d$Time<-  strptime(d$Time, "%H:%M:%S")
  d$Time<-sub(".* ","",d$Time)
  ##d$Time<-  strptime(d$Time, "%m/%d/%y %H:%M:%S")
  d<-d[d$Date >= "2007-02-01" & d$Date<= "2007-02-02",]
  
  png(file='plot1.png')
  hist(d$Global_active_power,col='red',xlab='Global Active Power(kilowatts)',main = 'Global Active Power')
  dev.off()
  return()
}


