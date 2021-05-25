#Analyzing astronomical data to inspect properties of stars like their luminosity, temperatue, and astral class.
#Download necessary packages
library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3)

#The absolute magnitude will show us the stars luminosity where negative values have the highest lumiunosity.
stars$magnitude

#Mean magnitude
mean(stars$magnitude)
4.26

#We plot the stars temperature to analye distribution. Here we see the majority of stars have a low temperature.
stars %>%
  ggplot(aes(temp)) +
  geom_density()

#Plot with temperature and magnitude of stars
stars %>%
  ggplot(aes(temp, magnitude)) +
  geom_point()

#A different way to look at the data would be taking log base 10 of the temperature and then flipping the x axis.
#In this plot we see the brightest stars with the highest temperatures are in the upper left corner.
stars %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point() +
  scale_x_reverse() +
  scale_y_reverse()
#Here we make a plot that includes the stars names
stars %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point() +
  geom_text(aes(label = star)) +
  scale_x_reverse() +
  scale_y_reverse()

#Now we remove the text labels and instead color the points by star type. This classification describes the properties of the star's spectrum, the amount of light produced at various wavelengths.
stars %>%
  ggplot(aes(log10(temp), magnitude, col = type)) +
  geom_point() +
  scale_x_reverse() +
  scale_y_reverse()

#With this plot we can easily see the stars with the highest and lowest temperature
