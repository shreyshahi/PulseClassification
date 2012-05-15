Pulse classification algorithm
===============================

This set of Matlab scripts and functions implements the Shahi and Baker (2012) multi-component pulse classification algorithm.

Contents
========

classifyRecord_main : This scripts is the one that calls other functions to classify a ground motion as a pulse/non-pulse and then compute the Ipulse and Tp values.

classification_algo.m : This defines the function that selects the prospective pulses for classification

analyze_record.m : This defines the main classification function that classified each prospective pulse

find_Ipulse.m : Defines the function to find if the ground motion is classified as pulse-like or non-pulse-like

find_Tp.m : Defines the function to compute the pulse period. Outputs -999 if the ground motion is non-pulse.

make_plot.m : Defines the function to make a plot showing the velocity time-history of the original ground motion (in the orientation from which pulse was extracted), the extracted pulse and the residual ground-motion.

cont_wavelet_trans.m : This funtion is used to perform the continuous wavelet transform

parseAT2.m : This function parses the NGA West2 AT2 files.

Directivity ground motions
==========================

Note that this algorithm is used to classify ground-motion recording as a pulse-like record or non pulse-like record. The list of directivity ground motions is a subset of the pulse-like ground motions. The pulse-like ground-motions are manually filtered using the source-to-site geometry to prepare a list of directivity ground-motions. Refer to Shahi and Baker (2012) for more details

References
===========

Shahi S.K., and  Baker J.W. (2012). "An efficient algorithm to identify strong velocity pulses in multi-component ground-motions". (under preparation) 