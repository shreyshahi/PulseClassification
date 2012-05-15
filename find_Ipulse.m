function isPulse = find_Ipulse(pulseData)

% Check if any prospective pulse was classified as pulse
isPulse = 0;
for j = 1:5
    buff = pulseData{j};
    if(buff.is_pulse == 1)
        isPulse = 1;
    end
end