dashboard.view.sideBar <- dashboardSidebar(
  selectInput(
    'dataset',
    'Wybierz dane',
    c(
      'Niewydolność serca' = 'heartFailure',
      'Cukrzyca' = 'diabetes'
    ),
    'heartFailure',
  ),
  sidebarMenu(
    menuItem(
      'Dane',
      tabName = 'dataInfo',
      icon = icon('th')
    ),
    menuItem(
      'Modele',
      tabName = 'model',
      icon = icon('robot')
    ),
    menuItem(
      'O projekcie',
      tabName = 'about',
      icon = icon('medrt')
    )
  )
)

dashboard.view.body <- dashboardBody(
  tabItems(
    tabItem(
      tabName = 'dataInfo',
      datainfo.view.fluidRow
    ),
    tabItem(
      tabName = 'model',
      model.view.fluidRow
    ),
    tabItem(
      tabName = 'about',
      htmlOutput('about')
    )
  )
)

dashboard.view.header <- dashboardHeader(title = 'LifeNum')
