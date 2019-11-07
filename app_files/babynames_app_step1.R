
library(shiny)
library(tidyverse)
library(babynames)

ui <- fluidPage(
  sliderInput(inputId = "years", label = "Year Range",
              min = 1880, max = 2019, value = c(1880,2019),sep = ""),
  textInput("name", "Name", value = "", placeholder = "Lisa"),
  selectInput("sex", "Sex", choices = list(Female = "F", Male = "M"))
)

server <- function(input, output){}

shinyApp(ui = ui, server = server)