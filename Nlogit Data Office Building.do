********  DATA CLEAN FOR NLOGIT ********

* Define relative path 
global path "/Users/yanyuma/Documents/Stata/data_LA building_final"     
import excel "$path/raw data-final.xlsx", firstrow clear
gen ID = _n
drop uuid vbrowserr15oe-csid
save "$path/rawdata_building.dta",replace

* Keep Los Angeles Only
use "$path/rawdata_building.dta", clear
drop if S10 == 1            // S10 Live in LA: control group 255; treatment group 263; total 518  
save "$path/rawdata_LA.dta",replace

* Keep vaild answer:  vaild for one type of building 
use "$path/rawdata_LA.dta", clear
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
count if randomR == 1  // 246 for control
count if randomR == 2  // 255 for treatment
save "$path/Nlogit office building.dta",replace 
 
 
******************** for part C: Office building ********************
use "$path/Nlogit office building.dta", clear

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
drop Block1PCScreen
drop Block2PCScreen
drop Block3PCScreen
drop Block4PCScreen
drop Block5PCScreen
drop Block6PCScreen
drop Block7PCScreen
drop Block8PCScreen
drop CountABCr1 CountABCr2 CountABCr3  
save "$path/Nlogit office building.dta",replace 

*******Compress choice information********
order ID S1-S13
*combine Block*PC1
replace Block1PC1 = Block2PC1 if Block2PC1 !=.
replace Block1PC1 = Block3PC1 if Block3PC1 !=.
replace Block1PC1 = Block4PC1 if Block4PC1 !=.
replace Block1PC1 = Block5PC1 if Block5PC1 !=.
replace Block1PC1 = Block6PC1 if Block6PC1 !=.
replace Block1PC1 = Block7PC1 if Block7PC1 !=.
replace Block1PC1 = Block8PC1 if Block8PC1 !=.

drop Block2PC1 Block3PC1 Block4PC1 Block5PC1 Block6PC1 Block7PC1 Block8PC1
rename Block1PC1 PC1
label var PC1 "Scenario 1: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC2
replace Block1PC2 = Block2PC2 if Block2PC2 !=.
replace Block1PC2 = Block3PC2 if Block3PC2 !=.
replace Block1PC2 = Block4PC2 if Block4PC2 !=.
replace Block1PC2 = Block5PC2 if Block5PC2 !=.
replace Block1PC2 = Block6PC2 if Block6PC2 !=.
replace Block1PC2 = Block7PC2 if Block7PC2 !=.
replace Block1PC2 = Block8PC2 if Block8PC2 !=.

drop Block2PC2 Block3PC2 Block4PC2 Block5PC2 Block6PC2 Block7PC2 Block8PC2
rename Block1PC2 PC2
label var PC2 "Scenario 2: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC3
replace Block1PC3 = Block2PC3 if Block2PC3 !=.
replace Block1PC3 = Block3PC3 if Block3PC3 !=.
replace Block1PC3 = Block4PC3 if Block4PC3 !=.
replace Block1PC3 = Block5PC3 if Block5PC3 !=.
replace Block1PC3 = Block6PC3 if Block6PC3 !=.
replace Block1PC3 = Block7PC3 if Block7PC3 !=.
replace Block1PC3 = Block8PC3 if Block8PC3 !=.

drop Block2PC3 Block3PC3 Block4PC3 Block5PC3 Block6PC3 Block7PC3 Block8PC3
rename Block1PC3 PC3
label var PC3 "Scenario 3: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC4
replace Block1PC4 = Block2PC4 if Block2PC4 !=.
replace Block1PC4 = Block3PC4 if Block3PC4 !=.
replace Block1PC4 = Block4PC4 if Block4PC4 !=.
replace Block1PC4 = Block5PC4 if Block5PC4 !=.
replace Block1PC4 = Block6PC4 if Block6PC4 !=.
replace Block1PC4 = Block7PC4 if Block7PC4 !=.
replace Block1PC4 = Block8PC4 if Block8PC4 !=.

drop Block2PC4 Block3PC4 Block4PC4 Block5PC4 Block6PC4 Block7PC4 Block8PC4
rename Block1PC4 PC4
label var PC4 "Scenario 4: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC5
replace Block1PC5 = Block2PC5 if Block2PC5 !=.
replace Block1PC5 = Block3PC5 if Block3PC5 !=.
replace Block1PC5 = Block4PC5 if Block4PC5 !=.
replace Block1PC5 = Block5PC5 if Block5PC5 !=.
replace Block1PC5 = Block6PC5 if Block6PC5 !=.
replace Block1PC5 = Block7PC5 if Block7PC5 !=.
replace Block1PC5 = Block8PC5 if Block8PC5 !=.

drop Block2PC5 Block3PC5 Block4PC5 Block5PC5 Block6PC5 Block7PC5 Block8PC5
rename Block1PC5 PC5
label var PC5 "Scenario 5: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC6
replace Block1PC6 = Block2PC6 if Block2PC6 !=.
replace Block1PC6 = Block3PC6 if Block3PC6 !=.
replace Block1PC6 = Block4PC6 if Block4PC6 !=.
replace Block1PC6 = Block5PC6 if Block5PC6 !=.
replace Block1PC6 = Block6PC6 if Block6PC6 !=.
replace Block1PC6 = Block7PC6 if Block7PC6 !=.
replace Block1PC6 = Block8PC6 if Block8PC6 !=.
 
drop Block2PC6 Block3PC6 Block4PC6 Block5PC6 Block6PC6 Block7PC6 Block8PC6
rename Block1PC6 PC6
label var PC6 "Scenario 6: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC7
replace Block1PC7 = Block2PC7 if Block2PC7 !=.
replace Block1PC7 = Block3PC7 if Block3PC7 !=.
replace Block1PC7 = Block4PC7 if Block4PC7 !=.
replace Block1PC7 = Block5PC7 if Block5PC7 !=.
replace Block1PC7 = Block6PC7 if Block6PC7 !=.
replace Block1PC7 = Block7PC7 if Block7PC7 !=.
replace Block1PC7 = Block8PC7 if Block8PC7 !=.

drop Block2PC7 Block3PC7 Block4PC7 Block5PC7 Block6PC7 Block7PC7 Block8PC7
rename Block1PC7 PC7
label var PC7 "Scenario 7: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC8
replace Block1PC8 = Block2PC8 if Block2PC8 !=.
replace Block1PC8 = Block3PC8 if Block3PC8 !=.
replace Block1PC8 = Block4PC8 if Block4PC8 !=.
replace Block1PC8 = Block5PC8 if Block5PC8 !=.
replace Block1PC8 = Block6PC8 if Block6PC8 !=.
replace Block1PC8 = Block7PC8 if Block7PC8 !=.
replace Block1PC8 = Block8PC8 if Block8PC8 !=.

drop Block2PC8 Block3PC8 Block4PC8 Block5PC8 Block6PC8 Block7PC8 Block8PC8
rename Block1PC8 PC8
label var PC8 "Scenario 8: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PC9
replace Block1PC9 = Block2PC9 if Block2PC9 !=.
replace Block1PC9 = Block3PC9 if Block3PC9 !=.
replace Block1PC9 = Block4PC9 if Block4PC9 !=.
replace Block1PC9 = Block5PC9 if Block5PC9 !=.
replace Block1PC9 = Block6PC9 if Block6PC9 !=.
replace Block1PC9 = Block7PC9 if Block7PC9 !=.
replace Block1PC9 = Block8PC9 if Block8PC9 !=.

drop Block2PC9 Block3PC9 Block4PC9 Block5PC9 Block6PC9 Block7PC9 Block8PC9
rename Block1PC9 PC9
label var PC9 "Scenario 9: 1-optionA; 2-OptionB; 3-optout"

* convert data from wide to long form 
sort AssignBlock    
//drop if missing(PC1) & missing(PC2) & missing(PC3) & missing(PC4) & ///
//         missing(PC5) & missing(PC5) & missing(PC6) & missing(PC7) & ///
//         missing(PC8) & missing(PC9)  //control:158   treatment:171
reshape long PC, i(ID) j(PC_Scenario)
  
* Replicate choice sets for each respondent
sort ID PC_Scenario
expand 3
sort ID PC_Scenario
gen Alterid = mod(_n,3)
replace Alterid = 3 if Alterid == 0
gen option1 = (Alterid == 1)
gen option2 = (Alterid == 2)
gen option3 = (Alterid == 3)
order Alterid option1 option2 option3, after(PC_Scenario)
order S1-S13, after(PC)

gen Choice=.
replace Choice=1 if Alterid == PC
replace Choice=0 if Choice == .
order Choice, after(Alterid)

* generate office building income reduction compared with current level
** Block 1
*** PC_Scenario 1 & option 1
gen income = 1        if (AssignBlock == 1) &  (PC_Scenario == 1) & (Alterid == 1)
*** PC_Scenario 1 & option 2
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 1) & (Alterid == 2)
*** PC_Scenario 2 & option 1
replace income = 1    if (AssignBlock == 1) &  (PC_Scenario == 2) & (Alterid == 1)
*** PC_Scenario 2 & option 2
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 2) & (Alterid == 2)
*** PC_Scenario 3 & option 1
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 3) & (Alterid == 1)
*** PC_Scenario 3 & option 2
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 3) & (Alterid == 2)
*** PC_Scenario 4 & option 1
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 4) & (Alterid == 1)
*** PC_Scenario 4 & option 2
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 4) & (Alterid == 2)
*** PC_Scenario 5 & option 1
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 5) & (Alterid == 1)
*** PC_Scenario 5 & option 2
replace income = 1    if (AssignBlock == 1) &  (PC_Scenario == 5) & (Alterid == 2)
*** PC_Scenario 6 & option 1
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 6) & (Alterid == 1)
*** PC_Scenario 6 & option 2
replace income = 1    if (AssignBlock == 1) &  (PC_Scenario == 6) & (Alterid == 2)
*** PC_Scenario 7 & option 1
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 7) & (Alterid == 1)
*** PC_Scenario 7 & option 2
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 7) & (Alterid == 2)
*** PC_Scenario 8 & option 1
replace income = 1    if (AssignBlock == 1) &  (PC_Scenario == 8) & (Alterid == 1)
*** PC_Scenario 8 & option 2
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 8) & (Alterid == 2)
*** PC_Scenario 9 & option 1
replace income = 0.99 if (AssignBlock == 1) &  (PC_Scenario == 9) & (Alterid == 1)
*** PC_Scenario 9 & option 2
replace income = 0.98 if (AssignBlock == 1) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 2
replace income = 1    if (AssignBlock == 2) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 1    if (AssignBlock == 2) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 1    if (AssignBlock == 2) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 1    if (AssignBlock == 2) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 1    if (AssignBlock == 2) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 2) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 2) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 3
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 3) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 3) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 3) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 3) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 3) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 1    if (AssignBlock == 3) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 4
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 4) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 4) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 4) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 1    if (AssignBlock == 4) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 5
replace income = 0.98 if (AssignBlock == 5) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 5) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 5) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 5) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 1    if (AssignBlock == 5) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 5) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 6
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 6) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 6) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 6) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 6) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 6) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 1    if (AssignBlock == 6) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 7
replace income = 1   if (AssignBlock == 7) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 1    if (AssignBlock == 7) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 1    if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 1    if (AssignBlock == 7) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 7) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 7) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 8
replace income = 0.99 if (AssignBlock == 8) &  (PC_Scenario == 1) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 1) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 2) & (Alterid == 1)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 2) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 1)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 8) &  (PC_Scenario == 4) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 4) & (Alterid == 2)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 5) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 8) &  (PC_Scenario == 5) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 6) & (Alterid == 1)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 6) & (Alterid == 2)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 7) & (Alterid == 1)
replace income = 0.99 if (AssignBlock == 8) &  (PC_Scenario == 7) & (Alterid == 2)
replace income = 0.99 if (AssignBlock == 8) &  (PC_Scenario == 8) & (Alterid == 1)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 8) & (Alterid == 2)
replace income = 0.98 if (AssignBlock == 8) &  (PC_Scenario == 9) & (Alterid == 1)
replace income = 1    if (AssignBlock == 8) &  (PC_Scenario == 9) & (Alterid == 2)
 
replace income = 0 if income == .

* generate building surviving situation.  BS1 = not life-safe(base); BS2 = life-safe;  BS3 = immediately occupied.
gen BS2=-1
gen BS3=-1

** Block 1
*** PC_Scenario 1 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 1) & (Alterid == 2)
*** PC_Scenario 2 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 2) & (Alterid == 2)
*** PC_Scenario 3 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 3) & (Alterid == 2)
*** PC_Scenario 4 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 4) & (Alterid == 2)
*** PC_Scenario 5 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 5) & (Alterid == 1)
*** PC_Scenario 6 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 6) & (Alterid == 1)
*** PC_Scenario 7 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 7) & (Alterid == 1)
*** PC_Scenario 8 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 8) & (Alterid == 2)
*** PC_Scenario 9 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 9) & (Alterid == 1)


** Block 2
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 1) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 3) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 9) & (Alterid == 1)


** Block 3
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 7) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 9) & (Alterid == 1)


** Block 4
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 9) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 5
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 9) & (Alterid == 2)


** Block 6
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 9) & (Alterid == 2)


** Block 7
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 9) & (Alterid == 1)


** Block 8
replace BS2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 7) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 9) & (Alterid == 1)

replace BS2=0 if Alterid == 3 
replace BS3=0 if Alterid == 3 

* generate Energy-saving situation.  ES1 = no saving(base); ES2 = 10% saving;  ES3 = 20% saving .
gen ES2=-1
gen ES3=-1

** Block 1
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 1) &  (PC_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 2
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 1) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 7) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PC_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 3
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 3) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 4
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 7) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 8) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 4) &  (PC_Scenario == 9) & (Alterid == 1)

** Block 5
replace ES2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PC_Scenario == 9) & (Alterid == 1)

** Block 6
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 5) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PC_Scenario == 7) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 8) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 7
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 1) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 4) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 7) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PC_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PC_Scenario == 9) & (Alterid == 2)

** Block 8
replace ES2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 1) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 2) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 3) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 5) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 7) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PC_Scenario == 8) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PC_Scenario == 9) & (Alterid == 2)

replace ES2 = 0 if Alterid == 3 
replace ES3 = 0 if Alterid == 3 

* generate fitness facility situation.  FF = 1 if there is fitness facility inside the building
gen FF=-1

** Block 1
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PC_Scenario == 9) & (Alterid == 1)
   
** Block 2
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 6) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PC_Scenario == 9) & (Alterid == 2)

** Block 3
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PC_Scenario == 9) & (Alterid == 1)

** Block 4
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 2) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PC_Scenario == 9) & (Alterid == 2)

** Block 5
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 6) & (Alterid == 2)
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PC_Scenario == 9) & (Alterid == 1)
									  
** Block 6
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 2) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 6) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PC_Scenario == 9) & (Alterid == 1)							  
									  
** Block 7
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PC_Scenario == 9) & (Alterid == 1)	
									  
** Block 8
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PC_Scenario == 9) & (Alterid == 2)							  
									  
replace FF = 0 if Alterid == 3 

*gen opt-out
gen optout = 1 if Alterid == 3
replace optout = 0 if optout ==.
drop AssignBlock PC 
order ID randomR PC_Scenario Alterid Choice option1 option2 option3 income - optout

save "$path/Nlogit office building.dta",replace 
export delimited "$path/Nlogit office building.csv", replace
