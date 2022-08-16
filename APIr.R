#Henter inn bibliotek
library(httr)
library(rjstat)

#Pendling
url<-'https://data.ssb.no/api/v0/no/table/11616/'
data<-'{
  "query": [
    {
      "code": "Region",
      "selection": {
        "filter": "all",
        "values": [
          "*"
        ]
      }
    },
    {
      "code": "ContentsCode",
      "selection": {
        "filter": "item",
        "values": [
          "Innpendlere",
          "Utpendlere"
        ]
      }
    },
    {
      "code": "Tid",
      "selection": {
        "filter": "item",
        "values": [
          "2015",
          "2016",
          "2017",
          "2018",
          "2019",
          "2020"
        ]
      }
    }
  ],
  "response": {
    "format": "json-stat2"
  }
}'

temp <- POST(url , body = data, encode = "json", verbose())
a<-content(temp)
a$updated

fromJSONstat(content(temp, "text"),naming = "id", use_factors = F)
library (PxWebApiData)
ApiData(url, 
        ContentsCode = c("Priser","Faste","PriserSesJust"), 
        Makrost = c("koh.nrpriv","koo.nroff","bif.nr83_6","makrok.nrianv","eks.nrtot","imp.nrtot","bnpb.nr23_9","bnpb.nr23_9fn","bnpb.nr23oljsj"),
        Tid = 8i,
        returnDataSet = 1)

