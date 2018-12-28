#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Miradashboard"
                  
                  
                  
                  ),
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Widgets", tabName = "widgets", icon = icon("th")),
        menuItem("Reports", tabName = "reports", icon = icon("th")),
        menuItem("OpsCare Clients", tabName = "OpsCare Clients", icon = icon("th")),
        menuItem("ProdCare Clients", tabName = "ProdCare Clients", icon = icon("th")),
        menuItem("Alerts", tabName = "Alerts", icon = icon("th")),
        menuItem("Change Requests", tabName = "Change Requests", icon = icon("th")),
        menuItem("Maintenance Windows", tabName = "Maintenance Windows", icon = icon("th"))
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
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)
