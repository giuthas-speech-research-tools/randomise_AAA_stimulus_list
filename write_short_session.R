source("randomise_short_session.R")

write_short_session <- function(
    prefix, suffix, participant, words, calibration, end_calibration,
    repeats = 2, half_way_break = FALSE) {
    set.seed(participant)
    tokens <- randomise_short_session(
        words, calibration, end_calibration,
        repeats=2, half_way_break = TRUE)
    file <- paste(c(prefix, participant, suffix), collapse = "")
    write.table(tokens, file = file, quote=F, row.names=F, col.names=F)
}