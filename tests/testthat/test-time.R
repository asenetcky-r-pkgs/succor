test_that("timestamp always the same length", {
  time <- make_timestamp()

  expect_true(
    stringr::str_length(time) == 24
  )
})

test_that("make_datekey converts date to integer", {
  today <- Sys.Date()
  tomorrow <- Sys.Date() + 1
  yesterday <- Sys.Date() - 1
  random_date <- as.Date("2023-10-27")

  date_vector <-
    c(today, tomorrow, yesterday, random_date)

  expect_true(
    class(
      make_datekey(date_vector)
    ) ==
      "integer"
  )
})
