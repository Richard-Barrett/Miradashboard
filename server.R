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
library(googlesheets)
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

# Google Sheets for Synced Keys with Data Master
# ===============================================
handover <- gs_key("1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c")
cr_mw_data <- gs_key("1zkGdbsmvSDdSGX9lQaNXd230gxLAVi-LUXTX1RGDA7o")
sev3_sev4_data <- gs_key("1ga7s1vgMhYRNvr2WL6vjv_VRYtP5nI0aMoweLAjB6v4")
#all_alerts_data <- gs_key("Insert_Key")
cases_wo_key_5 <- gs_key("1BmCvll1cmp0chaBvZoz3Nwd4Yw-ObhHf7PvsvxOlnV8")
#sc_sev_1_cases <- gs_key("Insert_Key")
#subscriptios <- gs_key("Insert_Key")
bimonthly_ttr <- gs_key("1TiQeStsuwATHWxExV_Pdb2rSuOlOPB3KcYbPKFOj8VQ")
vw_ttr <- gs_key("1ysF3sgmFiEbZiiV3RXji8KyHmCfqSsAokFzg34xUT7o")
inspur <- gs_key("1VX5bih8KC51A0PLkOTinOzraes0PU3x8omDRvHJRtpY")
adobe <- gs_key("1XIaubw7hzquk1CJkum_LJbjq9ZJM14N4FEhOEVCeGdg")
apple <- gs_key("1fboC1GmhUtFEI3INFQhRbTNcA1lPtHHBGqK0Tpq74KE")
att <- gs_key("1xIG-dsadYyjvhr-7E0L2a76F1__61iqPI0F_gYYpTGk")
cox_com <- gs_key("1pAdvwhN3fkS9BIRXNpHhHfuxp5POtjqMWBR3Wvf3kgM")
#edgegravity <- gs_key("Insert_Key")
ericmediakind <- gs_key("1N-8I_kzPp8h6W0W3FE230p0Gr2bDjUctb3HWhxy6Aio")
#erictelefonaka <- gs_key("Insert_Key")
reliance <- gs_key("1YqCBF9R-RbP2obCdB6DoPvWnfsSe2eOfNBc9ElzgAE4")
vw_demo <- gs_key("1-721jfJGi2bjC_42TSikKrKNrDF1yefoociYo3p8lPc")
auto_vw <- gs_key("1t-vZ0mMUVYWJ8ML_Cje4-TlxXzpRrp3akDjedH0bgeo")  ## Data for VW SLA Tracker
#sharetome <- gs_key("Insert_Key")
#statestreet <- gs_key("Insert_Key")
# ===============================================

# Create Customer Data frames from Google Sheets
## ---------------------- Customer-Dataframes ----------------------- ##
for_gs_sheet <- gs_read(handover)
str(for_gs_sheet)

## ---------------------- End-Customer-Dataframes ----------------------- ##

## Basic Frames for common reports
for_gs_sheet_cases_wo_key_5 <- gs_read(cases_wo_key_5)
str(for_gs_sheet_cases_wo_key_5)

for_gs_bimonthly_ttr <- gs_read(bimonthly_ttr)
str(for_gs_bimonthly_ttr)

## ---------------------- Server-Logic ----------------------- ##

# Define server logic required to draw a histogram
shinyServer(function(input, output){ 
  set.seed(122)
  histdata <- rnorm(500)
  #auth.code <- oauth2.0_token(endpoint = oauth_endpoints("google"),
  #                            app = app,
  #                            scope = "https://www.googleapis.com/auth/userinfo.profile")
  
  #req <- GET("https://www.googleapis.com/oauth2/v1/userinfo",
  #           config(token = auth.code))
  
  
  #stop_for_status(req)
  #str(content(req))
  
  #google_app <- oauth_app(
  #  "google",
  #  key = "390198683818-i5fmprq9h09vcn6niu7v91bku2dvk1v5.apps.googleusercontent.com",
  #  secret = "bDkrVewW5eRxxSpdFH6Ka5mz"
  #)
  
  #oauth2.0_token(google_app)
  ## ---------- Google Authentication ---------- ##
  #gs_auth(token = NULL ,new_user = FALSE,
  #        key = getOption("390198683818-i5fmprq9h09vcn6niu7v91bku2dvk1v5.apps.googleusercontent.com"),
  #        secret = getOption("bDkrVewW5eRxxSpdFH6Ka5mz"),
  #        cache = getOption("googlesheets.httr_oauth_cache"), verbose = TRUE)
  
  gs_auth()
  
  for_gs_sheet <- gs_read(handover)
  str(for_gs_sheet)
  
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
  
