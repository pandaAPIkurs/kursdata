
library(XML)
library(rvest)
ee<-read_html("https://www.ssb.no/kalender")
wewe<-ee %>%
  html_nodes("table") %>%
  html_text()
wewe

read.table("https://www.ssb.no/kalender")
read_xml("https://www.ssb.no/kalender")
ww<-read.csv("https://www.ssb.no/kalender")
readHTMLTable
readHTMLList("https://www.ssb.no/kalender")
