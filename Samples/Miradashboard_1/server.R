#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(rsconnect)
#library(shinydashboardPlus)
library(shinydashboard)
#library(shiny)
library(googleAuthR)
library(shiny)
library(shinyjs)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
    ### Authentication Functions ########################################################
  ##
  ##   AuthCode() - checks for presence of code in URL
  ##   AccessToken() - creates a token once a code is available
  ##   ShinyMakeGAProfileTable - the table of profiles taken from API
  ##   output$AuthGAURL - creates the authentication URL
  ##   output$GAProfile - table of the profiles belonging to user
  
  AuthCode  <- reactive({
  
   ## gets all the parameters in the URL. Your authentication code should be one of them
    pars <- parseQueryString(session$clientData$url_search) 
    
    if(length(pars$code) > 0){
      return(pars$code)
    } 
  })
  
  AccessToken <- reactive({ 
    validate(
      need(AuthCode(), "Authenticate To See")
      )
      access_token <- ShinyGetToken(code = AuthCode())
    
      token <- access_token$access_token
  })
  
  output$AuthGAURL <- renderUI({
    a("Click Here to Authorise Your Google Analytics Access", href=ShinyGetTokenURL())
  })
  
  ShinyMakeGAProfileTable <- reactive({

    token <- AccessToken()

  # List Server Output whereby plot[1-#] is the plot box output in UI above.
  # Server Output occurds and is defined by data variables
  # histdata[seq_len(input$slider)] defines slider utilization
  # hist(data) defines histogram off of "data"te
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


## END server.R ##
}) 
    
