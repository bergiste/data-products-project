library(shiny)
library(caret)
data(mtcars)
model <- train(mpg ~ wt + qsec + am, method='lm', data = mtcars)
maxWt <- max(mtcars$wt)
shinyServer(
    function(input, output){
        wt <- reactive({input$inWt})
        qsec <- reactive({input$inQsec})
        am <- reactive({as.numeric(input$inAm)})
        output$oMpg <- renderText({round(predict(model, data.frame(wt = wt(),qsec = qsec(), am = am())),2)})
        output$carImage <- renderImage({
            filename <- normalizePath(file.path("img/cars.jpg"))
            list(
                src = filename,
                contentType = 'image/jpg',
                width = 600,
                height = 300,
                alt = "Image of a car"
            )
        }, deleteFile = FALSE)
})