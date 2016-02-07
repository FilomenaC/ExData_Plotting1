# plot3.R - Exploratory Data Analysis - Project week 1 - Filomena Ciccarelli

# The script assumes that the project dataset (see README.md) is downloaded, 
#  manually unzipped and save in the working directory.

# This function does the following
# Step 1 - Read the data into 
# Step 2 - Convert the Date and Time variables to Date/Time classes and subset dates of interest as advised (see README.md)
# Step 3 - Plot the data - Plot the data - Note by default, with png() the graph's width and height is 480x480 pixels


# Step 1
Data.Power<-read.table("household_power_consumption.txt",header = TRUE,na.strings ="?",sep=";")

# Step 2
Data.Power$Date<-as.Date(Data.Power$Date,format="%d/%m/%Y")
Data_Power_Dates<-subset(Data.Power,Data.Power$Date=="2007-02-01"|Data.Power$Date=="2007-02-02")   #dim [2880 x 9]
Data_Power_Dates$Date.Time<-strptime(paste(Data_Power_Dates$Date,Data_Power_Dates$Time),
                                     format="%Y-%m-%d %H:%M:%S")                                   #dim [2880 x 10]


# Step 3 - Output chart
png(file="plot3.png")

plot(Data_Power_Dates$Date.Time,
     Data_Power_Dates$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(Data_Power_Dates$Date.Time,Data_Power_Dates$Sub_metering_2,type="l",col="red")

lines(Data_Power_Dates$Date.Time,Data_Power_Dates$Sub_metering_3,type="l",col="blue")
 
legend("topright",
       lty=c(1,1,1), 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
