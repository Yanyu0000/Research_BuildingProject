
********* Building Project Analysis for data set 1 *********

******************** for part A: Residentaial building ********************
* Define relative path
global path "/Users/yanyuma/Documents/Stata/data_LA building_final"   
import excel "$path/raw data-final.xlsx", firstrow clear
gen ID = _n
drop uuid vbrowserr15oe-csid

* Keep Los Angeles Only
drop if S10 == 1            // S10 Live in LA: control group 255; treatment group 263; total 518  

* Keep vaild answer: For Residential building 
drop Block*PB* Block*PC*
foreach i of numlist 1/8 {
    drop if Block`i'PA1 !=. & (Block`i'PA1 == Block`i'PA2 & ///
                               Block`i'PA1 == Block`i'PA3 & ///
                               Block`i'PA1 == Block`i'PA4 & ///
                               Block`i'PA1 == Block`i'PA5 & ///
                               Block`i'PA1 == Block`i'PA6 & ///
                               Block`i'PA1 == Block`i'PA7 & ///
                               Block`i'PA1 == Block`i'PA8 & ///
                               Block`i'PA1 == Block`i'PA9)
}
tab AssignBlock  // total 487
count if randomR == 1  // 239 for control 
count if randomR == 2  // 248 for treatment 

drop Block*
drop AssignBlock 
drop CountABCr1 CountABCr2 CountABCr3 

* Demographic 
generate age = 2024-S1
rename S3 gender
rename S4 race
rename S5 edu
rename S5Ar1 hh
rename S5Ar2 child

generate income_10000  = (S6 == 1)
generate income_30000  = (S6 == 2)
generate income_57500  = (S6 == 3)
generate income_100000 = (S6 == 4)
generate income_162500 = (S6 == 5)
generate income_350000 = (S6 == 6)
generate income_750000 = (S7 == 7) 

generate occupation_retired    = (S7 == 1)
generate occupation_homemaker  = (S7 == 2)
generate occupation_student    = (S7 == 3)
generate occupation_fulltime   = (S7 == 4)
generate occupation_parttime   = (S7 == 5)
generate occupation_unemployed = (S7 == 6)
generate occupation_other      = (S7 == 7)

generate architecture = (S8r1 ==1)
generate construction = (S8r2 ==1)
generate earthqsci = (S8r3 ==1)
generate government = (S8r4 ==1)
generate noprofession = (S8r5 ==1)

rename S9 live_US
rename S10 live_LA
rename S12 plan
rename S13 rent_experience

rename Q41 awareness
rename Q42 consideration
rename Q43 history
rename Q44c1 mild_quake
rename Q44c2 moderate_quake
rename Q44c3 severe_quake
rename Q45x1 riskattitude1
rename Q45x2 riskattitude2
rename Q45x3 riskattitude3
rename Q45x4 riskattitude4
rename Q45x5 riskattitude5
rename Q45x6 riskattitude6
rename Q45x7 riskattitude7
rename Q45x8 riskattitude8
rename Q45x9 riskattitude9
rename Q45x10 riskattitude10

save "$path/residential building DataSet1.dta",replace

********** control group  ********** 
drop if randomR == 2 
save "$path/residential building DataSet1 control.dta",replace
import excel "$path/dataset1 resid control.xlsx",clear
save "$path/dataset1 resid control.dta", replace 
merge 1:1 _n using "$path/residential building DataSet1 control.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2
gen FF = E*2

drop A B C D E S1 S2
order BS1 BS2 ES1 ES2 FF age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2 FF

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10

********** treatment group  ********** 
use "$path/residential building DataSet1.dta",clear
drop if randomR == 1
save "$path/residential building DataSet1 treatment.dta",replace
import excel "$path/dataset1 resid treatment.xlsx",clear
save "$path/dataset1 resid treatment.dta", replace 
merge 1:1 _n using "$path/residential building DataSet1 treatment.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2
gen FF = E*2

drop A B C D E S1 S2
order BS1 BS2 ES1 ES2 FF age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2 FF

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_10000 income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_unemployed occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10



*** t test 







******************** for part B: Public building ********************   
* Define relative path 
global path "/Users/yanyuma/Documents/Stata/data_LA building_final"     
import excel "$path/raw data-final.xlsx", firstrow clear
gen ID = _n
drop uuid vbrowserr15oe-csid

* Keep Los Angeles Only
drop if S10 == 1            // S10 Live in LA: control group 255; treatment group 263; total 518  

* Keep vaild answer: For Public building
drop Block*PA* Block*PC*
foreach i of numlist 1/8 { 
   drop if Block`i'PB1 !=. & (Block`i'PB1 == Block`i'PB2 & /// 
                              Block`i'PB1 == Block`i'PB3 & ///
                              Block`i'PB1 == Block`i'PB4 & ///
                              Block`i'PB1 == Block`i'PB5 & ///
                              Block`i'PB1 == Block`i'PB6 & ///
                              Block`i'PB1 == Block`i'PB7 & ///
                              Block`i'PB1 == Block`i'PB8 & ///
                              Block`i'PB1 == Block`i'PB9)
}
tab AssignBlock  // total 504
count if randomR == 1  //  248 for control 
count if randomR == 2  // 256 for treatment 

drop Block*
drop AssignBlock 
drop CountABCr1 CountABCr2 CountABCr3 

* Demographic 
generate age = 2024-S1
rename S3 gender
rename S4 race
rename S5 edu
rename S5Ar1 hh
rename S5Ar2 child

generate income_10000  = (S6 == 1)
generate income_30000  = (S6 == 2)
generate income_57500  = (S6 == 3)
generate income_100000 = (S6 == 4)
generate income_162500 = (S6 == 5)
generate income_350000 = (S6 == 6)
generate income_750000 = (S7 == 7) 

generate occupation_retired    = (S7 == 1)
generate occupation_homemaker  = (S7 == 2)
generate occupation_student    = (S7 == 3)
generate occupation_fulltime   = (S7 == 4)
generate occupation_parttime   = (S7 == 5)
generate occupation_unemployed = (S7 == 6)
generate occupation_other      = (S7 == 7)

generate architecture = (S8r1 ==1)
generate construction = (S8r2 ==1)
generate earthqsci = (S8r3 ==1)
generate government = (S8r4 ==1)
generate noprofession = (S8r5 ==1)

rename S9 live_US
rename S10 live_LA
rename S12 plan
rename S13 rent_experience

rename Q41 awareness
rename Q42 consideration
rename Q43 history
rename Q44c1 mild_quake
rename Q44c2 moderate_quake
rename Q44c3 severe_quake
rename Q45x1 riskattitude1
rename Q45x2 riskattitude2
rename Q45x3 riskattitude3
rename Q45x4 riskattitude4
rename Q45x5 riskattitude5
rename Q45x6 riskattitude6
rename Q45x7 riskattitude7
rename Q45x8 riskattitude8
rename Q45x9 riskattitude9
rename Q45x10 riskattitude10

save "$path/public building DataSet1.dta",replace

********** control group  ********** 
drop if randomR == 2 

save "$path/public building DataSet1 control.dta",replace
import excel "$path/dataset1 public control.xlsx",clear
save "$path/dataset1 public control.dta", replace 
merge 1:1 _n using "$path/public building DataSet1 control.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2

drop A B C D S1 S2
order BS1 BS2 ES1 ES2 age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2 

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10

********** treatment group  ********** 
use "$path/public building DataSet1.dta",clear
drop if randomR == 1
save "$path/public building DataSet1 treatment.dta",replace
import excel "$path/dataset1 public treatment.xlsx",clear
save "$path/dataset1 public treatment.dta", replace 
merge 1:1 _n using "$path/public building DataSet1 treatment.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2

drop A B C D S1 S2
order BS1 BS2 ES1 ES2 age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_10000 income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_unemployed occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10





******************** for part C: office building ********************
* Define relative path
global path "/Users/yanyuma/Documents/Stata/data_LA building_final"   
import excel "$path/raw data-final.xlsx", firstrow clear
gen ID = _n
drop uuid vbrowserr15oe-csid

* Keep Los Angeles Only
drop if S10 == 1            // S10 Live in LA: control group 255; treatment group 263; total 518  

* Keep vaild answer: For Residential building 
drop Block*PA* Block*PB*
foreach i of numlist 1/8 {
    drop if Block`i'PC1 !=. & (Block`i'PC1 == Block`i'PC2 & ///
                               Block`i'PC1 == Block`i'PC3 & ///
                               Block`i'PC1 == Block`i'PC4 & ///
                               Block`i'PC1 == Block`i'PC5 & ///
                               Block`i'PC1 == Block`i'PC6 & ///
                               Block`i'PC1 == Block`i'PC7 & ///
                               Block`i'PC1 == Block`i'PC8 & ///
                               Block`i'PC1 == Block`i'PC9)
}
tab AssignBlock  // total 501

******* drop if not work in office building ********
drop if Block1PCScreen == 2  // 
drop if Block2PCScreen == 2  // 
drop if Block3PCScreen == 2  // 
drop if Block4PCScreen == 2  // 
drop if Block5PCScreen == 2  //
drop if Block6PCScreen == 2  // 
drop if Block7PCScreen == 2  // 
drop if Block8PCScreen == 2  // 
tab AssignBlock  // total 328  
count if randomR == 1  //  162 for control
count if randomR == 2  //  166 for treatment

drop Block*
drop AssignBlock 
drop CountABCr1 CountABCr2 CountABCr3 

* Demographic 
generate age = 2024-S1
rename S3 gender
rename S4 race
rename S5 edu
rename S5Ar1 hh
rename S5Ar2 child

generate income_10000  = (S6 == 1)
generate income_30000  = (S6 == 2)
generate income_57500  = (S6 == 3)
generate income_100000 = (S6 == 4)
generate income_162500 = (S6 == 5)
generate income_350000 = (S6 == 6)
generate income_750000 = (S7 == 7) 

generate occupation_retired    = (S7 == 1)
generate occupation_homemaker  = (S7 == 2)
generate occupation_student    = (S7 == 3)
generate occupation_fulltime   = (S7 == 4)
generate occupation_parttime   = (S7 == 5)
generate occupation_unemployed = (S7 == 6)
generate occupation_other      = (S7 == 7)

generate architecture = (S8r1 ==1)
generate construction = (S8r2 ==1)
generate earthqsci = (S8r3 ==1)
generate government = (S8r4 ==1)
generate noprofession = (S8r5 ==1)

rename S9 live_US
rename S10 live_LA
rename S12 plan
rename S13 rent_experience

rename Q41 awareness
rename Q42 consideration
rename Q43 history
rename Q44c1 mild_quake
rename Q44c2 moderate_quake
rename Q44c3 severe_quake
rename Q45x1 riskattitude1
rename Q45x2 riskattitude2
rename Q45x3 riskattitude3
rename Q45x4 riskattitude4
rename Q45x5 riskattitude5
rename Q45x6 riskattitude6
rename Q45x7 riskattitude7
rename Q45x8 riskattitude8
rename Q45x9 riskattitude9
rename Q45x10 riskattitude10

save "$path/office building DataSet1.dta",replace

********** control group  ********** 
drop if randomR == 2 
save "$path/office building DataSet1 control.dta",replace
import excel "$path/dataset1 office control.xlsx",clear
save "$path/dataset1 office control.dta", replace 
merge 1:1 _n using "$path/office building DataSet1 control.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2
gen FF = E*2

drop A B C D E S1 S2
order BS1 BS2 ES1 ES2 FF age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2 FF

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10

********** treatment group  ********** 
use "$path/office building DataSet1.dta",clear
drop if randomR == 1
save "$path/office building DataSet1 treatment.dta",replace
import excel "$path/dataset1 office treatment.xlsx",clear
save "$path/dataset1 office treatment.dta", replace 
merge 1:1 _n using "$path/office building DataSet1 treatment.dta"
 
* recalculate WTP
gen BS1 = A*2
gen BS2 = B*2
gen ES1 = C*2
gen ES2 = D*2
gen FF = E*2

drop A B C D E S1 S2
order BS1 BS2 ES1 ES2 FF age 

* WTP summary & analysis
summarize BS1 BS2 ES1 ES2 FF

mvreg BS1 BS2 = age i.gender i.race i.edu i.hh i.child income_10000 income_30000 income_57500 income_100000 income_162500 income_350000 income_750000 occupation_retired occupation_homemaker occupation_student occupation_fulltime occupation_parttime occupation_unemployed occupation_other architecture construction earthqsci government noprofession iB3.live_US i.live_LA i.plan i.rent_experience i.awareness i.consideration i.history iB5.mild_quake iB5.moderate_quake iB5.severe_quake riskattitude1 riskattitude2 riskattitude3 riskattitude4 riskattitude5 riskattitude6 riskattitude7 riskattitude8 riskattitude9 riskattitude10


