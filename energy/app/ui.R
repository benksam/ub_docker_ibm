ui <- fluidPage(theme = shinytheme("lumen"),
                
                tabsetPanel(type = "tabs",
                            id = "tabsetpanel",
                            
                            # tab0          
                            tabPanel(title = "About this App", 
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)")),
                                                windowTitle = ("Income and Energy")),
                                     
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
                                                 p(h4("This App helps you visualize some relationships among:")),
                                                 p(h4(em(strong("1. Income")))),
                                                 p(h4(em(strong("2. Energy Consumption")))),
                                                 p(h4(em(strong("3. CO2-emissions")))), 
                                                 p(h4("in an ", em("easy way"), 
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
                                                      tags$a(href = "https://docs.google.com/document/d/1TiS-tH7EAlEarmk9L86uXGkOFB7xRHLLRIYzCZUBcdA/edit?usp=sharing", 
                                                             "Google Docs.")))
                                       ))
                                     
                                     
                                     
                            ), 
                            
                            
                            
                            
                            # tab1          
                            tabPanel(title = "Energy Use by Region", 
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                     
                                     
                                     hr(), 
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(   # sidebarLayout(
                                       
                                       # Inputs(s)
                                       column(width = 3, # sidebarPanel(sidebarLayout(
                                              
                                              # Inputs(s)
                                              # sidebarPanel(width = 3,
                                              
                                              textInput("title1", "Title", "GDP vs Energy Consumption"),
                                              
                                              br(), 
                                              
                                              # Action button for plot title
                                              actionButton(inputId = "update_plot_title1", 
                                                           label = "Update plot title"),
                                              
                                              br(), br(),
                                              
                                              sliderInput(inputId = "energyUse1", label = "Energy Consumption (Kg Oil Equivalent)",
                                                          min = 0, 20000,
                                                          value = c(min(Energy$energyUsePerCapitaKgOilEq), 
                                                                    max(Energy$energyUsePerCapitaKgOilEq))),
                                              
                                              br(), 
                                              
                                              selectInput("region1", "Region",
                                                          choices = c("All", levels(Energy$region))),
                                              
                                              
                                              br(), 
                                              
                                              
                                              
                                              # Add a checkbox for line of best fit
                                              checkboxInput("fit1", "Check for any relashionship", FALSE),
                                              
                                              # Show data table
                                              checkboxInput(inputId = "show_data1",
                                                            label = "Showing the data table ...",
                                                            value = FALSE),
                                              
                                              
                                              hr()
                                       ),
                                       
                                       column(width = 9, 
                                              # Output(s)
                                              # mainPanel(width = 9,
                                              # Add a plot output
                                              plotOutput("plot1", height = 500))),
                                     
                                     
                                     # fluidRow(   # sidebarLayout(
                                     #   
                                     #   # Inputs(s)
                                     #   column(width = 12,
                                     #   
                                     #   DT::dataTableOutput("table1")
                                     #   ))),
                                     # 
                                     
                                     fluidRow(
                                       column(12, 
                                              
                                              conditionalPanel("input.show_data1 == true"),     # , h3("Data table") Third level header: Data table
                                              DT::dataTableOutput(outputId = "table1")))),
                            
                            
                            # tab2
                            tabPanel(title = "Energy Use by Income Group", 
                                     
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                     
                                     
                                     hr(), 
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(
                                       
                                       # Inputs(s)
                                       column(width = 3,
                                              
                                              textInput("title2", "Title", "GDP vs Energy Consumption by Region"),
                                              
                                              br(), 
                                              
                                              # Action button for plot title
                                              actionButton(inputId = "update_plot_title2", 
                                                           label = "Update plot title"),
                                              
                                              br(), br(),
                                              
                                              
                                              sliderInput(inputId = "energyUse2", label = "Energy Consumption (Kg Oil Equivalent)",
                                                          min = 0, 20000,
                                                          value = c(min(Energy$energyUsePerCapitaKgOilEq), 
                                                                    max(Energy$energyUsePerCapitaKgOilEq))),
                                              
                                              br(), 
                                              
                                              # # Add a checkbox for line of best fit
                                              # radioButtons("group", "Filtering by ...", choices("Region" = "region",
                                              #                                                   "Income Group" = "incomeGroup"), 
                                              #              selected = "incomeGroup")),
                                              
                                              radioButtons("incomeGroup1", "Income Group",
                                                           choices = c("All", levels(Energy$incomeGroup))),
                                              
                                              br(),  
                                              
                                              
                                              
                                              # Add a checkbox for line of best fit
                                              checkboxInput("fit2", "Check for any relashionship", FALSE),
                                              
                                              # Show data table
                                              checkboxInput(inputId = "show_data2",
                                                            label = "Showing the data table ...",
                                                            value = FALSE),
                                              
                                              hr()
                                              
                                       ),
                                       
                                       
                                       # Output(s)
                                       column(width = 9,
                                              # Add a plot output
                                              plotOutput("plot2", height = 500))),
                                     
                                     # fluidRow(  
                                     #   # Output(s)
                                     #   column(width = 12,
                                     #     DT::dataTableOutput("table2")))),
                                     
                                     fluidRow(
                                       column(12, 
                                              
                                              conditionalPanel("input.show_data2 == true"),     # , h3("Data table") Third level header: Data table
                                              DT::dataTableOutput(outputId = "table2")))),                     
                            
                            
                            # tab3
                            tabPanel(title = "CO2-emissions by Income Group", 
                                     
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                     
                                     
                                     hr(), 
                                     
                                     # Sidebar layout with a input and output definitions
                                     sidebarLayout(
                                       
                                       # Inputs(s)
                                       sidebarPanel(width = 3,
                                                    
                                                    textInput("title3", "Title", "GDP vs CO2-emissions by Income Group"),
                                                    
                                                    br(), 
                                                    
                                                    # Action button for plot title
                                                    actionButton(inputId = "update_plot_title3", 
                                                                 label = "Update plot title"),
                                                    
                                                    br(), br(), 
                                                    
                                                    
                                                    sliderInput(inputId = "co2emissions", label = "CO2 emissions (tons per capita)",
                                                                min = 0, 50,
                                                                value = c(min(Energy$co2EmissionsTonsPerCapita), 
                                                                          max(Energy$co2EmissionsTonsPerCapita))),
                                                    
                                                    br(), 
                                                    
                                                    # # Add a checkbox for line of best fit
                                                    # radioButtons("group", "Filtering by ...", choices("Region" = "region",
                                                    #                                                   "Income Group" = "incomeGroup"), 
                                                    #              selected = "incomeGroup")),
                                                    
                                                    radioButtons("incomeGroup2", "Income Group",
                                                                 choices = c("All Countries", levels(Energy$incomeGroup))),
                                                    
                                                    br(),  
                                                    
                                                    
                                                    
                                                    # Add a checkbox for line of best fit
                                                    checkboxInput("fit3", "Check for any relashionship", FALSE)),
                                       
                                       
                                       
                                       
                                       # Output(s)
                                       mainPanel(width = 9,
                                                 # Add a plot output
                                                 plotOutput("plot3", brush = "plot_brush"),
                                                 # DT::dataTableOutput("table2"))
                                                 # Show data table
                                                 DT::dataTableOutput(outputId = "tablebrush"), # = table3
                                                 br()
                                       ))),
                            
                            
                            
                            # tab4
                            tabPanel(title = "Summarised Energy Data by Income Group", 
                                     
                                     
                                     
                                     # Application title
                                     titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                     
                                     
                                     hr(), 
                                     
                                     # Sidebar layout with a input and output definitions
                                     fluidRow(
                                       
                                       # Inputs(s)
                                       column(3, # offset = 0.5,
                                              
                                              br(), 
                                              
                                              
                                              # Add a checkbox for line of best fit
                                              selectInput("region2", "Distribution for ...", 
                                                          choices = c("All Countries", levels(Energy$region)), #"All", 
                                                          selected = "All Countries"),
                                              
                                              
                                              br(),
                                              
                                              
                                              # Set alpha level
                                              sliderInput(inputId = "alpha", 
                                                          label = "Transparency", 
                                                          min = 0, max = 1, 
                                                          value = 0.5)),
                                       
                                       
                                       # Output(s)
                                       
                                       column(8, offset = 1, 
                                              # Add a plot output
                                              
                                              h3("Summary Statistics"),
                                              tableOutput(outputId = "table4"), # DT::dataTableOutput(outputId = "table4"),
                                              br()),
                                       hr(), br()), 
                                     
                                     
                                     fluidRow(
                                       
                                       # Inputs(s)
                                       column(4,  
                                              plotOutput("plot41")),
                                       
                                       column(4,  
                                              plotOutput("plot42")),
                                       
                                       
                                       column(4,
                                              plotOutput("plot43")))), # ))
                            
                            # tab4
                            navbarMenu(title = "Web-Apps from ArcGIS",
                                       
                                       
                                       
                                       
                                       tabPanel(title = "Income Vs Energy", 
                                                
                                                
                                                # Application title
                                                titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                                
                                                
                                                hr(), 
                                                
                                                # p(h4(strong("Click on the Globus or the blue link to open the ", em("Income Vs Energy"), 
                                                #      "WebApp."))),
                                                # 
                                                
                                                p(h4(em("Click on the Globus or the blue link to open the "), strong("Income Vs Energy Consumption"), 
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
                                                    HTML('<blockquote class="embedly-card"><h4><a href="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=20d5f93f17164550ba2070a819107bce">Story Map Swipe and Spyglass</a></h4><p>This story map was created with the Esri Story Map Swipe and Spyglass application in ArcGIS Online.</p></blockquote>
<script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>')))),
                                       
                                       # html(<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                                       # # src="https://sanktpetriskole.maps.arcgis.com/home/item.html?id=4d7f7ef2519045d9ba52cd7e6f71bce0#settings"></iframe>
                                       # )   
                                       
                                       
                                       tabPanel(title = "Energy Vs CO2-emissions", 
                                                
                                                
                                                # Application title
                                                titlePanel(h3(tags$b("Income, Energy Consumption and CO2-emissions (Source: WB)"))),
                                                
                                                
                                                hr(), 
                                                
                                                # p(h4(strong("Click on the Globus or the blue link to open the ", em("Energy Vs CO2-emissions"), 
                                                #             "WebApp."))),
                                                
                                                
                                                p(h4(em("Click on the Globus or the blue link to open the "), strong("Energy Vs CO2-emissions"), 
                                                     em("WebApp."))),
                                                
                                                br(), br(), br(), br(), br(),
                                                
                                                
                                                fluidRow(
                                                  
                                                  
                                                  tags$div(
                                                    HTML('<blockquote class="embedly-card"><h4><a href="https://sanktpetriskole.maps.arcgis.com/apps/StorytellingSwipe/index.html?appid=3d1590d680d54f738a5c71345b805024">Story Map Swipe and Spyglass</a></h4><p>This story map was created with the Esri Story Map Swipe and Spyglass application in ArcGIS Online.</p></blockquote><script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>')))))
                            
                            # tags$div(
                            #   HTML('<style>.embed-container {position: relative; padding-bottom: 80%; height: 0; max-width: 100%;} .embed-container iframe, .embed-container object, .embed-container iframe{position: absolute; top: 0; left: 0; width: 100%; height: 100%;} small{position: absolute; z-index: 40; bottom: 0; margin-bottom: -15px;}</style><div class="embed-container"><iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="7A. World Energy Consumption and CO2-emissions" src="//sanktpetriskole.maps.arcgis.com/apps/Embed/index.html?webmap=e7010cd20bfa41daa2fdb97b181e615f&extent=-172.2656,-47.8749,172.2656,75.6276&zoom=true&previewImage=false&scale=true&disable_scroll=true&theme=light"></iframe></div>')))))
                            
                            
                            
                            
                            #         tabPanel("tab 3", "contents"),
                            #         tabPanel("tab 4", "contents"),
                            #         tabPanel("tab 5", "contents")
                            # )       
                            
                            
                            
                            
                            
                            
                ))




