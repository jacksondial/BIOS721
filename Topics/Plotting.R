library(tidyverse)

ggplot(airquality, aes(Temp, Ozone, shape = as_factor(Month)))+
  geom_point()+
  scale_shape_manual(values = c(1,3,5,8,6))


ggplot(airquality, aes(x = Temp, Ozone, color = Solar.R))+
  geom_point()+
  scale_color_distiller(palette = "Spectral")
library(viridis)
ggplot(airquality, aes(x = Temp, Ozone, color = Solar.R))+
  geom_point()+
  scale_color_viridis()




library(wesanderson)

#find number of unique values in scale
length(unique(airquality$Solar.R))

col <- wes_palette("Zissou1", 118, type = c("continuous"))

ggplot(airquality, aes(x = Temp, Ozone, color = Solar.R))+
  geom_point()+
  scale_color_gradientn(colors = col)



ggplot(airquality, aes(x = Temp, Ozone, color = Solar.R))+
  geom_point()+
  scale_color_gradient(low = "blue", high = "green")

##How to make errorbar plots (frequently used in biostatistics)

#first make dataset in correct format
head(airquality)

df <- airquality %>% 
  mutate(MonthCat = case_when(
    Month == 5 ~ "May",
    Month == 6 ~ "June",
    Month == 7 ~ "July",
    Month == 8 ~ "August",
    Month == 9 ~ "September"
  )) %>% 
  group_by(Month) %>% 
  mutate(AvgTemp = mean(Temp),
            lower = mean(Temp) - 1.96 * sd(Temp),
            upper = mean(Temp) + 1.96 * sd(Temp))



ggplot(df, aes(x= factor(MonthCat,
                         level = c("May", "June", "July", "August", "September")),
                         y = AvgTemp,
                         color = factor(MonthCat,
                                        level = c("May", "June", "July", "August", "September"))))+
  geom_point(size = 3)+
  geom_errorbar(aes(ymin = lower, ymax = upper))+
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        legend.title = element_text(color = "blue", 
                                    size = 13, 
                                    face = "italic"),
        legend.text = element_text(size = 11, 
                                   color = "black"),
        plot.title = element_text(size = 14,
                                  color = "dodgerblue"))+
  labs(x = "Month",
       y = "Temperature",
       color = "Month",
       title = "Mean (95% CI) Temperature (F) by Month")


aq <- airquality
aq$Month <- factor(aq$Month,
                      labels = c("May", "June", "July", "August", "September"))

ggplot(aq, aes(Temp, Ozone))+
  geom_point(aes(col = Month))+
  facet_grid(~Month)+
  theme_classic()
