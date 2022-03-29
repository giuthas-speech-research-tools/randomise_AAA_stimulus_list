# randomise_AAA_stimulus_list

## Getting Started

Download or fork the repository somewhere on your system. 

NOTE: This is only an quick hack. The development will shortly move
to a fully Python based version at 
[Delayed Naming Stimulus Generation](https://github.com/giuthas/delayed_naming_stimulus_gen).


### Prerequisites

A recent installation of both R and Matlab would be good.

### Running the example

First in R set working directory to where ever the code, sample
calibration, and wordlists are on your system. Then run first
`randomise_short_session.R` followed by
`generate_stimulus_list.R`. This should produce fin-1-1.txt.

The fin-1-1.txt thus generated and the one in the github repo are
almost correct: They need their file encoding changed to winDOS: `\n`
should be `\r\n`. You can do this in emacs with `c-x ret f dos`.

## Copyright and License

Copyright (C) 2022 Pertti Palo.

### Program license

[Program License](https://github.com/giuthas/randomise_AAA_stimulus_list/blob/master/LICENSE)
