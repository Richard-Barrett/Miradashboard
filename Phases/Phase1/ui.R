#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Google Sheets Embedded and Used
# ===============================

#account_data <- ["https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=1750932163"]

# Define UI for application
if(interactive()){
  shinyUI(fluidPage(
    
    ## ui.R ##
    ## --------------------------------------------- Header Content ------------------------------------------------------##
    ui <-dashboardPage(skin = "blue",
                       
                       # -------------------- Loading-Screen -------------------- #
                       #useShinyjs(),
                       #inlineCSS(appCSS),
                       
                       #Loading message
                       #div(
                       #id = "loading-content",
                       #h2("Loading...")
                       #),
                       
                       #hidden(
                       #div(
                       #id = "app-content",
                       #p("This is a simple example of a Shiny app with a loading screen.")
                       #)
                       #)
                       
                       dashboardHeader(title = "Miradashboard",
                                       # This drop-down menu offers user and system administration within the application
                                       dropdownMenu(type = "messages",
                                                    messageItem(
                                                      from = "Sales Dept",
                                                      message = "Sales are steady this month."
                                                    ),
                                                    messageItem(
                                                      from = "New User",
                                                      message = "How do I register?",
                                                      icon = icon("question"),
                                                      time = "13:45"
                                                    ),
                                                    messageItem(
                                                      from = "Support",
                                                      message = "The new server is ready.",
                                                      icon = icon("life-ring"),
                                                      time = "2014-12-01"
                                                    )
                                       ),
                                       # This is a drop-down menu for checking notifications.
                                       # This should alert users of alerts that have not been merged to a case in the last 15 days.
                                       dropdownMenu(type = "notifications",
                                                    notificationItem(
                                                      text = "5 new users today",
                                                      icon("users")
                                                    ),
                                                    notificationItem(
                                                      text = "12 items delivered",
                                                      icon("truck"),
                                                      status = "success"
                                                    ),
                                                    notificationItem(
                                                      text = "Server load at 86%",
                                                      icon = icon("exclamation-triangle"),
                                                      status = "warning"
                                                    )
                                       ),
                                       # This is a drop-down menu for checking tasks.
                                       # This drop-down menu will eventually offer suggestions based off of ML Algorithms.
                                       dropdownMenu(type = "tasks", badgeStatus = "success",
                                                    taskItem(value = 90, color = "green",
                                                             "Documentation"
                                                    ),
                                                    taskItem(value = 17, color = "aqua",
                                                             "Project X"
                                                    ),
                                                    taskItem(value = 75, color = "yellow",
                                                             "Server deployment"
                                                    ),
                                                    taskItem(value = 80, color = "red",
                                                             "Overall project"
                                                    )
                                       ),
                                       dropdownMenu(type = "notifications", 
                                                    icon = icon("user-circle"),
                                                    notificationItem(
                                                      text = "User Information",
                                                      icon = icon("user-tag")
                                                    ),
                                                    notificationItem(
                                                      text = "Settings",
                                                      icon = icon("user-cog")
                                                    )
                                                    
                                       )
                       ),
                       ## --------------------------------------------- Sidebar Content ------------------------------------------------------##
                       dashboardSidebar(
                         sidebarMenu(
                           menuItem("Dashboard",
                                    tabName = "dashboard",
                                    icon = icon("dashboard")),
                           menuItem("Data", icon = icon("th"), href = "https://docs.google.com/spreadsheets/d/1ga7s1vgMhYRNvr2WL6vjv_VRYtP5nI0aMoweLAjB6v4/edit#gid=1342420852"),
                           menuItem("Widgets", icon = icon("th"), href = "https://shiny.rstudio.com/gallery/", newtab = FALSE),
                           menuItem("Mirantis Directory", icon = icon("sitemap") ,href = "https://directory.mirantis.com/#/resources/staffing"),
                           menuItem("Reports", tabName = "reports", icon = icon("chart-line"), startExpanded = FALSE,
                                    menuSubItem("All Alerts", tabName = "All Alerts", icon = icon("dna")),
                                    menuSubItem("All CR & MW", tabName = "All CR & MW", icon = icon("dna")),
                                    menuSubItem("Sev3 & Sev4 Data", tabName = "Sev3 & Sev4 Data", icon = icon("dna")),
                                    menuSubItem("SC Sev1 Cases", tabName = "SC Sev1 Cases", icon = icon("dna")),
                                    menuSubItem("Cases with Key 5 Updates", tabName = "Cases with Key 5 Updates", icon = icon("dna")),
                                    menuSubItem("Cases without Key 5 Updates", tabName = "Cases without Key 5 Updates", icon = icon("dna")),
                                    menuSubItem("Auto Refresh Execution Log", tabName = "Auto Refresh Execution Log", icon = icon("dna")),
                                    menuSubItem("L1 Oncall", tabName = "L1 Oncall", icon = icon("calendar-alt")),
                                    menuSubItem("TET Oncall", tabName = "TET Oncall", icon = icon("calendar-alt")),
                                    menuSubItem("SME Oncall", tabName = "SME Oncall", icon = icon("calendar-alt")),
                                    menuSubItem("AT&T Oncall", tabName = "AT&T Oncall", icon = icon("calendar-alt"))
                           ),
                           menuItem("OpsCare Clients", id = "Opscare", tabName = "OpsCare Clients", icon = icon("bar-chart-o"), startExpanded = FALSE,
                                    menuSubItem("All Cases", tabName = "All_Cases", icon = icon("bezier-curve")),
                                    menuSubItem("All Alerts", tabName = "All_Alerts", icon = icon("bezier-curve")),
                                    menuSubItem("TTR Metrics by Customer", tabName = "TTR_Metrics", icon = icon("bezier-curve"))
                           ),
                           menuItem("Top 10 Clients", id = "top_10_clients", tabName = "Top 10 Clients", icon = icon("bar-chart-o"), startExpanded = FALSE,
                                    menuSubItem("Adobe Systems", tabName = "Adobe_Systems", icon = icon("address-card")),
                                    menuSubItem("Apple Inc", tabName = "Apple_Inc", icon = icon("address-card")),
                                    menuSubItem("AT&T Inc", tabName = "ATT_Inc", icon = icon("address-card")),
                                    menuSubItem("Cox Communications", tabName = "Cox_Communications", icon = icon("address-card")),
                                    menuSubItem("Edge Gravity by Ericsson", tabName = "Edge_Gravity", icon = icon("address-card")),
                                    menuSubItem("Ericsson - Mediakind", tabName = "Ericsson_Mediakind", icon = icon("address-card")),
                                    menuSubItem("Ericcson Telefonaka", tabName = "Ericcson_Telefonaka", icon = icon("address-card")),
                                    menuSubItem("Inspur", tabName = "Inspur", icon = icon("address-card")),
                                    menuSubItem("Reliance", tabName = "Reliance", icon = icon("address-card")),
                                    menuSubItem("Shanghai Xietong (Sharetome)", tabName = "Sharetome", icon = icon("address-card")),
                                    menuSubItem("State Street Corporation", tabName = "State_Street_Corporation", icon = icon("address-card")),
                                    menuSubItem("Volkswaggen", tabName = "Volkswaggen", icon = icon("address-card")),
                                    menuSubItem("Add/Delete Clients", tabName = "Add_Clients", icon = icon("plus"))
                           ),
                           menuItem("ProdCare Clients", tabName = "ProdCare_Clients", icon = icon("bar-chart-o")),
                           menuItem("Alerts", tabName = "Alerts", icon = icon("bar-chart-o")),
                           menuItem("Change Requests", tabName = "Change_Requests", icon = icon("list-alt")),
                           menuItem("Maintenance Windows", tabName = "Maintenance_Windows", icon = icon("list-alt")),
                           menuItem("Rundeck", icon = icon("code"),
                                    href = "https://rundeck.suplab01.snv.mirantis.net/user/login"),
                           menuItem("Salesforce", icon = icon("database"),
                                    href = "https://mirantis.my.salesforce.com/"),
                           menuItem("Databases", icon = icon("php"),
                                    href = "http://172.16.241.171/phpmyadmin/"),
                           menuItem("Docker", icon = icon("docker")),
                           menuItem("Handovers", icon = icon("google"),
                                    href = "https://docs.google.com/spreadsheets/d/1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c/edit#gid=0"),
                           menuItem("Jump-Host Access", tabName = "Jump-Host Access", icon = icon("bars")),
                           menuItem("Mirantis HT Wiki", icon = icon("bars"),
                                    href = "https://mirantis.jira.com/wiki/spaces/2S/pages/1254621239/L1+-+General+Queue+Help+Desk+Team"),
                           menuItem("Slack", icon = icon("slack"), href = "https://miracloud.slack.com"),
                           menuItem("Gainsight", tabName = "Gainsight", icon = icon("industry")),
                           menuItem("Users", tabName = "Users", icon = icon("users")),
                           menuItem("Source code", icon = icon("github"),
                                    href = "https://github.com/Richard-Barrett/Miradashboard")
                         )),
                       ## --------------------------------------------- Body Content ------------------------------------------------------##
                       dashboardBody(
                         tabItems(
                           tabItem(tabName = "dashboard",
                                   h5("Main Dashboard Tab Content"),
                                   fluidRow(
                                     box(
                                       width = "750px",
                                       title = "Main Dashboard Content",
                                       background = "black",
                                       solidHeader = TRUE, 
                                       collapsible = TRUE,
                                       tabBox(
                                         title = "Visualization Trends",
                                         # The id lets us use input$tabset1 on the server to find the current tab
                                         id = "tabset1",
                                         height = "750px",
                                         width = "750px",
                                         tabPanel("First Response Met",
                                                  fluidRow(
                                                    align = "center",
                                                    h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                    box(
                                                      title = "Bar Chart", 
                                                      solidHeader = TRUE, 
                                                      collapsible = TRUE,
                                                      background = "red",
                                                      align = "center",
                                                      HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRNxLt1g_l9p2zDStK3lrj7iLkMruOzjFOr_ZUyoc4nJtXXpkp1TRc7sB83xjGpXLcLLUq8xH0B9iv1/pubchart?oid=1201606802&amp;format=interactive"></iframe>')
                                                    ),
                                                    box(
                                                      title = "Summary Analysis", 
                                                      solidHeader = TRUE, 
                                                      collapsible = TRUE,
                                                      background = "red",
                                                      align = "center",
                                                      HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=134814464&amp;format=interactive"></iframe>')
                                                      
                                                    )
                                                  )
                                         ),
                                         tabPanel("Cases w/o Key 5 Updates",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  align = "center",
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRNxLt1g_l9p2zDStK3lrj7iLkMruOzjFOr_ZUyoc4nJtXXpkp1TRc7sB83xjGpXLcLLUq8xH0B9iv1/pubchart?oid=1827778814&amp;format=interactive"></iframe>')
                                         )),
                                         tabPanel("SLA Percent Met Open",
                                                  align = "center",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1574130033&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("SLA Percent Met Pending",
                                                  align = "center",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                    h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=1750932163"),
                                                  HTML('<iframe width="600" height="371" align="center" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=216517026&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("SLA Percent Met On-Hold",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  align ="center",
                                                  HTML('<iframe width="600" height="371" align="center" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1307309230&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Overall CR & MW", "Insert Google Chart",
                                                  box(
                                                  align = "center",
                                                  background = "red",
                                                  h5("FIND URL AND INSERT LINK"),
                                                  HTML('<iframe width="600" height="371" align="center" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTq8JfC-o3VDDU303mHaT49nt_FGOHikF_GqLFvBS-le9-AYmBOTGDE5TPRh_XTS_iu4rAu4xdfKUzz/pubchart?oid=1004062925&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Top 10 Account Health"),
                                         tabPanel("Case Touches Per Engineer",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  HTML('<iframe width="600" height="371" align="center" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1705841753&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("L1 v. TET Queue Count",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=236723210&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Count of Violation Open Cases",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1574130033&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Overall Time to Resolution",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1973942920&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Summary Statistics",
                                                  box(
                                                    align = "center",
                                                    background = "red",
                                                  h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=0"),
                                                  align = "center",
                                                  HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1571106899&amp;format=interactive"></iframe>')
                                                  )),
                                         tabPanel("Upload Data",
                                                  tabBox(
                                                    titlePanel("Uploading Files"),
                                                    br(),
                                                    fileInput("file1", "Choose CSV File",
                                                              multiple = FALSE,
                                                              accept = c("text/csv",
                                                                         "text/comma-separated-values,text/plain",
                                                                         ".csv")),
                                                    
                                                    # Horizontal line ----
                                                    tags$hr(),
                                                    
                                                    # Input: Checkbox if file has header ----
                                                    checkboxInput("header", "Header", TRUE),
                                                    
                                                    # Input: Select separator ----
                                                    radioButtons("sep", "Separator",
                                                                 choices = c(Comma = ",",
                                                                             Semicolon = ";",
                                                                             Tab = "\t"),
                                                                 selected = ","),
                                                    
                                                    # Input: Select quotes ----
                                                    radioButtons("quote", "Quote",
                                                                 choices = c(None = "",
                                                                             "Double Quote" = '"',
                                                                             "Single Quote" = "'"),
                                                                 selected = '"'),
                                                    
                                                    # Horizontal line ----
                                                    tags$hr(),
                                                    
                                                    # Input: Select number of rows to display ----
                                                    radioButtons("disp", "Display",
                                                                 choices = c(Head = "head",
                                                                             All = "all"),
                                                                 selected = "head")
                                                  )
                                         ),
                                         tabPanel("+")
                                       )
                                     ),
                                     br(),
                                     br(),
                                     #box(plotOutput("plot1", height = 250)),
                                     #box(plotOutput("plot2", height = 250)),
                                     #box(plotOutput("plot3", height = 250)),
                                     #box(plotOutput("plot4", height = 250)),
                                     box(
                                       width = "750px",
                                       title = "Account Data",
                                       id = "account_data",
                                       background = "red",
                                       align = "center",
                                       solidHeader = TRUE, 
                                       collapsible = TRUE, 
                                       h5("https://docs.google.com/spreadsheets/d/1jGo4qH5Xw_uH59XFJEU3a7SOTV12GfPcq9Iin81KGuU/edit#gid=1750932163"),
                                       #htmlOutput("account_data"),
                                       #HTML('<iframe src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQhKvFE0uh_YR3o0fAIyh7fKZ4P_cd2oH9EKGY7HU4I-QG6GvUlHN7KKdQVXzEvtjn04I7TWyDM45pD/pubhtml?widget=true&amp;headers=false"></iframe>'),
                                       #HTML('<div data-iframe-height></div>')
                                       HTML('<iframe width="1200" height="450" frameborder="0" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubhtml?widget=true&amp;headers=false"></iframe>')
                                       #DT::dataTableOutput("mytable", width = "auto", height = "auto")
                                     ),
                                     br(),
                                     br(),
                                     br(),
                                     box(
                                       width = "750px",
                                       title = "Daily Sev 3 and Sev 4 Updates",
                                       id = "daily_sev_data",
                                       background = "red",
                                       align = "center",
                                       solidHeader = TRUE, 
                                       collapsible = TRUE, 
                                       h5("https://docs.google.com/spreadsheets/d/192hFS4Zx7S5q7vG0bAVOF9cusTC_8FoESUxCgRhdKF8/edit#gid=0"),
                                       #htmlOutput("account_data"),
                                       #HTML('<iframe src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQhKvFE0uh_YR3o0fAIyh7fKZ4P_cd2oH9EKGY7HU4I-QG6GvUlHN7KKdQVXzEvtjn04I7TWyDM45pD/pubhtml?widget=true&amp;headers=false"></iframe>'),
                                       #HTML('<div data-iframe-height></div>')
                                       HTML('<iframe width="1200" height="450" frameborder="0" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vT0kFyhW_eaCx3KZ-6FPnIXU_O_U-v9nHYczRMo6Lmd5ZzelklPSgs5I4MlX_WiLQhuab9vHZGYfzY7/pubhtml?widget=true&amp;headers=false"></iframe>')
                                       #DT::dataTableOutput("mytable", width = "auto", height = "auto")
                                     ),
                                     br(),
                                     br(),
                                     br(),
                                     #box(plotOutput("plot1", height = 250)),
                                     #box(gs_read(ss, ws = "handover")),
                                     #box(plotOutput("plot3", height = 250)),
                                     #box(plotOutput("plot4", height = 250)),
                                     
                                     #Example Attachment Box
                                     #box(
                                     #  title = "Attachment example",
                                     #  attachmentBlock(
                                     #    src = "http://kiev.carpediem.cd/data/afisha/o/2d/c7/2dc7670333.jpg",
                                     #    title = "Test",
                                     #    title_url = "http://google.com",
                                     #    "This is the content"
                                     #  )
                                     box(
                                       title = "Overall TTR", 
                                       background = "red", 
                                       solidHeader = TRUE, 
                                       collapsible = TRUE, 
                                       HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1868381473&amp;format=interactive"></iframe>')
                                       #plotOutput("plot1", height = 350)
                                     ),
                                     box(
                                       title = "Overall CR & MW Status", 
                                       background = "red", 
                                       solidHeader = TRUE, 
                                       collapsible = TRUE,
                                       plotOutput("plot2", height = 350)),
                                     box(
                                       title = "Controls",
                                       sliderInput("slider", "Cases over Time:", 2, 200, 50)
                                     ),
                                     infoBox("Sev3-4 Progress", 10 * 2,
                                             icon = icon("hashtag"),
                                             color = "red",
                                             width = 3,
                                             fill = TRUE),
                                     infoBox("Average TTR", 10 * 2,
                                             icon = icon("percent"),
                                             color = "red",
                                             width = 3,
                                             fill = TRUE)
                                     #infoBoxOutput("progressBox2"),
                                     #infoBoxOutput("approvalBox2")
                                     #box(
                                     #  title = "Histogram", background = "red", solidHeader = TRUE,
                                     #  plotOutput("plot4", height = 150)
                                     #)
                                   )
                           ),
                           tabItem(tabName = "OpsCare_Clients",
                                   h2("Insert Opscare Client Lists")
                           ),
                           tabItem(tabName = "ProdCare_Clients",
                                   h2("Prodcare Tab Content")
                           ),
                           tabItem(tabName = "Alerts",
                                   h2("Alerts Tab Content")
                           ),
                           tabItem(tabName = "Change_Requests",
                                   h2("Change Requests Tab Content")
                           ),
                           ## ------------ OpsCare Clients ---------------- ##
                           tabItem(tabName = "All_Cases",
                                   h1("Insert All_Cases Google Sheet")
                           ),
                           tabItem(tabName = "All_Alerts",
                                   h1("Insert All_Alerts Google Sheet")
                           ),
                           tabItem(tabName = "TTR_Metrics",
                                   h1("The TTR_Metrics Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable10", width = "auto", height = "auto")
                                   )
                           ),
                           ## ------------ Top 10 Clients ---------------- ##
                           tabItem(tabName = "Adobe_Systems",
                                   h1("The Adobe Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable8", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Apple_Inc",
                                   h1("The Apple Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable7", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "ATT_Inc",
                                   h1("The AT&T Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable9", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Cox_Communications",
                                   h1("The Cox Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable5", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Ericsson_Mediakind",
                                   h1("The Mediakind Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable6", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Ericcson_Telefonaka",
                                   h1("Insert The Ericcson_Telefonaka Google Sheet")
                           ),
                           tabItem(tabName = "Edge_Gravity",
                                   h1("CLIENT IS NOT YET ONBOARDED")
                           ),
                           tabItem(tabName = "Inspur",
                                   h1("The Inspur Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable4", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Reliance",
                                   h1("The Reliance Google Sheet"),
                                   fluidRow(
                                     #DT::dataTableOutput("mytable3", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Sharetome",
                                   h1("CLIENT IS NOT YET ONBOARDED")
                           ),
                           tabItem(tabName = "State_Street_Corporation",
                                   h1("CLIENT IS NOT YET ONBOARDED")
                           ),
                           tabItem(tabName = "Volkswaggen",
                                   h1("The VW Google Sheet"),
                                   fluidRow(
                                     tabBox(
                                       id = "VWA",
                                       height = "500px",
                                       width = "750px",
                                       tabPanel("Count of Cloud",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=787540835&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Count of Cloud",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=787540835&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Count of Case Status",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1245795997&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Count of Severity Level",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=28739513&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Distribution of Status",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=890459270&amp;format=interactive"></iframe>')
                                       )
                                     ),
                                     tabBox(
                                       id = "VWB",
                                       height = "500px",
                                       width = "750px",
                                       tabPanel("Agent Report Time",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=563811911&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Age vs. Mirantis Response",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=2086505264&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Customer && Mirantis Wait",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=885164913&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Case Violation over Time",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=88368172&amp;format=interactive"></iframe>')
                                       )
                                     ),
                                     tabBox(
                                       id = "VWC",
                                       height = "500px",
                                       width = "750px",
                                       tabPanel("Compute",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1697665214&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Storage",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1573719008&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Controllers",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1272974501&amp;format=interactive"></iframe>')
                                       ),
                                       tabPanel("Count of Nodes",
                                                HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=100650085&amp;format=interactive"></iframe>')
                                       )
                                     )
                                   ),
                                   fluidRow(
                                     box(width = "750px",title = "Count of Actual Resolution Met", background = "red", solidHeader = TRUE, align = "center",
                                         HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1695935826&amp;format=interactive"></iframe>')
                                     ),
                                     box(width = "750px",title = "Count of Actual Response Met", background = "red", solidHeader = TRUE, align = "center",
                                         HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1680885140&amp;format=interactive"></iframe>')
                                     ),
                                     box(width = "750px",title = "Bar Count for Resolution", background = "red", solidHeader = TRUE, align = "center",
                                         HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=543988029&amp;format=interactive"></iframe>')
                                     ),
                                     box(width = "750px",title = "Bar Count of Actual Response", background = "red", solidHeader = TRUE, align = "center",
                                         HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vRewlZFMLuVy2n8kqzM5yJdDsEUP0p9gFKy47Wi_EvHckd4r_NbYC_VRR13rynX2FxRnRuRrrnEyfMu/pubchart?oid=1133411936&amp;format=interactive"></iframe>')
                                     )
                                   ),
                                   fluidRow(
                                     tabBox(
                                       height = "500px",
                                       width = "750px",
                                       id = "VWDT",
                                       tabPanel("VW Output",
                                                h5("https://docs.google.com/spreadsheets/d/1t-vZ0mMUVYWJ8ML_Cje4-TlxXzpRrp3akDjedH0bgeo/edit#gid=0")
                                                #DT::dataTableOutput("mytable2", width = "auto", height = "auto")
                                       ),
                                       tabPanel("VW DEMO",
                                                h5("https://docs.google.com/spreadsheets/d/1-721jfJGi2bjC_42TSikKrKNrDF1yefoociYo3p8lPc/edit#gid=0")
                                                #DT::dataTableOutput("vw_demo", width = "auto", height = "auto")
                                       ),
                                       tabPanel("SLA VW Tracking",
                                                h5("https://docs.google.com/spreadsheets/d/1t-vZ0mMUVYWJ8ML_Cje4-TlxXzpRrp3akDjedH0bgeo/edit#gid=0")
                                                #DT::dataTableOutput("auto_vw", width = "100%", height = "auto")
                                                
                                       )
                                     )
                                   )
                           ),
                           tabItem(tabName = "Maintenance_Windows",
                                   h2("Maintenance Windows Tab Content"),
                                   fluidRow(
                                     DT::dataTableOutput("mytable1", width = "auto", height = "auto")
                                   )
                           ),
                           tabItem(tabName = "Databases"
                           ),
                           tabItem(tabName = "Jump-Host Access",
                                   h2("Jump-Host Access Tab Content")
                           ),
                           tabItem(tabName = "Users",
                                   h2("Users Tab Content"),
                                   fluidRow(
                                     tabBox(
                                       title = "Admin/User Panel",
                                       # The id lets us use input$tabset1 on the server to find the current tab
                                       id = "tabset3", height = "500px", width = "750px",
                                       tabPanel("Admins", "First Tab Content 1"),
                                       tabPanel("Users", "First Tab Content 2")
                                     ))
                                   
                           )
                           
                         ),
                         br(),
                         h5("Built with",
                            img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
                            "by",
                            img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px"),
                            "!"),
                         br()
                       )
    )
  ))
}
