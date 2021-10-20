library(fullPage)
options <- list(
    loopBottom = T,
    css3 = T
  )

ui <- pagePiling(
  includeCSS("www/style.css"),
  sections.color = c('#f2f2f2', '#f2f2f2', '#f2f2f2'),
  opts = options,
  menu = c("Home" = "home",
           "About" = "about",
           "Resources" = "resources"
           ),
  pageSectionImage(
    center = FALSE,
    img = "Slide1.jpeg",
    h1(p("Rhabdomyosarcoma"),
       p("biobank"), 
       style = "font-size:65px;margin-top:200px;margin-left:30px;float:left;"),
    menu = "home",
  ),
  pageSectionImage(
    menu = "about",
    img = "Slide2.jpeg",
    align = 'center',
    h1(strong("About"), style = "margin-right:150px;margin-left:200px;"),
    h2("As a research subgroup at the Princess Máxima Center for Paediatric Oncology (PMC, The Netherlands), 
       we focus on molecular characterization of primary (non-)rhabdomyosarcoma tumors
       from paediatric patients.", style = "margin-right:150px;margin-left:150px;"),
    h2("The molecular characterization is performed via high-throughput 
      technologies (whole genome/exome and bulk mRNA sequencing) and also encompasses a number of pre-clinical models (tumoroids) 
      derived from primary tumors.", style = "margin-right:150px;margin-left:150px;"),
    img(src = "pm_logo2.png", style = "margin-right:150px;margin-left:150px;margin-top:40px;")
  ),
  pageSection(
    center = TRUE,
    menu = "resources",
    #img = "graph_rms.tiff",
    h1(strong("Publicly available resources"), 
       style = "margin-right:150px;margin-left:150px;"),
    h3(tags$a("RMS shiny web application",href="https://rmsdata.rms-biobank.eu", 
              target="_blank"),
       style = "margin-left:50px;float:left;"),
    br(),
    br(),
    absolutePanel(h4("A shiny-based webtool to browse whole genome and 
                       RNA-sequencing data from RMS tumor and tumoroids", 
       style = "margin-left:50px;float:left;"), fixed = T)
    # h3(paste0(a("RMS shiny web application", 
    #             href = "https://rmsdata-rms-biobank.eu", target = "_blank"), 
    #           ": contains whole genome and RNA-sequencing data from RMS tumor and tumoroids", 
    #           style = "margin-right:50px;margin-left:50px;"))
      )
    )

server <- function(input, output){
}

shinyApp(ui, server)