#' @export
pdf_combine <- function(vec_input, output = "output.pdf", start_vec = NULL, end_vec = NULL) {
  box::use(
    glue[glue],
    pdftools[extract = pdf_subset, join = pdf_combine, pdf_length],
    fs[...],
    purrr[...]
  )
  
  if(is.null(start_vec))
    start_vec <- rep(1L, length(end_vec))
  
  if(is.null(end_vec)) 
    end_vec <- map_int(.x = vec_input, .f = ~ pdf_length(i))
  
  files <- file_temp_push(glue("{tempdir()}/{path_ext_remove(path_file(output))}_{1L:length(vec_input)}.pdf"))
  
  one_step <- function(x, i) {
      extract(
        input = x,
        output = file_temp(),
        pages = start_vec[i]:end_vec[i]
      )
  }
  
  walk2(.x = vec_input, .y = 1L:length(vec_input), .f = ~ one_step(.x, .y))
  
  join(input = files, output = output)
  
}