#' Filter data by countries and cases types
#'
#' @description A function to filter the data by countries and cases types.
#'
#' @param data A data frame containing a `country` and `type` variable.
#' @param country_name A country you want to select.
#' @param type_name Types you can select including "confirmed", "deaths" and "recovered".
#' If you want to multiple select types, please use c("type1", "type2").
#'
#' @importFrom dplyr %>%
#'
#' @examples
#' \dontrun{
#' covid19_time_Australia <- filter_data(covid19_time, "Australia",c("confirmed","deaths"))
#' tibble::view(covid19_time_Australia)
#' }
#'
#' @export
#'
filter_data <- function(data, country_name, type_name){
   data %>%
    dplyr::filter(country == country_name,
                  type %in% type_name)
}

