make_rook_input = function(x) {
  i = 1L
  list(
    read = function(n) {
      if (i > length(x)) return(raw())
      j = min(i + n - 1L, length(x))
      y = x[i:j]
      i <<- j + 1L
      y
    },
    rewind = function() i <<- 1L
  )
}

boundary = '----mime-boundary'
filename_length = 50000
filename = paste(rep('a', filename_length), collapse = '')
parts = c(
  sprintf('--%s', boundary),
  sprintf('Content-Disposition: form-data; name="bundle"; filename="%s"', filename),
  'Content-Type: application/gzip',
  '',
  'x',
  sprintf('--%s--', boundary),
  ''
)
body = paste(parts, collapse = '\r\n')
body_raw = charToRaw(body)
env = list(
  CONTENT_TYPE = sprintf('multipart/form-data; boundary=%s', boundary),
  CONTENT_LENGTH = as.character(length(body_raw)),
  rook.input = make_rook_input(body_raw)
)

warnings = character()
res = withCallingHandlers(
  mime::parse_multipart(env),
  warning = function(w) {
    warnings <<- c(warnings, conditionMessage(w))
    invokeRestart('muffleWarning')
  }
)

if (any(grepl('PCRE error', warnings, fixed = TRUE)))
  stop("Unexpected PCRE warning while parsing multipart payload")
stopifnot(!is.null(res$bundle), is.data.frame(res$bundle))
stopifnot(nrow(res$bundle) >= 1L)
stopifnot(identical(res$bundle$name[[1]], filename))
stopifnot(identical(rawToChar(readBin(res$bundle$datapath[[1]], 'raw', 1)), 'x'))
