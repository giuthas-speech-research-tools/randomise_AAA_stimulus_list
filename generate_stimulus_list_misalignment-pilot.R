source("write_short_session.R")

words <- read.csv("misalignment/stimuli.csv", header = F, sep = "\t", fill = F)
words <- as.vector(words$V1)

end_calibration <- read.csv("misalignment/end_calibration.csv",
    header = F, sep="\t", fill = F)
end_calibration <- as.vector(end_calibration$V1)

calibration <- read.csv("misalignment/calibration.csv",
    header = F, sep = "\t", fill = F) 
calibration <- as.vector(calibration$V1)

# These were run with an old version of write_short_session and already
# recorded.
# write_short_session(
#     participant = 1,
#     words = words, calibration = calibration, end_calibration = end_calibration,
#     repeats = 2, half_way_break = T)
# write_short_session(
#     participant = 2,
#     words = words, calibration = calibration, end_calibration = end_calibration,
#     repeats = 2, half_way_break = T)

prefix = "misalignment/alignment-pilot-"
suffix = ".csv"
write_short_session(
    prefix, suffix, participant = 1,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)
write_short_session(
    prefix, suffix, participant = 2,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)

# Actual participants are numbers up from 3 to keep things random. 
prefix = "misalignment/alignment-"
suffix = ".csv"

write_short_session(
    prefix, suffix, participant = 3,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)

# fixed typo in stimuli
words <- read.csv("misalignment/stimuli-v1.1.csv", header = F, sep = "\t", fill = F)
words <- as.vector(words$V1)

write_short_session(
    prefix, suffix, participant = 4,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)

# Remember to change the newlines with emacs (c-x ret f dos).
