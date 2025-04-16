#' Skip unit test if not on windows
#'
#' @returns A message to console if skipping test
#' @export
#'
#' @examples
#' \dontrun{
#' skip_if_not_windows()
#' }
skip_if_not_windows <- function() {
  testthat::skip_if_not(
    condition = !is_windows(),
    message = "This test is only for the windows."
  )
}

#' Skip unit test if not on linux
#'
#' @returns A message to console if skipping test
#' @export
#'
#' @examples
#' \dontrun{
#' skip_if_windows()
#' }
#'
skip_if_windows <- function() {
  testthat::skip_if(
    condition = is_windows(),
    message = "This test is not for windows."
  )
}

#' Skip unit test if not on linux
#'
#' @returns A message to console if skipping test
#' @export
#'
#' @examples
#' \dontrun{
#' skip_if_not_dph()
#' }
skip_if_not_linux <- function() {
  testthat::skip_if_not(
    condition = !is_linux(),
    message = "This test is only for linux."
  )
}


#' Skip unit test if on linux
#'
#' @returns A message to console if skipping test
#' @export
#'
#' @examples
#' \dontrun{
#' skip_if_not_dph()
#' }
skip_if_linux <- function() {
  testthat::skip_if(
    condition = is_linux(),
    message = "This test is not for linux."
  )
}
