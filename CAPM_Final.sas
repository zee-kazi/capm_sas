*
BAN210.ZAA - Predictive Analytics 
Zeeshaan Kazi
Student ID: 103616215

Final Assessment
Dataset: CAPM
--------------------------------------------------------------------;
libname capm "/home/u59395568/BAN210 Predictive";

proc import datafile="/home/u59395568/BAN210 Predictive/capm5.xls" 
out=capm 
dbms= xls   
replace;
getnames=yes;
run;

title "Contents of dataset CAPM";
proc contents data=capm varnum;
run;

title "Summary Statistics for CAPM";
proc means data=capm mean median mode std var min max nmiss n;
run;


*--------------------------------------------------------------------;
*Data Cleaning;

data capm;
    set capm(drop= date time);
run;
*--------------------------------------------------------------------;
*Model Validation;

*Creating new variables for risk premium of stocks and market portfolio;

data capm2;
   set capm;
      rp_mkt = mkt-riskfree;
      rp_ge = ge - riskfree;
      rp_ibm = ibm - riskfree;
      rp_ford = ford - riskfree;
      rp_msft = msft - riskfree;
      rp_dis = dis - riskfree;
      rp_xom = xom - riskfree;
      label rp_mkt='Risk Premium for Market'
            rp_ge='Risk Premium for GE'
            rp_ibm='Risk Premium for IBM'
            rp_ford='Risk Premium for FORD'
            rp_msft='Risk Premium for MSFT'
            rp_dis='Risk Premium for DIS'
            rp_xom='Risk Premium for XOM';
run;

title "Summary Statistics for new dataset capm2";
proc means data=capm2 mean median mode std var min max nmiss n;
run;


*Plotting risk premiums;
title "Risk Premium (GE) x Risk Premium (Mkt)";
proc sgplot data=capm2;
  scatter x=rp_ge y=rp_mkt;
run;

title "Risk Premium (MSFT) x Risk Premium (Mkt)";
proc sgplot data=capm2;
  scatter x=rp_msft y=rp_mkt;
run;

ods noproctitle;
ods graphics / imagemap=on;
proc corr data=capm2 pearson plots=matrix;
   var rp_mkt;
   with rp_ge rp_ibm rp_ford rp_msft rp_dis rp_xom;
run;
  
*Linear regression to test model fit;
title "Linear regression to test model fit";
proc autoreg data=capm2;
model rp_ge= rp_mkt;
test rp_mkt=1;
run;

*--------------------------------------------------------------------;

*Calculating Alpha and Beta for each stock;

title "Finding Alpha and Beta for GE";
proc reg data=capm2;
model ge=mkt;
run;

title "Finding Alpha and Beta for IBM";
proc reg data=capm2;
model ibm=mkt;
run;

title "Finding Alpha and Beta for FORD";
proc reg data=capm2;
model ford=mkt;
run;

title "Finding Alpha and Beta for Microsoft";
proc reg data=capm2;
model msft=mkt;
run;

title "Finding Alpha and Beta for Disney";
proc reg data=capm2;
model dis=mkt;
run;

title "Finding Alpha and Beta for XOM";
proc reg data=capm2;
model xom=mkt;
run;

*Calculating CAPM for each stock;

proc import datafile="/home/u59395568/BAN210 Predictive/capm3.xls" 
out=capm3 
dbms= xls   
replace;
getnames=yes;
run;

title "Creating new dataset capm3 to compute expected return";
proc print data=capm3;
run;

data capm3;
  set capm3;
  ER=Beta*(0.0053823-0.0023545)+0.0023545;
  ER_econometric=Alpha+Error+(Beta*(0.0053823-0.0023545)+0.0023545);
run;

data capm3;
  set capm3;
  Annualized=ER_econometric*12;
run;

title "CAPM calculation for each stock";
proc print data=capm3;
run;

*--------------------------------------------------------------------;
*END. THANK YOU;