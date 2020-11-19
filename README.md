# mime

<!-- badges: start -->
[![R-CMD-check](https://github.com/yihui/mime/workflows/R-CMD-check/badge.svg)](https://github.com/yihui/mime/actions)
[![Downloads from the RStudio CRAN mirror](https://cranlogs.r-pkg.org/badges/mime)](https://cran.r-project.org/package=mime)
<!-- badges: end -->

This is an R package for mapping filename extensions to [MIME
types](https://en.wikipedia.org/wiki/Internet_media_type), based on the data
[derived](R/mime.R) from `/etc/mime.types`.

```r
# installation
install.packages('mime')

library(mime)
guess_type(c('a/b/c.html', 'd.pdf', 'e.odt', 'foo.docx', 'tex'))
# [1] "text/html"                                                              
# [2] "application/pdf"                                                        
# [3] "application/vnd.oasis.opendocument.text"                                
# [4] "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
# [5] "text/x-tex"
```
