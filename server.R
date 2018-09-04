library(shiny)
library(ggplot2)
library(plotly)
library(extrafont)
options(scipen=999)         #Removes Scientific Notation

#data comes from global.R

shinyServer(function(input, output, session) {
    
    dropdowns <- reactive({
      data
    })

  #retrives first row for dropdown
  output$xDropdown <- renderUI({
    selectInput("xaxis", "Value to plot to X Axis",
                names(dropdowns()) 
    )
  })
    output$yDropdown <- renderUI({
    selectInput("yaxis", "Value to plot to Y Axis",
                names(dropdowns())
    )
  })
  
  output$SeriesDropdown <- renderUI({
    selectInput("Series", "Graph Series",
                names(dropdowns())
    )
  })

  # create scatterplot
  if(nrow(data) < 25000) {
  output$Scatter <- renderPlotly( {
    validate(
      need(input$xaxis, "Loading"))
    sp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis,color=input$Series)) + geom_point(size=3)
    sp <- sp + ggtitle("Scatter Plot") + theme(text=element_text(family="Arial"))
    ggplotly(sp)
  })
}
  else 
    output$Scatter <- renderPlot( {
      validate(
        need(input$xaxis, "Loading"))
      sp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis,color=input$Series)) + geom_point(size=3)
      sp <- sp + ggtitle("Scatter Plot") + theme(text=element_text(family="Arial"))
      print(sp)
    })
  
  # create bar chart
  if(nrow(data) < 25000) {
    output$Bar <- renderPlotly( {
      validate(
        need(input$xaxis, "Loading"))
    bc <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis,fill=input$Series)) + geom_bar(stat="identity")
    bc <- bc + scale_x_discrete(labels=abbreviate)+ ggtitle("Bar Chart") + theme(text=element_text(family="Arial"))
    ggplotly(bc)
  })  
  }
  else 
    output$Bar <- renderPlot( {
      validate(
        need(input$xaxis, "Loading"))
      bc <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis,fill=input$Series)) + geom_bar(stat="identity")
      bc <- bc + scale_x_discrete(labels=abbreviate)+ ggtitle("Bar Chart") + theme(text=element_text(family="Arial"))
      print(bc)
    })  
  
  
  # create histogram
  if(nrow(data) < 25000){
  output$Histogram <-renderPlotly( {
    validate(
      need(input$xaxis, "Loading"))
    if (input$Normalize == FALSE){
      hs <- ggplot(data, aes_string(x=input$xaxis)) + geom_histogram(fill="light blue") 
      hs <- hs + ggtitle("Histogram") + theme(text=element_text(family="Arial"))
      ggplotly(hs)
    }
    else if(input$Normalize == TRUE){
      validate(
        need(input$xaxis, "Loading"))
      hs <- ggplot(data, aes_string(x=input$xaxis)) + geom_histogram(fill="light blue")
      hs <- hs + scale_x_log10() + ggtitle("Normalized Histogram")  + theme(text=element_text(family="Arial"))
      ggplotly(hs)
    }
  })
  }
  else
    output$Histogram <-renderPlot( {
      validate(
        need(input$xaxis, "Loading"))
      if (input$Normalize == FALSE){
        hs <- ggplot(data, aes_string(x=input$xaxis)) + geom_histogram(fill="light blue") 
        hs <- hs + ggtitle("Histogram") + theme(text=element_text(family="Arial"))
        print(hs)
      }
      else if(input$Normalize == TRUE){
        validate(
          need(input$xaxis, "Loading"))
        hs <- ggplot(data, aes_string(x=input$xaxis)) + geom_histogram(fill="light blue")
        hs <- hs + scale_x_log10() + ggtitle("Normalized Histogram")  + theme(text=element_text(family="Arial"))
        print(hs)
      }
    })
    
  # create boxplot
  if(nrow(data) < 25000) {
    output$Box <- renderPlotly( {
      validate(
        need(input$xaxis, "Loading"))
      if (input$Normalize == FALSE){
       bp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis)) + geom_boxplot() 
       bp <- bp + scale_x_discrete(labels=abbreviate) + ggtitle("Box Plot") + theme(text=element_text(family="Arial"))
       ggplotly(bp)
    }
      else if(input$Normalize == TRUE){
        validate(
          need(input$xaxis, "Loading"))
        bp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis)) + geom_boxplot() + scale_y_log10()
        bp <- bp + scale_x_discrete(labels=abbreviate) + ggtitle("Normalized Box Plot") + theme(text=element_text(family="Arial"))
        ggplotly(bp)
      }
    })
  }
  else
    output$Box <- renderPlot( {
      validate(
        need(input$xaxis, "Loading"))
      if (input$Normalize == FALSE){
        bp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis)) + geom_boxplot() 
        bp <- bp + scale_x_discrete(labels=abbreviate) + ggtitle("Box Plot") + theme(text=element_text(family="Arial"))
        print(bp)
      }
      else if(input$Normalize == TRUE){
        validate(
          need(input$xaxis, "Loading"))
        bp <- ggplot(data, aes_string(x=input$xaxis,y=input$yaxis)) + geom_boxplot() + scale_y_log10()
        bp <- bp + scale_x_discrete(labels=abbreviate) + ggtitle("Normalized Box Plot") + theme(text=element_text(family="Arial"))
        print(bp)
      }
    })
  
  })

#runApp() 