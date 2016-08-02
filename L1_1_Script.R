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
                            
######################################################
mtcars$cyl <- factor(mtcars$cyl)
# The dataset mtcars is available for you

# Plot the cyl on the x-axis and wt on the y-axis
ggplot(mtcars,aes(x=cyl,y=wt)) +
  geom_point()


# Use geom_jitter() instead of geom_point()
ggplot(mtcars,aes(x=cyl,y=wt)) +
  geom_jitter()


# Define the position object using position_jitter(): posn.j
posn.j <- position_jitter(width=0.1)

# Use posn.j in geom_point()
ggplot(mtcars,aes(x=cyl,y=wt)) +
  geom_point(position=posn.j)
####################################################
library(car)

# Also from downloaded csv Vocab <- read.csv(file="C:/Users/wb164718/Documents/R/Graphics/Graphics/Vocab.csv")


# Examine the structure of Vocab
str(Vocab)

# Basic scatter plot of vocabulary (y) against education (x). Use geom_point()
ggplot(Vocab,aes(x=education, y=vocabulary)) +
  geom_point()

# Use geom_jitter() instead of geom_point()
ggplot(Vocab,aes(x=education, y=vocabulary)) +
  geom_jitter()

# Using the above plotting command, set alpha to a very low 0.2
ggplot(Vocab,aes(x=education, y=vocabulary)) +
  geom_jitter(alpha=0.2)

# Using the above plotting command, set the shape to 1
ggplot(Vocab,aes(x=education, y=vocabulary)) +
  geom_jitter(alpha=0.2,shape=1)

######################################################
# Make a univariate histogram
ggplot(mtcars, aes(mpg)) +
  geom_histogram()

# Change the bin width to 1
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 1)

# Change the y aesthetic to density
ggplot(mtcars, aes(mpg)) +
  geom_histogram(aes(y=..density..), binwidth = 1)

# Custom color code
myBlue <- "#377EB8"

# Change the fill color to myBlue
ggplot(mtcars, aes(mpg)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 1, fill = myBlue)
###############################################

mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)

# Draw a bar plot of cyl, filled according to am
ggplot(mtcars,aes(x=cyl, fill=am)) +
  geom_bar()

# Change the position argument to stack
ggplot(mtcars,aes(x=cyl, fill=am)) +
  geom_bar(position="stack")

# Change the position argument to fill
ggplot(mtcars,aes(x=cyl, fill=am)) +
  geom_bar(position="fill")

# Change the position argument to dodge
ggplot(mtcars,aes(x=cyl, fill=am)) +
  geom_bar(position="dodge")

###############################################

# Draw a bar plot of cyl, filled according to am
ggplot(mtcars, aes(x=cyl, fill=am)) +
  geom_bar(position="stack")

# Change the position argument to "dodge"
ggplot(mtcars, aes(x=cyl, fill=am)) +
  geom_bar(position="dodge")

# Define posn_d with position_dodge()
posn_d <- position_dodge(width=0.2)

# Change the position argument to posn_d
ggplot(mtcars, aes(x=cyl, fill=am)) +
  geom_bar(position=posn_d)

# Use posn_d as position and adjust alpha to 0.6
ggplot(mtcars, aes(x=cyl, fill=am)) +
  geom_bar(position=posn_d,alpha=0.6)

################################################

# A basic histogram, add coloring defined by cyl 
ggplot(mtcars, aes(x=mpg,fill=cyl)) +
  geom_histogram(binwidth = 1)

# Change position to identity 
ggplot(mtcars, aes(x=mpg,fill=cyl)) +
  geom_histogram(binwidth = 1,position="identity")


# Change geom to freqpoly (position is identity by default) 
ggplot(mtcars, aes(x=mpg,col=cyl)) +
  geom_freqpoly(binwidth = 1,position="identity")

###################################################
# Example of how to use a brewed color palette
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

# Use str() on Vocab to check out the structure
str(Vocab)

# Plot education on x and vocabulary on fill
# Use the default brewed color palette
ggplot(Vocab, aes(x = factor(education), fill = factor(vocabulary))) +
  geom_bar(position="fill") +
  scale_fill_brewer()

#######################################################
library(cars)
Vocab$education=factor(Vocab$education)
Vocab$vocabulary=factor(Vocab$vocabulary)
library(ggplot2)

library(RColorBrewer)
# Final plot of last exercise
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_brewer()

# Definition of a set of blue colors
blues <- brewer.pal(9, "Blues")

# Make a color range using colorRampPalette() and the set of blues
blue_range <- colorRampPalette(blues)

# Use blue_range to adjust the color of the bars, use scale_fill_manual()
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values = blue_range(11))

#######################################################
# Basic histogram plot command
ggplot(mtcars, aes(mpg)) + 
  geom_histogram(binwidth = 1)

# Expand the histogram to fill using am
ggplot(mtcars, aes(x=mpg,fill=am)) + 
  geom_histogram(binwidth = 1)

# Change the position argument to "dodge"
ggplot(mtcars, aes(x=mpg,fill=am)) + 
  geom_histogram(binwidth = 1,position="dodge")

# Change the position argument to "fill"
ggplot(mtcars, aes(x=mpg,fill=am)) + 
  geom_histogram(binwidth = 1,position="fill")

# Change the position argument to "identity" and set alpha to 0.4
ggplot(mtcars, aes(x=mpg,fill=am)) + 
  geom_histogram(binwidth = 1,position="identity", alpha=0.4)

# Change fill to cyl
ggplot(mtcars, aes(x=mpg,fill=cyl)) + 
  geom_histogram(binwidth = 1,position="identity", alpha=0.4)
###############################################################
# Print out head of economics
head(economics)

# Plot unemploy as a function of date using a line plot
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

# Adjust plot to represent the fraction of total population that is unemployed
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()
##############################################################
# Expand the following command with geom_rect() to draw the recess periods

cards <-("
begin        end
1969-12-01 1970-11-01
1973-11-01 1975-03-01
1980-01-01 1980-07-01
1981-07-01 1982-11-01
1990-07-01 1991-03-01
2001-03-01 2001-11-01")

recess <- read.table(textConnection(cards),header=TRUE)
closeAllConnections()


recess$begin <- as.Date(recess$begin)  # to convert ordinary $ string from read.table to date format
recess$end <- as.Date(recess$end)

str(recess)

ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()+
  geom_rect(data=recess,inherit.aes=FALSE,
            aes(xmin=begin,xmax=end,ymin=-Inf,ymax=+Inf),fill="red",alpha=0.2)

####################################################################
cards <-("
   Year   Pink   Chum Sockeye  Coho Rainbow Chinook Atlantic
1  1950 100600 139300   64100 30500       0   23200    10800
         2  1951 259000 155900   51200 40900     100   25500     9701
         3  1952 132600 113800   58200 33600     100   24900     9800
         4  1953 235900  99800   66100 32400     100   25300     8800
         5  1954 123400 148700   83800 38300     100   24500     9600
         6  1955 244400 143700   72000 45100     100   27700     7800
         7  1956 203400 158480   84800 40000     100   25300     8100
         8  1957 270119 125377   69676 39900     100   21200     9000
         9  1958 200798 132407  100520 39200     100   20900     8801
         10 1959 200085 113114   62472 32865     100   20335     8700
         11 1960 111880 120760   83171 26898     100   17412     8900
         12 1961 178133 109053   93311 37524     200   18130     9400
         13 1962 163558 110707   66126 39883     300   17489    11500
         14 1963 222477 106491   53140 41547    1600   18928    10766
         15 1964 143623  94498   56189 38948    2300   20932    14342
         16 1965 161131  76503   94286 44207    1500   21197    12363
         17 1966 174844  93949   81080 46874     900   21549    12337
         18 1967 168960  88027   75582 43396    1700   21375    14411
         19 1968 155729  95624  113332 46463   11200   20720    12823
         20 1969 195169  67888   65106 30973    3000   21915    13316
         21 1970 133466 113650  106436 44050    4400   24000    13457
         22 1971 178823 105879   79160 43110    4600   25800    12397
         23 1972  93852 137655   43932 33880    4900   24000    12665
         24 1973 151180 125364   55637 38550    6900   27400    15387
         25 1974  94026 121052   53027 42631    8099   24148    15158
         26 1975 171012 127561   38615 31782   10302   24137    14736
         27 1976 146895 125110   60357 36965    9492   24984    11372
         28 1977 224475 118677   64651 30777    6166   26351    11491
         29 1978 174314 129513   75737 30712    7219   25417     8948
         30 1979 249558 150176  109439 34279    7036   25452    10259
         31 1980 226191 166803  111830 30557    9027   23023    12965
         32 1981 264855 186550  132651 28702    8819   22789    12425
         33 1982 170373 182561  128176 42281    6839   25147    10326
         34 1983 255129 196414  163790 30291    7473   18926    10862
         35 1984 210511 210507  126834 40834    7977   18449    10562
         36 1985 300987 267794  150860 38823    9373   20318    12422
         37 1986 211685 239065  136452 42825    9709   21187    11739
         38 1987 218121 217129  131135 28173   12196   25475    11413
         39 1988 165236 286572  107361 32245   11872   31338    10093
         40 1989 363456 243728  169410 31614   12249   20725    15795
         41 1990 235190 299438  198168 34635   12529   18249    10860
         42 1991 438998 266940  161218 38078   12545   15373     9793
         43 1992 216110 238427  199709 38433    9731   15093     9308
         44 1993 302568 286996  242613 25451   19091   15036     8161
         45 1994 326065 328765  183686 45602   12624   13623     7231
         46 1995 394735 424595  189612 28922   13450   13801     6819
         47 1996 294915 411395  188584 28201   12407   10509     6493
         48 1997 318717 347560  132075 13191   13147   13000     5579
         49 1998 371552 311965   78972 19386   18940    9840     4744
         50 1999 386928 281260  130128 15449   15874    8735     4107
         51 2000 285338 276355  124782 18035   14918    8437     4710
         52 2001 360973 307662  108618 20006   14927    8771     4772
         53 2002 268544 314098  103325 20757   12241   13911     4139
         54 2003 377749 360429  109822 16995   17128   15046     3648
         55 2004 266554 351188  142385 24546   16601   15899     4082
         56 2005 456350 318389  147151 18791   16886   13571     3727
         57 2006 316205 361561  151523 18275   17079   10497     3087
         58 2007 506343 331266  164609 17228   14844    8900     3014
         59 2008 294876 295819  138896 21280   16819    6443     3002
         60 2009 591654 359908  150040 19725   17884    6303     2373
         61 2010 370044 143959  170972 20770   20754    7968     2363")

fish.species <- read.table(textConnection(cards), header=TRUE)
closeAllConnections()

library(tidyr)

# Check the structure as a starting point
str(fish.species)

# Use gather to go from fish.species to fish.tidy
fish.tidy <- gather(data=fish.species,key=Species,value=Capture,-Year)


# Recreate the plot shown on the right
ggplot(fish.tidy, aes(x = Year, y = Capture, col = Species)) + 
  geom_line()


###########################################
# The old way (shown)
plot(mpg ~ wt, data = mtcars)

# Using ggplot:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Using qplot:
qplot(wt, mpg, data = mtcars) 

###################################

# basic scatter plot:
qplot(wt, mpg, data = mtcars)

# Categorical:
# cyl
qplot(wt, mpg, data = mtcars, size = factor(cyl))

# gear
qplot(wt, mpg, data = mtcars, size = factor(gear))

# Continuous
# hp
qplot(wt, mpg, data = mtcars, col = hp)

# qsec
qplot(wt, mpg, data = mtcars, col = qsec)
############################

# ChickWeight is available in your workspace

# Check out the head of ChickWeight
head(ChickWeight)

# Use ggplot() for the second instruction
ggplot(ChickWeight,aes(x=Time, y=weight)) +
  geom_line(aes(group=Chick))

# Use ggplot() for the third instruction
ggplot(ChickWeight,aes(x=Time, y=weight, col=Diet)) +
  geom_line(aes(group=Chick))
# Use ggplot() for the last instruction
ggplot(ChickWeight,aes(x=Time, y=weight, col=Diet)) +
  geom_line(aes(group=Chick),alpha=0.3) +
  geom_smooth(lwd=2,se=FALSE)

###################################

titanic <- read.table(file="C:/Users/wb164718/Documents/R/Graphics/Graphics/titanic.txt", header=TRUE)


# Check out the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(x=factor(Pclass),fill=factor(Sex))) +
  geom_bar(position="dodge")

# Use ggplot() for the second instruction
ggplot(titanic, aes(x=factor(Pclass),fill=factor(Sex))) +
  geom_bar(position="dodge") +
  facet_grid(". ~ Survived")

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction
ggplot(titanic, aes(x=factor(Pclass), y=Age, col=factor(Sex))) +
  geom_jitter(size=3,alpha=0.5, position=posn.j) +
  facet_grid(". ~ Survived")


