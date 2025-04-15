#' Assert Object is a Dataframe with at least one row of data
#'
#' @param .data A Dataframe.
#'
#' @returns If successful, returns .data invisibly otherwise throws an error.
#' @export
#'
#' @examples
#' assert_dataframe_with_data(mtcars)
assert_dataframe_with_data <- function(.data) {
  checkmate::assert_data_frame(
    .data,
    min.rows = 1
  )
}

#' Test if Object is a Dataframe with at least one row of data
#'
#' @param .data A Dataframe.
#'
#' @returns a Bool, `TRUE` if object is a Dataframe and `FALSE`if the
#' object is not a Dataframe.
#' @export
#'
#' @examples
#' is_dataframe_with_data(mtcars)
is_dataframe_with_data <- function(.data) {
  checkmate::test_data_frame(
    .data,
    min.rows = 1
  )
}
