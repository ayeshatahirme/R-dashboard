library(shiny)
library(shinydashboard)
library(caTools)
library(randomForest)
library(caret)
library(rpart)
library(rpart.plot)
library(RWeka)
library(decision)
#Ctrl + Shift + C to comment all selcted  

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Analysis Techniques Dashboard" ,              
                    dropdownMenu(type = "message",
                                 messageItem( from = "Analysis",message = "We are done with analysis" , icon = icon("user-circle")),
                                 messageItem( from = "Sales Update",message = "Sales are at 55%." ,icon = icon("bar-chart") , time = "12:00" ),
                                 messageItem( from = "Sales Update",message = "Meeting at 6 PM." ,icon = icon("handshake-o") , time = "03-12-2019" )
                                 
                                 
                    ),
                    
                    dropdownMenu(type = "notifications",
                                 notificationItem( text = "2 new tasks added" , icon = icon("dashboard") , status = "success"),
                                 notificationItem( text = "Server is 95% Load" , icon = icon("warning") , status = "warning")
                    ),
                    
                    dropdownMenu(type = "tasks", badgeStatus = "warning",
                                 taskItem(value = 90, color = "green", "Documentation"),
                                 taskItem(value = 17, color = "yellow", "Project X"),
                                 taskItem(value = 75, color = "purple", "Analysis" ),
                                 taskItem(value = 80, color = "red", "Overall project" )
                    )
                    
                    
    ), #Closing of header
    
    dashboardSidebar(
      sidebarSearchForm("SearchText" , "buttonSearch" , "Search"),
      sidebarMenu(    #menue to be dispalyed solves problem of going back and forth
        menuItem("DescionTreeID3" ,tabName = "DescionTreeID3" ,icon = icon("tree")),
        
        menuItem("DescionTreeC45" , tabName = "DescionTreeC45" ,icon = icon("tree")),
        
        menuItem("RandomForest" , tabName = "RandomForest",icon = icon("tree"))
        
        
      )),# closing of sidebar and sidebar menu
    dashboardBody(
      tabItems(
        tabItem(tabName = "DescionTreeID3",
                h1("Descion Tree id3"),
                fluidRow(
                  box( title = "Decision Tree", status = "primary",solidHeader = T,background = "olive" , helpText("Decision Tree of Testing data"),
                       plotOutput('Tree2' )),
                  box(title = "Confusion Matrix", status = "primary",solidHeader = T,background = "olive" , helpText("Prediction Results Using Testing data"),
                      verbatimTextOutput('confusionmatrix2'))
                )
      ), # closing of menuitem
      
      tabItem(tabName = "DescionTreeC45" ,
              h1("Descion Tree C4.5"),
              fluidRow(
                box( title = "Decision Tree", status = "primary",solidHeader = T,background = "olive" , helpText("Decision Tree of Testing data"),
                     plotOutput('Tree1')),
                box(title = "Confusion Matrix", status = "primary",solidHeader = T,background = "olive" , helpText("Prediction Results Using Testing data"),
                    verbatimTextOutput('confusionmatrix1')),
                box(title = "Accuray", status = "primary",solidHeader = T,background = "olive" , helpText("Accuracy of Testing Data"),
                    verbatimTextOutput('accuray1'))
              )
      ), # closing of menuitem
      
      
      tabItem(tabName = "RandomForest" ,  
              h1("Random Forest"),
              fluidRow(
                box( title = "Decision Tree", status = "primary",solidHeader = T,background = "olive" , helpText("Decision Tree of Testing data"),
                     plotOutput('Tree' )),
                box(title = "Confusion Matrix", status = "primary",solidHeader = T,background = "olive" , helpText("Prediction Results Using Testing data"),
                    verbatimTextOutput('confusionmatrix')),
                box(title = "Accuray", status = "primary",solidHeader = T,background = "olive" , helpText("Accuracy of Testing Data"),
                    verbatimTextOutput('accuray'))
                
                
              )
      )
      ) # closing of menuitem
      
      
    
    
    
  )# closing of dashboard body
  
) #closing of dashboard page


) # closing of shiny UI
