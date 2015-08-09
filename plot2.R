plot2<-function(){
        # Plot histogram of Global Active Power
        
        # Read data and select data of given dates
        raw_file<-read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
        selected_data<-raw_file[raw_file$Date=="1/2/2007" | raw_file$Date=="2/2/2007",c(1,2,3)]
        rm(raw_file)
        
        # Create column for date-time
        selected_data[,4]<-as.POSIXct(paste(as.Date(selected_data[,1],"%d/%m/%Y"),selected_data[,2]))
        
        names(selected_data)[4]<-"dt"
        # Change it to numeric
        selected_data[,3]<-as.numeric(selected_data[,3])
        
        # Draw plot and export it to file of Plot2.png
        plot(selected_data[,4],selected_data[,3],xlab="",ylab="Global Active Power (kilowatts)",type='l')
        dev.copy(png,file="Plot2.png",width=480,height=480)
        dev.off()
}