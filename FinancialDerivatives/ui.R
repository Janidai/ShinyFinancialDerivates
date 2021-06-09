## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Financial Derivatives"),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem("Introduction to Derivatives ", tabName = "intro", icon = icon("info-circle")),
            menuItem("Forwards Contracts", tabName = "forwards", icon = icon("info-circle")),
            menuItem("Black-Scholes-Merton", tabName = "black_scholes", icon = icon("info-circle")),
            menuItem("Glossary", tabName = "glossary", icon = icon("info-circle")),
            menuItem("About", tabName = "about", icon = icon("info-circle"))
        )        
    ),
    ## Body content
    dashboardBody(
        tabItems(
            # 1st tab content
            tabItem(tabName = "intro",
                    h1("Introduction To Derivatives")
            ),
            # 2nd tab content
            tabItem(tabName = "forwards",
                    tabsetPanel(
                        tabPanel("Theory", h2("Theory")),
                        tabPanel("Examples", h2("Examples")),
                        tabPanel("Data", h2("Data"))
                    )
            ),
            # 3rd tab content
            tabItem(tabName = "black_scholes",
                    tabsetPanel(
                        tabPanel("Theory", h2("Theory")),
                        tabPanel("Examples", h2("Examples")),
                        tabPanel("Data", h2("Data"))
                    )
            ),
            # 4rd tab content
            tabItem(tabName = "glossary",
                    h2("Glossary")
            ),
            
            # 5th tab content
            tabItem(tabName = "about",
                    h2("Write about the project and its creators")
            )
        )
    )
)