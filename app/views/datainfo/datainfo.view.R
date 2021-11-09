datainfo.view.descriptionPanel <- tabPanel(
  title = 'Opis',
  htmlOutput('selectedDataDescription')
)

datainfo.view.rawViewPanel <- tabPanel(
  title = 'Surowe dane',
  dataTableOutput('selectedRawData')
)

datainfo.view.visualizationPanel <- tabPanel(
  title = 'Wizualizacja',
  fluidRow(
    column(
      width = 2,
      selectInput(
        'visualizationX',
        'X-axis',
        ''
      ),
      actionButton(
        'visualizeEvent',
        'Visualize'
      )
    ),
    column(
      width = 10,
      plotOutput('visualization')
    )
  )
)

datainfo.view.analysisPanel <- tabPanel(
  title = 'Analiza',
  uiOutput('selectedDataAnalysis')
)

datainfo.view.summaryPanel <- tabPanel(
  title = 'Podsumowanie',
  verbatimTextOutput('summary')
)

datainfo.view.fluidRow <- fluidRow(
  tabBox(
    width = 12,
    datainfo.view.descriptionPanel,
    datainfo.view.rawViewPanel,
    datainfo.view.visualizationPanel,
    datainfo.view.analysisPanel,
    datainfo.view.summaryPanel
  )
)
