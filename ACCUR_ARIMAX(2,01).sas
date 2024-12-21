/* STSM03d05-new.sas */
/* Forecasting out-of-sample and validating */
/* This version prints the AIC and SBC of the training aas well as validation datasets in the output, along with accuracy measures */
/* This option causes the macro-generated SAS code to be printed in the log. */
options mprint;

/* Specify the number of timepoints for holdback across the program with &nhold. */


%let nhold=12;

/* This reads in the external file containing the actual macros and submits it when */
/* this statement is submitted. */

%include "C:/Users/steev/Documents/Spring24/Data Mining & BI/Forecasting-datasets-OPIM5671/macros2.sas" / source2;

/* The %accuracy_prep macro prepares the series by assuring that the holdout */
/* measurements are not included in the estimation of the time series model, */
/* but rather saved for a later time, when the %accuracy macro is submitted. */
/* The macro creates a temporary data set called WORK._TEMP, containing two  */
/* variables: Y_FIT for the in-sample observations; and */
/*            Y_HOLDOUT for the out-of-sample observations. */
/* The syntax for the %accuracy_prep macro is: */
/* %ACCURACY_PREP (INDSN=              series data set name, */
/*                 SERIES=             name of the target series, */
/*                 TIMEID=             time ID variable, */
/*                 NUMHOLDBACK=        number of time points to hold out); */

     
%accuracy_prep(indsn=stsm.AIR_POLLUTION_DATA, series=pollution, timeid=date, 
    numholdback=&nhold);

/* ODS SELECT NONE is used to suppress printing of the PROC ARIMA output. */
/* PROC ARIMA is run to estimate the model based on the non-holdout sample  */
/* and a forecast is requested for the entire sample.  Here, this is done
/* for two different models - the AR(1) model and the ARX(1) model. */
ods select none;

/* proc arima data=Work._TEMP plots */
/*     (only)=(series(corr crosscorr) residual(corr normal)  */
/* 		forecast(forecastonly)); */
/* 	identify var=pollution(12); */
/* 	estimate method=ML outstat=work.outstat; */
/* 	forecast lead=12 back=12 alpha=0.05 id=date interval=month out=stsm.ARIMAAC nooutall; */
/* 	outlier; */
/* 	run; */
/* quit; */


proc arima data=Work._TEMP plots
    (only)=(series(corr crosscorr) residual(corr normal) 
		forecast(forecastonly)) out=work.out0002;
	identify var=pollution(12) outcov=work.outcov0002;
	estimate q=(1 2 3 4 5 6) method=ML outest=work.outest0002 
		outstat=work.outstat0002 outmodel=work.outmodel0002;
	forecast lead=12 back=12 alpha=0.05 id=date interval=month out=stsm.ARIMAAC2 nooutall;;
	run;
quit;

ods select all;

/* Using the %ACCURACY macro */
/* The syntax for the %accuracy macro is: */
/* %ACCURACY (INDSN=              series data set name, */
/*            SERIES=             name of the target series, */
/*            TIMEID=             time ID variable, */
/*            NUMHOLDBACK=        number of time points to hold out, */
/*            FORECAST=           name of the variable containing forecasts); */


%accuracy(indsn=stsm.ARIMAAC2, timeid=date, series=pollution, 
    numholdback=&nhold);