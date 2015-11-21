library(shiny)
shinyUI( pageWithSidebar(
    headerPanel(
        h1("Shiny Car App"),
        "Shiny Car App - Developing Data Products Project"
    ),
    sidebarPanel(
        h2("About Your Car?"),
        p("Enter some information below about your shiny car and we will predict what the MPG rating will be:"),
        numericInput('inWt', "Weight of Car (in 1000 lbs)", 3, min = 1.5, max = 5.5, step = .1),
        sliderInput("inQsec", "1/4 Mile Time", 17.8, min = 14.5, max= 23, step = .1),
        radioButtons("inAm", "Transmission",
            c("Automatic" = 1,
              "Manual" = 0
              )                   
        )
    ),
    mainPanel(
        h2("The MPG of Your Car is:"),
        h3(textOutput("oMpg")),
        imageOutput("carImage", height=320),
        p("* Your car should have the stated MPG based on data available from the build-in R data set mtcars.")
        
    )
)) 