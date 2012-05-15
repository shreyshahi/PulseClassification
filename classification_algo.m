% Implementation of the stratified classification algorithm
%%%%%%%%%%%%%%%%
%
% Inputs
%
% signal1 , signal2 : Velocity time histories from 2 orthogonal components
% dt : the time difference two consecutively recorded data points
%%%%%%%%%%%%%%%%%
%
% Outputs
%
% pulse_datas : Cell with 5 slots with information about 5 potntial pulses
% rotAngles : Orientations from which the 5 pulses are extracted
% selectedCol, selectedRow : Indicates the scale and time at which each pulse
% was extracted
%%%%%%%%%%%%%%%%%


function [pulse_datas,rotAngles,selectedCol,selectedRow] = classification_algo(signal1,signal2,dt)

% Initialize the variables
pulse_datas = cell(1,5);
rotAngles = cell(1,5);
selectedCol = cell(1,5);
selectedRow = cell(1,5);

% setup wavelet analysis
wname = 'db4';
TpMin = 0.25;
TpMax = 15;
numScales = 50;
scaleMin = floor(TpMin/1.4/dt);
scaleStep = ceil((TpMax/1.4/dt - scaleMin)/numScales);
scaleMax = scaleMin + numScales*scaleStep;
scales = scaleMin:scaleStep:scaleMax;

% Perform continuous wavelet transform on both components
coefs1 = cont_wavelet_trans(signal1, dt, scales, wname);
coefs2 = cont_wavelet_trans(signal2, dt, scales, wname);


maxCoefs = (coefs1.^2 + coefs2.^2);

for i = 1:5
    %pulse extraction
    maxCoef = max(max(maxCoefs));
    col = find(max(maxCoefs) == maxCoef);
    row = find(max(maxCoefs,[],2) == maxCoef);
    maxDir = atan(coefs2(row,col)/coefs1(row,col));
    signal = signal1*cos(maxDir(1))+signal2*sin(maxDir(1));
    pulse_data = analyze_record(signal,dt,col,row,scales,wname); % classify the pulse.
    pulseScale = scales(row);
    
    % record the data about the extracted pulse
    pulse_datas{i} = pulse_data;
    rotAngles{i} = maxDir;
    selectedCol{i} = col;
    selectedRow{i} = row;
    
    % block out the region surrounding the extracted pulse so that pulse from a different time - freq region is selected
    blockMin = col-10/25*pulseScale;
    blockMax = col+10/25*pulseScale;
    idx = find(([1:length(signal1)] > blockMin).*([1:length(signal1)] < blockMax) == 1);
    maxCoefs(:,idx) = 0;
end
