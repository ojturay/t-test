data sample;
	input method $ value ;
	datalines;
	immediate 7.4
	immediate 46.6
	immediate 11.1
	immediate 12.3
	immediate 21.8
	immediate 279.6
	immediate 43
	immediate 8.9
	immediate 39.6
	cooled 	6.3
	cooled	44.2
	cooled	10.3
	cooled	11.3
	cooled	20.7
	cooled	254.8
	cooled	38.7
	cooled	7.9
	cooled	36.8
	;
run;

/*box plot of data*/
title 'concentration of blood samples by Method';
proc sgplot data=sample;
	vbox value / category=method;
run;


proc ttest data=sample alpha=0.05;
	class method;
	var value;
 run;

 /*like the statistician we fail to reject the null hypothesis
 which indicates theres no difference in the result of the analysis 
 based on the method (immediate or cooled) used*/


/*with the presence of outliers in the data, and non-normal data
 we run a wilcoxon signed-rank test rather*/
data sample2;
	input sample $ immediate cooled;
	diff = immediate - cooled;
	datalines;
	 1	7.4	 6.3
	 2	46.6 44.2
	 3	11.1 10.3
	 4	12.3 11.3
	 5	21.8 20.7
	 6	279.6	254.8
	 7	43    38.7
     8	8.9	  7.9
	 9	39.6  36.8
	;
run; 

proc univariate data=sample2;
	var diff;
run;

/*using a wilcoxon signed-rank test, we reject the null hypothesis as 
	we have eveidence that statistically theres a difference between 
	the methods used before analysis of sample*/
 
