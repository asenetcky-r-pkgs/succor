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
