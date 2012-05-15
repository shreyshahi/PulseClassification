% This function returns the continuous wavelet transform coeficients for
% the input signat at the specified time and scales
function [cwt_coefs] = cont_wavelet_trans(signal, dt, scales, wname)

time = dt:dt:length(signal)*dt;
wtype = wavemngr('type',wname);
cwt_coefs = cwt(signal,scales,wname);