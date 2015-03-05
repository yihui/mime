% Please edit documentation in R/mime.R
\name{guess_type}
\alias{guess_type}
\title{Guess the MIME types from filenames}
\usage{
guess_type(file, unknown = "application/octet-stream", empty = "text/plain", 
    mime_extra = mimeextra, subtype = "")
}
\arguments{
\item{file}{a character vector of filenames, or filename extensions}

\item{unknown}{the MIME type to return when the file extension was not found
in the table}

\item{empty}{the MIME type for files that do not have extensions}

\item{mime_extra}{a named character vector of the form \code{c(extension =
type)} providing extra MIME types (by default, \code{\link{mimeextra}});
note this MIME table takes precedence over the standard table
\code{\link{mimemap}}}

\item{subtype}{a character vector of MIME subtypes, which should be of the
same length as \code{file} if provided (use an empty character string for a
file if we do not want a subtype for it)}
}
\description{
Look up in the \code{\link{mimemap}} table for the MIME types based on the
extensions of the given filenames.
}
\examples{
library(mime)
# well-known file types
guess_type(c("a/b/c.html", "d.pdf", "e.odt", "foo.docx", "tex"))
# not in the standard table, but in mimeextra
guess_type(c("a.md", "b.R"), mime_extra = NULL)
guess_type(c("a.md", "b.R"))

# override the standard MIME table (tex is text/x-tex by default)
guess_type("tex", mime_extra = c(tex = "text/plain"))
# unknown extension 'bar'
guess_type("foo.bar")
# force unknown types to be plain text
guess_type("foo.bar", unknown = "text/plain")

# empty file extension
guess_type("Makefile")
# we know it is a plain text file
guess_type("Makefile", empty = "text/plain")

# subtypes
guess_type(c("abc.html", "def.htm"), subtype = c("charset=UTF-8", ""))
}
