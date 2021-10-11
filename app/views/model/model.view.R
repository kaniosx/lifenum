model.view.getForm <- function(datasetName) {
  switch(
    datasetName,
    'diabetes' = model.view.diabetesForm,
    'heartFailure' = model.view.heartFailureForm
  )
}

model.view.trainingPanel <- tabPanel(
  title = 'Training',
  selectInput(
    'modelType', 
    'Model type',
    choices = c(
      'Decision Tree Classification' = 'decisionTreeClassifier',
      'Logistic reggresion' = 'logisticRegression',
      # 'Random forest' = 'randomForestClassifier',
      'K Nearest Neighbors' = 'kNeighborsClassifier'
    ),
    selected = 'logisticReggresion'
  ),
  actionButton('trainModelEvent', 'Train model'),
  textOutput('trainModelStatusMessage'),
  tableOutput('confusionMatrix')
)

model.view.userDataPanel <- tabPanel(
  title = 'Upload test data',
  fileInput(
    'userFile',
    'Upload your CSV File',
    multiple = FALSE,
    accept = c(
      'text/csv',
      'text/comma-separated-values,text/plain',
      '.csv'
    )
  ),
  actionButton('userFileEvent', 'Generate answers'),
  tableOutput('userFileOutput'),
  downloadButton("downloadData", "Download")
)

model.view.formPanel <- tabPanel(
  title = 'Model form',
  uiOutput('selectedDataModelForm'),
  actionButton(
    'checkFormEvent',
    'Check'
  ),
  tableOutput('formTable'),
  textOutput('formScore')
)

model.view.fluidRow <- fluidRow(
  tabBox(
    width = 12,
    model.view.trainingPanel,
    model.view.formPanel,
    model.view.userDataPanel
  )
)

model.view.diabetesForm <- fluidPage(
  numericInput(
    'diabetesAge', 
    'Age:',
    0
  ),
  selectInput(
    'diabetesGender',
    'Gender:',
    c('Male' = 'Male', 'Female' = 'Female')
  ),
  selectInput(
    'diabetesPolyuria',
    'Polyuria:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPolydipsia',
    'Polydipsia:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesSuddenWeightLoss',
    'Sudden weight loss:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesWeakness',
    'Weakness:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPolyphagia',
    'Polyphagia:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesGenitalThrush',
    'Genital thrush:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesVisualBlurring',
    'Visual blurring:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesItching',
    'Itching:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesIrritability',
    'Irritability:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesDelayedHealing',
    'Delayed healing:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPartialParesis',
    'Partial paresis:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesMuscleStiffness',
    'Polyuria:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesAlopecia',
    'Alopecia:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesObesity',
    'Obesity:',
    c('Yes' = 'Yes', 'No' = 'No'),
    selected = 'No'
  )
)

model.view.heartFailureForm <- fluidPage(
  numericInput(
    'heartFailureAge', 
    'Age:',
    0
  ),
  selectInput(
    'heartFailureGender',
    'Gender:',
    c('Male' = 1, 'Female' = 0),
    selected = 1
  ),
  selectInput(
    'heartFailureAnaemia',
    'Anaemia:',
    c('Yes' = 1, 'No' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailureCreatininePhosphokinase', 
    'Creatinine phosphokinase:',
    0
  ),
  selectInput(
    'heartFailureDiabetes',
    'Diabetes:',
    c('Yes' = 1, 'No' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailureEjectionFraction', 
    'Ejection fraction:',
    0
  ),
  selectInput(
    'heartFailureHighBloodPreasure',
    'High blood preasure:',
    c('Yes' = 1, 'No' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailurePlatelets', 
    'Platelets:',
    0
  ),
  numericInput(
    'heartFailureSerumCreatinine', 
    'Serum creatinine:',
    0
  ),
  numericInput(
    'heartFailureSerumSodium', 
    'Serum sodium:',
    0
  ),
  selectInput(
    'heartFailureSmoking',
    'Smoking:',
    c('Yes' = 1, 'No' = 0),
    selected = 0
  )
)

