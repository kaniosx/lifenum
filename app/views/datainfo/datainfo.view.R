datainfo.view.datasetSelectionBox <- box(
  selectInput(
    'dataset',
    'Choose dataset',
    c(
      'Breast cancer' = 'breastCancer',
      'Covid19' = 'covid19',
      'Heart failure' = 'heartFailure'
    ),
    'heartFailure',
  )
)

datainfo.view.descriptionPanel <- tabPanel(
  title = 'Description',
  htmlOutput('selectedDataDescription')
)

datainfo.view.rawViewPanel <- tabPanel(
  title = 'Raw view',
  dataTableOutput('selectedRawData')
)

datainfo.view.visualizationPanel <- tabPanel(
  title = 'Visualization'
)

datainfo.view.summaryPanel <- tabPanel(
  title = 'Summary'
)

datainfo.view.fluidRow <- fluidRow(
  datainfo.view.datasetSelectionBox,
  tabBox(
    width = 12,
    datainfo.view.descriptionPanel,
    datainfo.view.rawViewPanel,
    datainfo.view.visualizationPanel,
    datainfo.view.summaryPanel
  )
)
