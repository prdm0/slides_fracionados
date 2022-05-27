# Programação em C
staplr::staple_pages(
  input_files =
    c(
      "~/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_1.pdf",
      "~/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_2.pdf",
      "~/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_3.pdf"
    ),
  output_filepath = "~/Dropbox/GitHub/slides_fracionados/slides_de_c.pdf",
  start_pages = c(NA, NA, NA),
  end_pages = c(NA, NA, 188)
)

# Programação em R

staplr::staple_pages(
  input_files =
    c(
      "~/Dropbox/UFPB/aulas_ufpb/Programação Estatística II/Aula_1.pdf",
      "~/Dropbox/UFPB/aulas_ufpb/Programação Estatística II/Aula_2.pdf"
    ),
  output_filepath = "~/Dropbox/GitHub/slides_fracionados/slides_de_r.pdf",
  start_pages = c(NA, NA),
  end_pages = c(NA, 89)
)