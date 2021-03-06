data work.masterbycitycategory;
	length PopCategory $ 50;
	set work.MasterByCity;
	format Population2015 fPopulation;
	/* Adds new variable call PopCategory to group each city into a population group */
	if Population2015 < 200000 then PopCategory = '1. Less than 200,000';
	if 200000<=Population2015<=300000 then PopCategory = '2. Between 200,000 and 300,000';
	if 300000<=Population2015<=400000 then PopCategory = '3. Between 300,000 and 400,000';
	if 400000<=Population2015<=500000 then PopCategory = '4. Between 400,000 and 500,000';
	if 500000<=Population2015<=1000000 then PopCategory = '5. Between 500,000 and 1,000,000';
	if 1000000<=Population2015<=2500000 then PopCategory = '6. Between 1,000,000 and 2,500,000';
	if 2500000<=Population2015<=5000000 then PopCategory = '7. Between 2,500,000 and 5,000,000';
	if Population2015 > 4999999 then PopCategory = '8. Greater than 5,000,000';
run;

title1 'The Overall Crime By Population Category 2015';
title2 'Top 3 State - California, New York, Texas';
proc tabulate data=work.masterbycitycategory;
	where crimetype = 'TotalCrime' and statename in ('California','New York','Texas');
	class PopCategory / ASCENDING; /* The PopCategory is prefix with a number to be used for sorting */
	var Total2015 ;
	table PopCategory, Total2015 * (N Mean Min Max);
	label PopCategory = 'Population Category';
run;

title1 'The Overall Crime By Population Category 2014';
title2 'Top 3 State - California, New York, Texas';
proc tabulate data=work.masterbycitycategory;
	where crimetype = 'TotalCrime' and statename in ('California','New York','Texas');
	class PopCategory / ASCENDING; /* The PopCategory is prefix with a number to be used for sorting */
	var Total2014 ;
	table PopCategory, Total2014 * (N Mean Min Max);
	label PopCategory = 'Population Category';
run;
