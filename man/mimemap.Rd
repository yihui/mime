% Please edit documentation in R/mime.R
\docType{data}
\name{mimemap}
\alias{mimeextra}
\alias{mimemap}
\title{Tables for mapping filename extensions to MIME types}
\source{
The file \file{/etc/mime.types} on Debian.
}
\description{
The data \code{mimemap} is a named character vector that stores the filename
extensions and the corresponding MIME types, e.g. \code{c(html = 'text/html',
pdf = 'application/pdf', ...)}. The character vector \code{mimeextra} stores
some additional types that we know, such as Markdown files (\file{.md}), or R
scripts (\file{.R}).
}
\examples{
str(as.list(mimemap))
mimemap["pdf"]
mimemap[c("html", "js", "css")]
# additional MIME types (not exported)
mime:::mimeextra
}
\keyword{datasets}
