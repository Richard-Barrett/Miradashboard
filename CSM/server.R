#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

## app.R ##
library(shinydashboardPlus)                           ## Library for Shinydashboardplus
library(shinydashboard)                               ## Library for Shinydashboard
library(shiny)                                        ## Library for Shiny
library(rsconnect)                                    ## Libraryfor Shinny Rsconnect or publish to shinyapps.io
library(RCurl)                                        ##
library(httr)                                         ##
library(dplyr)                                        ##
library(mosaic)                                       ##
library(DT)                                           ## Library to manipulate and rendeer Data Tables
library(googleCharts)                                 ## Library to Manipulate Google Charts that have been published
library(googlesheets)                                 ## Library to maniupalte Google Sheets owned by the user and/or organization

# Google Vis Package and Suppression Message
library(googleVis)                                    ##
suppressPackageStartupMessages(library(googleVis))    ##
#library(fontawesome)                                 ## Library for the icons used within the menuItems
library(ggplot2)                                      ## Library for ggplot
library(salesforcer)                                  ## Library for Salesforce API
#library(rJava)
library(stats)

## Google Authenticaton
## ---------------------------- google-authentication ------------------------------- ##
## Notes:
## To use google authentication to get into the applicaiton and user interface
## You will need to uncomment out the 1,2, and 3.
library(googleAuthR)
library(googleAnalyticsR)
library(searchConsoleR)

#options(httr_oob_default=TRUE)
#googleAuthR::gar_auth()
#googleAuthR::gar_auth(new_user=TRUE)

options(httr_oob_default=TRUE) 
gs_auth(new_user = TRUE) 
gs_ls()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    rv <- reactiveValues(
        login = FALSE
    )

    ## Authentication
    accessToken <- callModule(googleAuth, "gauth_login",
        login_class = "btn btn-primary",
        logout_class = "btn btn-primary")
    userDetails <- reactive({
        validate(
            need(accessToken(), "not logged in")
        )
        rv$login <- TRUE
        with_shiny(get_user_info, shiny_access_token = accessToken())
    })


options(httr_oob_default=TRUE)
googleAuthR::gar_auth()
googleAuthR::gar_auth(new_user=TRUE)
options(googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/drive.file"))
options("googleAuthR.webapp.client_id" = '390198683818-i5fmprq9h09vcn6niu7v91bku2dvk1v5.apps.googleusercontent.com')
options("googleAuthR.webapp.client_secret" = 'B6VEB3y1UCCwwkFn01Pu4fK5')

  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  output$mytable = DT::renderDataTable({
    df <- gs_read(handover)
  })
  
  output$mytable1 = DT::renderDataTable({
    df <- gs_read(sev3_sev4_data)
  })
  
  output$mytable2 = DT::renderDataTable({
    df <- gs_read(vw_ttr)
  })
  
  output$vw_demo = DT::renderDataTable({
    df <- gs_read(vw_demo)
  })
  
  output$mytable3 = DT::renderDataTable({
    df <- gs_read(reliance)
  })
  
  output$mytable4 = DT::renderDataTable({
    df <- gs_read(inspur)
  })
  
  output$mytable5 = DT::renderDataTable({
    df <- gs_read(cox_com)
  })
  
  output$mytable6 = DT::renderDataTable({
    df <- gs_read(ericmediakind)
  })
  
  output$mytable7 = DT::renderDataTable({
    df <- gs_read(apple)
  })
  
  output$mytable8 = DT::renderDataTable({
    df <- gs_read(adobe)
  })
  
  output$mytable9 = DT::renderDataTable({
    df <- gs_read(att)
  })
  
  output$mytable10 = DT::renderDataTable({
    df <- gs_read(cases_wo_key_5)
  })
  
  output$auto_vw = DT::renderDataTable({
    df <- gs_read(auto_vw)
  })
  
  # List Server Output whereby plot[1-#] is the plot box output in UI above.
  # Server Output occurs and is defined by data variables
  # histdata[seq_len(input$slider)] defines slider utilization
  # hist(data) defines histogram off of "data"
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

