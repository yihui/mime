#' @import utils
NULL

#' Tables for mapping filename extensions to MIME types
#'
#' The data `mimemap` is a named character vector that stores the filename
#' extensions and the corresponding MIME types, e.g. `c(html = 'text/html', pdf
#' = 'application/pdf', ...)`. The character vector `mime:::mimeextra` stores
#' some additional types that we know, such as Markdown files (`.md`), or R
#' scripts (`.R`).
#' @docType data
#' @usage NULL
#' @format NULL
#' @source The file `/etc/mime.types` on Debian.
#' @export
#' @examples str(as.list(mimemap))
#' mimemap['pdf']
#' mimemap[c('html', 'js', 'css')]
#' # additional MIME types (not exported)
#' mime:::mimeextra
'mimemap'

#' Guess the MIME types from filenames
#'
#' Look up in the [`mimemap`] table for the MIME types based on the extensions of
#' the given filenames.
#' @param file a character vector of filenames, or filename extensions
#' @param unknown the MIME type to return when the file extension was not found
#'   in the table
#' @param empty the MIME type for files that do not have extensions
#' @param mime_extra a named character vector of the form `c(extension = type)`
#'   providing extra MIME types (by default, `mime:::mimeextra`); note this MIME
#'   table takes precedence over the standard table [`mimemap`]
#' @param subtype a character vector of MIME subtypes, which should be of the
#'   same length as `file` if provided (use an empty character string for a file
#'   if we do not want a subtype for it)
#' @examples
#' library(mime)
#' # well-known file types
#' guess_type(c('a/b/c.html', 'd.pdf', 'e.odt', 'foo.docx', 'tex'))
#' # not in the standard table, but in mimeextra
#' guess_type(c('a.md', 'b.R'), mime_extra = NULL)
#' guess_type(c('a.md', 'b.R'))
#'
#' # override the standard MIME table (tex is text/x-tex by default)
#' guess_type('tex', mime_extra = c(tex = 'text/plain'))
#' # unknown extension 'zzz'
#' guess_type('foo.zzz')
#' # force unknown types to be plain text
#' guess_type('foo.zzz', unknown = 'text/plain')
#'
#' # empty file extension
#' guess_type('Makefile')
#' # we know it is a plain text file
#' guess_type('Makefile', empty = 'text/plain')
#'
#' # subtypes
#' guess_type(c('abc.html', 'def.htm'), subtype = c('charset=UTF-8', ''))
#' @export
guess_type = function(file, unknown = 'application/octet-stream',
                      empty = 'text/plain', mime_extra = mimeextra, subtype = '') {
  # TODO: remove this workaround
  if ('RestRserve' %in% loadedNamespaces() && packageVersion('RestRserve') <= '1.2.4')
    mimemap['js'] = 'application/javascript'
  file = basename(file)
  # only need 'bar' from 'foo.bar'
  file = tools::file_ext(file)
  type = unname(c(mime_extra, mimemap)[tolower(file)])
  type[file == ''] = empty
  type[is.na(type)] = unknown  # unknown file extensions
  if (any(i <- subtype != '')) {
    if (length(type) != length(file))
      stop("'subtype' must be of the same length as 'file'")
    type[i] = paste(type[i], subtype[i], sep = '; ')
  }
  type
}

if (.Platform$OS.type == 'windows') basename = function(path) {
  if (length(path) == 0) return(path)
  tryCatch(base::basename(path), error = function(e) {
    vapply(strsplit(path, '[\\/]+'), tail, character(1), 1, USE.NAMES = FALSE)
  })
}
