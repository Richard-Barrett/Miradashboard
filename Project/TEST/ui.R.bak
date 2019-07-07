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

google_app <- oauth_app(
    "google",
    key = "390198683818-i5fmprq9h09vcn6niu7v91bku2dvk1v5.apps.googleusercontent.com",
    secret = "bDkrVewW5eRxxSpdFH6Ka5mz"
)


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


# Create Customer Data frames from Google Sheets
## ---------------------- Customer-Dataframes ----------------------- ##
for_gs_sheet <- gs_read(handover)
str(for_gs_sheet)

for_gs_vw_demo <- gs_read(vw_demo)
str(for_gs_vw_demo)

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

for_gs_sheet_autovw <- gs_read(auto_vw)
str(for_gs_sheet_autovw)

## ---------------------- End-Customer-Dataframes ----------------------- ##

## Basic Frames for common reports
for_gs_sheet_cases_wo_key_5 <- gs_read(cases_wo_key_5)
str(for_gs_sheet_cases_wo_key_5)

for_gs_bimonthly_ttr <- gs_read(bimonthly_ttr)
str(for_gs_bimonthly_ttr)

## Identifies the Google Sheet in Question
## handover_sheet = gs_url("https://docs.google.com/spreadsheets/d/1Wu8gJyzw6o7BS4GoR7pM_NofHyXvOzDMK3O-VVHcB8c/edit#gid=0")
## bimonthly_ttr = gs_url("https://docs.google.com/spreadsheets/d/1TiQeStsuwATHWxExV_Pdb2rSuOlOPB3KcYbPKFOj8VQ/edit#gid=0")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    ## ui.R ##
    ## --------------------------------------------- Header Content ------------------------------------------------------##
    
ui <-dashboardPage(skin = "red",
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
            
            ## --------------------------------------------- Body Content ------------------------------------------------------##
            
            
                     )),
        dashboardBody(
            tabItems(
                tabItem(tabName = "dashboard",
                        h5("Dashboard Tab Content"),
                        fluidRow(
                            #box(plotOutput("plot1", height = 250)),
                            #box(plotOutput("plot2", height = 250)),
                            #box(plotOutput("plot3", height = 250)),
                            #box(plotOutput("plot4", height = 250)),
                            h1("Handovers"),
                            #HTML('<iframe src="https://docs.google.com/a/mirantis.com/spreadsheets/d/e/2PACX-1vQhKvFE0uh_YR3o0fAIyh7fKZ4P_cd2oH9EKGY7HU4I-QG6GvUlHN7KKdQVXzEvtjn04I7TWyDM45pD/pubhtml?widget=true&amp;headers=false"></iframe>'),
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
                        
                )
            )
        )
    )
    )
)

