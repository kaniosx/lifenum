source('scripts/datainfo/description.R', local = TRUE)
source('scripts/datainfo/rawdata.R', local = TRUE)

server <- function(input, output) {
  output$selectedDataDescription <- renderText({
    paste(description.describeData(input$dataset))
  })

  output$selectedRawData <- renderDataTable({
    rawdata.load(input$dataset)
  })
}
