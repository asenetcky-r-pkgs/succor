% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io.R
\name{read_folder}
\alias{read_folder}
\title{Read all files in a folder and hope for the best}
\usage{
read_folder(path)
}
\arguments{
\item{path}{A folder path.}
}
\value{
A list of tibbles.
}
\description{
Read all files in a folder and hope for the best
}
\examples{
\dontrun{
  read_common_folder("~/data/", "csv")
}
}
\seealso{
Other io: 
\code{\link{read_all_ext}()}
}
\concept{io}
