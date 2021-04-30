#' @export
pdf_combine <- function(vec_input, output = "output.pdf", start_pages = NA, end_pages = NA) {
  
  box::use(
    glue[glue],
    pdftools[extract = pdf_subset, join = pdf_combine, pdf_length],
    fs[...],
    purrr[...]
  )
  
  if(length(start_pages) != length(vec_input) || length(end_pages) != length(vec_input))
    stop("Start_pages and end_pages must be a vector of the same length as vec_input!")
  
  start_pages <- 
    flatten_dbl(
      map_if(
        .x = start_pages,
        .f = function(x) 1,
        .p = is.na
      )
    )
  
  f <- function(x, y) 
    ifelse(is.na(x), pdf_length(vec_input[y]), x[y])

  end_pages <- 
    purrr::map2_dbl(
      .x = end_pages,
      .y = seq_along(vec_input),
      .f = f
    )

  files <- 
    file_temp_push(
      glue(
        "{tempdir()}/{path_ext_remove(path_file(output))}_{1L:length(vec_input)}.pdf"
      )
    )
  
  one_step <- function(x, y) {
      extract(
        input = x,
        output = file_temp(),
        pages = start_pages[y]:end_pages[y]
      )
  }

  walk2(
    .x = vec_input,
    .y = 1L:length(vec_input),
    .f = ~ one_step(.x, .y)
  )

  join(input = files, output = output)
}