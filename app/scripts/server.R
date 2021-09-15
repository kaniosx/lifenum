source('scripts/core/data.R',               local = TRUE)
source('scripts/datainfo/description.R',    local = TRUE)
source('scripts/datainfo/rawdata.R',        local = TRUE)
source('scripts/datainfo/visualization.R',  local = TRUE)
source('scripts/datainfo/analysis.R',       local = TRUE)

library(ggplot2)

server <- function(input, output, session) {
  observe({
    visualization.updateVisualizationSelect(session, input$dataset)  
  })
  
  observeEvent(input$visualizeAction, {
    output$visualization <- renderPlot({ 
      visualization.visualize(
        rawdata.load(input$dataset),
        input$visualizationX,
        input$visualizationY
      )
    })
  })

  output$selectedDataDescription <- renderText({
    paste(description.describeData(input$dataset))
  })

  output$selectedRawData <- renderDataTable({
    rawdata.load(input$dataset)
  })
  
  output$selectedDataAnalysis <- renderUI({
    analysis.analize(input$dataset)
  })
}
