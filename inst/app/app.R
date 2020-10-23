library(shiny)
library(plotly)
library(ggplot2)
library(tidycovid19)
library(maps)
library(dplyr)
library(lubridate)
library(tidyverse)
library(shinyWidgets)
library(dslabs)
library(countrycode)
library(DT)
theme_set(theme_classic())

l <- list(color = toRGB("grey"), width = 0.5)

g <- list(showframe = FALSE,
          showcoastlines = FALSE,
          projection = list(type = 'Mercator'))

# ui ----------------------------------------------------------------------

ui <- fluidPage(

    titlePanel("COVID-19 Tracker"),

    sidebarLayout(

        sidebarPanel(
            selectizeInput("countryInput", "Which country do you want to display?",
                           choices = unique(jhu_covid19_data$country),
                           selected="Afghanistan", multiple =FALSE),
            checkboxGroupInput("typeInput", "Which statistics do you want to display?",
                               choices = c("Confirmed Cases"="confirmed",
                                           "Reported Deaths"="deaths",
                                           "Recovered Cases"="recovered"),
                               selected = "confirmed")
            ),

        mainPanel(
            tabsetPanel(
                tabPanel("The Spread of COVID-19", plotOutput("timeline")),
                tabPanel("Map", plotlyOutput("map")),
                tabPanel("Community Mobility Changes", DTOutput("table")),
                tabPanel("About",textOutput("about"))
            )
        )
    )
)


# server ------------------------------------------------------------------

server <- function(input, output, session) {
    cou <- reactive({
        filtered <- covid19_time %>%
            filter(country == input$countryInput,
                   type %in% input$typeInput)

    })

    cm <- reactive({
        filtered1 <- community_mobility_changes %>%
            filter(country == input$countryInput)
    })
    output$timeline <- renderPlot({

            ggplot(cou(), aes(x= date, y = number, color = type)) +
            geom_line() +
            theme_bw() +
            xlab("Date") +
            ylab("Number of cases") +
            ggtitle("The Spread of COVID-19")
    })

    output$map <- renderPlotly({

        p2 <- plot_geo(covid19_cumulative_case) %>%
            add_trace(
            z = ~cases, color = ~cases, colors = 'Blues',
            text = ~country, locations = ~iso3c, marker = list(line = l))%>%
            colorbar(title = 'Cumulative Cases') %>%
            layout(
            title = 'Confirmed Covid-19 cases as reported by JHU CSSE <br>Source:<a href="https://github.com/CSSEGISandData/COVID-19"> Center for Systems Science and Engineering (CSSE)</a>',
            geo = g)
        })

    output$table <- renderDT({
        datatable(cm(),
        caption = 'Community Mobility Changes',
        colnames = c("Country","Community Mobility", "Average Changes (%)"))%>%
            formatRound("mean", 2)%>%
            formatStyle(columns = 0:4, textAlign = 'center')

        })

    output$about <- renderText("COVID-19 App uses data from JHU CSSE showing the cases allover the world and the community mobility changes. Author: Yezi He")
}

shinyApp(ui, server)
