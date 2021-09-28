library(shiny)

source('views/ui.R', local = TRUE)
source('scripts/server.R', local = TRUE)
source('libs/Rmd.R', local = TRUE)
encoding <- 'UTF-8'
shinyApp(ui = ui, server = server)
