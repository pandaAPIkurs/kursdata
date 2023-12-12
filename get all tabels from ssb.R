#Henter inn bibliotek
library(httr)
library(rjstat)



k<-1

MytabKostra<-data.frame(matrix(ncol=1, nrow=0))
MytabKostra<-data.frame(matrix(ncol=1, nrow=0))
MytabUten<-data.frame(matrix(ncol = 1, nrow=0))

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
          "filter": "all",
          "values": [
            "*"
          ]
        }
      },
      {
        "code": "Tid",
        "selection": {
          "filter": "top",
          "values": [
            "1"
          ]
        }
      }
    ],
    "response": {
      "format": "json-stat2"
    }
  }'


dataKostra<-'{
  "query": [
    {
      "code": "KOKkommuneregion0000",
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
        "filter": "all",
        "values": [
          "*"
        ]
      }
    },
    {
      "code": "Tid",
      "selection": {
        "filter": "all",
        "values": [
          "*"
        ]
      }
    }
  ],
  "response": {
    "format": "json-stat2"
  }
}
'

for (i in 12004:15000) {
  
  num<-as.character(i)
  while(nchar(num)<5) {
    num<-paste0("0", num)
  }
  url<-paste0('https://data.ssb.no/api/v0/no/table/', num)
  print(num)
  print(url)
  
  
  temp <- POST(url , body = dataKostra, encode = "json", verbose())
  if (temp$status_code==200) {
    MytabKostra[k, 1]<-num
    k<-k+1
  }
  
  Sys.sleep(2)
  i<-i+1
}




length(num)
length()

url<-'https://data.ssb.no/api/v0/no/table/13144/'
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
        "filter": "all",
        "values": [
          "*"
        ]
      }
    },
    {
      "code": "Tid",
      "selection": {
        "filter": "top",
        "values": [
          "1"
        ]
      }
    }
  ],
  "response": {
    "format": "json-stat2"
  }
}'

temp <- POST(url , body = data, encode = "json", verbose())
temp$status_code



a<-content(temp)
a$updated



fromJSONstat(content(temp, "text"),naming = "id", use_factors = F)
library (PxWebApiData)
ApiData(url, 
        ContentsCode = c("Priser","Faste","PriserSesJust"), 
        Makrost = c("koh.nrpriv","koo.nroff","bif.nr83_6","makrok.nrianv","eks.nrtot","imp.nrtot","bnpb.nr23_9","bnpb.nr23_9fn","bnpb.nr23oljsj"),
        Tid = 8i,
        returnDataSet = 1)

