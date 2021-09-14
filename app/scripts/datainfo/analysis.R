analysis.analize <- function(key) {
  switch(
    key,
    'diabetes' = 'Diabetes',
    'heartFailure' = 'Heart Failure'
  )
}

analysis.analizeDiabetes <- function() {
  'Diabetes'
}

analysis.analizeHeartFailure <- function() {
  'Heart Failure'
}
