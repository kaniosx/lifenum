library(shinydashboard)

source('views/datainfo/datainfo.view.R', local = TRUE)
source('views/model/model.view.R', local = TRUE)
source('views/dashboard.view.R', local = TRUE)

ui <- dashboardPage(
  dashboard.view.header,
  dashboard.view.sideBar,
  dashboard.view.body
)
