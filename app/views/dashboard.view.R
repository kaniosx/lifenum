dashboard.view.sideBar <- dashboardSidebar(
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
      h2('tutaj wyniki wytrenowania modelu')
    ),
    tabItem(
      tabName = 'about',
      h2('tutaj info o projekcie')
    )
  )
)

dashboard.view.header <- dashboardHeader(title = 'LifeNum')
