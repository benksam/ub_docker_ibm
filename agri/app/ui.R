ui <- fluidPage(theme = shinytheme("lumen"),
                
                tabsetPanel(type = "tabs",
                            id = "tabsetpanel",
                            
                            # tab0          
                            tabPanel(title = "About this App", 
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)")),
                                                windowTitle = ("Sustainable Agriculture")),
                                     
                                     # h4(em("Source: WB")),
                                     
                                     hr(), 
                                     
                                     
                                     sidebarLayout(
                                       
                                       sidebarPanel(offset = 1,
                                                    h3(strong("Instructions")),
                                                    p(h4(em("This part of the panel is where you change the inputs to visualize your: "))),
                                                    
                                                    radioButtons("button", "", choices = c("Plots", "Tables"), selected = "Plots"),
                                                    
                                                    
                                                    conditionalPanel(
                                                      condition = "input.button == 'Plots'",
                                                      plotOutput("plot0", height = 270, width = 370)
                                                    ),
                                                    
                                                    conditionalPanel(
                                                      condition =  "input.button == 'Tables'",
                                                      tableOutput("table0")
                                                    ),
                                                    
                                                    # img(src = "rstudio.png", height = 140, width = 200),
                                                    
                                                    h5("This App was made using Shiny, a product of ", 
                                                       span("RStudio", style = "color:blue"))
                                       ),
                                       
                                       mainPanel(width = 7, 
                                                 
                                                 h3(strong("Introduction to this App")),
                                                 p(h4("This App helps you visualize for world regions a few trends for:")),
                                                 p(h4(em(strong("1. Agricultural production and yield ")))),
                                                 p(h4(em(strong("2. Rural and urban population growths")))),
                                                 p(h4(em(strong("3. Land area and use ")))), 
                                                 p(h4("in a ", em("handy way"), 
                                                      "and to interact with different dimensions of the data.")),
                                                 br(),
                                                 # p(h4("For an introduction and live examples, visit the ",
                                                 #   a("Shiny homepage.", 
                                                 #     href = "http://shiny.rstudio.com"))),
                                                 
                                                 h3(strong("Features")),
                                                 p(h4("1. Create beautiful", strong("plots"), "by changing the inputs from the sidepanel on the left.")),
                                                 p(h4("2. Manipulate the", strong("tables"),"by choosing or sorting interesting data from them.")),
                                                 
                                                 br(),br(),
                                                 p(h4("This App helps you answer in particular a few questions raised in this", 
                                                      tags$a(href = "https://docs.google.com/document/d/1YKhh6SIiCaSt-eqQhg7uSVswuTrO2UcCIaib_66_sY4/edit?usp=sharing", 
                                                             "Google Docs.")))
                                       ))
                                     
                                     
                                     
                            ), 
                            
                            
                            # tab1          
                            tabPanel(title = "Sustainable Agriculture by Income Groups", 
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                     
                                     hr(),
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(   # sidebarLayout(
                                       
                                       # Inputs(s)
                                       column(2,# sidebarPanel(
                                              
                                              textInput("title1", "Title", "Cereal Yield vs Year"),
                                              
                                              
                                              # Action button for plot title
                                              actionButton(inputId = "update_plot_title1", 
                                                           label = "Update plot title"),
                                              
                                              br(), br(),
                                              # br(), hr(), br(), 
                                              
                                              
                                              
                                              # br(), hr(), br(),
                                              
                                              selectInput("var1", "Select your variable",
                                                          choices = c(# "World Region", "Year",
                                                            "GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                                            "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                                            "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                                            "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                                            "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                                            "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                                            "Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                                            "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                                            "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                                            "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                                            "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                                            "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                                          selected = "cerealYieldKgPerHectare"),
                                              
                                              
                                              
                                              # c("Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                              #           "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                              #           "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                              #           "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                              #           "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                              #           "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                              #           "GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                              #           "Land under cereal production (hectares)" = "landUnderCerealProductionHectares",
                                              #           "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                              #           "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                              #           "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                              #           "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                              #           "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                              # 
                                              
                                              
                                              
                                              
                                              # names(AgriIncome)[3:19]                                         
                                              
                                              
                                              # selectInput("incomeGroup1", "Income Group",
                                              #             choices = c(levels(AgriIncome$incomeGroup))),                           
                                              
                                              br(), 
                                              
                                              sliderInput(inputId = "years1", label = "Years",
                                                          min = 2010, 2017,
                                                          value = c(min(AgriIncome$year)+1, 
                                                                    max(AgriIncome$year))),
                                              
                                              br(), 
                                              
                                              # Add a checkbox for line of best fit
                                              checkboxInput("fit1", "Checking for any trend ...", FALSE),
                                              
                                              
                                              br(), 
                                              
                                              # Show data table
                                              checkboxInput(inputId = "show_data1",
                                                            label = "Showing the data table ...",
                                                            value = FALSE),
                                              
                                              hr()), 
                                       
                                       # Output(s)
                                       column(9, # mainPanel(
                                              # Add a plot output
                                              plotOutput("plot1"),
                                              # ... in main panel
                                              textOutput(outputId = "description1")),
                                       
                                       fluidRow(
                                         column(12, 
                                                
                                                conditionalPanel("input.show_data1 == true"),     # , h3("Data table") Third level header: Data table
                                                DT::dataTableOutput(outputId = "table1"))))),
                            
                            # DT::dataTableOutput("table1")))),
                            
                            
                            
                            # tab2
                            tabPanel(title = "Sustainable Agriculture by World Regions", 
                                     
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                     
                                     hr(),
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(      # sidebarLayout(
                                       
                                       # Inputs(s)
                                       column(2,
                                              
                                              textInput("title2", "Title", "Cereal Yield vs Year"),
                                              
                                              # Action button for plot title
                                              actionButton(inputId = "update_plot_title2", 
                                                           label = "Update plot title"),
                                              
                                              br(), br(),
                                              # hr(), 
                                              
                                              
                                              
                                              
                                              # hr(), 
                                              
                                              # # Add a checkbox for line of best fit
                                              # radioButtons("group", "Filtering by ...", choices("Region" = "region",
                                              #                                                   "Income Group" = "incomeGroup"), 
                                              #              selected = "incomeGroup")),
                                              
                                              selectInput("var2", "Select your variable",
                                                          choices = c(# "World Region", "Year",
                                                            "GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                                            "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                                            "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                                            "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                                            "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                                            "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                                            "Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                                            "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                                            "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                                            "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                                            "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                                            "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                                          selected = "cerealYieldKgPerHectare"),
                                              
                                              
                                              # choices = c("Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                              #             "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                              #             "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                              #             "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                              #             "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                              #             "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                              #             "GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                              #             "Land under cereal production (hectares)" = "landUnderCerealProductionHectares",
                                              #             "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                              #             "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                              #             "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                              #             "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                              #             "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                              # selected = "cerealYieldKgPerHectare"),
                                              #   
                                              
                                              
                                              # names(AgriRegion)[3:19]), 
                                              # selected = "Cereal yield (kg per hectare)"),
                                              
                                              
                                              # radioButtons("region1", "World Region",
                                              #              choices = c(levels(AgriRegion$worldRegion))),
                                              
                                              
                                              br(),
                                              
                                              sliderInput(inputId = "years2", label = "Years",
                                                          min = 2010, 2017,
                                                          value = c(min(AgriRegion$year)+1, 
                                                                    max(AgriRegion$year))),
                                              
                                              br(),
                                              
                                              # Add a checkbox for line of best fit
                                              checkboxInput("fit2", "Checking for any trend ...", FALSE),
                                              
                                              # Show data table
                                              checkboxInput(inputId = "show_data2",
                                                            label = "Showing the data table ...",
                                                            value = FALSE),
                                              
                                              hr()),
                                       
                                       # Output(s)
                                       column(9,
                                              # Add a plot output
                                              plotOutput("plot2"),
                                              # ... in main panel
                                              textOutput(outputId = "description2"))),
                                     
                                     # column(
                                     #   dataTableOutput(outputId = "table"), width = 6) , 
                                     # width = 10
                                     
                                     fluidRow(
                                       column(width = 10, 
                                              
                                              conditionalPanel("input.show_data2 == true"),     # , h3("Data table") Third level header: Data table
                                              DT::dataTableOutput(outputId = "table2")))),
                            
                            
                            # DT::dataTableOutput("table2")) ))),
                            
                            
                            
                            # # tab0          
                            # tabPanel(title = "About this App", 
                            #          
                            #          
                            #          # Application title
                            #          titlePanel(h3(tags$b("Sustainable Agriculture in the World")),
                            #                     
                            
                            # tab3 - No plot3
                            tabPanel(title = "Regional Summary Plots", 
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),             
                                     
                                     hr(),
                                     
                                     sidebarLayout(
                                       
                                       # Inputs(s)
                                       sidebarPanel(  
                                         # plotOutput("plot41")),
                                         textInput("title4", "Title", "Cereal Yield"),
                                         
                                         
                                         # Action button for plot title
                                         actionButton(inputId = "update_plot_title4", 
                                                      label = "Update plot title"),
                                         
                                         br(), br(),
                                         # br(), hr(), br(), 
                                         
                                         
                                         
                                         # br(), hr(), br(),
                                         
                                         selectInput("var4", "Select your variable",
                                                     choices = c("GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                                                 "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                                                 "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                                                 "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                                                 "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                                                 "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                                                 "Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                                                 "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                                                 "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                                                 "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                                                 "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                                                 "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                                     selected = "cerealYieldKgPerHectare"),
                                         
                                         
                                         # radioButtons("var4", "Select your variable",
                                         #              choices = c("GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                         #                          "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                         #                          "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                         #                          "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                         #                          "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                         #                          "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                         #                          "Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                         #                          "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                         #                          "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                         #                          "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                         #                          "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                         #                          "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                         #              selected = "cerealYieldKgPerHectare"),      
                                         # 
                                         #  choices = c(
                                         #  "gdpPerCapitaPppConstant2011International" ,                                      
                                         # "gdpPppConstant2011International"  ,                                              
                                         #  "landUnderCerealProductionHectares"   ,                                           
                                         #  "permanentCroplandPercentOfLandArea"     ,                                        
                                         #  "ruralPopulationPercentOfTotalPopulation"   ,                                     
                                         #  "ruralPopulationGrowthAnnualPercent")
                                         
                                         
                                         
                                         
                                         hr(),
                                         tableOutput(outputId = "tableX")),
                                       
                                       
                                       mainPanel(
                                         
                                         plotOutput("plot41"),  # plotOutput("plot42")) 
                                         
                                         
                                         
                                         
                                         plotOutput("plot42")))),
                            
                            
                            # tab4
                            tabPanel(title = "Regional Distribution by Income Group", 
                                     
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                     
                                     hr(),
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(
                                       
                                       # Inputs(s)
                                       column(2, # offset = 0.5,
                                              
                                              # br(), 
                                              
                                              textInput("title5", "Title", "Cereal Yield"),
                                              
                                              br(), 
                                              
                                              actionButton(inputId = "update_plot_title5", 
                                                           label = "Update plot title"),
                                              
                                              br(), br(), br(),
                                              
                                              selectInput("var5", "Select your variable",
                                                          choices = c("GDP per capita, PPP (constant 2011 international $)" = "gdpPerCapitaPppConstant2011International",
                                                                      "Agriculture, forestry, and fishing, value added (% of GDP)" = "agricultureForestryAndFishingValueAddedPercentOfGdp",
                                                                      "Rural population (% of total population)" = "ruralPopulationPercentOfTotalPopulation",
                                                                      "Rural population growth (annual %)" = "ruralPopulationGrowthAnnualPercent",
                                                                      "Urban population (% of total)" = "urbanPopulationPercentOfTotal",
                                                                      "Urban population growth (annual %)" = "urbanPopulationGrowthAnnualPercent",
                                                                      "Agricultural land (% of land area)" = "agriculturalLandPercentOfLandArea",
                                                                      "Arable land (% of land area)" = "arableLandPercentOfLandArea",
                                                                      "Forest area (% of land area)" = "forestAreaPercentOfLandArea",
                                                                      "Agriculture, forestry, and fishing, value added per worker (constant 2010 US$)" = "agricultureForestryAndFishingValueAddedPerWorkerConstant2010Us",
                                                                      "Cereal yield (kg per hectare)" = "cerealYieldKgPerHectare",
                                                                      "Water productivity, total (constant 2010 US$ GDP per cubic meter of total freshwater withdrawal)" = "waterProductivityTotalConstant2010UsGdpPerCubicMeterOfTotalFreshwaterWithdrawal"),
                                                          selected = "cerealYieldKgPerHectare"),
                                              
                                              
                                              # Add a checkbox for line of best fit
                                              selectInput("region", "Distribution for ...", 
                                                          choices = c("All Countries", levels(AgriCountry$worldRegion)[-8]), #"All", 
                                                          selected = "All Countries"),
                                              
                                              
                                              br(),
                                              
                                              
                                              # Set alpha level
                                              sliderInput(inputId = "alpha", 
                                                          label = "Transparency", 
                                                          min = 0, max = 1, 
                                                          value = 0.5)),
                                       br(), br(), 
                                       
                                       # Summary Table Output(s)
                                       
                                       # column(6, offset = 1, 
                                       #        # Add a plot output
                                       #        
                                       #        h3("Summary Statistics"),
                                       #        tableOutput(outputId = "table5"), # DT::dataTableOutput(outputId = "table5"),
                                       #        br()),
                                       # hr(), br()), 
                                       
                                       
                                       # fluidRow(
                                       
                                       # Inputs(s)
                                       column(10, # offset = 6,  
                                              plotOutput("plot51", height = 500)))), # ))
                            
                            
                            # tab4
                            navbarMenu(title = "Web-Apps from ArcGIS",
                                       
                                       
                                       
                                       
                                       tabPanel(title = "Income Vs population Growth", 
                                                
                                                
                                                # Application title
                                                titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                                
                                                
                                                hr(), 
                                                
                                                # p(h4(em(strong("Click on the Globus or the blue link to open the ", em("Income Vs population Growth"), 
                                                #             "WebApp.")))),
                                                # 
                                                
                                                p(h4(em("Click on the Globus or the blue link to open the "), strong("Income Vs population Growth"), 
                                                     em("WebApp."))),
                                                
                                                br(), br(), br(), br(), br(),
                                                # Sidebar layout with a input and output definitions
                                                # fluidRow(   # sidebarLayout(
                                                
                                                fluidRow(
                                                  # tags$iframe(
                                                  #   seamless = "seamless", 
                                                  #   src = "https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=20d5f93f17164550ba2070a819107bce", 
                                                  #   width="500" , height="400" # height = 800, width = 1400
                                                  # )
                                                  
                                                  #   tags$div(
                                                  #     HTML("<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                                                  # src="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=20d5f93f17164550ba2070a819107bce"></iframe>")
                                                  #   # ))
                                                  
                                                  #                        
                                                  #                        tags$div(
                                                  #                          HTML('<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                                                  # src="https://arcgis.com/home/item.html?id=4d7f7ef2519045d9ba52cd7e6f71bce0#settings"></iframe>'))
                                                  
                                                  
                                                  tags$div(
                                                    HTML('<blockquote class="embedly-card"><h4><a href="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=b6b2014080e2454eb8f25561552c9299">Story Map Swipe and Spyglass</a></h4><p>This story map was created with the Esri Story Map Swipe and Spyglass application in ArcGIS Online.</p></blockquote>
                                           <script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>')))),
                                       
                                       # html(<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                                       # # src="https://sanktpetriskole.maps.arcgis.com/home/item.html?id=4d7f7ef2519045d9ba52cd7e6f71bce0#settings"></iframe>
                                       # )   
                                       
                                       
                                       tabPanel(title = "Income Vs Workforce in Agriculture", 
                                                
                                                
                                                # Application title
                                                titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                                
                                                
                                                hr(), 
                                                
                                                # p(h4(em(strong("Click on the Globus or the blue link to open the ", em("Income Vs Workforce in Agriculture"), 
                                                #             "WebApp.")))),
                                                # 
                                                p(h4(em("Click on the Globus or the blue link to open the "), strong("Income Vs Workforce in Agriculture"), 
                                                     em("WebApp."))),
                                                
                                                br(), br(), br(), br(), br(),
                                                
                                                
                                                fluidRow(
                                                  
                                                  
                                                  tags$div(
                                                    HTML('<blockquote class="embedly-card"><h4><a href="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=7518c8a0923f49f0856c90864eefe8f1">Story Map Swipe and Spyglass</a></h4><p>This story map was created with the Esri Story Map Swipe and Spyglass application in ArcGIS Online.</p></blockquote><script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>')))),
                                       
                                       # )))))
                                       
                                       tabPanel(title = "Population Growth Vs Water Withdrawal", 
                                                
                                                
                                                # Application title
                                                titlePanel(h3(tags$b("Sustainable Agriculture in the World (Source: WB)"))),
                                                
                                                
                                                hr(), 
                                                
                                                p(h4(em("Click on the Globus or the blue link to open the "), strong(" Population Growth Vs Water Withdrawal"), 
                                                     em("WebApp."))),
                                                
                                                
                                                br(), br(), br(), br(), br(),
                                                
                                                
                                                fluidRow(
                                                  
                                                  
                                                  tags$div(
                                                    HTML('<blockquote class="embedly-card"><h4><a href="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=74ed87cea73145ee9c691c5a888bcc05">Story Map Swipe and Spyglass</a></h4><p>This story map was created with the Esri Story Map Swipe and Spyglass application in ArcGIS Online.</p></blockquote><script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>'))))
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                            )))


# tags$div(
#   HTML('<style>.embed-container {position: relative; padding-bottom: 80%; height: 0; max-width: 100%;} .embed-container iframe, .embed-container object, .embed-container iframe{position: absolute; top: 0; left: 0; width: 100%; height: 100%;} small{position: absolute; z-index: 40; bottom: 0; margin-bottom: -15px;}</style><div class="embed-container"><iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="7A. World Energy Consumption and CO2-emissions" src="//sanktpetriskole.maps.arcgis.com/apps/Embed/index.html?webmap=e7010cd20bfa41daa2fdb97b181e615f&extent=-172.2656,-47.8749,172.2656,75.6276&zoom=true&previewImage=false&scale=true&disable_scroll=true&theme=light"></iframe></div>')))))




#         tabPanel("tab 3", "contents"),
#         tabPanel("tab 4", "contents"),
#         tabPanel("tab 5", "contents")
# )       






#                                   ))







#                        ))))




# column(4,  
#        plotOutput("plot52")),
# 
# 
# column(4,
#        plotOutput("plot53"))



#              ))






