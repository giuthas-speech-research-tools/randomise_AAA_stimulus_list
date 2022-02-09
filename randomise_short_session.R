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

	counters = as.vector(matrix(c(".","..","..."), nrow=n, ncol=repeats, byrow=T))
	tokens = apply(data.frame(tokens, counters), 1, paste, collapse=" ") 
	
	m = length(tokens)

	apply(data.frame(tokens, counters), 1, paste, collapse=" ")	

	if (half_way_break) {
		calibration_counters = c(".","..","...", "....")
		calibration = apply(expand.grid(calibration, calibration_counters), 1, paste, collapse = " ")

		tokens = c(
			calibration, tokens[1:(m/2)], calibration,
			calibration, tokens[(m/2+1):(m)], calibration
		)
	}
	else {
		calibration_counters = c(".","..")
		calibration = apply(expand.grid(calibration, calibration_counters), 1, paste, collapse = " ")

		tokens = c(calibration, tokens, calibration)
	}
	
	return(tokens)
}