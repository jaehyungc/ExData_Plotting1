plot1<-function(){
        # Plot histogram of Global Active Power
        
        # Read data and select data of given dates
        raw_file<-read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
        selected_data<-raw_file[raw_file$Date=="1/2/2007" | raw_file$Date=="2/2/2007",c(1,2,3)]
        rm(raw_file)
        
        # Change it to numeric
        selected_data[,3]<-as.numeric(selected_data[,3])
        
        # Draw histogram and export it to file of Plot1.png
        hist(selected_data[,3],xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
        dev.copy(png,file="Plot1.png",width=480,height=480)
        dev.off()
}