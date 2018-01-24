library(shiny)

# Define UI for an interactive car MPG estimator 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Interactive car MPG predictor"),
  
  # Sidebar with slider inputs for car weight and start-up travel times and box input for manual transmission 
  sidebarPanel(
    sliderInput("WGT", 'Numeric input for weight (in lbs)',3200,min=1500,max=5500,step=50),
    sliderInput("SEC", 'Numeric input for 1/4 mile time (in seconds)', 17.50,min=14.50,max=23,step=.25),
    checkboxInput("MT", "Check if the car has manual transmission",FALSE)
  ),
    
    # Show results
    mainPanel(
      h3("MPG Predictor"),
      h4("Based on industry data, the miles per gallon for a 1973-74 car with such features is expected to be the following:"),
      verbatimTextOutput("Prediction"),
      h4("The Interactive car MPG predictor allows the user to estimate the fuel efficiency of a 1973-74 model car after inputting a few car attributes on the left panel."),
      h4("It is based on a linear regression model using these attributes, and the underlying dataset is the mtcars dataset preloaded into R, which was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
      h4("The predictor will automatically recalculate each time an attribute on the left panel is re-specified.")
    )
  )
)
