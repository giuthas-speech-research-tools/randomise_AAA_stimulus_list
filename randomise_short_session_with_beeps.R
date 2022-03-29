randomise_short_session <- function(words, calibration, repeats = 2, half_way_break = FALSE){
	n=length(words)
	
	indeces = matrix(, nrow=n, ncol=repeats)
	indeces[,1] = sample.int(n)
	i = 2
	while (i <= repeats){
		indeces[,i] = sample.int(n)
		
		# If last token of previous block and the first token of this block 
		# would be the same, regenerate this block.
		if (indeces[n,i-1] == indeces[1,i]){
			next
		}
		i = i+1
	}
	indeces = as.vector(indeces)
	tokens = words[indeces]

	counters = c()
	counter = ""
	for (i in 1:repeats) {
		counter = paste0(counter, ".")
		counters = c(counters, counter)
	}

    # Generate dot counters to indicate number of repeats and add the to the stimulus words.
	counters = as.vector(matrix(c(".","..","..."), nrow=n, ncol=repeats, byrow=T))
	tokens = apply(data.frame(tokens, counters), 1, paste, collapse=" ") 

	m = length(tokens)
	l = length(calibration)

    # Generate beep wav-file names and combine them to a table with the tokens.
    # Beep files are [prefix]_[seed]_[running number].wav.
	beeps = apply(data.frame(sprintf("ex2_P3_day7_%03d", 1:(m)), ".wav"), 1, paste, collapse="")
	tokens = cbind(prompt = tokens, bmp = " ", wav = beeps)

	if (half_way_break) {
        # Generate calibration, counters and leave beeps out of the table.
		calibration_counters = c(".","..","...", "....")
		calibration = apply(expand.grid(calibration, calibration_counters), 1, paste, collapse = " ")
		calibration = cbind(prompt = calibration, bmp = " ", wav = "")

		tokens = c(
			calibration[1:l], tokens[1:(m/2)], calibration[(l+1):(2*l)],
			calibration[(2*l+1):(3*l)], tokens[(m/2+1):(m)], calibration[(3*l+1):(4*l)]
		)
	}
	else {
        # Generate calibration, counters and leave beeps out of the table.
		calibration_counters = c(".","..")
		calibration = apply(expand.grid(calibration, calibration_counters), 1, paste, collapse = " ")
		calibration = cbind(prompt = calibration, bmp = " ", wav = "")

		tokens = c(calibration[1:l], tokens, calibration[(l+1):(2*l)])
	}
	
	return(tokens)
}