source('scripts/core/data.R',                               local = TRUE)
source('scripts/datainfo/description.R',                    local = TRUE)
source('scripts/datainfo/rawdata.R',                        local = TRUE)
source('scripts/datainfo/visualization.R',                  local = TRUE)
source('scripts/datainfo/analysis.R',                       local = TRUE)
source('scripts/model/switcher.R',                          local = TRUE)
source('scripts/model/diabetes/logistic_regression.R',      local = TRUE)
source('scripts/model/diabetes/from_form.R',                local = TRUE)
source('scripts/model/heart_failure/logistic_regression.R', local = TRUE)

library(ggplot2)
library(caTools)

server <- function(input, output, session) {
  observe({
    visualization.updateVisualizationSelect(session, input$dataset)  
  })
  
  observeEvent(input$visualizeEvent, {
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
  
  output$selectedDataModelForm <- renderUI({
    model.view.getForm(input$dataset)
  })
  
  output$userFileData <- renderTable({
    req(input$userFile)
    
    tryCatch({
      df <- read.csv(input$userFile$datapath, sep = ',')
    }, error = function(e) {
      stop(safeError(e))
    })
    
    df
  })
  
  observeEvent(input$trainModelEvent, {
    output$trainModelStatusMessage <- renderText('Model successfully trained!')
    output$confusionMatrix <- renderTable({
      model.trainModel(
        input$modelType,
        input$dataset
      )
    }, caption = 'Confusion matrix')
  })
  
  observeEvent(input$checkFormEvent, {
    if (input$dataset == 'diabetes') {
      output$formTable <- renderTable({
        model.diabetes.fromForm.getRow(input)
      }, caption = 'Test')

      output$formScore <- renderPrint({
        classifier <- model.getClassifier(
          input$modelType,
          input$dataset
        )
        row <- model.diabetes.fromForm.getRow(input)
        model.diabetes.fromForm.predict(classifier, row)
      })
    }
    
    if (input$dataset == 'heartFailure') {
      output$formTable <- renderTable({
        model.heartFailure.fromForm.getRow(input)
      }, caption = 'Test')
      
      output$formScore <- renderText({
      })
    }
  })
}
