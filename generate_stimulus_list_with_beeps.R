
words = read.csv("stimuli.csv", header=F, sep="\t", fill = F) 
words = as.vector(words$V1)
calibration = read.csv("calibration.csv", header=F, sep="\t", fill = F) 
calibration = as.vector(calibration$V1)

prefix = "fin1"

# For now Participant 1 = 001

set.seed(1) # increment the seed for each recording session/participant
tokens <- randomise_short_session_with_beeps(prefix, words, calibration, repeats=1)

# AAA prompts
# Remember to change the newlines with emacs (c-x ret f dos).
write.table(tokens, file = "fin1-1.txt", quote=F, row.names=F, col.names=F)

