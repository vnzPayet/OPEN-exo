library(shiny)

### Partie UI

ui <- fluidPage(
  # Application title
  titlePanel(
    textOutput("L'application bizarre de Anne-Laure GIRARD,
               Salomé HAMARD et Dylan CLAIR")
  ),
  sidebarLayout(
    
    sidebarPanel(
      
      ### Fonction pour entrer le nom renvoi un texte d'acceuil
      
      textInput("name", "Entrez votre nom ici :")
    ),
    
    mainPanel(
      textOutput("txtaccueil"))
  ),
  
  
  ### Fonction qui associe un message au radiobutton choisi
  
  radioButtons(inputId = "idRadio", 
               label = "Choisi une heure :", 
               selected = 4,
               choices = c("8h" = "Wake up", "12h" = "Bon Appétit", "18h" = "ON EN A GROS !!!", "20h" = "On se fait un Sloubi ?")),
  textOutput("txt"),
  
  ### Ajout d'un bouton "Le jeu de l'heure"
  
  actionButton("button1", "Mais que faire à cette heure ?"),
  
  ### Liste déroulante, renvoi un message a chaque sloubi choisi
  
  selectInput(inputId = "idsloubi",
              label = "Choisi un sloubi :",
              selected = NULL,
              choices = c("Slouby 1" = "Chante sloubi",
                          "Sloubi 2" = "rakatak-mik", "Sloubi 3" = "kayak-kata",
                          "Sloubi 4" = "joue ganoue", "Sloubi 5" = "jeu boulin",
                          "Sloubi 6" = "jeu carré", "Sloubi 7" = "doublette")),
  textOutput("txtsloubi"),
  
  ### Un deuxieme bouton "Le jeu sloubi"
  
  actionButton("button2", "Voit la relance sloubi"),
  
  
  ### Fonction associe une image au choix a puce choisi
  
  titlePanel("Tirage d'image"),
  
  fluidRow(
    column(4, wellPanel(
      radioButtons("picture", "Picture:",
                   c("Un peu de latin", "C'est pas faux"))
    )),
    column(4,
           imageOutput("image2")
    ),
    ### 3eme boutton "tirage d'image"
    actionButton("button3", "A quoi servent ces puces")
  )
  )




### Partie server

server <- function(input, output) {
  
  ### Renvoie le message d'accueil
  
  output$txtaccueil <- renderText(
    paste("Bien le bonjour", input$name, "!")
  )
  
  ### Renvoi pour la fonction idradio (les radiobuttons, jeu de l'heure)
  observeEvent(input$button1,{
  output$txt <- renderText({
    paste (input$idRadio)})
  })
  
  ### Supposé faire apparaitre la fonction radiobutton que quand le bouton est cliqué
  
  observeEvent(input$button2,{
  output$txtsloubi <- renderText({ ### renvoie le texte du jeu sloubi
    paste (input$idsloubi)})
})
  
  ### Sortie pour le tirage d'image
  
  observeEvent(input$button3,{
  output$image2 <- renderImage({
    if (is.null(input$picture))
      return(NULL)
    
    if (input$picture == "C'est pas faux") {
      return(list(
        src = "0c6c319447cea2759446e6f2266a69af.png",
        contentType = "image/png",
        alt = "C'est pas faux"
      ))
    } else if (input$picture == "Un peu de latin") {
      return(list(
        src = "missa.png",
        filetype = "image/png",
        alt = "Un peu de latin"
      ))
    }
    
  }, deleteFile = FALSE)})
  
}

shinyApp(ui=ui, server=server)