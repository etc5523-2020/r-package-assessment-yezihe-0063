#' Select a country for shiny app
#'
#' @description A slider to select a country which you want to display.
#'
#' @param data A data frame containing a `country` variable.
#'
#' @examples
#' select_country(jhu_covid19_data)
#'
#' @export
#'

select_country <- function(data) {
  selectizeInput("countryInput", "Which country do you want to display?",
                 choices = unique(data$country),
                 selected="Afghanistan", multiple =FALSE)
}
