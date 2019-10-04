fluidRow(
  box(
    width = "750px",
    title = "All Cox Cases",
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
                 h5("https://docs.google.com/spreadsheets/d/1q9STlLeg63UnU65zHLSWPuMVOjo46rXtRyQCi52w7Js/edit?usp=sharing"),
                 box(
                   title = "Count of Violations",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1973942920&amp;format=interactive"></iframe>')
                 ),
                 box(
                   title = "Count of Case Status",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=2006055022&amp;format=interactive"></iframe>')
                   
                 )
               )
      ),
      tabPanel("Cloud Information",
               fluidRow(
                 align = "center",
                 h5("https://docs.google.com/spreadsheets/d/1q9STlLeg63UnU65zHLSWPuMVOjo46rXtRyQCi52w7Js/edit?usp=sharing"),
                 box(
                   title = "Count of Customer Tier",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vREIkCc7ezFxRTd6j_zuzJeBZzAz9JhGjJWrPH1J0_WSE6XdZ7S3zVw12bD3KhfqNi1kV-qP_7rbs8Q/pubchart?oid=297941055&amp;format=interactive"></iframe>')
                 ),
                 box(
                   title = "Count of Cases by Client Cloud",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=418228373&amp;format=interactive"></iframe>')
                   
                 )
               )
      ),
      tabPanel("Cloud Cases Touched",
               fluidRow(
                 align = "center",
                 h5("https://docs.google.com/spreadsheets/d/1q9STlLeg63UnU65zHLSWPuMVOjo46rXtRyQCi52w7Js/edit?usp=sharing"),
                 box(
                   title = "Cases Touched by Engineer",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=317613709&amp;format=interactive"></iframe>')
                 ),
                 box(
                   title = "Cloud Case Counts Closed",
                   solidHeader = TRUE,
                   collapsible = TRUE,
                   background = "red",
                   align = "center",
                   HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1043763779&amp;format=interactive"></iframe>')
                   
                 )
               )
    ),
    tabPanel("Cloud Management",
             fluidRow(
               align = "center",
               h5("https://docs.google.com/spreadsheets/d/1q9STlLeg63UnU65zHLSWPuMVOjo46rXtRyQCi52w7Js/edit?usp=sharing"),
               box(
                 title = "Clouds with Cases Closed/Solved",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=383879038&amp;format=interactive"></iframe>')
               ),
               box(
                 title = "Cases by L2",
                 solidHeader = TRUE,
                 collapsible = TRUE,
                 background = "red",
                 align = "center",
                 HTML('<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQuxbru4jnFmzPOCAu0Lp5SJdO0TPaLsmpu2MoyKzPU9r5n9X1CPpdLErwISxY-ZJPcVyF0YwV1OxHY/pubchart?oid=1769905950&amp;format=interactive"></iframe>')
                 
               )
             )
    )
  )
),
