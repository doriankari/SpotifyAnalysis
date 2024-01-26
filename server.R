# Define the server logic
server <- function(input, output, session) {
  
  filtered_data <- reactive({
    spotify_data %>% filter(artist_name %in% input$Selected_artist)
    
  })
  
  # Calculate number of streams
  num_streams <- reactive({
    filtered_data() %>% 
      summarize(n_streams = sum(streams)) %>% 
      pull()
  })
  
  # Calculate number of tracks
  num_tracks <- reactive({
    filtered_data() %>% 
      summarize(n_tracks = n()) %>% 
      pull()
  })
  
  # Calculate number of artists
  num_artists <- reactive({
    
    length(input$Selected_artist)
    
  })
  
  # Calculate number of genre
  num_genre <- reactive({
    
    filtered_data() %>% 
      summarize(n_genre = n()) %>% 
      pull()
    
  })
  
  
  
  
  
  output$numStreams <- renderValueBox({
    valueBox(value = num_streams(), color = "olive",
             subtitle = "Number of streams")
  })
  
  output$numTracks <- renderValueBox({
    valueBox(value = num_tracks(), color = "olive",
             subtitle = "Number of Tracks")
  })
  
  
  output$numArtists <- renderValueBox({
    valueBox(value = num_artists(), color = "olive",
             subtitle = "Number of Artists")
  })
  
  
  output$numGenre <- renderValueBox({
    valueBox(value = num_genre(), color = "olive",
             subtitle = "Number of Gender")
  })
  
  
  output$datatable_track <- renderDT({
    data <- filtered_data() %>% 
      ...
    
    datatable(data, options = list(
      scrollX = TRUE,
      paginate = T,
      lengthMenu = c(5, 10, 15),
      pageLength = 20
    ))
    
  })
  
  output$tracksPerYearArtistPlot <- renderPlotly({
    
    data <- filtered_data() %>%
      ...
    
    p <- ggplot()
    ...
    theme_minimal() 
    
    ggplotly(p)
    
  })
  
  # Render the interactive plotly plot
  output$genrePopularityPlot <- renderPlotly({
    
    data <- filtered_data() %>%
      ...
    
    p <- ggplot()
    ...
    theme_minimal() 
    
    ggplotly(p)
    
  })
  
}





