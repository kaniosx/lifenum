model.heartFailure.roc.generate <- function(predicted, real) {
  gr <- ggroc(
    calculate_roc(predicted, real)
  )
  plot_journal_roc(gr)
}
