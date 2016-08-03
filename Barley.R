library(lattice) # for barley data

library(RColorBrewer) # to generate myColors
myColors <- brewer.pal(9, "Reds")

# The heat map we want to replace
# Don't remove, it's here to help you!

# Heat map - not suitable
myColors <- brewer.pal(9, "Reds")
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  facet_wrap( ~ site, ncol = 1) +
  scale_fill_gradientn(colors = myColors)
# Better alternative
ggplot(barley,aes(x=year, y = yield, col= variety, group=variety)) +
         geom_line()

ggplot(barley,aes(x=year, y = yield, col= variety, group=variety)) +
  geom_line() +
  facet_wrap( ~ site, nrow = 1)