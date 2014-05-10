data=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
data[,1]=as.Date(data$Date,"%d/%m/%Y")
data[,2]=as.Date(data$Time,"%H/%M/%S")
data2 <- subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))
data2[,3]=as.numeric(data2[,3])
data2[,4]=as.numeric(data2[,4])
data2[,5]=as.numeric(data2[,5])
data2[,6]=as.numeric(data2[,6])
data2[,7]=as.numeric(data2[,7])
data2[,8]=as.numeric(data2[,8])
data2[,9]=as.numeric(data2[,9])

data2$DateTime <- paste(data2$Date, data2$Time)  ## new variable pasting date and time
data2$DateTime <- as.POSIXct(strptime(data2$DateTime, "%Y-%m-%d %T"))

png("plot3.png", height = 480, width = 480)

plot(data2$DateTime,data2[,7],type="l",xlab=" ",ylab="Energy sub metering")
lines(data2[,10],data2[,8],col="Red")
lines(data2[,10],data2[,9],col="Blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1,pt.cex=0.6,cex=0.6,bty="n")

dev.off()