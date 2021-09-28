# CHANGES IN mime VERSION 0.13


# CHANGES IN mime VERSION 0.12

- Fixed bugs #15 and #16 in `parse_multipart()` (thanks, @michalkouril).

# CHANGES IN mime VERSION 0.11

- Removed the unused `LazyData` field in `DESCRIPTION`.

# CHANGES IN mime VERSION 0.10

- Add mimetype for OGC GeoPackage (.gpkg extension) (thanks, @eblondel, #14).

# CHANGES IN mime VERSION 0.9

- Added the MIME type for .jsonp files (thanks, @clabornd, #11).

# CHANGES IN mime VERSION 0.8

- Added the MIME type for .scss files (thanks, @cpsievert, #10).

# CHANGES IN mime VERSION 0.7

- Added more types for .Rnw, .Rproj, and .yml files (thanks, @beanumber, #9).

# CHANGES IN mime VERSION 0.6

- Updated the MIME types from Ubuntu 18.04.

# CHANGES IN mime VERSION 0.5

- the package license was changed from GPL-2 to GPL

# CHANGES IN mime VERSION 0.4

- added a new content type: .geojson -> application/vnd.geo+json (thanks, @dmpe, #3)

- guess_type() may fail on Windows when the file paths are too long (#2)

# CHANGES IN mime VERSION 0.3

- added a few more content types

# CHANGES IN mime VERSION 0.2

- added a function parse_multipart() to parse multipart form data submitted via HTTP POST

# CHANGES IN mime VERSION 0.1.2

- guess_type() returned wrong values for filenames without extensions: it should have used the 'empty' argument.

# CHANGES IN mime VERSION 0.1.1

- mime::guess_type() may not work when mime is loaded but not attached, because R does not load the mimemap data in this case. Now mimemap is exported in the package namespace.

# CHANGES IN mime VERSION 0.1

- The initial version of mime. The main function is mime::guess_type().

