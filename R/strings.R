#' Squish and lowercase all variables in a dataframe
#'
#' All variables in a dataframe (in memory, or lazily evaluated)
#' will have the following applied:
#' * set to lowercase
#' * whitespace at the end and beginning removed
#' * whitespace inside of a string set to a single space
#'
#' @inheritParams assert_dataframe_with_data
#'
#' @returns A Dataframe with the modified variable names.
#' @export
#'
#' @examples
#' x <- tibble::tibble(
#'   ChEeSeSteAk = 1:4,
#'   "   OH     NO  " = 4:7,
#'   AHHH = 7:10
#' )
#'
#' x |>
#'   rename_with_stringr()
rename_with_stringr <- function(.data) {
  # check user input
  # is it dataframe-ish?
  checkmate::assert(
    checkmate::check_class(.data, "data.frame"),
    checkmate::check_class(.data, "tbl"),
    checkmate::check_class(.data, "tbl_lazy"),
    combine = "or"
  )

  .data |>
    dplyr::rename_with(stringr::str_squish) |>
    dplyr::rename_with(stringr::str_to_lower)
}
