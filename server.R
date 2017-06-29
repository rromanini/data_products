#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  #Dataset simulation
  brasilAccidents <-data.frame(
    lat= c(-23.5674,-10.7444,-22.6444,-16.4406,-23.4917,-16.5408,-3.2592,-0.8669,-21.8000,-3.0411),
    lng = c(-46.5704,-53.5203,-42.3203,-52.0042,-46.6444,-39.1078,-60.6719,-52.6436,-43.3869,-60.0506),
    vitim = c(199,154,19,8,8,14,24,10,8,7),
    ano=c(2007,2006,2006,2012,2007,2009,2009,2013,2012,2011),
    classAcident = c(10,10,5,1,1,5,5,5,1,1))
  

  
  
  #Rendering the map
  output$mymap <- renderLeaflet({
    
    brasilAccidents2 <- brasilAccidents[brasilAccidents$vitim >= input$qtdVictims[1] & brasilAccidents$vitim <= input$qtdVictims[2],]
    
    brasilAccidents2 %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(popup = paste(as.character(brasilAccidents2$vitim),"victims"),clusterOptions=markerClusterOptions())%>%
      addCircles(weight=1,radius = brasilAccidents2$vitim * 500)
  })
  
})
