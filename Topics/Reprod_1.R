#look at the columns of the df
names(cars)

#calculate the mean of speed
mean(cars$speed)

#load ggplot2 and make plot
library(ggplot2)
ggplot(cars, aes(speed))+
  geom_histogram(bins = 10)

#always put:
#dev.off()
#after uploading a plot to a png, jpeg, etc.

#set working directory to source file location
setwd("C:/Users/jacks/OneDrive/Desktop/DUKE_FALL2021/721/BIOS721/Topics")
#upload to jpeg file in current file
jpeg(filename = "histogram_cars.jpeg")
ggplot(cars, aes(speed))+
  geom_histogram(bins = 10)

dev.off()