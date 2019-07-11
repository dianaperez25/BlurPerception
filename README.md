# BlurPerception
Code for Experiments Detailed in "Prior Experience Alters the Appearance of Blurry Object Borders"

To run the Experiment:
Put all the code for the Version you want to run in one folder (files are labeled V4, V5, etc., according to the Version). The files necessary to run the Experiment are 
-blurFinalVX.m
-createStimTexturesVX.m
-DrawFixationVX.m
-InstructionsVX.m
-PsychToolboxSetupVX.m
-subNumVX.m
-TrialStructureVX.m
-WaitForResponseVX.m
-ConditionVX.mat
-ConditionPVX.mat
-Stimuli (either lamp intact.bmp and Lamp PR.bmp, Anchor intact.bmp and Anchor PR.bmp, or woman intact.bmp and woman pr.bmp)

The code CreateConditionsV4.m creates the files ConditionVX.mat and ConditionPVX.mat. In order for this code to run you will need preMaskV4, preMaskPV4, postMaskV4, and postMaskPV4 for Version 4, and only postMaskVX and postMaskPVX for Versions 5 and 7. In order to create the files preMaskV4, preMaskPV4, postMaskVX, and postMaskPVX you need to run the code CreateMasksVX.m.

The data files for this Experiment are publicly available at:

To run the Analysis:
The outputs of the .m file “blurFinalVX” are two .mat files named “VersionX_sX.mat” and “timing_VersionX_sX.mat” (I will use Version4_s1.mat and timing_Version4_s1.mat as an example). The “Version4_s1.mat” file has the participant’s responses and the “timing_Version4_s1.mat” file contains the timing information for each trial. 

1.	Use the “writeExcelV4.m” script to convert “Version4_s1.mat”, and all other response .mal files for V4, to Excel. It will automatically be named “Version4_s1.xlsx”. 

2.	Copy all of the data from “Version4_s1.xlsx” and paste onto “template.xlsx” (or “template2.xlsx” for Versions 8-9B), starting on the Test column. Replace the Subject Number with the appropriate number. This need to be manually saved, I will name this “s1.xlsx”.  

3.	Run the script “checkTiming.m”. This will check the “timing_VersionX_sX.mat” files for all subjects to make sure the masks, primes, and stimuli were displayed for the correct timing. The output of this script are two files: “errorTrials.mat” and “timingErrors.mat”. It is much easier to read the “timingErrors.mat” file, which includes 4 cell arrays (preMaskErrors, primeErrors, postMaskErrors, and stimErrors). In this file you can see the trial number that contained an error, and how long the mask/prime/stimuli were displayed for in this format [trial number, display time]. NOTE that the “checkTiming.m” script has to be in the same folder as the “timing_VersionX_sX.mat” files. 

4.	On the “s1.xlsx” file, manually input a 1 in the column Timing Error for each trial in which a timing error occurred. 

5.	Select all the data in “s1.xlsx” and create a Pivot Table with Timing Error and Timeout under Filters, testBlur under Columns, Test and ReCode Prime under Rows (only Test for Versions 8-9B), and Average of ChoseTest (or Chose Same for Versions 7-9B) under Values. 

6.	We then copy the values in each row onto the appropriate sheet in the spreadsheet “Summary.xlsx”. For example, Copy the values for the stimulus Lamp, for Prime 1, for Test Blur level 3, onto the appropriate cell in "Summary.xlsx".  Rename this spreadsheet “SummaryV4.xlsx”.

7.	Complete these steps for all subjects, making sure to copy the averages onto “SummaryV4.xlsx”. Then run the script “accXlstoMatlabV4.m”. This will create a file named “AccuraciesV4.mat”.

8.	Run the script “FitV4.m”. This will create many files. Most will be graphs of each participants’ fitted responses to each stimulus. It will also create two files named “V4FittedResults”; one will be a .mat file and the other will be an Excel file.

9.	In the Excel file, I separated the data using the Filters function in Excel by Prime and Stimulus, so that there were 6 worksheets: Prime 1 Stim1, Prime 1 Stim 2, Prime 2 Stim 1, etc.

10.	I added a Column after “ACI2” (the upper bound of the confidence interval for Alpha) and took the difference between “ACI1” and “ACI2” (the confidence interval). For all columns I took the average, standard deviation, count, and standard error. I calculated 2 standard deviations below and 2 above the average confidence interval for all participants, and using Excel formulas, I selected the subjects that fell outside this range and removed them as outliers. I performed 3 rounds of this outlier removal procedure. I did this separately for each worksheet and then put all outliers together and removed the same outliers from all worksheets. For Versions 7-9B, you will be looking at Beta, and thus you will calculate the confidence interval for Beta and perform the outlier removal procedure based on its average.

11.	Finally, we used all the Alpha (or Beta) values for all participants and for each Prime and Stimulus combination as input for an Repeated Measures ANOVA in SPSS. 

