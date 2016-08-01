# Load the ggplot2 package
library(ggplot2)

# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_point()

# A scatter plot has been made for you
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) +
  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()

# Explore the diamonds data frame with str()
str(diamonds)

# Add geom_point() with +
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point()

# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()

# The plot you created in the previous exercise
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()

# Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()

# Copy the above command and assign the correct value to col in aes()
ggplot(diamonds, aes(x = carat, y = price, col=clarity)) +
         geom_smooth()

# Keep the color settings from previous command. Plot only the points with argument alpha
ggplot(diamonds, aes(x = carat, y = price, col=clarity)) +
         geom_point(alpha=0.4)


# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds,aes(x=carat,y=price))

# Add a geom layer with + and geom_point()
# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds,aes(x=carat,y=price)) +
  geom_point()
# Add the same geom layer, but with aes() inside
dia_plot <- ggplot(diamonds,aes(x=carat,y=price)) +
  geom_point(aes(col=clarity))
dia_plot


set.seed(1)

# The dia_plot object has been created for you
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot <- dia_plot + 
  geom_point(alpha = 0.2)

# Plot dia_plot with additional geom_smooth() with se set to FALSE
dia_plot + geom_smooth(se = FALSE)

# Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot + geom_smooth(aes(col = clarity), se = FALSE)

# Plot the correct variables of mtcars
plot(mtcars$wt,mtcars$mpg,col=mtcars$cyl)

# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl)

# Make the same plot as in the first instruction
plot(mtcars$wt,mtcars$mpg,col=mtcars$cyl)


# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mtcars$mpg ~mtcars$wt, data = mtcars)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel,lty=2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl), 
       col = 1:3, pch = 1, bty = "n")


# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2)

# Consider the structure of iris, iris.wide and iris.tidy (in that order)
str(iris)
str(iris.wide)
str(iris.tidy)


# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(Value ~ Measure)


# Load the tidyr package
library(tidyr)

# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
  gather(key, Value, -Species) %>%
  separate(key, c("Part", "Measure"), "\\.") 


# Consider the head of iris, iris.wide and iris.tidy (in that order)
head(iris)
head(iris.wide)
head(iris.tidy)

# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.wide, aes(x = Length, y = Width, col = Part)) +
  geom_jitter() +
  facet_grid(Length ~ Species)

library(tidyr)

# Add column with unique ids (don't need to change)
iris$Flower <- 1:nrow(iris)

# Fill in the ___ to produce to the correct iris.wide dataset
iris.wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value)
# Map cyl to y
ggplot(mtcars, aes(x=mpg, y=cyl))+
  geom_point()

# Map cyl to x
ggplot(mtcars, aes(x=cyl, y=mpg))+
  geom_point()

# Map cyl to col
ggplot(mtcars,aes(x=wt, y=mpg, col=cyl))+
  geom_point()
# Change shape and size of the points in the above plot
ggplot(mtcars,aes(x=wt, y=mpg, col=cyl))+
  geom_point(shape=1,size=4)


ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill=cyl)) +
  geom_point()


# Change shape, size and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill=cyl)) +
  geom_point(shape=21,size=6,alpha=0.6)


ggplot(mtcars,aes(x=wt, y=mpg, size=cyl))+
  geom_point()

# Map cyl to alpha
ggplot(mtcars,aes(x=wt, y=mpg, alpha=cyl))+
  geom_point()


# Map cyl to shape 
ggplot(mtcars,aes(x=wt, y=mpg, shape=cyl))+
  geom_point()



# Map cyl to labels
ggplot(mtcars,aes(x=wt, y=mpg, label=cyl))+
  geom_text()


my_color <- "#122229"

# Set the color aesthetic 
ggplot(mtcars,aes(x=wt,y=mpg,col=cyl)) + geom_point()


# Set the color aesthetic and attribute 
ggplot(mtcars,aes(x=wt,y=mpg,col=cyl)) + geom_point(col=my_color,size=4)


# Set the fill aesthetic and color, size and shape attributes
ggplot(mtcars,aes(x=wt,y=mpg,fill=cyl)) + geom_point(col=my_color,size=10,shape=23)

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(alpha = 0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 24, color = 'yellow',size=3)

# Expand to draw text with label x, color red and size 10
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_text(label = "x", color = 'red', size = 10)

####

# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars,aes(x=mpg,y=qsec,col=factor(cyl))) +
  geom_point()

# Add mapping: factor(am) onto shape
ggplot(mtcars,aes(x=mpg,y=qsec,col=factor(cyl),shape=factor(am))) +
  geom_point()

# Add mapping: (hp/wt) onto size
ggplot(mtcars,aes(x=mpg,y=qsec,col=factor(cyl),shape=factor(am),size=(hp/wt))) +
  geom_point()



#######################################

cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) +
           
# The base layer, cyl.am, is available for you
# Add geom (position = "stack" by default)
cyl.am + 
  geom_bar()

# Fill - show proportion
cyl.am + 
  geom_bar(position = "fill")  

# Dodging - principles of similarity and proximity
cyl.am +
  geom_bar(position = "dodge") 

# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab) 
##############################################

# Add a new column called group
mtcars$group <- 0

# Create jittered plot of mtcars: mpg onto x, group onto y
ggplot(mtcars, aes(x = mpg, y = group)) + geom_jitter()


# Change the y aesthetic limits
ggplot(mtcars, aes(x = mpg, y = group)) +
  geom_jitter() +
  scale_y_continuous(limits=c(-2,2))

# Bonus exercise from Video
posn.jitter <- position_jitter(width=.5)
ggplot(mtcars, aes(x = mpg, y = group)) +
  geom_point(position=posn.jitter, color="red",size=2) +
  scale_y_continuous(limits=c(-3,3))
###############################################

# Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x=wt,y=mpg, col=cyl))+ 
  geom_point(size=4)


# Hollow circles - an improvement
ggplot(mtcars, aes(x=wt,y=mpg, col=cyl))+ 
  geom_point(size=4,shape=1)


# Add transparency - very nice
ggplot(mtcars, aes(x=wt,y=mpg, col=cyl))+ 
  geom_point(size=4,shape=1, alpha=0.6)

#################################################

# Scatter plot: carat (x), price (y), clarity (col)
ggplot(diamonds, aes(x=carat, y=price, col=clarity)) +
         geom_point() 
       
# Adjust for overplotting
ggplot(diamonds,aes(x=carat, y=price, col=clarity)) +
                geom_point(alpha=0.5) 
              
# Scatter plot: clarity (x), carat (y), price (col)
ggplot(diamonds,aes(x=clarity, y=carat, col=price)) +
               geom_point(alpha=0.5) 
             
                     
# Dot plot with jittering
ggplot(diamonds,aes(x=clarity, y=carat, col=price)) +
            geom_point(alpha=0.5,position="jitter")
                            
                            
                            







