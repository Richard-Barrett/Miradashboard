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
      tabPanel("Reolsution SLA",
               fluidRow(
                 align = "center",
                 h5("<insert_google_spreadsheet_link>"),
                 box(
                   title = "Count of Next Update Violations",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                 ),
                 box(
                   title = "Count of Resolution Violations",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                   
                 )
               )
      ),
      tabPanel("Case Management",
               fluidRow(
                 align = "center",
                 h5("<insert_google_spreadsheet_link>"),
                 box(
                   title = "Count of Status",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                 ),
                 box(
                   title = "Customer Wait Times",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                   
                 )
               )
      ),
      tabPanel("Cloud Cases",
               fluidRow(
                 align = "center",
                 h5("<insert_google_spreadsheet_link>"),
                 box(
                   title = "Primary Engineers Assigned",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                 ),
                 box(
                   title = "Cases by Cloud for Account",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe_insertion>')
                   
                 )
               )
    ),
    tabPanel("Cloud Management",
             fluidRow(
               align = "center",
               h5("<insert_google_spreadsheet_link>"),
               box(
                 title = "Case Restoration Distribution",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('<iframe_insertion>')
               ),
               box(
                 title = "Histogram of Status",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('<iframe_insertion>')
                 
               )
             )
    )
  )
),
