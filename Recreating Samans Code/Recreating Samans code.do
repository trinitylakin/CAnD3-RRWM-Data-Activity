import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\CAnD3\gss-12M0025-E-2017-c-31_F1.csv"
** data cleaning
clonevar edu_cat = ehg3_01b
recode edu_cat (4 5 6 7=3)(96 97 98 99=.)
clonevar loc_dico = luc_rst
recode loc_dico (2 3=0)(6 7 8 9=.)
** survey weights
svyset [pweight = wght_per], bsrweight(wtbs_001-wtbs_500)
** freq tables ???
svy bootstrap, bsn(25) mse dof(500): tab loc_dico
svy bootstrap, bsn(25) mse dof(500): tab loc_dico edu_cat
svy bootstrap, bsn(25) mse dof(500): tab loc_dico sex
** regression
svy bootstrap, bsn(25) mse dof(500): logistic loc_dico edu_cat sex
svy bootstrap, bsn(25) mse dof(500): logit loc_dico edu_cat sex


