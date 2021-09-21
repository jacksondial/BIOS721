library(tictoc)

tic()
ggplot(airquality, aes(Temp, Ozone))+
  geom_point()
toc()



