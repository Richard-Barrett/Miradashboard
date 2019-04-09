require(shiny)
require(shinydashboard)

Logged <- FALSE;
LoginPass <- 0; #0: not attempted, -1: failed, 1: passed

login <- box(title = "Login",textInput("userName", "Username (user)"),
             passwordInput("passwd", "Password (test)"),
             br(),actionButton("Login", "Log in"))

loginfail <- box(title = "Login",textInput("userName", "Username"),
                 passwordInput("passwd", "Password"),
                 p("Username or password incorrect"),
                 br(),actionButton("Login", "Log in"))

mainbody <- div(tabItems(
  tabItem(tabName = "t_item1", box(title = "Item 1 information")),
  tabItem(tabName = "t_item2", box(title = "Item 2 information")),
  tabItem(tabName = "t_item3", box(title = "Item 3 information"))
)
)

header <- dashboardHeader(title = "dashboard header")

sidebar <- dashboardSidebar(uiOutput("sidebarpanel"))

body <- dashboardBody(uiOutput("body"))

ui <- dashboardPage(header, sidebar, body)

server <- function(input, output, session) {
  USER <<- reactiveValues(Logged = Logged, LoginPass = LoginPass)
  observe({
    if (USER$Logged == FALSE) {
      if (!is.null(input$Login)) {
        if (input$Login > 0) {
          username <- isolate(input$userName)
          password <- isolate(input$passwd)
          #Id.username <- which(my_username == Username)
          if (username == "user" & password == "test") {
            USER$Logged <<- TRUE
            USER$LoginPass <<- 1
          }
          USER$LoginPass <<- -1
        }
      }
    }
  })

  output$sidebarpanel <- renderUI({
    if (USER$Logged == TRUE) {
      div(
        sidebarMenu(
          menuItem("Item 1", tabName = "t_item1", icon = icon("line-chart"), selected = TRUE),
          menuItem("Item 2", tabName = "t_item2", icon = icon("users")),
          menuItem("item 3", tabName = "t_item3", icon = icon("dollar"))
        )
      )}
  })
  output$body <- renderUI({
    if (USER$Logged == TRUE) {
      mainbody
    }
    else {
      if(USER$LoginPass >= 0) {
        login
      }
      else {
        loginfail
      }
    }
  })
}

shinyApp(ui, server)
