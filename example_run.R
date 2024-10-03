# Run this to get write_short_session working.
source("write_short_session.R")

# Load the files and set the prefix and suffix below. It is a good idea to put
# the stimulus and calibration files to where ever the data is going to live
# at. And also to make a new copy of this file for each dataset.
words <- read.csv("stimuli.csv", header = F, sep = "\t", fill = F)
words <- as.vector(words$V1)

end_calibration <- read.csv("end_calibration.csv",
    header = F, sep="\t", fill = F)
end_calibration <- as.vector(end_calibration$V1)

calibration <- read.csv("calibration.csv",
    header = F, sep = "\t", fill = F) 
calibration <- as.vector(calibration$V1)

prefix = "test-stimulus-list-"
suffix = ".csv"

# The actual generation run.

# Participant number is used both for numbering files and as the random seed.
# Here we generate participants 1 and 2.
write_short_session(
    prefix, suffix, participant = 1,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)
write_short_session(
    prefix, suffix, participant = 2,
    words = words, calibration = calibration, end_calibration = end_calibration,
    repeats = 2, half_way_break = T)

# Remember to change the newlines with emacs (c-x ret f dos).
