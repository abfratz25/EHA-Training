# Welcome!
# 1) Did you get R and RStudio installed?
#   - If not, instructions at http://happygitwithr.com/install-r-rstudio.html
# 2) Open RStudio

# (Ambitious) Plan for today:
# 9-11: Intro to R and data manipulation
# 11-12: Intro to git and version control
# 12-12:30: Reproducible reports
# 12:30-1:  Data training plans
# (There will be a coffee break in here somewhere)

3 / 7

##getwd() gives the directory but it needs to be typed directly into the command line
getwd()



# Get this script at http://bit.ly/eha2018


### Creating objects in R
####assignment - naming of an object (use <-)

my_object <- 8
my_object
my_other_object <- 10
my_object*2.2
my_object3 <- my_object*2.2
my_object3
####when using mathematical operators, it doesn't matter if you put a space or not, and generally multiple spaces between things also doesn't make a difference
####also you can break a line for readability
####use control+shift+c to comment out a block of highlighted text



### Challenge
##
## What are the values after each statement in the following?
##

mass <- 47.5            # mass 47.5
age  <- 122             # age? 122
mass <- mass * 2.0      # mass? 95
age  <- age - 20        # age? 102
mass_index <- mass/age  # mass_index? .93
mass
age

####functions - take input and give output
####argument is the input of a function - functions can take multiple arguments
?round

### Vectors and data types
####vector- collection of values (use the concatonate function c())

weight_g <- c(50, 60, 65, 72)
weight_g
animals <- c("rat","mouse","cat","dog")

####can also put in words (character objects) as long as they are surrounded by quotes -- determine the type of object using the class() function
####use the str() function to give class plus a single line of values
####if you combine a numeric value and a character with c(), it will make both characters
####"logical" objects give true/false

## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
##
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
num_char <- c(1, 2, 3, "a")
class(num_char)
str(num_char)
##
num_logical <- c(1, 2, 3, TRUE)
class(num_logical)
##
char_logical <- c("a", "b", "c", TRUE)
class(char_logical)
##
tricky <- c(1, 2, 3, "4")
class(tricky)
##
## ## Why do you think it happens?
##
## ## You've probably noticed that objects of different types get
## ## converted into a single, shared type within a vector. In R, we call
## ## converting objects from one class into another class
## ## _coercion_. These conversions happen according to a hierarchy,
## ## whereby some types get preferentially coerced into other types. Can
## ## you draw a diagram that represents the hierarchy of how these data
## ## types are coerced?

animals
animals[0]
animals[c(3,2)]
####use brackets to pull out specific values
weight_g <- c(50,60,70,80)
weight_g[c(TRUE,FALSE,TRUE,FALSE)]
weight_g>55
weight_g[weight_g<55 | weight_g>75] #### | means or and & means and
weight_g[weight_g<55 & weight_g>75]
####a single = is the same as an assignmnet arrow ( <- ) but it is better practice to use the arrow rather than the =
####a double equals sign (==) is a logical argument (ie. is the value of an object equal to something ex: mass == 95 ----would output TRUE)


heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

##NA is not an object, so nothing can be assigned to it, bt it is still a numeric --- if you do operations on datasets with an NA, you might need to remove them using the argument na.rm=TRUE

mean(heights) ##gives NA
mean(heights, na.rm=TRUE) 

# 1.
heights_no_na <- heights[!is.na(heights)]
heights_no_na <- heights[!is.na(heights)]

# or
heights_no_na <- na.omit(heights)

# 2.
median(heights, na.rm = TRUE)

# 3.
heights_above_67 <- heights_no_na[heights_no_na > 67]
length(heights_above_67)
## ###Challenge
## 1. Using this vector of heights in inches, create a new vector with the NAs removed.
##
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
heights_no_na <- heights[!is.na(heights)]

##
## 2. Use the function `median()` to calculate the median of the `heights` vector.
##
median(heights, na.rm=TRUE)
## 3. Use R to figure out how many people in the set are taller than 67 inches.
heights[c (heights > 67)]
heights_above_67 <- heights_no_na[heights_no_na > 67] 
length(heights_above_67)

### Presentation of the survey data
download.file("https://ndownloader.figshare.com/files/2292169",
              "data/portal_data_joined.csv")
####install package tidyverse
install.packages("tidyverse")
####must load the package using the library() function
library(tidyverse)
####read in the data using the read_csv() function
surveys <- read_csv("data/portal_data_joined.csv")
####surveys is a dataframe --a series of vectors that are the same length and make up a table (every column must be the same length and each column must have the same type of data)
####use the $ to call to a certain column in a dataframe

surveys$weight
str(surveys)

####get the dimensions of the dataframe
dim(surveys)
nrow(surveys)
ncol(surveys)
summary(surveys)


## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`?
## * How many rows and how many columns are in this object?
## * How many species have been recorded during these surveys?


## Indexing and subsetting data frames

####can subset dataframes using the bracket notation [rows,columns]
surveys[1,1]
surveys[4:7,2] ####gives the fourth through seventh rows of the dataframe and columns one and two





### Challenges:
###
### 1. Create a `data.frame` (`surveys_200`) containing only the
###    data in row 200 of the `surveys` dataset.
surveys_200 <- surveys [200,]
###
### 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
###
###      * Use that number to pull out just that last row in the data frame
###      * Compare that with what you see as the last row using `tail()` to make
###        sure it's meeting expectations.
###      * Pull out that last row using `nrow()` instead of the row number
###      * Create a new data frame object (`surveys_last`) from that last row
nrow(surveys)
surveys_last_row <- surveys [34786,]
tail(surveys)
tail(surveys_last_row)
surveys_last <- surveys[nrow(surveys),]
###
### 3. Use `nrow()` to extract the row that is in the middle of the
###    data frame. Store the content of this row in an object named
###    `surveys_middle`.

surveys_middle<-surveys [nrow(surveys)/2,]
###
### 4. Combine `nrow()` with the `-` notation above to reproduce the behavior of
###    `head(surveys)`, keeping just the first through 6th rows of the surveys
###    dataset.

surveys_head <- surveys[1:6,]
surveys_head <- surveys[-(7:nrow(surveys)),]

####select() function allows you to choose specific columns where the first argument is the dataframe name
select(surveys, month,day,year)
####use the filter() function to give specific rows
filter(surveys, genus=="Neotoma")


x <- select(surveys, month,day,year, genus)
filter(x,genus=="Neotoma")

surveys_before_1995<-surveys %>% 
  select(plot_id,weight,genus) %>% 
  filter(genus=="Neotoma")


## ## Pipes Challenge:

#### the pipe %>% passes to a new function without having to call to the dataframe again (use command + shift + m)


## ##  Using pipes, subset the data to include individuals collected
## ##  before 1995, and retain the columns `year`, `sex`, and `weight.`

surveys %>% 
  select(year, sex, weight) %>% 
  filter(year <="1995")

## ## Mutate Challenge:
## ##  Create a new data frame from the `surveys` data that meets the following
## ##  criteria: contains only the `species_id` column and a column that
## ##  contains values that are half the `hindfoot_length` values (e.g. a
## ##  new column `hindfoot_half`). In this `hindfoot_half` column, there are
## ##  no NA values and all values are < 30.
##
survey_id <- surveys %>% 
  mutate(surveys$hindfoot_half == (surveys$hindfoot_length/2) %>% 
  select(species_id,hindfoot_half)

## ##  Hint: think about how the commands should be ordered to produce this data frame!
  
  
  
## ## Count Challenges:
## ##  1. How many individuals were caught in each `plot_type` surveyed?
##
## ##  2. Use `group_by()` and `summarize()` to find the mean, min, and max
## ## hindfoot length for each species (using `species_id`). Also add the number of
## ## observations (hint: see `?n`).
##
## ##  3. What was the heaviest animal measured in each year? Return the
## ##  columns `year`, `genus`, `species_id`, and `weight`.
## ## Reshaping challenges
##
## ## 1. Make a wide data frame with `year` as columns, `plot_id`` as rows, and where the values are the number of genera per plot. You will need to summarize before reshaping, and use the function `n_distinct` to get the number of unique genera within a chunk of data. It's a powerful function! See `?n_distinct` for more.
##
## ## 2. Now take that data frame, and make it long again, so each row is a unique `plot_id` `year` combination
##
## ## 3. The `surveys` data set is not truly wide or long because there are two columns of measurement - `hindfoot_length` and `weight`.  This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let's walk through a common solution for this type of problem. First, use `gather` to create a truly long dataset where we have a key column called `measurement` and a `value` column that takes on the value of either `hindfoot_length` or `weight`. Hint: You'll need to specify which columns are being gathered.
##
## ## 4. With this new truly long data set, calculate the average of each `measurement` in each `year` for each different `plot_type`. Then `spread` them into a wide data set with a column for `hindfoot_length` and `weight`. Hint: Remember, you only need to specify the key and value columns for `spread`.
##
## ### Create the dataset for exporting:
## ##  Start by removing observations for which the `species_id`, `weight`,
## ##  `hindfoot_length`, or `sex` data are missing:
## surveys_complete <- surveys %>%
##     filter(species_id != "",        # remove missing species_id
##            !is.na(weight),                 # remove missing weight
##            !is.na(hindfoot_length),        # remove missing hindfoot_length
##            sex != "")                      # remove missing sex
##
## ##  Now remove rare species in two steps. First, make a list of species which
## ##  appear at least 50 times in our dataset:
## species_counts <- surveys_complete %>%
##     count(species_id) %>%
##     filter(n >= 50) %>%
##     select(species_id)
##
## ##  Second, keep only those species:
## surveys_complete <- surveys_complete %>%
##     filter(species_id %in% species_counts$species_id)


### Data Visualization with ggplot2
## install.packages("hexbin")
## library(hexbin)
## surveys_plot +
##  geom_hex()
## ### Challenge with hexbin
## ##
## ## To use the hexagonal binning with **`ggplot2`**, first install the `hexbin`
## ## package from CRAN:
##
## install.packages("hexbin")
## library(hexbin)
##
## ## Then use the `geom_hex()` function:
##
## surveys_plot +
##     geom_hex()
##
## ## What are the relative strengths and weaknesses of a hexagonal bin
## ## plot compared to a scatter plot?
## ## Challenge with boxplots:
## ##  Start with the boxplot we created:
## ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
##   geom_boxplot(alpha = 0) +
##   geom_jitter(alpha = 0.3, color = "tomato")
##
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
##
## ##  2. Represent weight on the log10 scale; see `scale_y_log10()`.
##
## ##  3. Create boxplot for `hindfoot_length` overlaid on a jitter layer.
##
## ##  4. Add color to the data points on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  *Hint:* Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
##
## ### Plotting time series challenge:
## ##
## ##  Use what you just learned to create a plot that depicts how the
## ##  average weight of each species changes through the years.
##
## ### Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://www.rstudio.com/wp-content/uploads/2015/08/ggplot2-cheatsheet.pdf

## Curriculum can be found at http://www.datacarpentry.org/R-ecology-lesson/