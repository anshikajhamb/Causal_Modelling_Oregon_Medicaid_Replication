****a) iii)

*SF-8 mental health 
regress mcs8_score_in i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp


*SF-8 physical health 
regress pcs8_score_in i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp


*Change in health  (ols w bs)
set seed 10
bootstrap, rep(2000) strata(Medicaid_option): regress health_change_bin i.Medicaid_option number_house  bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



logit health_change_bin i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



predict pred_prob, pr
* transform these onto the log-ods scale
gen logit_prob = ln(pred_prob/(1-pred_prob))
* generate log-odds if everybody did not have a college degree, use conditional effect from ouput
gen logit_prob_0 = (1-Medicaid_option)*logit_prob + Medicaid_option*(logit_prob- .0215617)
gen pred_prob_0 = exp(logit_prob_0) / (1+exp(logit_prob_0))
* (1) get predicted probability of workign for each person if they had a college degree given covariates    
gen logit_prob_1 = Medicaid_option*logit_prob + (1-Medicaid_option)*(logit_prob+.0215617)
gen pred_prob_1 = exp(logit_prob_1) / (1+exp(logit_prob_1))
*list pred_prob_0 pred_prob_1 college agegr
* (2) work out predicted probability of working in the population if all were non-degree holders 

gen diff = pred_prob_1-pred_prob_0
summ diff

drop pred_prob logit_prob logit_prob_0 pred_prob_0 logit_prob_1 pred_prob_1 diff

*dia_dx_post_lottery_inp - (diabetes)

set seed 10
bootstrap, rep(2000) strata(Medicaid_option): regress dia_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp


logit dia_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



predict pred_prob, pr
* transform these onto the log-ods scale
gen logit_prob = ln(pred_prob/(1-pred_prob))
* generate log-odds if everybody did not have a college degree, use conditional effect from ouput
gen logit_prob_0 = (1-Medicaid_option)*logit_prob + Medicaid_option*(logit_prob- .4735812)
gen pred_prob_0 = exp(logit_prob_0) / (1+exp(logit_prob_0))
* (1) get predicted probability of workign for each person if they had a college degree given covariates    
gen logit_prob_1 = Medicaid_option*logit_prob + (1-Medicaid_option)*(logit_prob+.4735812)
gen pred_prob_1 = exp(logit_prob_1) / (1+exp(logit_prob_1))
*list pred_prob_0 pred_prob_1 college agegr
* (2) work out predicted probability of working in the population if all were non-degree holders 

gen diff = pred_prob_1-pred_prob_0
summ diff

drop pred_prob logit_prob logit_prob_0 pred_prob_0 logit_prob_1 pred_prob_1 diff


* hbp_dx_post_lottery_inp -high blood pressure

set seed 10
bootstrap, rep(2000) strata(Medicaid_option): regress hbp_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp


logit hbp_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



predict pred_prob, pr
* transform these onto the log-ods scale
gen logit_prob = ln(pred_prob/(1-pred_prob))
* generate log-odds if everybody did not have a college degree, use conditional effect from ouput
gen logit_prob_0 = (1-Medicaid_option)*logit_prob + Medicaid_option*(logit_prob-  .0639618)
gen pred_prob_0 = exp(logit_prob_0) / (1+exp(logit_prob_0))
* (1) get predicted probability of workign for each person if they had a college degree given covariates    
gen logit_prob_1 = Medicaid_option*logit_prob + (1-Medicaid_option)*(logit_prob+ .0639618)
gen pred_prob_1 = exp(logit_prob_1) / (1+exp(logit_prob_1))
*list pred_prob_0 pred_prob_1 college agegr
* (2) work out predicted probability of working in the population if all were non-degree holders 

gen diff = pred_prob_1-pred_prob_0
summ diff

drop pred_prob logit_prob logit_prob_0 pred_prob_0 logit_prob_1 pred_prob_1 diff


*chl_dx_post_lottery_inp : cholestrol 


set seed 10
bootstrap, rep(2000) strata(Medicaid_option): regress chl_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



logit chl_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



predict pred_prob, pr
* transform these onto the log-ods scale
gen logit_prob = ln(pred_prob/(1-pred_prob))
* generate log-odds if everybody did not have a college degree, use conditional effect from ouput
gen logit_prob_0 = (1-Medicaid_option)*logit_prob + Medicaid_option*(logit_prob-.029234 )
gen pred_prob_0 = exp(logit_prob_0) / (1+exp(logit_prob_0))
* (1) get predicted probability of workign for each person if they had a college degree given covariates    
gen logit_prob_1 = Medicaid_option*logit_prob + (1-Medicaid_option)*(logit_prob+ .029234 )
gen pred_prob_1 = exp(logit_prob_1) / (1+exp(logit_prob_1))
*list pred_prob_0 pred_prob_1 college agegr
* (2) work out predicted probability of working in the population if all were non-degree holders 

gen diff = pred_prob_1-pred_prob_0
summ diff

drop pred_prob logit_prob logit_prob_0 pred_prob_0 logit_prob_1 pred_prob_1 diff

*dep_dx_post_lottery_inp : depression diagnosis


set seed 10
bootstrap, rep(2000) strata(Medicaid_option): regress dep_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



logit dep_dx_post_lottery_inp i.Medicaid_option number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp



predict pred_prob, pr
* transform these onto the log-ods scale
gen logit_prob = ln(pred_prob/(1-pred_prob))
* generate log-odds if everybody did not have a college degree, use conditional effect from ouput
gen logit_prob_0 = (1-Medicaid_option)*logit_prob + Medicaid_option*(logit_prob-.1155492 )
gen pred_prob_0 = exp(logit_prob_0) / (1+exp(logit_prob_0))
* (1) get predicted probability of workign for each person if they had a college degree given covariates    
gen logit_prob_1 = Medicaid_option*logit_prob + (1-Medicaid_option)*(logit_prob+ .1155492 )
gen pred_prob_1 = exp(logit_prob_1) / (1+exp(logit_prob_1))
*list pred_prob_0 pred_prob_1 college agegr
* (2) work out predicted probability of working in the population if all were non-degree holders 

gen diff = pred_prob_1-pred_prob_0
summ diff

drop pred_prob logit_prob logit_prob_0 pred_prob_0 logit_prob_1 pred_prob_1 diff




*****c) i)

replace Medicaid_cover = 0 if Medicaid_cover == .


xi: pbalchk Medicaid_cover number_house  dep_dx_post_lottery_in bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp ast_dx_pre_lottery_inp dia_dx_pre_lottery_inp hbp_dx_pre_lottery_inp chl_dx_pre_lottery_inp ami_dx_pre_lottery_inp emp_dx_pre_lottery_inp kid_dx_pre_lottery_inp cancer_dx_pre_lottery_inp dep_dx_pre_lottery_inp ins_any_inp owe_inp catastrophic_exp_inp

*wont include medicaid_option in propensity scoring bc it will violate the assumption of the instrument (medicaid_option) should not affect hte outcome except through its impact on the treatment. 


pscore Medicaid_cover number_house dep_dx_post_lottery_in bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp ast_dx_pre_lottery_inp dia_dx_pre_lottery_inp hbp_dx_pre_lottery_inp chl_dx_pre_lottery_inp ami_dx_pre_lottery_inp emp_dx_pre_lottery_inp kid_dx_pre_lottery_inp cancer_dx_pre_lottery_inp dep_dx_pre_lottery_inp ins_any_inp owe_inp catastrophic_exp_inp, pscore(PS) comsup logit


drop if comsup==0
gen IPTW_exp = 1/PS
gen IPTW_con = 1/(1-PS)
gen IPTW = Medicaid_cover*IPTW_exp + (1-Medicaid_cover)*IPTW_con


xi: pbalchk Medicaid_cover number_house dep_dx_post_lottery_in bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp ast_dx_pre_lottery_inp dia_dx_pre_lottery_inp hbp_dx_pre_lottery_inp chl_dx_pre_lottery_inp ami_dx_pre_lottery_inp emp_dx_pre_lottery_inp kid_dx_pre_lottery_inp cancer_dx_pre_lottery_inp dep_dx_pre_lottery_inp ins_any_inp owe_inp catastrophic_exp_inp, wt(IPTW)




regress mcs8_score_in i.Medicaid_cover number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp [pw=IPTW]

regress pcs8_score_in i.Medicaid_cover number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp [pw=IPTW]



teffects ra (mcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in) (Medicaid_cover), ate


teffects ra (pcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in) (Medicaid_cover), ate



teffects aipw (mcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in) (Medicaid_cover  number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in)



teffects aipw (pcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in) (Medicaid_cover  number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_in)




****d)
regress pcs8_score_in i.Medicaid_cover number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp [pw=IPTW]



ivregress 2sls pcs8_score_in (Medicaid_cover = Medicaid_option) number_house 

ivregress 2sls mcs8_score_in (Medicaid_cover = Medicaid_option)



*adjusted
ivregress 2sls pcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp (Medicaid_cover = Medicaid_option)


ivregress 2sls mcs8_score_in number_house bmi_inp chl_inp bp_sar_inp bp_dar_inp phqtot_inp cvd_risk_point_inp i.ast_dx_pre_lottery_inp i.dia_dx_pre_lottery_inp i.hbp_dx_pre_lottery_inp i.chl_dx_pre_lottery_inp i.ami_dx_pre_lottery_inp i.emp_dx_pre_lottery_inp i.kid_dx_pre_lottery_inp i.cancer_dx_pre_lottery_inp i.dep_dx_pre_lottery_inp i.ins_any_inp i.owe_inp i.catastrophic_exp_inp (Medicaid_cover = Medicaid_option)
