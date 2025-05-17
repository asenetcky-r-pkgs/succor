#' Read all files with specified extension in a folder
#'
#' @param path A folder path.
#' @param ext A file extension.
#'
#' @family io
#'
#' @returns A list of tibbles.
#' @export
#'
#' @examples
#' \dontrun{
#'   read_all_ext("~/data/", "csv")
#' }
read_all_ext <- function(path, ext) {
  # check if folder and extension is string
  checkmate::assert(
    checkmate::check_directory_exists(path),
    checkmate::check_string(ext),
    combine = "and"
  )

  file_paths <-
    fs::dir_ls(
      path = path,
      glob = glue::glue("*{ext}")
    )

  if (rlang::is_empty(file_paths)) {
    rlang::abort(
      glue::glue("No files with extension: {ext}, found.")
    )
  }

  output <-
    purrr::map2(
      file_paths,
      ext,
      \(p, e) read_common_file(p, e)
    )

  output
}

#' Read all files in a folder and hope for the best
#'
#' @param path A folder path.
#'
#' @returns A list of tibbles.
#' @export
#'
#' @family io
#'
#' @examples
#' \dontrun{
#'   read_common_folder("~/data/", "csv")
#' }
read_folder <- function(path) {
  file_paths <- NULL
  # check if folder and extension is string
  checkmate::assert_directory_exists(path)

  dir <-
    tibble::tibble(file_paths = fs::dir_ls(path = path)) |>
    dplyr::mutate(file_type = fs::path_ext(file_paths))

  purrr::map2(
    dir$file_paths,
    dir$file_type,
    \(path, ext) read_common_file(path, ext)
  )
}


#' Read a file based on its extension
#'
#' @param path A file path.
#'
#' @inheritParams read_all_ext
#' @returns A tibble.
read_common_file <- function(path, ext) {
  switch(
    ext,
    "xlsx" = readxl::read_xlsx(path),
    "xls" = readxl::read_xls(path),
    "csv" = readr::read_csv(path),
    "tsv" = readr::read_tsv(path),
    "parquet" = nanoparquet::read_parquet(path),
    readr::read_delim(path)
  )
}
