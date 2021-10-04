dashboard.view.sideBar <- dashboardSidebar(
  selectInput(
    'dataset',
    'Choose dataset',
    c(
      'Heart failure' = 'heartFailure',
      'Diabetes' = 'diabetes'
    ),
    'heartFailure',
  ),
  sidebarMenu(
    menuItem(
      'Data',
      tabName = 'dataInfo',
      icon = icon('th')
    ),
    menuItem(
      'Model',
      tabName = 'model',
      icon = icon('robot')
    ),
    menuItem(
      'About',
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
