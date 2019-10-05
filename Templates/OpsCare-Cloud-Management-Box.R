fluidRow(
  box(
    width = "750px",
    title = "All <insert_cloud_name> Cases",
    background = "red",
    solidHeader = TRUE,
    collapsible = TRUE,
    tabBox(
      title = "Visualization Trends",
      # The id lets us use input$tabset1 on the server to find the current tab
      id = "tabset1",
      height = "750px",
      width = "750px",
      tabPanel("Case Management Information",
               fluidRow(
                 align = "center",
                 h5("<insert_google_spreadsheet_link>"),
                 box(
                   title = "Count of Violations",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                 ),
                 box(
                   title = "Count of Case Status",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                   
                 )
               )
      ),
      tabPanel("Cloud Information",
               fluidRow(
                 align = "center",
                 h5("<insert_google_spreadsheet_link>"),
                 box(
                   title = "Count of Customer Tier",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                 ),
                 box(
                   title = "Count of Cases by Client Cloud",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                   
                 )
               )
      ),
      tabPanel("Cloud Cases Touched",
               fluidRow(
                 align = "center",
                 h5(""),
                 box(
                   title = "Cases Touched by Engineer",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                 ),
                 box(
                   title = "Cloud Case Counts Closed",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('')
                   
                 )
               )
    ),
    tabPanel("Cloud Management",
             fluidRow(
               align = "center",
               h5(""),
               box(
                 title = "Clouds with Cases Closed/Solved",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('')
               ),
               box(
                 title = "Cases by L2",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('')
                 
               )
             )
    )
  )
),
