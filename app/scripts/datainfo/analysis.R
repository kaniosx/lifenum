analysis.analize <- function(key) {
  switch(
    key,
    'diabetes' = analysis.analizeDiabetes.getMarkdown(),
    'heartFailure' = analysis.analizeHeartFailure.getMarkdown()
  )
}

analysis.analizeDiabetes.getMarkdown <- function() {
  analysis.getMarkdown('diabetes.Rmd')
}

analysis.analizeHeartFailure.getMarkdown <- function() {
  analysis.getMarkdown('heartfailure.Rmd')
}

analysis.getMarkdown <- function(filename) {
  inclRmd(
    paste0(
      'scripts/datainfo/analysis_markdown/',
      filename
    )
  )
}
