sys.source('R/mimeextra.R', environment())

lines = readLines(mimefile <- '/etc/mime.types', warn = FALSE)
# remove comments and blank lines
lines = grep('^[a-z]', lines, value = TRUE)
lines = unlist(lapply(strsplit(lines, '\\s+'), function(x) {
  # each line is of the form: type ext [ext2 ext3 ...]
  if (length(x) <= 1) return()
  # convert to c(html = 'text/html', js = 'application/javascript', ...)
  setNames(rep(x[1], length(x) - 1), x[-1])
}), recursive = FALSE)

# remove duplicated file extensions
lines = lines[!duplicated(names(lines))]
# write R source code to the data directory; "hand-writing" instead dump(), to
# make sure we can easily catch possible future differences in version control
dump_vec = function(name, x) {
  nm = names(x)
  writeLines(c(
    sprintf('%s = c(', name),
    paste(sprintf(
      '%s = "%s"',
      # invalid names should be quoted using ``
      ifelse(make.names(nm) == nm, nm, sprintf('`%s`', nm)),
      x
    ), collapse = ',\n'),
    ')'
  ), sprintf('R/%s.R', name))
}

dump_vec('mimemap', lines)
dump_vec('mimeextra', mimeextra[setdiff(names(mimeextra), names(lines))])
