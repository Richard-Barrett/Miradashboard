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
                          menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
                          menuItem("Widgets", tabName = "widgets", icon = icon("th")),
                          menuItem("Reports", tabName = "reports", icon = icon("chart-line")),
                          menuItem("OpsCare Clients", tabName = "OpsCare Clients", icon = icon("bar-chart-o")),
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
                          menuItem("Source code", icon = icon("github"), 
                                   href = "https://github.com/Richard-Barrett/Miradashboard")
                        )
                      )
                    ),
                    dashboardBody(
                      # Boxes need to be put in a row (or column)
                      fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        box(plotOutput("plot2", height = 250)),
                        box(plotOutput("plot3", height = 250)),
                        box(plotOutput("plot4", height = 250)),
                        #box(dataTableOutput("DT1", height = 250))
                        box(
                          title = "Controls",
                          sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                      )
                    )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
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
}

shinyApp(ui, server)
