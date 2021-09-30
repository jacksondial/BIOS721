#in class plotting practice

library(tidyverse)
glimpse(diamonds)

d2 <- diamonds

d2$cut <- factor(d2$cut, level = c("Ideal","Premium", "Very Good", "Good", "Fair"))
  
#plot1
ggplot(d2, aes(carat, price, color = cut))+
  geom_point(alpha = .2, size = 3)+
  labs(x = "Carat",
       y = "Price ($)",
       title = "Price and Carat of Diamonds, by Cut",
       color = "Cut")+
  theme_minimal()+
  scale_color_viridis_d()

#scale_colour_viridis_d(direction = -1)

#plot2
ggplot(d2, aes(carat, price, color = cut))+
  geom_point(alpha = .2, size = 3)+
  labs(x = "Carat",
       y = "Price ($)",
       title = "Price and Carat of Diamonds, by Cut and Clarity",
       color = "Cut")+
  theme_minimal()+
  facet_wrap(~clarity)

#notice we are not actually dividing by sqrt(n) in the confidence interval 
#calculation, this is just so the plot would show the lines more and we could
#see the pretty colors better

df <- d2 %>% 
  group_by(color) %>% 
  mutate(AvgPrice = mean(price),
         Upper = mean(price) + 1.96 * sd(price),
         Lower = mean(price) - 1.96 * sd(price))


library(viridis)

ggplot(df, aes(color, AvgPrice, color = color))+
  geom_linerange(aes(ymin = Lower, ymax = Upper))+
  geom_point(size = 4)+
  theme_classic()+
  labs(x = "Diamond Color Level",
       y = "Price ($)",
       title = "Confidence Intervals (95%) for Diamond Price, by Color")+
  scale_color_brewer(palette = "Dark2")+
  theme(legend.position = "none")




