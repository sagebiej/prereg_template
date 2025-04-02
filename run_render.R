quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "answers" , output_file = "Preregistration_Template_with_answers.html" , output_format = "html")

quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "" , output_file = "Preregistration_Template.html" , output_format = "html")


quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "answers" , output_file = "Preregistration_Template_with_answers.pdf" , output_format = "pdf")
file.rename("Preregistration_Template.tex","Preregistration_Template_with_answers.tex")

quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "" , output_file = "Preregistration_Template.pdf" , output_format = "pdf")


quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "" , output_file = "Preregistration_Template.docx" , output_format = "docx")

quarto::quarto_render(input = "Preregistration_Template.qmd", profile = "answers"  , output_file = "Preregistration_Template_with_answers.docx" , output_format = "docx")
