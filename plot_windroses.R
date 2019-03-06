#install.packages("openair")
require("openair")
require("ggplot2")

# read the file with default export naming (of today's export)
csvfile=paste("/tmp/influxdataexport.",Sys.Date(),".csv.gz",sep="")
d<-read.csv(csvfile)
summary(d)
d$timestamp=as.POSIXct(d$time/1000/1000/1000, origin = "1970-01-01", tz = "UTC")
# windRose(d, ws="wind_speed", wd="wind_direction")
#ggplot(d,aes(wind_angle,wind_speed))+geom_point()


pdf("windrose_plots.pdf")
for (cmpgn in unique(d$campaign)){
    for (dvcd in unique(d$deviceid)){
        
        my.statistic <- list("fun"=length,"unit" = "%","scale" = "all", "lab" = paste("campaign:",cmpgn, "deviceid:",dvcd) , "fun2" = function(x) signif(mean(x, na.rm = TRUE), 3), "lab2" = "mean","labcalm" = function(x) round(x, 1))

        windRose(d[d$deviceid==dvcd&d$campaign==cmpgn,], ws="WGA", wd="WRA", angle=10,statistic=my.statistic)
    #     windRose(d, ws="WGA", wd="WRA")
    }
}

dev.off()
