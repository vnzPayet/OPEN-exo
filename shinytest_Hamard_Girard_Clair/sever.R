

server <- function(input, output, session) {
  output$txtaccueil <- renderText(
    paste("bien le bonjour", input$name, "!")
  )
}

