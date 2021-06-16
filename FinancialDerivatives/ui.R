## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    skin = "black",
  dashboardHeader(title = "Financial Derivatives"),
  dashboardSidebar(
    sidebarMenu(
      # menuItem("Introduction to Derivatives ", tabName = "intro", icon = icon("info-circle")),
      # menuItem("Forwards Contracts", tabName = "forwards", icon = icon("info-circle")),
      menuItem("Black-Scholes-Merton", tabName = "black_scholes", icon = icon("info-circle"))
      # menuItem("Glossary", tabName = "glossary", icon = icon("info-circle")),
      # menuItem("About", tabName = "about", icon = icon("info-circle"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # 1st tab content
      # tabItem(
      #   tabName = "intro",
      #   h1("Introduction To Derivatives")
      # ),
      # 2nd tab content
      # tabItem(
      #   tabName = "forwards",
      #   tabsetPanel(
      #     tabPanel("Theory", h2("Theory")),
      #     tabPanel("Examples", h2("Examples")),
      #     tabPanel("Data", h2("Data"))
      #   )
      # ),
      # 3rd tab content
      tabItem(
        tabName = "black_scholes",
        tabsetPanel(
          tabPanel("Theory", h2("Theory")),
          tabPanel(
            "App",
            sidebarPanel(
              numericInput("stockprice", "Stock Price", 100),
              numericInput("strike", "Strike Price", 100),
              sliderInput("maturity", "Maturity (years)", min = 0.1, max = 10, value = 1, step = 0.01),
              sliderInput("volatility", "Volatility", min = 0.1, max = 0.9, value = 0.15, step = 0.01),
              sliderInput("riskfreerate", "Risk free rate", min = 0.0, max = 0.5, value = 0.01, step = 0.01),
              sliderInput("divrate", "Dividend rate", min = 0.0, max = 0.25, value = 0.01, step = 0.01),
            ),
            
          ),
          tabPanel("Data", h2("Data"))
        )
      )
      # # 4rd tab content
      # tabItem(
      #   tabName = "glossary",
      #   h2("Glossary")
      # ),
      # 
      # # 5th tab content
      # tabItem(
      #   tabName = "about",
      #   h2("Write about the project and its creators")
      # )
    )
  )
)
