#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinyjs)
library(googlesheets)
library(googlesheets4)
library(googleCharts)
library(googleAuthR)
library(stats)
library(searchConsoleR)
library(googleAnalyticsR)
library(httr)
library(dplyr)
library(plyr)
library(mosaic)
library(DT)
library(httpuv)
library(htmltools)


#options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/spreadsheets")
#service_token <- gar_auth_service(json_file="~/miradashboard-f89f243d0221.json")

account_data_link<-("https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubhtml")

# Define server logic required to draw a histogram
#if(interactive()){
shinyServer(function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  account_data_link<-("https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubhtml")
  
  output$googleSheet <- renderUI({
    tags$iframe(id = "account_data",
                src = account_data_link,
                width = 750,
                height = 500,
                frameborder = 0,
                marginheight = 0)
  })
    
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  output$plot2 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  output$plot3 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  output$plot4 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  output$plot5 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
})
#}
