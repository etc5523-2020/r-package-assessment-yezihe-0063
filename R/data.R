#' Johns Hopkins University CSSE data on COVID-19
#'
#' Johns Hopkins University CSSE data on the spread of the SARS-CoV-2 virus and the COVID-19 pandemic.
#'
#'
#' @format A data frame with 7 variables.
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso3c}{ISO3c country code as defined by ISO 3166-1 alpha-3}
#'   \item{date}{Calendar date in YYYY-MM-DD format}
#'   \item{confirmed}{Confirmed Covid-19 cases as reported by JHU CSSE (accumulated)}
#'   \item{deaths}{Covid-19-related deaths as reported by JHU CSSE (accumulated)}
#'   \item{recovered}{Covid-19 recoveries as reported by JHU CSSE (accumulated)}
#'   \item{timestamp}{Date and time where data has been collected from authoritative sources}
#'   }
#'
#' @source
#' Johns Hopkins University Center for Systems Science and
#'  Engineering (JHU CCSE) Coronavirus Repository \href{https://github.com/CSSEGISandData/COVID-19}{website}.
#'
"jhu_covid19_data"

#'
#'
#'
#' COVID-19 Cumulative Cases
#'
#' COVID-19 confirmed cases, deaths, recovered cases and cumulative confirmed cases based on JHU CSSE data.
#'
#'
#' @format A data frame with 7 variables.
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso3c}{ISO3c country code as defined by ISO 3166-1 alpha-3}
#'   \item{date}{Calendar date in YYYY-MM-DD format}
#'   \item{confirmed}{Confirmed Covid-19 cases as reported by JHU CSSE (accumulated)}
#'   \item{deaths}{Covid-19-related deaths as reported by JHU CSSE (accumulated)}
#'   \item{recovered}{Covid-19 recoveries as reported by JHU CSSE (accumulated)}
#'   \item{cum_cases}{Cumulative confirmed Covid-19 cases grouped by countries}
#'   }
#'
#' @source
#' Johns Hopkins University Center for Systems Science and
#'  Engineering (JHU CCSE) Coronavirus Repository \href{https://github.com/CSSEGISandData/COVID-19}{website}.
#'
"covid19_cumulative_case"


#' COVID-19 Cases in Long Format
#'
#' Long format of COVID-19 cases with month and day.
#'
#'
#' @format A data frame with 6 variables.
#' \describe{
#'   \item{country}{Country name}
#'   \item{date}{Calendar date in YYYY-MM-DD format}
#'   \item{month}{Month of date}
#'   \item{day}{Day of date}
#'   \item{type}{Type of reported cases including confirmed cases, reported deaths and recovered cases}
#'   \item{number}{Number of cases for each type}
#'   }
#'
#' @source
#' Johns Hopkins University Center for Systems Science and
#'  Engineering (JHU CCSE) Coronavirus Repository \href{https://github.com/CSSEGISandData/COVID-19}{website}.
#'
"covid19_time"

#' Community Mobility Changes
#'
#' Data chart movement trends over time
#' by geography, across different categories of places such as retail and
#' recreation, groceries and pharmacies, parks, transit stations,
#' workplaces, and residential" to help
#' interested parties to assess responses to social distancing guidance
#' related to Covid-19.
#'
#'
#' @format A data frame with 3 variables.
#' \describe{
#'   \item{country}{Country name}
#'   \item{community_mobility}{5 Place categories:Grocery & pharmacy, Parks, Residential, Retail & Recreation,
#'   Transit stations, Workplaces}
#'   \item{mean}{Mean value of mobility changes compared with date before the pandemic
#'    reported as a positive or negative percentage.}
#'   }
#'
#' @source
#' Google COVID-19 Community Mobility Reports \href{https://www.google.com/covid19/mobility/}{website}.
#'
"community_mobility_changes"
