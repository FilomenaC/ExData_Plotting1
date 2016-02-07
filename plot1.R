# plot1.R - Exploratory Data Analysis - Project week 1 - Filomena Ciccarelli

# The script assumes that the project dataset (see README.md) is downloaded, 
#  manually unzipped and save in the working directory.

# This function does the following
# Step 1 - Read the data into 
# Step 2 - Recode the data and subset dates of interest as advised (see README.md)
# Step 3 - Plot the data - Note by default, with png() the graph's width and height is 480x480 pixels

# Step 1
Data.Power<-read.table("household_power_consumption.txt",header = TRUE,na.strings ="?",sep=";")

# Step 2
Data.Power$Date<-as.Date(Data.Power$Date,format="%d/%m/%Y")
Data_Power_Dates<-subset(Data.Power,Data.Power$Date=="2007-02-01"|Data.Power$Date=="2007-02-02") #dim [2880 x 9]


# Step 3 - Output chart
png(file="plot1.png")

hist(Data_Power_Dates$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
