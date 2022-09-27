###########################################################################
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
###########################################################################

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Cosmic Loneliness Equation"),

    #p_log_MIN = log10(1e-30) # minimum value of p on log scale
    #p_log_MAX = log10(1e-3)  # maximum value of p on log scale
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          
            sliderInput("bins",
                        "Maximum value of p (probability of another star developing an advanced radio-transmitting civilization):",
                        min = (1e-30), #1,
                        max = (1e-3), #50,
                        value = 1e-10, 
                        animate = TRUE
                        )
            ,

            sliderInput("min",
                        "Minimum value of p (probability of another star developing an advanced radio-transmitting civilization):",
                        min = (1e-30), #1,
                        max = (1e-3), #50,
                        value = 1e-30, 
                        animate = TRUE
            )
            ,
            
                        
            #sliderInput("min",
            #            "Minimum value of p:",
            #            min = (1e-35), #1,
            #            max = (1e-30), #50,
            #            value = 1e-35, 
            #            animate = TRUE
            #)
            #,
            
            sliderInput("d",
                        "Maximum value of d (stellar density in our neighbourhood):",
                        min = (1/320), #1,
                        max = (100/320), #50,
                        value = 1/320, 
                        animate = TRUE
                        )
            ,
            
            sliderInput("samples",
                        "Number of samples to draw:",
                        min = 100, #1,
                        max = 100000, #50,
                        value = 1000, 
                        animate = TRUE
                        )
            
                    ),
        
        
        
            

                  # Show a plot of the generated distribution
                  mainPanel(
                     plotOutput("distPlot")
                          )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        # hist(x, breaks = bins, col = 'darkgray', border = 'white',
        #     xlab = 'Waiting time to next eruption (in mins)',
        #     main = 'Histogram of waiting times')
        
        ############################
        # sample p, d and plot L
        ############################
        
        # sample from uniform distribution for log10(p)
        N_samples = input$samples # 1000 # number of samples
        p_log_MIN = log10(input$min) # log10(1e-30) # minimum value of p on log scale input$min
        p_log_MAX = log10(input$bins) # log10(1e-3)  # maximum value of p on log scale
        d = input$d #1/320 # stellar density in our neighbourhood
        
        # error check
        if (10^p_log_MAX < 10^p_log_MIN)
        {
            cat(10^p_log_MAX)
            cat("\n")
            cat(10^p_log_MIN)
            shiny::modalDialog(title = "Minimum range cannot be greater than maximum for p")
        }
        else
        {  
            
            # sample
            p_dist_log = runif(n = N_samples, min = p_log_MIN, max = p_log_MAX)
            p_dist = 10^p_dist_log
            
            
            # cosmic loneliness equation
            L_dist = ( (3 * pi ) / ( 4 * p_dist * d ) )^(1/3)
            
            L_dist
            
            # plot L log
            ggplot2::qplot( log10( L_dist), 
                            xlab = 'log10 lifetime of human civilization',
                            ylab = 'Frequency'
                          )
            
        }
        # end of if structure
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

# TODO:
# shiny::runGitHub('neelsoumya/cosmic_loneliness_equation')
# https://stackoverflow.com/questions/37830819/developing-shiny-app-as-a-package-and-deploying-it-to-shiny-server

# TODO: dialog box check if min < max
# https://shiny.rstudio.com/reference/shiny/1.6.0/modalDialog.html
