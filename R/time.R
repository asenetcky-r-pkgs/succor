#' Create a standard timestamp
#'
#' @returns A character string of a standardized timestamp.
#' @export
#'
#' @examples
#' make_timestamp()
make_timestamp <- function() {
  Sys.time() |>
    as.character() |>
    stringr::str_trunc(width = 24, ellipsis = "") |>
    stringr::str_pad(width = 24, side = "right", pad = "0")
}

#' Convert a date object into a datekey integer
#'
#' Datekeys can be used to quickly join dates to data
#'
#' @param date date object
#'
#' @returns An integer datekey.
#' @export
#'
#' @examples
#' make_datekey(date = lubridate::make_date())
make_datekey <- function(date) {
  checkmate::assert_date(date)

  as.integer(
    stringr::str_remove_all(
      string = as.character(date),
      pattern = "-"
    )
  )
}
