#
# This is the server logic of a Shiny web application. 

library(shiny)
#The following generates a linear regression model for a car's MGP based on weight, start-up travel time, and transmission type.
lm4<-lm(mpg~wt+qsec+factor(am),data=mtcars) 
# Define server logic required to provide a prediction based on user inputs
shinyServer
(function(input, output) {
  y<-reactive(lm4$coefficients[1]+input$WGT*lm4$coefficients[2]/1000+input$SEC*lm4$coefficients[3]+input$MT*lm4$coefficients[4])
  output$Prediction <- renderText(y())
  
})