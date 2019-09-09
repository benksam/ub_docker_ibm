
server <- function(input, output) {
  
  
  # Tab0 
  
  output$table0 <- renderTable({ 
    colnames(AgriIncome) = colabels1
    data = head(AgriIncome[,c(1:2,13)], 3)
    data[,2] = c("2009", "2010", "2011")
    data
  }) 
  # if (input$button == "Tables") {
  
  
  output$plot0 <- renderPlot({
    # Use the same filtered data that the table uses
    
    data = AgriIncome
    g0 = ggplot(data, aes(factor(year), cerealYieldKgPerHectare, col = incomeGroup)) +
      geom_point() +
      # facet_grid(. ~ incomeGroup)
      labs(x = "Year", y = "Cereal yield (kg per hectare)") +
      ggtitle("Evolution of Cereal Yield (2009-2017)") +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      guides(color = guide_legend(title = "Income Group", title.position = "top")) +
      theme_classic()
    # scale_x_log10()
    # if (input$fit1 == TRUE) {
    #   g1 <- g1 + geom_smooth(method = "lm", se = FALSE)
    # if (input$button == "Plots") {}
    g0
    
    
    
    # ggplot(WorldIncome_ts, aes_string("year", y)) +
    #   geom_line() +
    #   facet_grid(. ~ WorldIncome_ts[[1]]) +
    #   ggtitle(title)
    # #    coord_flip() +
    # # stat_smooth(method = "lm")
    
    
    
    
  })   
  
  
  
  # Create FIRST a reactive variable named "filtered_data"
  # Tab1  
  filtered_data1 <- reactive({
    # Filter the data
    data1 <- AgriIncome[,c(1:14)]  # [,c(1:4, 6:9, 11, 15:19)]
    data1 <- subset(data1,  year >= input$years1[1] & 
                      year <= input$years1[2]) 
    # if (input$income1 != "All"){
    #   data1 <- subset(data1,region == input$region1)
    # }
    # colnames(data1) = colabels 
    data1
  })
  
  # Tab2  
  filtered_data2 <- reactive({
    # Filter the data
    data2 <- AgriRegion[,c(1:14)] # [,c(1:4, 6:9, 11, 15:19)]
    data2 <- subset(data2,  year >= input$years2[1] & 
                      year <= input$years2[2])
    # if (input$incomeGroup1 != "All"){
    #   data2 <- subset(data2, incomeGroup == input$incomeGroup1)
    # }
    # colnames(data2) = colabels 
    data2
  })
  
  
  output$table1 <- DT::renderDataTable({
    if(input$show_data1){
      DT::datatable(filtered_data1(), 
                    colnames = colabels1[c(1:14)],
                    options = list(pageLength = 10), 
                    rownames = FALSE) # [c(1:4, 6:9, 11, 15:19)])
      
    } 
  })
  
  
  output$table2 <- DT::renderDataTable({
    if(input$show_data2){
      DT::datatable(filtered_data2(), 
                    colnames = colabels2[c(1:14)],
                    options = list(pageLength = 10), 
                    rownames = FALSE) # [c(1:4, 6:9, 11, 15:19)])
      # , formatRound(c(2:4, 6:9, 11:13, 15:19), 1)
    }
  })
  
  
  names(AgriIncome)               
  
  
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
    g1 = ggplot(data, aes_string(x = "year", y = input$var1, col = "incomeGroup")) + # input$var1
      
      
      theme_minimal() +
      
      geom_line() +
      labs(x = "Year", y = "") +
      facet_grid(~ incomeGroup, labeller = label_wrap_gen()) +
      
      # geom_line() +
      # labs(x = "Year", y = "") + 
      # facet_grid(~ incomeGroup, labeller = label_wrap_gen()) +
      
      ggtitle(new_plot_title1()) +
      # labs( title = isolate({input$title1}) ) +
      
      theme(axis.text.x = element_text(angle = 0,
                                       hjust = 1, size = 10, face = "bold")) +
      theme(axis.text.y = element_text(face = "bold")) +
      theme(plot.title = element_text(size = 15, face = "bold")) + 
      theme(strip.background = element_blank(),
            strip.text.x = element_text(size = 12, face = "bold")) +
      
      guides(color = guide_legend(title = "Income Group", title.position = "top"))
    # scale_x_log10()
    if (input$fit1 == TRUE) {
      g1 <- g1 + geom_smooth(method = "lm", se = FALSE)
    }
    g1
    
  })
  
  output$description1 <- renderText({
    paste0("   The plot above titled '", new_plot_title1(), 
           "' visualizes the evolution with time of this variable.")
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
    g2 = ggplot(data, aes_string(x = "year", y = input$var2, col = "worldRegion")) + # input$var2
      
      
      
      theme_minimal() +
      
      geom_line() +
      labs(x = "Year", y = "") +
      facet_grid(~ worldRegion, labeller = label_wrap_gen()) +
      
      ggtitle(new_plot_title2()) +
      
      #labs( title = isolate({input$title1}) ) +
      
      theme(axis.text.x = element_text(angle = 0,
                                       hjust = 1, size = 8, face = "bold")) +
      theme(axis.text.y = element_text(face = "bold")) +
      theme(plot.title = element_text(size = 12, face = "bold")) +
      theme(strip.background = element_blank(),
            strip.text.x = element_text(size = 10, face = "bold")) +
      
      guides(color = guide_legend(title = "Region", title.position = "top"))
    # scale_x_log10()
    if (input$fit2 == TRUE) {
      g2 <- g2 + geom_smooth(method = "lm", se = FALSE)
    }
    g2
    
  })
  
  
  output$description2 <- renderText({
    paste0("   The plot above titled '", new_plot_title2(), 
           "' visualizes the evolution with time of this variable.")
  })
  
  
  
  
  # New plot title1
  new_plot_title4 <- eventReactive(
    eventExpr = input$update_plot_title4, 
    valueExpr = { (input$title4) }, #toTitleCase(
    ignoreNULL = FALSE
  )
  
  # Tab4  - Summary Data
  filtered_data41 <- reactive({
    # Filter the data
    # Filter the data
    data41 <- AgriIncome[,c(1, 3:14)] # [,c(1:4, 6:9, 11, 15:19)]
    data41 <- data41 %>% # select(incomeGroup, urbanPopulationPercentOfTotal) %>% 
      group_by(incomeGroup) %>% 
      summarise_all(funs(mean(., na.rm = TRUE)))  # round(mean(, na.rm = TRUE),1))
    
    # `Average Energy Consumption` = round(mean(urbanPopulationPercentOfTotal),1),
    # `Average CO2-emissions` = round(mean(urbanPopulationPercentOfTotal),1))
    
    # if (input$region != "All"){
    #   data4 <- subset(data4,region == input$region)
    # }
    # colnames(data4) = colabels 
    # colnames(data41)[1] = "Income Group"
    data41
  })  
  
  # aggregate(x = values, 
  #           by = list(unique.values = values$value), 
  #           FUN = length)
  
  
  # output$tableX <- renderTable({ # DT::renderDataTable({
  #   
  #   filtered_data41()
  #   # , 
  #   # colnames(data)=c("Income Group", "Average"))
  #   # data[,2] = round(data[,2],1)
  #   # data
  #   # DT::datatable(
  #   #               colnames = colabels) 
  #   
  #   
  # })  
  
  
  # Create the plot render function  
  output$plot41 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data41()
    g41 = ggplot(data, aes_string(x = "incomeGroup", y = input$var4, fill = "incomeGroup")) +
      geom_col() +
      theme_minimal() +
      #    #      facet_wrap(~ incomeGroup) + alpha = input$alpha
      labs(x = "Income Group", y = "") + #Cereal yield (kg per hectare)
      ggtitle(new_plot_title4()) +
      theme(plot.title = element_text(size = 20, face = "bold")) +
      guides(fill = guide_legend(title = "Income Group", title.position = "top"))
    
    # #   labs(xlim = c(0,120000)) +
    # theme_bw()
    # scale_x_log30()
    # if (input$fit1 == TRUE) {
    #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    # }
    g41
  }) 
  
  # forestAreaPercentOfLandArea
  
  
  # Tab4  - Summary Data
  filtered_data42 <- reactive({
    # Filter the data
    # Filter the data
    data42 <- AgriRegion[,c(1, 3:14)] # [,c(1:4, 6:9, 11, 15:19)]
    data42 <- data42 %>% # select(worldRegion, urbanPopulationPercentOfTotal) %>% 
      group_by(worldRegion) %>% 
      summarise_all(funs(mean(., na.rm = TRUE))) # round(mean(input$var4, na.rm = TRUE),1)) # forestAreaPercentOfLandArea
    
    # `Average Energy Consumption` = round(mean(energyUsePerCapitaKgOilEq),1),
    # `Average CO2-emissions` = round(mean(co2EmissionsTonsPerCapita),1))
    
    # if (input$region != "All"){
    #   data4 <- subset(data4,region == input$region)
    # }
    # colnames(data4) = colabels 
    # colnames(data41)[1] = "Income Group"
    data42
  })  
  
  
  # Create the plot render function  
  output$plot42 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data42()
    g42 = ggplot(data, aes_string(x = "worldRegion", y = input$var4, fill = "worldRegion")) +
      geom_col() +
      theme_minimal() +
      #    #      facet_wrap(~ incomeGroup) + alpha = input$alpha
      labs(x = "World Region", y = "") + #Cereal yield (kg per hectare)
      # ggtitle(new_plot_title4) +
      theme(plot.title = element_text(size = 20, face = "bold")) +
      guides(fill = guide_legend(title = "World Region", title.position = "top")) +
      theme(axis.text.x = element_text(angle = 45,
                                       hjust = 1))  # , size = 8, face = "bold"
    # #   labs(xlim = c(0,120000)) +
    # theme_bw() +
    scale_x_discrete(labels = function(x) str_wrap(x, width = 10))
    #  # if (input$fit1 == TRUE) {
    #  #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    #  # }
    g42
    
  }) 
  
  
  # # Tab4  - Summary Data
  # filtered_data43 <- reactive({
  #   # Filter the data
  #   # Filter the data
  #   data43 <- AgriIncome[,c(1:14)] # [,c(1:4, 6:9, 11, 15:19)]
  #   data43 <- data43 %>% 
  #     group_by(incomeGroup) %>% 
  #     summarise(`Worker Productivity` = 
  #                 round(mean(agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us,
  #                            na.rm = T),1))
  #   
  #   # `Average Energy Consumption` = round(mean(energyUsePerCapitaKgOilEq),1),
  #   # `Average CO2-emissions` = round(mean(co2EmissionsTonsPerCapita),1))
  #   
  #   # if (input$region != "All"){
  #   #   data4 <- subset(data4,region == input$region)
  #   # }
  #   # colnames(data4) = colabels 
  #   # colnames(data43)[1] = "Income Group"
  #   data43
  # })  
  # 
  # 
  # # Create the plot render function  
  # output$plot43 <- renderPlot({
  #   # Use the same filtered data that the table uses
  #   data = filtered_data43()
  #   g43 = ggplot(data, aes(incomeGroup, data[[2]], fill = incomeGroup)) +
  #     geom_col() +
  #     #      facet_wrap(~ incomeGroup) + alpha = input$alpha
  #     labs(x = "Income Group", y = "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)") +
  #     ggtitle("Worker Productivity by Income Group") +
  #     theme(plot.title = element_text(size = 30, face = "bold")) + 
  #     guides(fill = guide_legend(title = "Income Group", title.position = "top")) +
  #     
  #   #  labs(xlim = c(0,120000)) +
  #     theme_minimal()
  #   # scale_x_log30()
  #   # if (input$fit1 == TRUE) {
  #   #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
  #   # }
  #   g43
  # })
  # 
  # 
  # # Tab4  - Summary Data
  # filtered_data44 <- reactive({
  #   # Filter the data
  #   # Filter the data
  #   data44 <- AgriRegion[,c(1:14)] # [,c(1:4, 6:9, 11, 15:19)]
  #   data44 <- data44 %>% 
  #     group_by(worldRegion) %>% 
  #     summarise(`Worker Productivity` = 
  #                 round(mean(agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us,
  #                            na.rm = T),1))
  #   
  #   # `Average Energy Consumption` = round(mean(energyUsePerCapitaKgOilEq),1),
  #   # `Average CO2-emissions` = round(mean(co2EmissionsTonsPerCapita),1))
  #   
  #   # if (input$region != "All"){
  #   #   data4 <- subset(data4,region == input$region)
  #   # }
  #   # colnames(data4) = colabels 
  #   # colnames(data41)[1] = "Income Group"
  #   data44
  # })  
  # 
  # 
  # # Create the plot render function  
  # output$plot44 <- renderPlot({
  #   # Use the same filtered data that the table uses
  #   data = filtered_data44()
  #   g44 = ggplot(data, aes(worldRegion, data[[2]], fill = worldRegion)) +
  #     geom_col() +
  #     #      facet_wrap(~ incomeGroup) + alpha = input$alpha
  #     labs(x = "World Region", y = "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)") +
  #     ggtitle("Worker Productivity by World Region") +
  #     theme(plot.title = element_text(size = 30, face = "bold")) + 
  #     guides(fill = guide_legend(title = "World Region", title.position = "top")) +
  #     theme(axis.text.x = element_text(angle = 45,
  #                                      hjust = 1)) +  #, size = 8, face = "bold"
  #     # labs(xlim = c(0,120000)) +
  #     theme_minimal() +
  #     scale_x_discrete(labels = function(x) str_wrap(x, width = 10))
  #   # scale_x_log30()
  #   # if (input$fit1 == TRUE) {
  #   #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
  #   # }
  #   g44
  #   
  # }) 
  
  
  
  # Tab4  - Summary Data NOT WORKING
  
  # filtered_data51 <- reactive({
  #   # Filter the data
  #   # data51 <- AgriCountry
  #   data51 <- AgriCountry %>% select(incomeGroup, input$var5) %>%
  #     group_by(incomeGroup) %>%
  #     summarise(Minimum = round(min(input$var5, na.rm = T),1), # input$var5
  #               Average = round(mean(input$var5, na.rm = T),1),
  #               Maximum = round(max(input$var5, na.rm = T),1),
  #   `Typical Deviation` = round(sd(input$var5, na.rm = T),1))
  #   # data51 = subset(data51, !(is.na(data51[,1])))
  #   # if (input$region != "All"){
  #   #   data4 <- subset(data4,region == input$region)
  #   # }
  #   # colnames(data4) = colabels
  #   colnames(data51)[1] = "Income Group"
  #   data51
  # })
  
  # Tab4  - Plots
  filtered_data52 <- reactive({
    # Filter the data
    data52 <- AgriCountry
    data52 <- subset(data52, !(worldRegion == "World"))
    
    if (input$region != "All Countries"){
      data52 <- subset(data52,  worldRegion %in% input$region)
      
      
    }
    
    data52
  })
  
  
  
  # # Summary Data NOT WORKING
  # output$table5 <-  DT::renderDataTable({  # renderTable({
  #   
  #   DT::datatable(filtered_data51(), 
  #                 # colnames = colabels1[c(1:14)],
  #                 options = list(pageLength = 10), 
  #                 rownames = FALSE) # [c(1:4, 6:9, 11, 15:19)])
  #   
  #   # filtered_data51()
  # 
  #   
  #   
  # })  
  
  
  # New plot title1
  new_plot_title5 <- eventReactive(
    eventExpr = input$update_plot_title5, 
    valueExpr = { (input$title5) }, #toTitleCase(
    ignoreNULL = FALSE
  )
  
  
  # Create the plot render function  
  output$plot51 <- renderPlot({
    # Use the same filtered data that the table uses
    data = filtered_data52()
    g51 = ggplot(data, aes_string(input$var5, fill = "incomeGroup")) +
      geom_density(alpha = input$alpha) + 
      theme_minimal() +
      #      facet_wrap(~ incomeGroup) +
      labs(x = "Log scale on different units depending on selected variable", y = "Density") + # "Log(GDP per Capita)"
      ggtitle(new_plot_title5()) +
      theme(plot.title = element_text(size = 30, face = "bold")) + 
      guides(fill = guide_legend(title = "Income Group", title.position = "top")) +
      
      labs(xlim = c(0,120000)) + # +
      
      scale_x_log10()
    # if (input$fit1 == TRUE) {
    #   g3 <- g3 + geom_smooth(method = "lm", se = FALSE)
    # }
    g51
    
  })    
  
  
}

