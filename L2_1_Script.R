#L2_1.Script.R
library(ggplot2)

# ggplot2 is already loaded

# Explore the mtcars data frame with str()
str(mtcars)

# A scatter plot with LOESS smooth:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method="loess")

# A scatter plot with an ordinary Least Squares linear model:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method="lm")

# The previous plot, without CI ribbon:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method="lm", se=FALSE)

# The previous plot, without points:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method="lm", se=FALSE)

##############################################
# ggplot2 is already loaded


# Define cyl as a factor variable
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F)

# Complete the following ggplot command as instructed
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F) +
  stat_smooth(method = "lm", se = F, aes(group = 1))

#####################################################

# Plot 1: change the LOESS span
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add span below 
  geom_smooth(method=loess)+
  geom_smooth(span=0.7, se=FALSE)

# Plot 2: Set the overall model to LOESS and use a span of 0.7
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F) +
  # Change method and add span below
  stat_smooth(method = "loess", span=0.7, aes(group = 1), 
              se = F, col = "black")

# Plot 3: Set col to "All", inside the aes layer of stat_smooth()
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F) +
  stat_smooth(method = "loess",
              # Add col inside aes()
              aes(group = 1, col="All"), 
              # Remove the col argument below
              se = F, span = 0.7)

# Plot 4: Add scale_color_manual to change the colors
myColors <- c(brewer.pal(3, "Dark2"), "black")
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F, span = 0.75) +
  stat_smooth(method = "loess", 
              aes(group = 1, col="All"), 
              se = F, span = 0.7) +
  # Add correct arguments to scale_color_manual
  scale_color_manual("Cylinders",values=myColors)

#######################################################################

# Plot 1: Jittered scatter plot, add a linear model (lm) smooth
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.2) +
  stat_smooth(method = "lm", se = F)

# Plot 2: Only lm, colored by year
ggplot(Vocab, aes(x = education, y = vocabulary, col = factor(year))) +
  stat_smooth(method = "lm", se = F)

# Plot 3: Set a color brewer palette
ggplot(Vocab, aes(x = education, y = vocabulary, col = factor(year))) +
  stat_smooth(method = "lm", se = F) +
  scale_color_brewer()

# Plot 4: Change col and group, specify alpha, size and geom, and add scale_color_gradient
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_smooth(method = "lm", se = F, alpha = 0.6, size = 2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

######################################################################
# Use stat_quantile instead of stat_smooth:
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(alpha = 0.6, size = 2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

# Set quantile to 0.5:
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(alpha = 0.6, size = 2, quantiles=0.5) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))
##################################################################

# DID NOT WORK !

# Plot with linear and loess model
p <- ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "loess", aes(col = "red"), se = F) +
  stat_smooth(method = "lm", aes(col = "blue"), se = F) +
  scale_color_discrete("Model", labels = c("red" = "LOESS", "blue" = "lm"))

# Add stat_sum
p + stat_sum()

# Add stat_sum and set size range
p + stat_sum() + scale_size(range=c(1,10))

##################################################################
# Display structure of mtcars
str(mtcars)

# Convert cyl and am to factors:
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)

# Define positions:
posn.d <- position_dodge(width=0.1)
posn.jd <- position_jitterdodge(jitter.width=0.1, dodge.width=0.2)
posn.j <- position_jitter(width=0.2)

# base layers:
wt.cyl.am <- ggplot(mtcars, aes(x=cyl, y=wt, col=am, fill=am, group=am))
#################################################################

# wt.cyl.am, posn.d, posn.jd and posn.j are available

# Plot 1: Jittered, dodged scatter plot with transparent points
wt.cyl.am +
  geom_point(position = posn.jd, alpha = 0.6)

# Plot 2: Mean and SD - the easy way
wt.cyl.am +
  stat_summary(fun.data = mean_sdl,
               fun.args=list(mult=1),position=posn.d)

# Plot 3: Mean and 95% CI - the easy way
wt.cyl.am +
  stat_summary(fun.data = mean_cl_normal,position=posn.d)

# Plot 4: Mean and SD - with T-tipped error bars - fill in ___
wt.cyl.am +
  stat_summary(geom ="point", fun.y = mean, 
               position = posn.d) +
  stat_summary(geom ="errorbar", fun.data = mean_sdl, 
               position = posn.d, fun.args = list(mult = 1), width = 0.1)

#############################

xx <- 1:100
xx

# mean_sdl(xx, mult = 1) mean and 1 sd on both sides

# Play vector xx is available
mean_sdl(xx, mult = 1)


# See function(x) { 
#data.frame(define elements a= sumpin(x), b= fumpin(x) and so on)
# }

# Function to save range for use in ggplot 
gg_range <- function(x) {
  # Change x below to return the instructed values
  data.frame(ymin = min(x), # Min
             ymax = max(x)) # Max
}

gg_range(xx)
# Required output:
#   ymin ymax
# 1    1  100

# Function to Custom function:
med_IQR <- function(x) {
  # Change x below to return the instructed values
  data.frame(y = median(x), # Median
             ymin = quantile(x)[2], # 1st quartile
             ymax = quantile(x)[4])  # 3rd quartile
}

med_IQR(xx)
# Required output:
#        y  ymin  ymax
# 25% 50.5 25.75 75.25

##############################################################################
# The base ggplot command, you don't have to change this
wt.cyl.am <- ggplot(mtcars, aes(x = cyl,y = wt, col = am, fill = am, group = am))

# Add three stat_summary calls to wt.cyl.am
wt.cyl.am + 
  stat_summary(geom = "linerange", fun.data = med_IQR, 
               position = posn.d, size = 3) +
  stat_summary(geom = "linerange", fun.data = gg_range, 
               position = posn.d, size = 3, 
               alpha = 0.4) +
  stat_summary(geom = "point", fun.y = median, 
               position = posn.d, size = 3, 
               col = "black", shape = "X")
##################################################################################
mtcars$cyl <- factor(mtcars$cyl)
p <- ggplot(mtcars, aes(x = wt, y = hp, col = factor(am))) + geom_point() + geom_smooth()
p

# Extend p with a scale_x_continuous() with limits = c(3, 6) and expand = c(0, 0). What do you see?
p + scale_x_continuous(limits=c(3,6),expand=c(0,0))

p + coord_cartesian(xlim=c(3,6))

# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()

# Add scale_x_continuous
p + scale_x_continuous(limits=c(3,6),expand=c(0,0))

# The proper way to zoom in:
p + coord_cartesian(xlim=c(3,6))

##############################################################################

# Complete basic scatter plot function
base.plot <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width,col=Species)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = F)

# Plot base.plot: default aspect ratio
base.plot

# Fix aspect ratio (1:1) of base.plot
base.plot + 
  coord_equal()

############################################################################

# Create stacked bar plot: thin.bar
thin.bar <- ggplot(mtcars, aes(x=1,fill=cyl)) +
  geom_bar()

# Convert thin.bar to pie chart
thin.bar + coord_polar(theta="y")

# Create stacked bar plot: wide.bar
wide.bar <- ggplot(mtcars, aes(x=1,fill=cyl)) +
  geom_bar(width=1)


# Convert wide.bar to pie chart
wide.bar + coord_polar(theta="y")

####################################################################
# Basic scatter plot:
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Separate rows according to transmission type, am
p+ facet_grid(am~.)



# Separate columns according to cylinders, cyl
p+ facet_grid(.~cyl)



# Separate by both columns and rows 
p + facet_grid(am~cyl)
#################################################################
# Code to create the cyl_am col and myCol vector
mtcars$cyl_am <- paste(mtcars$cyl, mtcars$am, sep = "_")
myCol <- rbind(brewer.pal(9, "Blues")[c(3,6,8)],
               brewer.pal(9, "Reds")[c(3,6,8)])

# Basic scatter plot, add color scale:
ggplot(mtcars, aes(x = wt, y = mpg, col=cyl_am)) +
  geom_point() +
  scale_color_manual(values=myCol)

# Facet according on rows and columns.
ggplot(mtcars, aes(x = wt, y = mpg, col=cyl_am)) +
  geom_point() +
  scale_color_manual(values=myCol) +
  facet_grid(gear~vs)
# Add more variables
ggplot(mtcars, aes(x = wt, y = mpg, col=cyl_am, size=disp)) +
  geom_point() +
  scale_color_manual(values=myCol) +
  facet_grid(gear~vs)

######################################################################
# mamsleep is a version of msleep data in base R
# Basic scatter plot
ggplot(mamsleep, aes(x=time,y=name,col=sleep)) + geom_point()

# Facet rows accoding to vore
ggplot(mamsleep, aes(x=time,y=name,col=sleep))+ geom_point() + facet_grid(vore~.)

# Specify scale and space arguments to free up rows
ggplot(mamsleep, aes(x=time,y=name,col=sleep))+ geom_point()+
  facet_grid(vore~.,scale="free_y", space="free_y" )

#########################################################################

# Plot 1: change the plot background color to myPink:
z + theme(plot.background=element_rect(fill=myPink))

# Plot 2: adjust the border to be a black line of size 3
z + theme(plot.background=element_rect(fill=myPink, color="black", size=3))

# Plot 3: set panel.background, legend.key, legend.background and strip.background to element_blank()
uniform_panels <- theme(panel.background = element_blank(), 
                        legend.key = element_blank(), 
                        legend.background=element_blank(), 
                        strip.background = element_blank())
z + theme(plot.background=element_rect(fill=myPink, color="black", size=3)) + uniform_panels

#############################################################################

# Extend z with theme() function and three arguments
z + theme(panel.grid=element_blank(), # removes grid
          axis.line=element_line(color="black"),  
          axis.ticks=element_line(color="black"))

##################################################################
# Extend z with theme() function and four arguments
z + theme(strip.text=element_text(size=16,color=myRed),
          axis.title.y=element_text(color=myRed,hjust=0,face="italic"),
          axis.title.x=element_text(color=myRed,hjust=0,face="italic"),
          axis.text=element_text(color="black"))
#########################################################

# Move legend by position

z + theme(legend.position=c(0.85,0.85))
# Change direction

z + theme(legend.direction="horizontal")

# Change location by name
z + theme(legend.position="bottom")

# Remove legend entirely
z + theme(legend.position="none")

################################################
# Increase spacing between facets
library(grid)
z + theme(panel.margin.x=unit(2,"cm"))


# Add code to remove any excess plot margin space
library(grid)
z + theme(panel.margin.x=unit(2,"cm"),
          plot.margin=unit(c(0,0,0,0),"cm"))

######################################################
# Theme layer saved as an object, theme_pink
theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "black"),
                    axis.ticks = element_line(color = "black"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")

# Apply theme_pink to z2
z2 + theme_pink

# Change code so that old theme is saved as old
old <- theme_update(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "black"),
                    axis.ticks = element_line(color = "black"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")

# Display the plot z2
z2 

# Restore the old plot
theme_set(old)
#######################################################################################

# Load ggthemes package
library(ggthemes)

# Apply theme_tufte

z2 + theme_tufte()

# Apply theme_tufte, modified:
z2 + theme_tufte() +
  theme(legend.position=c(0.9,0.9),
        legend.title=element_text(face="italic", size=12),
        axis.title=element_text(face="bold",size=14))

######################################################################################







