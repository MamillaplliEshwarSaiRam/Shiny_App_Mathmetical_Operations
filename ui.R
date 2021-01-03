ui <-fluidPage(
  titlePanel("My Program"),
  sidebarLayout(
    sidebarPanel(
      numericInput("obs", "Number1:", 10, min = 1, max = 100),
      numericInput("obs2","Number2:",10,min=1,max=100),
      verbatimTextOutput("value"),
      radioButtons("rb", "Choose one:",
                   choiceNames = list(
                     "Sum",
                     "Mean",
                     "Median"
                   ),
                   choiceValues = list(
                     "Sum", "Mean", "Median"
                   )),
      submitButton(text = "submit",icon =NULL, width = NULL),
      textOutput("txt")
    ), mainPanel(tableOutput("product"))
  )
)

server <- function(input,output){
  #output$value <- renderText({ input$obs })
  output$product <- renderPrint({
    
    x=input$obs
    y=input$obs2
    if(input$rb=="Sum"){
      cat("Sum = ",x+y,"\n")
    }
    if(input$rb=="Mean"){
      cat("Mean = ",(x+y)/2,"<br>")
    }
    if(input$rb=="Median"){
      cat("Median = ",x,"<br>")
    }
  })
  output$txt <- renderText({
    paste("You chose", input$rb)
  })
  
}

shinyApp(ui, server)
