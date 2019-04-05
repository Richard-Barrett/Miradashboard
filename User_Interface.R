#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

## app.R ##
library(shinydashboardPlus)
library(shinydashboard)
library(shiny)
library(rsconnect)
library(googlesheets)
library(RCurl)
library(httr)
library(dplyr)
library(mosaic)
library(DT)
library(googleCharts)
library(fontawesome)

Logged <- FALSE;
LoginPass <- 0; #0: not attempted, -1: failed, 1: passed

login <- box(title = "Login",textInput("userName", "Username (user)"),
             passwordInput("passwd", "Password (test)"),
             br(),actionButton("Login", "Log in"))

loginfail <- box(title = "Login",textInput("userName", "Username"),
                 passwordInput("passwd", "Password"),
                 p("Username or password incorrect"),
                 br(),actionButton("Login", "Log in"))


# Google Sheets for Synced Keys with Data Master
gs_auth(new_user = FALSE)
handover <- gs_key("1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c")
#cr_mw_data <- gs_key("Insert_Key")
sev3_sev4_data <- gs_key("1ga7s1vgMhYRNvr2WL6vjv_VRYtP5nI0aMoweLAjB6v4")
#all_alerts_data <- gs_key("Insert_Key")
#case_wo_key_5 <- gs_key("Insert_Key")
#sc_sev_1_cases <- gs_key("Insert_Key")
#subscriptios <- gs_key("Insert_Key")
bimonthly_ttr <- gs_key("1TiQeStsuwATHWxExV_Pdb2rSuOlOPB3KcYbPKFOj8VQ")


for_gs_sheet <- gs_read(handover)
str(for_gs_sheet)

for_gs_sheet <- gs_read(sev3_sev4_data)
str(for_gs_sheet)

for_gs_sheet <- gs_read(bimonthly_ttr)
str(for_gs_sheet)

## Identifies the Google Sheet in Question
## handover_sheet = gs_url("https://docs.google.com/spreadsheets/d/1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c/edit#gid=0")
## bimonthly_ttr = gs_url("https://docs.google.com/spreadsheets/d/1TiQeStsuwATHWxExV_Pdb2rSuOlOPB3KcYbPKFOj8VQ/edit#gid=0")
#shinyApp(ui = ui, server = server, options = list(height = 1080))

ui <- dashboardPage(skin = "red",
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
                                    )
                    ),
                    
                    dashboardSidebar(
                      ## Sidebar content
                      dashboardSidebar(
                        sidebarMenu(
                          sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                                            label = "Search..."),
                            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
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
                            menuItem("OpsCare Clients", tabName = "OpsCare Clients", icon = icon("bar-chart-o"), startExpanded = FALSE,
                                   menuSubItem("All Cases", tabName = "All Cases", icon = icon("bezier-curve")),
                                   menuSubItem("All Alerts", tabName = "All Alerts", icon = icon("bezier-curve")),
                                   menuSubItem("TTR Metrics by Customer", tabName = "TTR Metrics by Customer", icon = icon("bezier-curve"))
                                   ),
                            menuItem("Top 10 Clients", tabName = "Top 10 Clients", icon = icon("bar-chart-o"), startExpanded = FALSE,
                                   menuSubItem("Adobe Systems", tabName = "Adobe Systems", icon = icon("address-card")),
                                   menuSubItem("Apple Inc", tabName = "Apple Inc", icon = icon("address-card")),
                                   menuSubItem("AT&T Inc", tabName = "AT&T Inc", icon = icon("address-card")),
                                   menuSubItem("Cox Communications", tabName = "Cox Communications", icon = icon("address-card")),
                                   menuSubItem("Edge Gravity by Ericsson", tabName = "Edge Gravity by Ericsson", icon = icon("address-card")),
                                   menuSubItem("Ericsson - Mediakind", tabName = "Ericsson - Mediakind", icon = icon("address-card")),
                                   menuSubItem("Ericcson Telefonaka", tabName = "Ericcson Telefonaka", icon = icon("address-card")),
                                   menuSubItem("Inspur", tabName = "Inspur", icon = icon("address-card")),
                                   menuSubItem("Reliance", tabName = "Reliance", icon = icon("address-card")),
                                   menuSubItem("Shanghai Xietong (Sharetome)", tabName = "Shanghai Xietong (Sharetome)", icon = icon("address-card")),
                                   menuSubItem("State Street Corporation", tabName = "State Street Corporation", icon = icon("address-card")),
                                   menuSubItem("Volkswaggen", tabName = "Volkswaggen", icon = icon("address-card")),
                                   menuSubItem("Other Clients", tabName = "Other Clients", icon = icon("address-card"))
                            ),
                            menuItem("ProdCare Clients", tabName = "ProdCare Clients", icon = icon("bar-chart-o")),
                            menuItem("Alerts", tabName = "Alerts", icon = icon("bar-chart-o")),
                            menuItem("Change Requests", tabName = "Change Requests", icon = icon("list-alt")),
                            menuItem("Maintenance Windows", tabName = "Maintenance Windows", icon = icon("list-alt")),
                            menuItem("Rundeck", icon = icon("code"), 
                                   href = "https://rundeck.suplab01.snv.mirantis.net/user/login"),
                            menuItem("Salesforce", icon = icon("database"), 
                                   href = "https://mirantis.my.salesforce.com/"),
                            menuItem("Handovers", icon = icon("google"), 
                                   href = "https://docs.google.com/spreadsheets/d/1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c/edit#gid=0"),
                            menuItem("Jump-Host Access", tabName = "Jump-Host Access", icon = icon("bars")),
                            menuItem("Mirantis HT Wiki", icon = icon("bars"), 
                                   href = "https://mirantis.jira.com/wiki/spaces/2S/pages/1254621239/L1+-+General+Queue+Help+Desk+Team"),
                            menuItem("Slack", icon = icon("slack"), href = "https://miracloud.slack.com"),
                            menuItem("Users", tabName = "Users", icon = icon("users")),
                            menuItem("Source code", icon = icon("github"), 
                                   href = "https://github.com/Richard-Barrett/Miradashboard")
                            )
                          )
                        ),
                    dashboardBody(
                      googleChartsInit(),
                      # Boxes need to be put in a row (or column)
                      fluidRow(
                        #box(plotOutput("plot1", height = 250)),
                        #box(plotOutput("plot2", height = 250)),
                        #box(plotOutput("plot3", height = 250)),
                        #box(plotOutput("plot4", height = 250)),
                        h1("Handovers"),
                        DT::dataTableOutput("mytable", width = "auto", height = "auto"),
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
                        #),
                        box(plotOutput("plot1", height = 250)),
                        box(plotOutput("plot2", height = 250)),
                        #box(dataTableOutput("DT1", height = 250))
                        box(
                          title = "Controls",
                          sliderInput("slider", "Number of observations:", 2, 200, 50)
                        )
                      )
                    )
                  )

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  
  output$mytable = DT::renderDataTable({
    df <- gs_read(handover)
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
  
}

shinyApp(ui, server)
