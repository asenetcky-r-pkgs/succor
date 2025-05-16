
<!-- README.md is generated from README.Rmd. Please edit that file -->

# succor

<!-- badges: start -->

[![R-CMD-check](https://github.com/asenetcky-r-pkgs/succor/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/asenetcky-r-pkgs/succor/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of succor is to provide helper functions for common scenarios.

## Installation

You can install the development version of succor from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("asenetcky-r-pkgs/succor")
```

## Data helpers

``` r
library(succor)
library(purrr)
suppressPackageStartupMessages(library(dplyr))

# is it a dataframe, with data?
is_dataframe_with_data(mtcars)
#> [1] TRUE

is_dataframe_with_data(mtcars[0, ])
#> [1] FALSE

# you can assert or throw errors as well
assert_dataframe_with_data(mtcars)
safe_assert <- purrr::safely(assert_dataframe_with_data)

captured <- safe_assert(mtcars[0, ])
captured$error$message
#> [1] "Assertion on '.data' failed: Must have at least 1 rows, but has 0 rows."
```

## Test and Environment Helpers

``` r
library(testthat)
#> 
#> Attaching package: 'testthat'
#> The following object is masked from 'package:dplyr':
#> 
#>     matches
#> The following object is masked from 'package:purrr':
#> 
#>     is_null
# is the current session on a linux machine?
is_linux()
#> [1] FALSE

# this is useful for unit testing
testthat::test_that("test runs when on linux", {
  skip_if_not_linux()
  testthat::expect_true(TRUE)
})
#> Test passed 😸
```

## Miscellaneous Helpers

``` r
library(stringr)

# make a datekey for dimension wrangling
Sys.Date()
#> [1] "2025-05-16"

make_datekey(Sys.Date())
#> [1] 20250516

# Standardized timestamps
# Always the same format, length and delimiters
make_timestamp()
#> [1] "2025-05-16 14:13:39.1487"

# Mass rename dataframe column names to something more sensible
# that you can pile on you own standards after

cursed_names <-
  dplyr::tibble(
    COLUMN1 = 1:10,
    CoLuMn2 = 1:10,
    `Column    3` = 1:10,
    `    ColumN   4    ` = 1:10
  )

colnames(cursed_names)
#> [1] "COLUMN1"            "CoLuMn2"            "Column    3"       
#> [4] "    ColumN   4    "

cursed_names |>
  rename_with_stringr() |>
  colnames()
#> [1] "column1"  "column2"  "column 3" "column 4"

cursed_names |>
  rename_with_stringr() |>
  dplyr::rename_with(
    .fn = \(col) {
      stringr::str_remove_all(col, " ")
    }
  ) |>
  colnames()
#> [1] "column1" "column2" "column3" "column4"
```
