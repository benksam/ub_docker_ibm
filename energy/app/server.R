
server <- function(input, output) {
  
  
  # Tab0 
  
  output$table0 <- renderTable({ 
    colnames(Energy) = colabels
    
    data = Energy[c(36,39,130),c(2,9,11)]
    data
    # head(Energy[,c(2:4)], 3)  
  }) 
  # if (input$button == "Tables") {
  
  
  output$plot0 <- renderPlot({
    # Use the same filtered data that the table uses
    
    
    data = Energy
    g0 = ggplot(data, aes(gdpPerCapita, energyUsePerCapitaKgOilEq, col = incomeGroup)) +
      geom_point() +
      labs(x = "GDP per Capita", y = "Energy Consumption Per Capita") +
      ggtitle(input$title1) +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      guides(color = guide_legend(title = "Income Group", title.position = "top")) +
      theme_minimal()
    # scale_x_log10()
    # if (input$fit1 == TRUE) {
    #   g1 <- g1 + geom_smooth(method = "lm", se = FALSE)
    # if (input$button == "Plots") {}
    g0
    
    
  })   
  
  
  # Create FIRST a reactive variable named "filtered_data"
  # Tab1  
  filtered_data1 <- reactive({
    # Filter the data
    data1 <- Energy
    data1 <- subset(data1,  energyUsePerCapitaKgOilEq >= input$energyUse1[1] & 
                      energyUsePerCapitaKgOilEq <= input$energyUse1[2])
    if (input$region1 != "All"){
      data1 <- subset(data1,region == input$region1)
    }
    # colnames(data1) = colabels 
    data1
  })
  
  # Tab2  
  filtered_data2 <- reactive({
    # Filter the data
    data2 <- Energy
    data2 <- subset(data2,  energyUsePerCapitaKgOilEq >= input$energyUse2[1] & 
                      energyUsePerCapitaKgOilEq <= input$energyUse2[2])
    if (input$incomeGroup1 != "All"){
      data2 <- subset(data2, incomeGroup == input$incomeGroup1)
    }
    # colnames(data2) = colabels 
    data2
  })
  
  
  # Tab3  
  filtered_data3 <- reactive({
    # Filter the data
    data3 <- Energy
    data3 <- subset(data3,  co2EmissionsTonsPerCapita >= input$co2emissions[1] & 
                      co2EmissionsTonsPerCapita <= input$co2emissions[2])
    if (input$incomeGroup2 != "All Countries"){
      data3 <- subset(data3, incomeGroup == input$incomeGroup2)
    }
    # colnames(data2) = colabels 
    data3
  })
  
  
  # Tab4  - Summary Data
  filtered_data40 <- reactive({
    # Filter the data
    data40 <- Energy
    data40 <- Energy %>% 
      group_by(incomeGroup) %>% 
      summarise(`Average Income` = round(mean(gdpPerCapita),0),
                `Average Energy Consumption` = round(mean(energyUsePerCapitaKgOilEq),1),
                `Average CO2-emissions` = round(mean(co2EmissionsTonsPerCapita),1))
    
    # if (input$region != "All"){
    #   data4 <- subset(data4,region == input$region)
    # }
    # colnames(data4) = colabels 
    colnames(data40)[1] = "Income Group"
    data40
  })  
  
  
  # Tab4  - Summary Data
  filtered_data41 <- reactive({
    # Filter the data
    data41 <- Energy
    data41 <- Energy %>% 
      group_by(incomeGroup, region) %>% 
      summarise(`Average Income` = round(mean(gdpPerCapita),0),
                `Average Energy Consumption` = round(mean(energyUsePerCapitaKgOilEq),1),
                `Average CO2-emissions` = round(mean(co2EmissionsTonsPerCapita),1))
    
    # if (input$region != "All"){
    #   data4 <- subset(data4,region == input$region)
    # }
    # colnames(data4) = colabels 
    colnames(data41)[1] = "Income Group"
    
    data41
  })  
  
  
  # Tab4  - Plots
  filtered_data42 <- reactive({
    # Filter the data
    data42 <- Energy
    if (input$region2 != "All Countries"){
      data42 <- subset(data42,  region %in% input$region2)
      
      
    }
    
    data42
  }) 
  
  output$table1 <- DT::renderDataTable({
    if(input$show_data1){ 
      DT::datatable(filtered_data1(), 
                    colnames = colabels,
                    options = list(pageLength = 10), 
                    rownames = FALSE) 
    }
    
  })
  
  
  output$table2 <- DT::renderDataTable({
    if(input$show_data2){
      DT::datatable(filtered_data2(), 
                    colnames = colabels,
                    options = list(pageLength = 10), 
                    rownames = FALSE)  
      
    }
  })
  
  output$table4 <- renderTable({ # DT::renderDataTable({
    if (input$region2 == "All Countries"){
      filtered_data40()} else {
        data = filtered_data41() %>% filter(region %in% input$region2) 
        colnames(data)[2] = "World Region"
        data
      }
    # DT::datatable(
    #               colnames = colabels) 
    
    
  })  
  
  # New plot title1
  new_plot_title1 <- eventReactive(
    eventExpr = input$update_plot_title1, 
    valueExpr = { (input$title1) }, #toTitleCase(
    ignoreNULL = FALSE
  )
  
  
  # Create the plot render function  
  output$plot1 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data1()
    g1 = ggplot(data, aes(gdpPerCapita, energyUsePerCapitaKgOilEq, col = incomeGroup)) +
      geom_point() +
      labs(x = "GDP per Capita", y = "Energy Consumption Per Capita") +
      ggtitle(new_plot_title1()) +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      guides(color = guide_legend(title = "Income Group", title.position = "top")) +
      theme_minimal()
    # scale_x_log10()
    if (input$fit1 == TRUE) {
      g1 <- g1 + geom_smooth(method = "lm", se = FALSE)
    }
    g1
    
  })
  
  
  # New plot title2
  new_plot_title2 <- eventReactive(
    eventExpr = input$update_plot_title2, 
    valueExpr = { (input$title2) }, #toTitleCase(
    ignoreNULL = FALSE
  )  
  
  # Create the plot render function  
  output$plot2 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data2()
    g2 = ggplot(data, aes(gdpPerCapita, energyUsePerCapitaKgOilEq, col = region)) +
      geom_point() +
      labs(x = "GDP per Capita", y = "Energy Consumption Per Capita") +
      facet_wrap(~ region) +
      ggtitle(new_plot_title2()) +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      guides(color = guide_legend(title = "Region", title.position = "top")) +
      theme_minimal()
    # scale_x_log10()
    if (input$fit2 == TRUE) {
      g2 <- g2 + geom_smooth(method = "lm", se = FALSE)
    }
    g2
    
  })
  
  # New plot title3
  new_plot_title3 <- eventReactive(
    eventExpr = input$update_plot_title3, 
    valueExpr = { (input$title3) }, #toTitleCase(
    ignoreNULL = FALSE
  )  
  
  
  # Create the plot render function  
  output$plot3 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data3()
    g3 = ggplot(data, aes(gdpPerCapita, co2EmissionsTonsPerCapita, col = region)) + # 
      geom_point() +
      labs(x = "GDP per Capita", y = "CO2-emissions Per Capita") +
      ggtitle(new_plot_title3()) +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      guides(color = guide_legend(title = "Region", title.position = "top")) +
      theme_minimal()
    # scale_x_log10()
    if (input$fit3 == TRUE) {
      g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    }
    g3
    
  })
  
  #BRUSHED table 
  
  # Create data table
  output$tablebrush <- DT::renderDataTable({
    brushedPoints(filtered_data3(), brush = input$plot_brush) %>%
      select("Country Name" = countryName, 
             "Region" = region, 
             "Income Group" = incomeGroup,
             "GDP per Capita" = gdpPerCapita,
             "CO2-emissions per Capita" = co2EmissionsTonsPerCapita)
  }) 
  
  
  
  # Create the plot render function  
  output$plot41 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data42()
    g41 = ggplot(data, aes(gdpPerCapita, fill = incomeGroup)) +
      geom_density(alpha = input$alpha) +
      #      facet_wrap(~ incomeGroup) +
      labs(x = "Log(GDP per Capita)", y = "Density") +
      ggtitle("Income Distribution") +
      theme(plot.title = element_text(size = 30, face = "bold")) + 
      guides(fill = guide_legend(title = "Income Group", title.position = "top")) +
      
      labs(xlim = c(0,120000)) +
      theme_minimal()
    # scale_x_log30()
    # if (input$fit1 == TRUE) {
    #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    # }
    g41
    
  })    
  
  # Create the plot render function  
  output$plot42 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data42()
    g42 = ggplot(data, aes(energyUsePerCapitaKgOilEq, fill = incomeGroup)) +
      geom_density(alpha = input$alpha) +
      #      facet_wrap(~ incomeGroup) +
      labs(x = "Log(Energy use per capita (kg oil eq))", y = "Density") +
      ggtitle("Energy Consumption Distribution") +
      theme(plot.title = element_text(size = 30, face = "bold")) + 
      guides(fill = guide_legend(title = "Income Group", title.position = "top")) +
      
      labs(xlim = c(0,120000)) +
      theme_minimal()
    # scale_x_log30()
    # if (input$fit1 == TRUE) {
    #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    # }
    g42
    
  })
  
  # Create the plot render function  
  output$plot43 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data42()
    g43 = ggplot(data, aes(co2EmissionsTonsPerCapita, fill = incomeGroup)) +
      geom_density(alpha = input$alpha) +
      #      facet_wrap(~ incomeGroup) +
      labs(x = "Log(CO2 emissions (tons per capita))", y = "Density") +
      ggtitle("CO2-emissions Distribution") +
      theme(plot.title = element_text(size = 30, face = "bold")) + 
      guides(fill = guide_legend(title = "Income Group", title.position = "top")) +
      
      labs(xlim = c(0,120000)) +
      scale_x_log10() +
      theme_minimal()
    
    # if (input$fit1 == TRUE) {
    #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    # }
    g43      
    
    
  })  
  
  
  
}
