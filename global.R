#recentdata <- file.info(list.files("C:/Users/Darren Levett/Desktop/RComplete/")) 
#data <- read.csv(paste(path="C:/Users/Darren Levett/Desktop/RComplete", rownames(newest)[order(files$mtime)][nrow(newest)], sep = ""))


data <-read.csv("UK_Accidents.csv")

#data from https://www.kaggle.com/tsiaras/uk-road-safety-accidents-and-vehicles