test_that("select_country", {
  testthat::expect_equal(select_country(jhu_covid19_data),
  shiny::selectizeInput("countryInput", "Which country do you want to display?",
                 choices = unique(jhu_covid19_data$country),
                 selected="Afghanistan", multiple =FALSE)
  )
})
