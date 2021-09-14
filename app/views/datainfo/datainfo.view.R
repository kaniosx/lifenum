datainfo.view.descriptionPanel <- tabPanel(
  title = 'Description',
  htmlOutput('selectedDataDescription')
)

datainfo.view.rawViewPanel <- tabPanel(
  title = 'Raw view',
  dataTableOutput('selectedRawData')
)

datainfo.view.visualizationPanel <- tabPanel(
  title = 'Simple Visualization',
  fluidRow(
    column(
      width = 2,
      selectInput(
        'visualizationX',
        'X-axis',
        ''
      ),
      selectInput(
        'visualizationY',
        'Y-axis',
        ''
      ),
      actionButton(
        'visualizeAction',
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
  title = 'Analysis',
  htmlOutput('selectedDataAnalysis')
)

datainfo.view.summaryPanel <- tabPanel(
  title = 'Summary'
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
