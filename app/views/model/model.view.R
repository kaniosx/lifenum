model.view.getForm <- function(datasetName) {
  switch(
    datasetName,
    'diabetes' = model.view.diabetesForm,
    'heartFailure' = model.view.heartFailureForm
  )
}

model.view.trainingPanel <- tabPanel(
  title = 'Trening',
  selectInput(
    'modelType', 
    'Typ modelu',
    choices = c(
      'Naiwny klasyfikator Bayesa' = 'naiveBayes',
      'Klasyfikator drzew decyzyjnych' = 'decisionTreeClassifier',
      'Regresja logistyczna' = 'logisticRegression',
      'Klasyfikator k najbliższych sąsiadów' = 'kNeighborsClassifier'
    ),
    selected = 'logisticReggresion'
  ),
  actionButton('trainModelEvent', 'Trenuj'),
  textOutput('trainModelStatusMessage'),
  tableOutput('confusionMatrix')
)

model.view.userDataPanel <- tabPanel(
  title = 'Importuj dane testowe',
  fileInput(
    'userFile',
    'Załaduj swój plik CSV',
    multiple = FALSE,
    accept = c(
      'text/csv',
      'text/comma-separated-values,text/plain',
      '.csv'
    )
  ),
  actionButton('userFileEvent', 'Wygeneruj odpowiedzi'),
  tableOutput('userFileOutput'),
  downloadButton("downloadData", "Pobierz")
)

model.view.formPanel <- tabPanel(
  title = 'Formularz',
  uiOutput('selectedDataModelForm'),
  actionButton(
    'checkFormEvent',
    'Sprawdź'
  ),
  tableOutput('formTable'),
  textOutput('formScore')
)

model.view.comparisonPanel <- tabPanel(
  title = 'Krzywe ROC',
  actionButton(
    'generateRocEvent',
    'Generuj'
  ),
  plotOutput('comparison')
)

model.view.fluidRow <- fluidRow(
  tabBox(
    width = 12,
    model.view.trainingPanel,
    model.view.formPanel,
    model.view.userDataPanel,
    model.view.comparisonPanel
  )
)

model.view.diabetesForm <- fluidPage(
  numericInput(
    'diabetesAge', 
    'Wiek:',
    0
  ),
  selectInput(
    'diabetesGender',
    'Płeć:',
    c('Mężczyzna' = 'Male', 'Kobieta' = 'Female')
  ),
  selectInput(
    'diabetesPolyuria',
    'Poliuria:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPolydipsia',
    'Polidypsja:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesSuddenWeightLoss',
    'Sudden weight loss:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesWeakness',
    'Osłabienie:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPolyphagia',
    'Polifagia:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesGenitalThrush',
    'Pleśniawki narządów płciowych:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesVisualBlurring',
    'Rozmyte widzenie:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesItching',
    'Swędzenie:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesIrritability',
    'Drażliwość:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesDelayedHealing',
    'Opóźnione gojenie:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesPartialParesis',
    'Częściowy niedowład:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesMuscleStiffness',
    'Sztywność mięśni:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesAlopecia',
    'Alopecja:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  ),
  selectInput(
    'diabetesObesity',
    'Otyłość:',
    c('Tak' = 'Yes', 'Nie' = 'No'),
    selected = 'No'
  )
)

model.view.heartFailureForm <- fluidPage(
  numericInput(
    'heartFailureAge', 
    'Wiek:',
    0
  ),
  selectInput(
    'heartFailureGender',
    'Płeć:',
    c('Mężczyzna' = 1, 'Kobieta' = 0),
    selected = 1
  ),
  selectInput(
    'heartFailureAnaemia',
    'Anemia:',
    c('Tak' = 1, 'Nie' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailureCreatininePhosphokinase', 
    'Fosfokinaza kreatynowa:',
    0
  ),
  selectInput(
    'heartFailureDiabetes',
    'Cukrzyca:',
    c('Tak' = 1, 'Nie' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailureEjectionFraction', 
    'Frakcja wyrzutowa:',
    0
  ),
  selectInput(
    'heartFailureHighBloodPreasure',
    'Wysokie ciśnienie krwi:',
    c('Tak' = 1, 'Nie' = 0),
    selected = 0
  ),
  numericInput(
    'heartFailurePlatelets', 
    'Płytki krwi:',
    0
  ),
  numericInput(
    'heartFailureSerumCreatinine', 
    'Kreatynina:',
    0
  ),
  numericInput(
    'heartFailureSerumSodium', 
    'Sód:',
    0
  ),
  selectInput(
    'heartFailureSmoking',
    'Palenie:',
    c('Tak' = 1, 'Nie' = 0),
    selected = 0
  )
)

