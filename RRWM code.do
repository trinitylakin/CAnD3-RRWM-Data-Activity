****** CAnD3 RRWM Data Activity ******
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\CAnD3\gss-12M0025-E-2017-c-31_F1.csv"

***** DATA CLEANING
* independent var = highest level of education completed
clonevar educ = ehg3_01b
recode educ (4 5=3) (6=4) (7=5)(96 97 98 99 =.)
* dependent var - intend to have child within next 3 years
clonevar intendchild = fi_105
recode intendchild (2=1) (3 4=0) (5 6 7 8 9=.)
* missings variable
egen missings= rmiss(intendchild educ)

***** TABLES & MODELS
* descriptives table with no missing cases
tabstat intendchild educ if missings==0, statistics(count mean sd min max)

* logistic regression with no missing cases
logistic intendchild educ if missings==0



