plot3<-function(){
        # Plot histogram of Global Active Power
        
        # Read data and select data of given dates
        raw_file<-read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
        selected_data<-raw_file[raw_file$Date=="1/2/2007" | raw_file$Date=="2/2/2007",c(1,2,7,8,9)]
        rm(raw_file)
        
        # Create column for date-time
        selected_data[,6]<-as.POSIXct(paste(as.Date(selected_data[,1],"%d/%m/%Y"),selected_data[,2]))
        
        names(selected_data)[6]<-"dt"
        # Change it to numeric
        selected_data[,3]<-as.numeric(selected_data[,3])
        selected_data[,4]<-as.numeric(selected_data[,4])
        selected_data[,5]<-as.numeric(selected_data[,5])
        # Draw a plot and export it to file of Plot3.png
        plot(selected_data[,6],selected_data[,3],xlab="",ylab="Energy sub metering",type='l')
        lines(selected_data[,6],selected_data[,4],col="red",type='l')
        lines(selected_data[,6],selected_data[,5],col="blue",type='l')
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=3, cex=0.5)
        dev.copy(png,file="Plot3.png",width=480,height=480)
        dev.off()
}