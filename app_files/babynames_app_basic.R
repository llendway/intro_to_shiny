
library(shiny)
library(tidyverse)
library(babynames)

ui <- fluidPage(
  sliderInput(inputId = "years", 
              label = "Year Range",
              min = 1880, 
              max = 2019, 
              value = c(1880,2019),
              sep = ""),
  textInput("name", 
            "Name", 
            value = "", 
            placeholder = "Lisa"),
  selectInput("sex", 
              "Sex", 
              choices = list(Female = "F", Male = "M")),
  submitButton(text = "Create my plot!"),
  plotOutput(outputId = "timeplot")
)

server <- function(input, output) {
  output$timeplot <- renderPlot({
  babynames %>% 
    filter(name == input$name, 
           sex == input$sex) %>% 
    ggplot() +
    geom_line(aes(x = year, y = n)) +
    scale_x_continuous(limits = input$years) +
    theme_minimal()
  })
}

shinyApp(ui = ui, server = server)