box::use(
  module/tools_pdf
)

# Combining slides for the DE
tools_pdf$pdf_combine(
  vec_input = 
    c(
      "/home/prdm0/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_1.pdf",
      "/home/prdm0/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_2.pdf",
      "/home/prdm0/Dropbox/UFPB/aulas_ufpb/Programação Estatística I/Aula_3.pdf"
    ),
  output = "./slides_de.pdf",
  start_pages = c(NA, NA, NA),
  end_pages = c(NA, NA, 102)  
)

# Combining slides for the PPGMMC
tools_pdf$pdf_combine(
  vec_input = 
    c(
      "/home/prdm0/Dropbox/UFPB/aulas_ufpb/Programação Estatística II/Aula_1.pdf",
      "/home/prdm0/Dropbox/UFPB/aulas_ufpb/Programação Estatística II/Aula_2.pdf"
    ),
  output = "./slides_ppgmmc.pdf",
  start_pages = c(NA, NA),
  end_pages = c(NA, 79)  
)