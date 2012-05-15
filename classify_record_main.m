% Main pulse classification script
%
%%%%%%%%%%%%%%%%%%

clear all
clc

filename1 = './example1.AT2';
filename2 = './example2.AT2';

disp('Starting computations');

[A1,dt,NPTS,errCode] = parseAT2(filename1);
signal1 = cumsum(A1)' .* dt .* 981; % convert acc (in g) to velocity (in cm/s)
[A2,dt2,NPTS2,errCode2] = parseAT2(filename2);
signal2 = cumsum(A2)' .* dt2 .* 981; % convert acc (in g) to velocity (in cm/s)

if(errCode == -1)
    % Error in reading the file (File not found), skip the record
    disp('File not found');
    return;
end

if(abs(NPTS-NPTS2) > 20)
    % If the difference between number of points recorded in two
    % orientation is greater than 20 then skip
    disp('NPTS1 ~= NPTS2');
    return;
end

if(NPTS ~= NPTS2)
    % If number of points recorded in the two orientation differ from
    % one another curtail the longer record to match the length of
    % shorter record
    if(NPTS < NPTS2)
        A2 = A2(1:length(A1));
        signal2 = signal2(1:length(signal1));
    else
        A1 = A1(1:length(A2));
        signal1 = signal1(1:length(signal2));
    end
end

if(dt ~= dt2)
    % if the reported dt in the timehistory file in both orientations
    % is different skip the record.
    disp('dt1 ~= dt2');
    return;
end


if(length(A1) == length(A2))
    % Check if the length of records are the same.
    [pulseData, rotAngles,selectedCol,selectedRow] = classification_algo(signal1,signal2,dt);
    fn = './classification_result.mat';
    save(fn,'pulseData','rotAngles','selectedCol','selectedRow');
else
    disp('length(A1) ~= length(A2), even though the NPTS are same');
    return;
end

Ipulse = find_Ipulse(pulseData);
Tp = find_Tp(pulseData);
make_plot(pulseData);


