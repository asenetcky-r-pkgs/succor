#' Is this a Windows Machine?
#'
#' @returns A bool; `TRUE` if on a windows machine and `FALSE`
#' if not on a windows machine.
#'
#' @export
#'
#' @examples
#' is_windows()
is_windows <- function() {
  info <- Sys.info()

  purrr::pluck(info, "sysname") == "Windows"
}


#' Is this a Linux Machine?
#'
#' @returns A bool; `TRUE` if on a linux machine and `FALSE`
#' if not on a linux machine.
#'
#' @export
#'
#' @examples
#' is_linux()
is_linux <- function() {
  info <- Sys.info()

  purrr::pluck(info, "sysname") == "Linux"
}
