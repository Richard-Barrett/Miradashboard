## This is used to insert tabItems containerized within the ui.R for the Dashboard User Interface
## --------------------------------------- tabItems -------------------------------------------------
                      tabItems(
                        tabItem(tabName = "Dashboard",
                                h2("Dashboard Tab Content")
                                #h1("Handovers"),
                                #DT::dataTableOutput("mytable", width = "auto", height = "auto"),
                        ),
                        tabItem(tabName = "ProdCare Clients",
                                h2("ProdCare Clients Tab Content")
                                ),
                        tabItem(tabName = "Alerts",
                                h2("Alerts Tab Content")
                                ),
                        tabItem(tabName = "Change Requests",
                                h2("Change Requests Tab Content")
                                ),
                        tabItem(tabName = "Maintenance Windows",
                                h2("Maintenance Windows Tab Content")
                                ),
                        tabItem(tabName = "Jump-Host Access",
                                h2("Jump-Hosts Tab Content")
                                ),
                        tabItem(tabName = "Users",
                                h2("Users Tab Content")
                                )
                        
                      ),
                      
## You can dynamically name the tabItes accordingly and call them within the server output.
