#This script takes a baltimore address that looks like "1234 Keswick Drive", 
#adds in the city "Baltimore" the corresponding zip code
#Possibly census tract
#longitude and latitude
#City council district, and Neighborhood

##Packages
#install.packages('zipcodeR')
#https://www.gavinrozzi.com/post/an-r-package-for-zip-codes/

#maybe this was a bad one. 

#https://stackoverflow.com/questions/59583943/r-get-zipcode-from-just-street-name-city-and-state
# USPS Shipping API: 
# For Company:  Goucher College
# Your Username is 876GOUCH1113
# Your Password is 204SN44QV936
# library(rusps)
# library(XML)
# username <- 'XXXYYYYYZZZZ'

#Maybe we try tidygeocoder without the zip codes?
#install.packages(dplyr)
#install.packages(tidyverse)
#install.packages(tidygeocoder)
library(dplyr)
library(tidyverse)
library(tidygeocoder)

dc_addresses <- tribble( ~name,~addr,
                         "White House", "1600 Pennsylvania Ave Washington, DC",
                         "National Academy of Sciences", "2101 Constitution Ave NW, Washington, DC 20418",
                         "Department of Justice", "950 Pennsylvania Ave NW, Washington, DC 20530",
                         "Supreme Court", "1 1st St NE, Washington, DC 20543",
                         "Washington Monument", "2 15th St NW, Washington, DC 20024")

coordinates <- dc_addresses %>%
  geocode(addr)


dc_addresses2 <- tribble( ~name,~addr,
                         "White House", "1600 Pennsylvania Ave Washington, DC",
                         "National Academy of Sciences", "2101 Constitution Ave NW, Washington, DC ",
                         "Department of Justice", "950 Pennsylvania Ave NW, Washington, DC ",
                         "Supreme Court", "1 1st St NE, Washington, DC ",
                         "Washington Monument", "2 15th St NW, Washington, DC ")

coordinates2 <- dc_addresses2 %>%
  geocode(addr)
