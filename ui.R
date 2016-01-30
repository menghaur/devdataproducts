#Developing Data Products Assignment
#
#Shiny user interface, it demonstrates some activity to user inputs
#TIs content sidebarPanel and a mainPanel
#
library(shiny)

x_axis_label = "x=axis"

#Define UI for dataset viewer app

shinyUI(pageWithSidebar(
    
    headerPanel("Dosage and Supplements Demo"),  # App title
    
    # Sidebar control to provide caption, select a dataset and specify the number of observations to view
    sidebarPanel(
        # User chooses the supplement
        selectInput("chooseSupp", "Supplements:", choices = c("Both", "Vitamin C", "Orange Juice")),
        
        # Check boxes to choose the dosage
        checkboxGroupInput("chooseDose", "Dosage:", c("0.5" = "0.5", "1.0" = "1.0", "2.0" = "2.0"),
                            selected=c("0.5","1.0","2.0"), inline=TRUE),
        
        # Check boxes results by
        checkboxGroupInput("check1", "Results By:", c("Dose" = "1", "Supplement" = "2"), selected="1"),
        
        # Radio buttons to choose graph
        radioButtons("chartType", "Chart Type:", list("Box", "Bar", "Scatter")),
        
        # Slider bar to input jitter for scatter plots
        sliderInput('jit', 'Scatterplot Jitter',value = 0, min = 0, max = 2, step = 0.05),
        
        # Numeric input for num of observation in a table, increments of 5
        numericInput("obs", "Num of observations to view - max50:", 5, min=0, max = 50, step=5),
    
        #
        p("Explaine:"),
        p("Select supplement from drop down"),
        p("Select graph type from check boxes"),
        p("Scatterplot Jitter only works on Scatter"),
        p("Beware: various combintions may result in strange results."),
        p("Best use: Supplement Both, with Results by: Dose or Supplement")
    ),
    
    
    # Show the caption, a summary of the dataset
    mainPanel(

        plotOutput('main_plot'),
        verbatimTextOutput("summary"),
        tableOutput("view")
        
    )
))