#' Launch the Shiny App
#'
#' @description Load the shiny app covidtrack
#'
#' @import shiny
#'
#' @examples
#' \dontrun{
#' launch_app()
#' }
#'
#' @export
launch_app <- function() {
  appDir <- system.file("app",package = "covidtrack")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `covidtrack`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
