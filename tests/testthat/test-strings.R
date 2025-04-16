test_that("rename_with_stringr works", {
  cursed_names <-
    dplyr::tibble(
      COLUMN1 = 1:10,
      CoLuMn2 = 1:10,
      `Column    3` = 1:10,
      `    ColumN   4    ` = 1:10
    )

  expected_names <-
    c(
      "column1",
      "column2",
      "column 3",
      "column 4"
    )

  actual_names <-
    cursed_names |>
    rename_with_stringr() |>
    colnames()

  expect_identical(
    actual_names,
    expected_names
  )
})

test_that("rename_with_stringr throws expected errors", {
  expect_no_error(rename_with_stringr(mtcars))

  expect_error(
    rename_with_stringr("mtcars")
  )
})
