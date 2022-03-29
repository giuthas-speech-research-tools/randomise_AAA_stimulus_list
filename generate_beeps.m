

function generate_beeps(min, max, beep_len, beep_f, nro_beeps, seed)
%gen_beeps_ex2 Generate stimulus beeps for experiment 2
%   Arguments are (all in seconds) 
%   min = minimum length of wait i.e. silence in the beginning
%   max = maximum length of wait i.e. silence in the beginning
%   beep_len = lenght of the stimulus beep
%   beep_f = frequency of the stimulus beep
%   nro_beeps = number of randomised beep files to generate
%   seed = random number seed for the generator, must be a non-negative
%       integer. If a negative number is given as the seed, it will not be
%       used. This feature can be used to generate consecutive batches of
%       pseudorandom beeps without resetting the seed between batches.

    fs = 44100;
    beep_len = floor(round(beep_len*fs));
    min_len = floor(round(min*fs));
    max_len = floor(round(max*fs));
    audio_len = beep_len + max_len;
    interval = max_len-min_len;

    audio = zeros(audio_len, 1);
    audio(end-beep_len+1:end) = sin(2*pi*beep_f/fs*(1:beep_len));
    
    % Set the random number seed. Increment for each participant.
    if seed >= 0
        rng(seed);
    end
    
    for i = 1:nro_beeps
        f_name = [sprintf('%0.3d', i) '.wav'];
        delay = randi(interval, 1);
        audiowrite(f_name, audio(delay:end), fs);
    end
end

