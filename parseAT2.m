%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parser for NGA West2 AT2 files
% ---------------------------------
% Input : Full path of the file to be parsed
% 
% Outputs: 
%   -Acceleration time history (Acc)
%   -Time step used for recording (record_dt)        
%   -Number of recorded points (NPTS)
%   -error code to indicate if the file was not present (errCode)
%       --errCode = 0 if successful, -1 if File not found
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Acc,record_dt,NPTS,errCode] = parseAT2(filename)
file_in = fopen(filename, 'r');
if(file_in == -1)
    Acc = -1;
    record_dt = -1;
    errCode = -1;
    NPTS = -1;
else
    for j=1:3
        ans = fgetl(file_in);
    end
    [a1 ans] = fscanf(file_in, '%5c', 1);
    [NPTS ans] = fscanf(file_in, '%s', 1);
    NPTS = str2double(NPTS(1:end-1));
    [a3 ans] = fscanf(file_in, '%s', 1);
    [record_dt ans] = fscanf(file_in, '%f', 1);
    ans = fgetl(file_in);
    [Acc, np] = fscanf(file_in, '%f');
    fclose(file_in);
    errCode = 0;
end