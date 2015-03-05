% Please edit documentation in R/parse.R
\name{parse_multipart}
\alias{parse_multipart}
\title{Parse multipart form data}
\usage{
parse_multipart(env)
}
\arguments{
\item{env}{the HTTP request environment}
}
\value{
A named list containing the values of the form data, and the files
  uploaded are saved to temporary files (the temporary filenames are
  returned). It may also be \code{NULL} if there is anything unexpected in
  the form data, or the form is empty.
}
\description{
This function parses the HTML form data from a Rook environment (an HTTP POST
request).
}
\references{
This function was borrowed from
  \url{https://github.com/jeffreyhorner/Rook/} with slight modifications.
}
