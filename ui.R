#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Brazil Air Accidents Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Number of Victims"),
       sliderInput("qtdVictims",
                   "Choose the minimum and maximum number of Victims:",
                   min = 1,
                   max = 200,
                   value = c(1,200)),
      em("The filter above allow you to search for Brazil Air Accidents, choosing the number of victims."),
      em("You only need to select the minimum number of victims and the maximum number. The map will change automatically.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("mymap"),
      p()
      
    )
  )
))
