Pulse classification algorithm
===============================

This set of Matlab scripts and functions implements the Shahi and Baker (2014) multi-component pulse classification algorithm.

Contents
========

classify_record_main : This scripts is the one that calls other functions to classify a ground motion as a pulse/non-pulse and then compute the Ipulse and Tp values.

classification_algo.m : This defines the function that selects the prospective pulses for classification

analyze_record.m : This defines the main classification function that classified each prospective pulse

find_Ipulse.m : Defines the function to find if the ground motion is classified as pulse-like or non-pulse-like

find_Tp.m : Defines the function to compute the pulse period. Outputs -999 if the ground motion is non-pulse.

make_plot.m : Defines the function to make a plot showing the velocity time-history of the original ground motion (in the orientation from which pulse was extracted), the extracted pulse and the residual ground-motion.

cont_wavelet_trans.m : This funtion is used to perform the continuous wavelet transform

parseAT2.m : This function parses the NGA West2 AT2 files.

example1.AT2 , example2.AT2 : Example time-histories (recorded components of the Imperial Valley(1979) El centro Array #4 recording) used for demonstration.

Other Information
===========

Example classification results are available at https://www.jackwbaker.com/pulse_classification_v2/Pulse-like-records.html

The NGA-West2 data used for this analysis is available at https://ngawest2.berkeley.edu/


References
===========

Shahi S.K., and  Baker J.W. (2014). "An efficient algorithm to identify strong velocity pulses in multi-component ground-motions". Bulletin of the Seismological Society of America, 104(5), 2456–2466. https://doi.org/10.1785/0120130191
