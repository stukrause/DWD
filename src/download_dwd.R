# https://bookdown.org/brry/rdwd/

#install.packages("rdwd")
library(rdwd)
# be sure to run this to get updated file paths
rdwd::updateRdwd()

# https://bookdown.org/brry/rdwd/available-datasets.html
files <- indexFTP("hourly/air_temperature", dir = "./data/")
files
# RH is also inlcuded so no extra query required
at_hist <- selectDWD(res="hourly", var="air_temperature", per="hist")
at_rec <- selectDWD(res="hourly", var="air_temperature", per="recent")

at_hist_d <- dataDWD(at_hist[10], dir = "./data/")
at_rec_d <- dataDWD(at_hist, dir = "./data/")

at_hist_d$MESS_DATUM <- as.POSIXct(at_hist_d$MESS_DATUM, format = "%Y-%m-%d %H:%M:%S")
tail(at_hist_d)
at_hist_d


unzip

# select only the relevant files:
data("metaIndex")
myIndex <- metaIndex[
  metaIndex$von_datum < as.Date("2016-01-01") &
    metaIndex$bis_datum > as.Date("2022-12-31") & metaIndex$hasfile   ,  ]
data("fileIndex")    
links <- fileIndex[
  suppressWarnings(as.numeric(fileIndex$id)) %in% myIndex$Stations_id &
    fileIndex$res=="hourly" &
    fileIndex$var=="air_temperature" &
    fileIndex$per=="historical", "path" ]  

length(links) # ca 2k elements - much better
