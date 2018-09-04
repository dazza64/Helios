library(shiny)
library(plotly)

shinyUI(fluidPage(
  

  HTML("    <head>
       <meta charset='utf-8'>
       <title>Helios</title>
       <link rel='stylesheet' href='main.css' media='screen' title='no title' charset='utf-8'/>
      Data Visualisation Component for EY project by Darren Levett
       </head>
      <body>
       <div class='header'>
       <div class='small_logo'><p>h</p></div>
       <div id='line_l'></div>
       <p id='saved_queries'>SAVED QUERIES</p>
       <div id='line_r'></div>
       <p id='visual'>VISUALISE</p>
       </div>
       <div class='main'>
       <h1>5. Visualisation</h1>
       </div>
       <div class='boxvis'>
       <p id='boxvis'
       </div>"),
  
  
  
  sidebarPanel(
    tabsetPanel(
      
      tabPanel("Set Axis", 
               uiOutput("xDropdown"),
               uiOutput("yDropdown"),
               uiOutput("toggleSeries"),
               uiOutput("SeriesDropdown"),
               checkboxInput("Normalize", label="Normalize(Histogram and Boxplot only)", value=FALSE)
               
               
      ),
      tabPanel("Information", 
               list( h6("This dynamic graphing tool was part of 'Helios', a tool developed for EYC3-Ernst & Young's Enterprise Intelligence Team as a capstone of Macquarie University's IT degree.
                        EYC3 required a data agnostic data analysis tool to improve efficiency of anomaly detection over current manual methods when analysing datasets. "),
                     h6(" This dynamic graphing solution complimented a query based report system built with PHP and SQL. In order to meet the requirements of data agnosticism, this tool reads CSV files and places them in dropdowns, where axes can be selected, legends can be toggled and data viewed
                        in different graphs. This version is not the final build compiled for EY. UK Accidents is the example test data loaded. Data by Thanasis https://www.kaggle.com/tsiaras/uk-road-safety-accidents-and-vehicles "),
                     h6("Some features of this tool are the ability to view data in 4 different charts, as well as the ability to toggle normalization. Additionally, data points can be toggled to dig deeper and gather more meaningful information about the data."),
                     h6("Due to the agnostic nature of this tool, some outputs may be unable to be displayed or look strange. Click 'Help' for the best ways to demonstrate this tool."),
                     h6("Helios Visualisation created by Darren Levett. Helios project team comprised of Josh Wilson, Duc Nguyen, Darren Levett and Leonard Ang."),
                     h6("For more information about this app or the EY project itself please email darren.levett@hotmail.com or check out https://github.com/dazza64")
               )
               
               
      ),

        
      tabPanel("Help",
               list( h5(" A chart will not display if your axis values are incorrect. Below is a guide for each graph type "),
                     h5("1. Scatterplot: X and Y axis's must be numeric. It can accept categorical data on either axis, but other charts are better for visualisation"),
                     h5("2. Bar Chart: X axis must be categorical. Y axis must be numeric"),
                     h5("3. Histogram: X axis must be numeric. Y axis is automatically set to 'Count'"),
                     h5("4. Box Plot: X axis must be categorical. Y Axis must be numeric."),
                     h5("Graph Series breaks down the data to provide more insight. For example, Setting X to On_Road_Obect_Hit and Y and Cost_Of_Incident broken down by Driver_Sex shows some interesting datapoints. "),
                     h6("By Darren Levett.")
                     )
      )
      

   )
),


    mainPanel(
      if(nrow(data) < 25000){     #change this to match nrow(data) limit
    tabsetPanel(
      tabPanel("Scatter Plot", plotlyOutput("Scatter")),
      tabPanel("Bar Chart", plotlyOutput("Bar")),
      tabPanel("Histogram", plotlyOutput("Histogram")),
      tabPanel("Box Plot", plotlyOutput("Box"))
   )
      }
   else 
     tabsetPanel(
       tabPanel("Scatter Plot", plotOutput("Scatter")),
       tabPanel("Bar Chart", plotOutput("Bar")),
       tabPanel("Histogram", plotOutput("Histogram")),
       tabPanel("Box Plot", plotOutput("Box"))
      # downloadButton("plotdownload", label = "Download the plot")
     )
   
   )
 )
)


       