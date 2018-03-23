library(plyr)  
gtd <- read.csv("globalterrorismdb.csv", header = TRUE, na.strings = c("", "."))
dim(gtd)
columnsKeep <- c("iyear", "imonth", "country_txt", "region_txt", "city",
                 "attacktype1_txt", "nkill", )
gtd <- dat[columnsKeep]
gtd <- rename(dat, c("iyear" = "year", "imonth" = "month",
                     "country_txt" = "country", "region_txt" = "region", "attacktype1_txt" = "attacktype"))
gtd <- within(dat, attacktype <- revalue(attacktype,
                                         c("Hostage Taking (Kidnapping)" = "Hostage (Kidnapping)",
                                           "Facility/Infrastructure Attack" = "Facility Attack",
                                           "Hostage Taking (Barricade Incident)" = "Hostage (Barricade)"
                                           )))
gtd <- within(dat, region <- revalue(region,
                                     c("Australasia & Oceania" = "Oceania",
                                       "Central America & Caribbean" = "Central America",
                                       "Middle East & North Africa" = "Middle East")))
write.table(dat, "gdcleant.csv", sep=",", col.names=TRUE, row.names=FALSE,
            quote=which(colnames(dat) == 'city'))