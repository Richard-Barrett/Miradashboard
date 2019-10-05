fluidRow(
  box(
    width = "750px",
    title = "<insert_cloud_name>",
    background = "red",
    solidHeader = TRUE,
    collapsible = TRUE,
      tabBox(
        title = "Visualization Trends",
        # The id lets us use input$tabset1 on the server to find the current tab
        id = "tabset1",
        height = "750px",
        width = "750px",
      tabPanel("Opscare Alerts",
        fluidRow(
          align = "center",
          h5("<insert_googlesheet_where_graph_lives"),
            box(
              title = "Alerts over Time by Host",
              solidHeader = TRUE,
              collapsible = TRUE,
              background = "red",
              align = "center",
              HTML('<insert_iframe_1>')
              ),
            box(
              title = "Alerts By Host",
              solidHeader = TRUE,
              collapsible = TRUE,
              background = "red",
              align = "center",
              HTML('<inser_iframe_2')

              )
            )
          )
        )
      )
),
