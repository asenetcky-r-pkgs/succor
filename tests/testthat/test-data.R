test_that("tests and assertions work on dataframes and friends", {
  expect_no_error(
    assert_dataframe_with_data(mtcars)
  )

  expect_error(
    assert_dataframe_with_data("mtcars")
  )

  dataframe_no_data <-
    mtcars |>
    dplyr::filter(mpg == 0)

  expect_error(
    assert_dataframe_with_data(dataframe_no_data)
  )

  expect_true(
    is_dataframe_with_data(mtcars)
  )

  expect_false(
    is_dataframe_with_data(dataframe_no_data)
  )

  expect_false(
    is_dataframe_with_data("mtcars")
  )
})
