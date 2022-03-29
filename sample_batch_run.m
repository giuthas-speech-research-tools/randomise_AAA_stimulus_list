% Generation constants 
prefix = "fin1"
min_wait = 1.2;
max_wait = 1.8;
beep_duration = 0.05;
beep_freq = 1000;
number_of_trials = 60;

%
% Generate beeps for one participant at a time.
%
random_seed = 1; % it is not a bad practice to use participant id as random seed.
cd('~/project/participant1/');
generate_beeps(prefix, min_wait, max_wait, beep_duration, beep_freq, number_of_trials, random_seed);

random_seed = 2;
cd('~/project/participant2/');
generate_beeps(prefix, min_wait, max_wait, beep_duration, beep_freq, number_of_trials, random_seed);

% Obviously this can be for-looped or vectorised even, but even better, it can be done 
% together with generating the shuffled stimulus lists and not in R and Matlab, but just 
% all in Python. See https://github.com/giuthas/delayed_naming_stimulus_generation/. It 
% just might all be done already there.