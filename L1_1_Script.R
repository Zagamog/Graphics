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


