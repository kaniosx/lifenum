library(shiny)

source('views/ui.R', local = TRUE)
source('scripts/server.R', local = TRUE)
source('libs/Rmd.R', local = TRUE)

shinyApp(ui = ui, server = server)
