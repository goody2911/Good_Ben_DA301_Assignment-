# Import the data set.

# Import the tidyverse library.
library(tidyverse)

# Import a CSV file and choose turtle_sales.csv
data <- read.csv(file.choose(), header=T)

# Print the data frame.
data
head(data)

# Remove redundant columns (Ranking, Year, Genre, Publisher)

# Drop unnecessary columns.
data_df <- subset(data, select=-c(1,4,5,6))

head(data_df)

# Visualise the Data Set
# Scatterplots
qplot(Platform, NA_Sales, data = data_df)

qplot(Platform, EU_Sales, data = data_df)

qplot(Platform, Global_Sales, data = data_df)

#Histograms
qplot(NA_Sales, bins=10, data=data_df)

qplot(EU_Sales, bins=10, data=data_df)

qplot(Global_Sales, bins=10, data=data_df)

#Boxplots
boxplot(data_df$NA_Sales)

boxplot(data_df$EU_Sales)

boxplot(data_df$Global_Sales)

# Scatterplots seem to be the best way of visualising due to the individualistic 
# nature of the data


# min max mean of sales data.

# Call the function to calculate the mean.
mean(data$NA_Sales) 
mean(data$EU_Sales) 
mean(data$Global_Sales) 

# Call the function to calculate the min.

min(data$NA_Sales) 
min(data$EU_Sales) 
min(data$Global_Sales) 

# Call the function to calculate the max.

max(data$NA_Sales) 
max(data$EU_Sales) 
max(data$Global_Sales)

# Summary of data frame

summary(data)

# Impact on Sales per product id

# aggregate sum of sales with products

Global_Sales_per_Product_ID <- print(aggregate(data$Global_Sales, list(data$Product), FUN=sum))
head(Global_Sales_per_Product_ID)

NA_Sales_per_Product_ID <- print(aggregate(data$NA_Sales, list(data$Product), FUN=sum))
head(NA_Sales_per_Product_ID)

EU_Sales_per_Product_ID <- print(aggregate(data$EU_Sales, list(data$Product), FUN=sum))
head(EU_Sales_per_Product_ID)

# Changing Column names and Summary of new data frame

colnames(Global_Sales_per_Product_ID) <- c("Product_id", "Global_Sales")
Global_Sales_per_Product_ID

colnames(NA_Sales_per_Product_ID) <- c("Product_id", "NA_Sales")
NA_Sales_per_Product_ID

colnames(EU_Sales_per_Product_ID) <- c("Product_id", "EU_Sales")
EU_Sales_per_Product_ID

summary(Global_Sales_per_Product_ID)

summary(NA_Sales_per_Product_ID)

summary(EU_Sales_per_Product_ID)

# Scatterplot, boxplot and histogram of sales data

# Scatterplot

qplot(NA_Sales, Product_id, data = NA_Sales_per_Product_ID)

qplot(EU_Sales, Product_id, data = EU_Sales_per_Product_ID)

qplot(Global_Sales, Product_id, data = Global_Sales_per_Product_ID)

#Histogram

qplot(NA_Sales, bins=10, data=NA_Sales_per_Product_ID)

qplot(EU_Sales, bins=10, data=EU_Sales_per_Product_ID)

qplot(Global_Sales, bins=10, data=Global_Sales_per_Product_ID)

#Boxplot

boxplot(NA_Sales_per_Product_ID$NA_Sales)

boxplot(EU_Sales_per_Product_ID$EU_Sales)

boxplot(Global_Sales_per_Product_ID$Global_Sales)

# Scatterplot seems to be the best way of visulising this data set again due
# due to the large amount of different product_id's

# Normality of datasets

# Shapiro-Wilk Test

shapiro.test(NA_Sales_per_Product_ID$NA_Sales)

shapiro.test(EU_Sales_per_Product_ID$EU_Sales)

shapiro.test(Global_Sales_per_Product_ID$Global_Sales)

# Skewness and Kurtosis
# Install the moments package and load the library.
install.packages('moments') 
library(moments)

skewness(NA_Sales_per_Product_ID$NA_Sales) 
kurtosis(NA_Sales_per_Product_ID$NA_Sales)

skewness(EU_Sales_per_Product_ID$EU_Sales) 
kurtosis(EU_Sales_per_Product_ID$EU_Sales)

skewness(Global_Sales_per_Product_ID$Global_Sales) 
kurtosis(Global_Sales_per_Product_ID$Global_Sales)

# Correlation between sales data columns

cor(NA_Sales_per_Product_ID$NA_Sales, EU_Sales_per_Product_ID$EU_Sales)
cor(NA_Sales_per_Product_ID$NA_Sales, Global_Sales_per_Product_ID$Global_Sales)
cor(EU_Sales_per_Product_ID$EU_Sales, Global_Sales_per_Product_ID$Global_Sales)