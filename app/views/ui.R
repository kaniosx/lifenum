library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = 'LifeNum'),

  dashboardSidebar(
    sidebarMenu(
      menuItem(
        'Data',
        tabName = 'rawData',
        icon = icon('th')
      ),
      menuItem(
        'Model',
        tabName = 'model',
        icon = icon('robot')
      ),
      menuItem(
        'About',
          tabName = 'info',
          icon = icon('medrt')
      )
    )
  ),

  dashboardBody(
    tabItems(
      tabItem(
        tabName = 'rawData',
        fluidRow(
          tabBox(
            width = 12,
            tabPanel(
              title = 'Description'
            ),
            tabPanel(
              title = 'Raw view'
            ),
            tabPanel(
              title = 'Visualization'
            ),
            tabPanel(
              title = 'Summary'
            )
          )
        )
      ),
      tabItem(
        tabName = 'model',
        h2('tutaj wyniki wytrenowania modelu')
      ),
      tabItem(
        tabName = 'info',
        h2('tutaj info o projekcie')
      )
    )
  )
)
