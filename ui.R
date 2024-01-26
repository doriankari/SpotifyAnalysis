base::source("packages.R")
base::source("global.r")

ui <- dashboardPage(skin = "black",
                    dbHeader,
                    dashboardSidebar(disable = TRUE),
                    dashboardBody(
                      box(
                        title = "Important information",
                        width = 12,
                        background = "green",
                        p("This dashboard presents summarized data for one or mutiple artists"),
                        br(),
                        p("Note: Only artists with at least 5 songs are included in the analysis")
                      ),
                      box(
                        title = "Artist",
                        solidHeader = FALSE, 
                        width = 6,
                        column(3, align = "center"),
                        column(6, align = "center"),
                        column(3, align = "center"),
                        pickerInput("Selected_artist",
                                    #label = "Default", 
                                    choices = sort(unique(spotify_data$artist_name)),
                                    multiple = TRUE
                        )),
                        
                        box(
                          title = "Chat with ChatGPT",
                          solidHeader = FALSE, 
                          width = 6,
                          column(3, align = "center"),
                          column(6, align = "center"),
                          column(3, align = "center"),
                          # textInput(
                          #            )
                        ),
                        box(
                          title = "Stats",
                          solidHeader = FALSE,
                          width = 10,
                          valueBoxOutput("numStreams"),
                          valueBoxOutput("numTracks"),
                          valueBoxOutput("numArtists"),
                          valueBoxOutput("numGenre"),
                         
                          # ...,
                          br(),
                          fluidRow(
                            # ...
                          )
                        ),
                        br(), 
                        box(title = "Track & playlist presence", 
                            # ...,
                        )
                        
                      )
                    )
                    
                    