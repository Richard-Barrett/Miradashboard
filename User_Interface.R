#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

## app.R ##
library(shinydashboardPlus)           ## Library for Shinydashboardplus 
library(shinydashboard)               ## Library for Shinydashboard
library(shiny)                        ## Library for Shiny
library(rsconnect)                    ## Libraryfor Shinny Rsconnect or publish to shinyapps.io
library(RCurl)                        ##
library(httr)                         ##
library(dplyr)                        ##
library(mosaic)                       ##
library(DT)                           ## Library to manipulate and rendeer Data Tables
library(googleCharts)                 ## Library to Manipulate Google Charts that have been published
library(googlesheets)                 ## Library to maniupalte Google Sheets owned by the user and/or organization
library(googleVis)                    ##
library(fontawesome)                  ## Library for the icons used within the menuItems
library(ggplot2)
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

# 1. Start with google analytics auth
#gar_auth("ga.httr-oauth")

# 2. You can run Google Analytics API calls:
#ga_account_list()

# 3. You can switch to Seacrh Console auth
#gar_auth("sc.httr-oauth")

# can now run Search Console API calls:
#list_websites()
## ---------------------------- END-google-authentication --------------------------- ##

## Other authetications to come and be developed soon
## DEMO
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
#sharetome <- gs_key("Insert_Key")
#statestreet <- gs_key("Insert_Key")


# Create Customer Data frames from Google Sheets
## ---------------------- Customer-Dataframes ----------------------- ##
for_gs_sheet <- gs_read(handover)
str(for_gs_sheet)

for_gs_sheet_1 <- gs_read(sev3_sev4_data)
str(for_gs_sheet_1)

for_gs_sheet_2 <- gs_read(bimonthly_ttr)
str(for_gs_sheet_2)

for_gs_sheet_vw <- gs_read(vw_ttr)
str(for_gs_sheet_vw)

for_gs_sheet_reliance <- gs_read(reliance)
str(for_gs_sheet_reliance)

for_gs_sheet_inspur <- gs_read(inspur)
str(for_gs_sheet_inspur)

for_gs_sheet_cox <- gs_read(cox_com)
str(for_gs_sheet_cox)

for_gs_sheet_mediakind <-gs_read(ericmediakind)
str(for_gs_sheet_mediakind)

for_gs_sheet_adobe <- gs_read(adobe)
str(for_gs_sheet_adobe)

for_gs_sheet_apple <- gs_read(apple)
str(for_gs_sheet_apple)

for_gs_sheet_att <- gs_read(att)
str(for_gs_sheet_att)

## ---------------------- End-Customer-Dataframes ----------------------- ##

## Basic Frames for common reports
for_gs_sheet_cases_wo_key_5 <- gs_read(cases_wo_key_5)
str(for_gs_sheet_cases_wo_key_5)

for_gs_bimonthly_ttr <- gs_read(bimonthly_ttr)
str(for_gs_bimonthly_ttr)

## Identifies the Google Sheet in Question
## handover_sheet = gs_url("https://docs.google.com/spreadsheets/d/1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c/edit#gid=0")
## bimonthly_ttr = gs_url("https://docs.google.com/spreadsheets/d/1TiQeStsuwATHWxExV_Pdb2rSuOlOPB3KcYbPKFOj8VQ/edit#gid=0")
#shinyApp(ui = ui, server = server, options = list(height = 1080))

ui <- dashboardPage(skin = "red",
                    dashboardHeader(title = "Miradashboard", 
                                    # This drop-down menu offers user a SSO area.
                                    # Employees will be able to gain access to all of the corporate software and there integrations in one area.

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
                    ## --------------------------------------------- Sidebar content ------------------------------------------------------##
                    
                    dashboardSidebar(
                      ## Sidebar content
                      dashboardSidebar(
                        sidebarMenu(
                          # Built with Shiny by RStudio
                          sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                                            label = "Search..."),
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
                            )
                          )
                        ),
                    
                    ## --------------------------------------------- Body content ------------------------------------------------------##
                    
                    dashboardBody(
                      googleChartsInit(),
                      # Boxes need to be put in a row (or column)
                      # Main panel for displaying outputs ----
                      # mainPanel(
                      tabItems(
                        tabItem(tabName = "dashboard",
                                h5("Dashboard Tab Content"),
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
                                  box(
                                    title = "Weekly Overall TTR", background = "red", solidHeader = TRUE,
                                    plotOutput("plot1", height = 350)),
                                  box(
                                    title = "Overall CR & MW Status", background = "red", solidHeader = TRUE,
                                    plotOutput("plot2", height = 350)),
                                  #box(dataTableOutput("DT1", height = 250))
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
                                  DT::dataTableOutput("mytable10", width = "auto", height = "auto")
                                )
                        ),
                        ## ------------ Top 10 Clients ---------------- ##
                        tabItem(tabName = "Adobe_Systems",
                                h1("The Adobe Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable8", width = "auto", height = "auto")
                                )
                        ),
                        tabItem(tabName = "Apple_Inc",
                                h1("The Apple Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable7", width = "auto", height = "auto")
                                )
                        ),
                        tabItem(tabName = "ATT_Inc",
                                h1("The AT&T Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable9", width = "auto", height = "auto")
                                )
                        ),
                        tabItem(tabName = "Cox_Communications",
                                h1("The Cox Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable5", width = "auto", height = "auto")
                                )
                        ),
                        tabItem(tabName = "Ericsson_Mediakind",
                                h1("The Mediakind Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable6", width = "auto", height = "auto")
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
                                  DT::dataTableOutput("mytable4", width = "auto", height = "auto")
                                )
                        ),
                        tabItem(tabName = "Reliance",
                                h1("The Reliance Google Sheet"),
                                fluidRow(
                                  DT::dataTableOutput("mytable3", width = "auto", height = "auto")
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
                                  DT::dataTableOutput("mytable2", width = "auto", height = "auto")
                                )
                                ),
                        tabItem(tabName = "Maintenance_Windows",
                                h2("Maintenance Windows Tab Content"),
                                fluidRow(
                                  DT::dataTableOutput("mytable1", width = "auto", height = "auto")
                                )
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
                      
                      fluidRow(
                        tabBox(
                          title = "Visualization Trends",
                          # The id lets us use input$tabset1 on the server to find the current tab
                          id = "tabset1", height = "500px",
                          tabPanel("First Response",
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRNxLt1g_l9p2zDStK3lrj7iLkMruOzjFOr_ZUyoc4nJtXXpkp1TRc7sB83xjGpXLcLLUq8xH0B9iv1/pubchart?oid=1201606802&amp;format=interactive"></iframe>')

                                   ),
                          tabPanel("Case Closure", 
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRNxLt1g_l9p2zDStK3lrj7iLkMruOzjFOr_ZUyoc4nJtXXpkp1TRc7sB83xjGpXLcLLUq8xH0B9iv1/pubchart?oid=1827778814&amp;format=interactive"></iframe>')
                                   ),
                          tabPanel("SLA Met", "First Tab Content 3"),
                          tabPanel("SLA Missed", "Insert SLA Misses Content"),
                          tabPanel("Overall CR & MW", "Insert Google Chart",
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTq8JfC-o3VDDU303mHaT49nt_FGOHikF_GqLFvBS-le9-AYmBOTGDE5TPRh_XTS_iu4rAu4xdfKUzz/pubchart?oid=1004062925&amp;format=interactive"></iframe>'))
                          
                        ),
                        tabBox(
                          title = "Customer Visualizations",
                          id = "tabset2",
                          side = "right", height = "500px",
                          selected = "Mediakind",
                          tabPanel("Volkswaggen", 
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRQ3jyR6tDWIzwad37uzklYoi4r7Fu3--znyoomv7-GSTs4YlpOZA01emoAunbgZBz4tQzkgrvH6lyX/pubchart?oid=973576597&amp;format=interactive"></iframe>')
                                   ),
                          tabPanel("Inspur",
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSx-jOMQSCb0n_mAnK2csWiSPVDwvGsAMKmxaWP1jfSn7ThfUHr7TD3st0rFos5TvctWkPrItLzwurX/pubchart?oid=1867197075&amp;format=interactive"></iframe>')),
                          tabPanel("Reliance",
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQqb9QFD6FDHRTXc9Kbr09muTTfCKhXij740HJO1eyA8xLeAuX1RLpzTN_LfL1HWFe684_JUqbMPNbu/pubchart?oid=1303594187&amp;format=interactive"></iframe>')),
                          tabPanel("Mediakind", 
                                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vT2wCO76jnF6n2za5cUq_lHNqM7x8zdYOemWmxzndXDWEwCpUFfVsv-q9LkNz_VNW0JTlAPACh3hWyT/pubchart?oid=261186580&amp;format=interactive"></iframe>'))
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
## ---------------------------------------------------------------- Server-Content -------------------------------------------------------------------- ##
server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  
  ## Data Table Outputs from Google Sheets
  ## --------------------------------------
  output$mytable = DT::renderDataTable({
    df <- gs_read(handover)
  })
  
  output$mytable1 = DT::renderDataTable({
    df <- gs_read(sev3_sev4_data)
  })
  
  output$mytable2 = DT::renderDataTable({
    df <- gs_read(vw_ttr)
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
