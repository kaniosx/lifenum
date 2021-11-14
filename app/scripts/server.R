source('scripts/core/data.R',                                         local = TRUE)
source('scripts/datainfo/description.R',                              local = TRUE)
source('scripts/datainfo/rawdata.R',                                  local = TRUE)
source('scripts/datainfo/visualization.R',                            local = TRUE)
source('scripts/datainfo/analysis.R',                                 local = TRUE)
source('scripts/datainfo/summary.R',                                  local = TRUE)
source('scripts/model/switcher.R',                                    local = TRUE)
source('scripts/model/diabetes/decision_tree_classification.R',       local = TRUE)
source('scripts/model/diabetes/naive_bayes.R',                        local = TRUE)
source('scripts/model/diabetes/logistic_regression.R',                local = TRUE)
source('scripts/model/diabetes/knn.R',                                local = TRUE)
source('scripts/model/diabetes/roc.R',                                local = TRUE)
source('scripts/model/diabetes/from_form.R',                          local = TRUE)
source('scripts/model/diabetes/from_user_file.R',                     local = TRUE)
source('scripts/model/heart_failure/decision_tree_classification.R',  local = TRUE)
source('scripts/model/heart_failure/naive_bayes.R',                   local = TRUE)
source('scripts/model/heart_failure/logistic_regression.R',           local = TRUE)
source('scripts/model/heart_failure/knn.R',                           local = TRUE)
source('scripts/model/heart_failure/roc.R',                           local = TRUE)
source('scripts/model/heart_failure/from_form.R',                     local = TRUE)
source('scripts/model/heart_failure/from_user_file.R',                local = TRUE)

library(ggplot2)
library(caTools)
library(class)
library(rpart)
library(e1071)
library(rpart.plot)
library(plotROC)
library(OptimalCutpoints)

server <- function(input, output, session) {
  observe({
    visualization.updateVisualizationSelect(session, input$dataset)  
  })
  
  observeEvent(input$visualizeEvent, {
    output$visualization <- renderPlot({
      data <- rawdata.load(input$dataset)
      
      if (input$dataset == 'diabetes') {
        data <- model.diabetes.knn.preprocessData(data)
      }
      
      visualization.visualize(
        data,
        input$visualizationX
      )
    })
  })

  output$about <- renderText({
    about.view.description
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

  output$summary <- renderPrint({
    summary.summarize(input$dataset)
  })
  
  observeEvent(input$trainModelEvent, {
    output$trainModelStatusMessage <- renderText('Model successfully trained!')
    output$confusionMatrix <- renderTable({
      model.trainModel(
        input$modelType,
        input$dataset
      )
    }, caption = 'Macierz błędów')
  })
  
  observeEvent(input$checkFormEvent, {
    output$formTable <- renderTable({
      model.predictFromForm.getRow(input)
    }, caption = 'Twoje dane')

    output$formScore <- renderText({
      prediction <- model.predictFromForm.getPredicition(input)

      if (prediction == 1) {
        return('Uwaga! Odpowiedź jest pozytywna z predykcją = 1!')
      }

      return ('Predykcja jest negatywna (0).')
    })
  })

  observeEvent(input$userFileEvent, {
    data <- model.predictFromUserFile.getData(input$dataset, input$modelType, input$userFile$datapath)

    output$userFileOutput <- renderTable({
      req(input$userFile)
      data
    })

    output$downloadData <- downloadHandler(
      filename = 'data.csv',
      content = function(file) {
        write.csv(data, file, row.names = FALSE)
      }
    )
  })
  
  observeEvent(input$generateRocEvent, {
    output$comparison <- renderPlot({
      model.generateRoc(input$dataset, input$modelType)
    })
  })
}
