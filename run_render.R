input <- "Preregistration_Template.qmd"

# the "with Answers" title is set by preregtemplate.lua when the
# answers profile is active
for (fmt in c("html", "pdf", "docx")) {
  quarto::quarto_render(
    input = input,
    profile = "answers",
    output_format = fmt,
    output_file = paste0("Preregistration_Template_with_answers.", fmt)
  )
  # keep-tex always writes Preregistration_Template.tex, so rename it
  # before the plain render overwrites it
  if (fmt == "pdf") {
    file.rename("Preregistration_Template.tex", "Preregistration_Template_with_answers.tex")
  }

  quarto::quarto_render(
    input = input,
    output_format = fmt,
    output_file = paste0("Preregistration_Template.", fmt)
  )
}
