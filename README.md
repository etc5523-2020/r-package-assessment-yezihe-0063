
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covidtrack

<!-- badges: start -->

[![R build
status](https://github.com/etc5523-2020/r-package-assessment-yezihe-0063/workflows/R-CMD-check/badge.svg)](https://github.com/etc5523-2020/r-package-assessment-yezihe-0063/actions)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
<!-- badges: end -->

The goal of covidtrack is to export a Shiny App to show the COVID-19
cases and community mobility changes due to the pandemic.

## Overview

`covidtrack` package is aimed to create a shiny app to track the
COVID-19 cases and community mobility changes.

The **The Spread of COVID-19** collects coronavirus cases from all
countries in the world, including confirmed cases, reported deaths and
recovered cases. You can filter the countries you want to observe
through the selection bar on the left, as well as the statistics.

The **Map** section provides a world map. By moving the mouse to the
country, it will show you the country name and the cumulative number of
confirmed cases so far. Due to the large amount of data, this may take a
while.

**Community Mobility Changes** shows movement trends across different
categories of places, and you can also filter countries through the
options on the left.

## Installation

You can install the covidtrack package from
[GitHub](https://github.com/etc5523-2020/r-package-assessment-yezihe-0063)
with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-yezihe-0063")
```

## Launching Shiny Dashboard

The applicaiton can be launched by using the following line of code:

``` r
library(covidtrack)
launch_app()
```

Besides, there are two more functions inside the package:

  - `filter_data` To filter data by countries and cases types.
  - `select_country` To construct an interface to select a country and
    types.

## Data Resources

  - The raw data pulled from the Johns Hopkins University Center for
    Systems Science and Engineering (JHU CCSE) Coronavirus
    [repository](https://github.com/CSSEGISandData/COVID-19).

  - Community Mobility Changes data comes from
    [Google](https://www.google.com/covid19/mobility/)
