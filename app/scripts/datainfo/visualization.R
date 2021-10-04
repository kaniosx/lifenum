# Visualization module

visualization.getAxisOptions <- function(key) {
  switch(
    key,
    'heartFailure' = colnames(data.heartFailureData),
    'diabetes' = colnames(data.diabetesData)
  )
}

visualization.updateVisualizationSelect <- function(session, inputDataset) {
  visualizationChoices <- visualization.getAxisOptions(inputDataset)
  
  updateSelectInput(
    session,
    'visualizationX',
    choices = visualizationChoices,
    selected = head(visualizationChoices, 1)
  )
}

visualization.visualize <- function(data, x) {
  hist(
    data[,x],
    main = paste('Histogram of ', x),
    xlab = x,
    col = 'orange'
  )
}