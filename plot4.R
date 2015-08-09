plot4<-function(){
        # Plot histogram of Global Active Power
        
        # Read data and select data of given dates
        raw_file<-read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
        selected_data<-raw_file[raw_file$Date=="1/2/2007" | raw_file$Date=="2/2/2007",]
        rm(raw_file)
        
        # Create column for date-time
        selected_data[,10]<-as.POSIXct(paste(as.Date(selected_data[,1],"%d/%m/%Y"),selected_data[,2]))
        
        names(selected_data)[10]<-"dt"
        # Change it to numeric
        selected_data[,3]<-as.numeric(selected_data[,3])
        selected_data[,4]<-as.numeric(selected_data[,4])
        selected_data[,5]<-as.numeric(selected_data[,5])
        selected_data[,7]<-as.numeric(selected_data[,7])
        selected_data[,8]<-as.numeric(selected_data[,8])
        selected_data[,9]<-as.numeric(selected_data[,9])
        
        # Draw a plot and export it to file of Plot4.png
        par(mfrow=c(2,2)) # 2 by 2
        plot(selected_data[,10],selected_data[,3],xlab="",ylab="Global Active Power (kilowatts)",type='l')
        
        plot(selected_data[,10],selected_data[,5],xlab="datetime",ylab="Voltage",type='l')
        
        plot(selected_data[,10],selected_data[,7],xlab="",ylab="Energy sub metering",type='l')
        lines(selected_data[,10],selected_data[,8],col="red",type='l')
        lines(selected_data[,10],selected_data[,9],col="blue",type='l')
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n",text.font=2,lwd=1, cex=0.25)
        
        plot(selected_data[,10],selected_data[,4],xlab="datetime",ylab="Global Reactive Power",type='l')
        
        # Export to file
        dev.copy(png,file="Plot4.png",width=480,height=480)
        dev.off()
}