FROM rocker/shiny:3.5.2

# System libraries of general use and some required for the R packages
RUN apt-get update && apt-get install -y \
  sudo \
  libssl-dev \
  libxml2-dev \
  libmariadb-dev \
  libxml2

# Add shiny user
#  RUN groupadd  shiny \
#  && useradd --gid shiny --shell /bin/bash --create-home shiny

# System library dependency for the genetic interaction tool app
RUN R -e "install.packages(c('devtools'))"
RUN R -e "install.packages('shiny', repo='https://mran.microsoft.com/snapshot/2021-05-03/')"
RUN R -e "install.packages('remotes', repo='https://mran.microsoft.com/snapshot/2021-10-19/')"
RUN R -e "remotes::install_github('RinteRface/fullPage')"


# Copy the app to the image
WORKDIR /srv/shiny-server
COPY app.R .
COPY www www/

# Allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# Document which port can be published
EXPOSE 3838

# Run app
CMD ["/usr/bin/shiny-server.sh"]
#CMD ["R", "-e", "shiny::runApp('app.R', host = '0.0.0.0', port = 3838)"]
