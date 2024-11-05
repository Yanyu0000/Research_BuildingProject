********* DATA CLEAN FOR NLOGIT *********

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

* Keep vaild answer: For Residential building 
use "$path/rawdata_LA.dta", clear
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
save "$path/Nlogit residential building.dta",replace 


******************** for part A: Residentaial building ********************
use "$path/Nlogit residential building.dta", clear

*******Compress choice information********
order ID S1-S13
*combine Block*PA1
replace Block1PA1 = Block2PA1 if Block2PA1 !=.
replace Block1PA1 = Block3PA1 if Block3PA1 !=.
replace Block1PA1 = Block4PA1 if Block4PA1 !=.
replace Block1PA1 = Block5PA1 if Block5PA1 !=.
replace Block1PA1 = Block6PA1 if Block6PA1 !=.
replace Block1PA1 = Block7PA1 if Block7PA1 !=.
replace Block1PA1 = Block8PA1 if Block8PA1 !=.

drop Block2PA1 Block3PA1 Block4PA1 Block5PA1 Block6PA1 Block7PA1 Block8PA1
rename Block1PA1 PA1
label var PA1 "Scenario 1: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA2
replace Block1PA2 = Block2PA2 if Block2PA2 !=.
replace Block1PA2 = Block3PA2 if Block3PA2 !=.
replace Block1PA2 = Block4PA2 if Block4PA2 !=.
replace Block1PA2 = Block5PA2 if Block5PA2 !=.
replace Block1PA2 = Block6PA2 if Block6PA2 !=.
replace Block1PA2 = Block7PA2 if Block7PA2 !=.
replace Block1PA2 = Block8PA2 if Block8PA2 !=.

drop Block2PA2 Block3PA2 Block4PA2 Block5PA2 Block6PA2 Block7PA2 Block8PA2
rename Block1PA2 PA2
label var PA2 "Scenario 2: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA3
replace Block1PA3 = Block2PA3 if Block2PA3 !=.
replace Block1PA3 = Block3PA3 if Block3PA3 !=.
replace Block1PA3 = Block4PA3 if Block4PA3 !=.
replace Block1PA3 = Block5PA3 if Block5PA3 !=.
replace Block1PA3 = Block6PA3 if Block6PA3 !=.
replace Block1PA3 = Block7PA3 if Block7PA3 !=.
replace Block1PA3 = Block8PA3 if Block8PA3 !=.

drop Block2PA3 Block3PA3 Block4PA3 Block5PA3 Block6PA3 Block7PA3 Block8PA3
rename Block1PA3 PA3
label var PA3 "Scenario 3: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA4
replace Block1PA4 = Block2PA4 if Block2PA4 !=.
replace Block1PA4 = Block3PA4 if Block3PA4 !=.
replace Block1PA4 = Block4PA4 if Block4PA4 !=.
replace Block1PA4 = Block5PA4 if Block5PA4 !=.
replace Block1PA4 = Block6PA4 if Block6PA4 !=.
replace Block1PA4 = Block7PA4 if Block7PA4 !=.
replace Block1PA4 = Block8PA4 if Block8PA4 !=.

drop Block2PA4 Block3PA4 Block4PA4 Block5PA4 Block6PA4 Block7PA4 Block8PA4
rename Block1PA4 PA4
label var PA4 "Scenario 4: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA5
replace Block1PA5 = Block2PA5 if Block2PA5 !=.
replace Block1PA5 = Block3PA5 if Block3PA5 !=.
replace Block1PA5 = Block4PA5 if Block4PA5 !=.
replace Block1PA5 = Block5PA5 if Block5PA5 !=.
replace Block1PA5 = Block6PA5 if Block6PA5 !=.
replace Block1PA5 = Block7PA5 if Block7PA5 !=.
replace Block1PA5 = Block8PA5 if Block8PA5 !=.

drop Block2PA5 Block3PA5 Block4PA5 Block5PA5 Block6PA5 Block7PA5 Block8PA5
rename Block1PA5 PA5
label var PA5 "Scenario 5: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA6
replace Block1PA6 = Block2PA6 if Block2PA6 !=.
replace Block1PA6 = Block3PA6 if Block3PA6 !=.
replace Block1PA6 = Block4PA6 if Block4PA6 !=.
replace Block1PA6 = Block5PA6 if Block5PA6 !=.
replace Block1PA6 = Block6PA6 if Block6PA6 !=.
replace Block1PA6 = Block7PA6 if Block7PA6 !=.
replace Block1PA6 = Block8PA6 if Block8PA6 !=.
 
drop Block2PA6 Block3PA6 Block4PA6 Block5PA6 Block6PA6 Block7PA6 Block8PA6
rename Block1PA6 PA6
label var PA6 "Scenario 6: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA7
replace Block1PA7 = Block2PA7 if Block2PA7 !=.
replace Block1PA7 = Block3PA7 if Block3PA7 !=.
replace Block1PA7 = Block4PA7 if Block4PA7 !=.
replace Block1PA7 = Block5PA7 if Block5PA7 !=.
replace Block1PA7 = Block6PA7 if Block6PA7 !=.
replace Block1PA7 = Block7PA7 if Block7PA7 !=.
replace Block1PA7 = Block8PA7 if Block8PA7 !=.

drop Block2PA7 Block3PA7 Block4PA7 Block5PA7 Block6PA7 Block7PA7 Block8PA7
rename Block1PA7 PA7
label var PA7 "Scenario 7: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA8
replace Block1PA8 = Block2PA8 if Block2PA8 !=.
replace Block1PA8 = Block3PA8 if Block3PA8 !=.
replace Block1PA8 = Block4PA8 if Block4PA8 !=.
replace Block1PA8 = Block5PA8 if Block5PA8 !=.
replace Block1PA8 = Block6PA8 if Block6PA8 !=.
replace Block1PA8 = Block7PA8 if Block7PA8 !=.
replace Block1PA8 = Block8PA8 if Block8PA8 !=.

drop Block2PA8 Block3PA8 Block4PA8 Block5PA8 Block6PA8 Block7PA8 Block8PA8
rename Block1PA8 PA8
label var PA8 "Scenario 8: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PA9
replace Block1PA9 = Block2PA9 if Block2PA9 !=.
replace Block1PA9 = Block3PA9 if Block3PA9 !=.
replace Block1PA9 = Block4PA9 if Block4PA9 !=.
replace Block1PA9 = Block5PA9 if Block5PA9 !=.
replace Block1PA9 = Block6PA9 if Block6PA9 !=.
replace Block1PA9 = Block7PA9 if Block7PA9 !=.
replace Block1PA9 = Block8PA9 if Block8PA9 !=.

drop Block2PA9 Block3PA9 Block4PA9 Block5PA9 Block6PA9 Block7PA9 Block8PA9
rename Block1PA9 PA9
label var PA9 "Scenario 9: 1-optionA; 2-OptionB; 3-optout"

* convert data from wide to long form 
sort AssignBlock
reshape long PA, i(ID) j(PA_Scenario)
  
* Replicate choice sets for each respondent
sort ID PA_Scenario
expand 3
sort ID PA_Scenario
gen Alterid = mod(_n,3)
replace Alterid = 3 if Alterid == 0
gen option1 = (Alterid == 1)
gen option2 = (Alterid == 2)
gen option3 = (Alterid == 3)
order Alterid option1 option2 option3, after(PA_Scenario)
order S1-S13, after(PA)

gen Choice=.
replace Choice=1 if Alterid == PA
replace Choice=0 if Choice == .
order Choice, after(Alterid)

* generate residential building Monthly rent above current market level
** Block 1
*** PA_Scenario 1 & option 1
gen rent = 1 if (AssignBlock == 1) &  (PA_Scenario == 1) & (Alterid == 1)
*** PA_Scenario 1 & option 2
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 1) & (Alterid == 2)
*** PA_Scenario 2 & option 1
replace rent = 1 if (AssignBlock == 1) &  (PA_Scenario == 2) & (Alterid == 1)
*** PA_Scenario 2 & option 2
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 2) & (Alterid == 2)
*** PA_Scenario 3 & option 1
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 3) & (Alterid == 1)
*** PA_Scenario 3 & option 2
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 3) & (Alterid == 2)
*** PA_Scenario 4 & option 1
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 4) & (Alterid == 1)
*** PA_Scenario 4 & option 2
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 4) & (Alterid == 2)
*** PA_Scenario 5 & option 1
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 5) & (Alterid == 1)
*** PA_Scenario 5 & option 2
replace rent = 1 if (AssignBlock == 1) &  (PA_Scenario == 5) & (Alterid == 2)
*** PA_Scenario 6 & option 1
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 6) & (Alterid == 1)
*** PA_Scenario 6 & option 2
replace rent = 1 if (AssignBlock == 1) &  (PA_Scenario == 6) & (Alterid == 2)
*** PA_Scenario 7 & option 1
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 7) & (Alterid == 1)
*** PA_Scenario 7 & option 2
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 7) & (Alterid == 2)
*** PA_Scenario 8 & option 1
replace rent = 1 if (AssignBlock == 1) &  (PA_Scenario == 8) & (Alterid == 1)
*** PA_Scenario 8 & option 2
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 8) & (Alterid == 2)
*** PA_Scenario 9 & option 1
replace rent = 1.1 if (AssignBlock == 1) &  (PA_Scenario == 9) & (Alterid == 1)
*** PA_Scenario 9 & option 2
replace rent = 1.2 if (AssignBlock == 1) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 2
replace rent = 1   if (AssignBlock == 2) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 2) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 2) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 2) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 2) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 2) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 2) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 3
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 3) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 3) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 3) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 3) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 3) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 3) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 4
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 4) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 4) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 4) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 4) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 5
replace rent = 1.2 if (AssignBlock == 5) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 5) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 5) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 5) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 5) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 5) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 6
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 6) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 6) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 6) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 6) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 6) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 6) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 7
replace rent = 1   if (AssignBlock == 7) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 7) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 7) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 7) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 7) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 8
replace rent = 1.1 if (AssignBlock == 8) &  (PA_Scenario == 1) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 1) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 2) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 2) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 8) &  (PA_Scenario == 4) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 4) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 5) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 8) &  (PA_Scenario == 5) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 6) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 6) & (Alterid == 2)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 7) & (Alterid == 1)
replace rent = 1.1 if (AssignBlock == 8) &  (PA_Scenario == 7) & (Alterid == 2)
replace rent = 1.1 if (AssignBlock == 8) &  (PA_Scenario == 8) & (Alterid == 1)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 8) & (Alterid == 2)
replace rent = 1.2 if (AssignBlock == 8) &  (PA_Scenario == 9) & (Alterid == 1)
replace rent = 1   if (AssignBlock == 8) &  (PA_Scenario == 9) & (Alterid == 2)

replace rent = 0 if rent == .

* generate building surviving situation.  BS1 = not life-safe(base); BS2 = life-safe;  BS3 = immediately occupied.
gen BS2=-1
gen BS3=-1

** Block 1
*** PA_Scenario 1 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 1) & (Alterid == 2)
*** PA_Scenario 2 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 2) & (Alterid == 2)
*** PA_Scenario 3 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 3) & (Alterid == 2)
*** PA_Scenario 4 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 4) & (Alterid == 2)
*** PA_Scenario 5 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 5) & (Alterid == 1)
*** PA_Scenario 6 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 6) & (Alterid == 1)
*** PA_Scenario 7 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 7) & (Alterid == 1)
*** PA_Scenario 8 & option 2
replace BS2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 8) & (Alterid == 2)
*** PA_Scenario 9 & option 1
replace BS3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 9) & (Alterid == 1)


** Block 2
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 1) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 3) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 9) & (Alterid == 1)


** Block 3
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 7) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 9) & (Alterid == 1)


** Block 4
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 9) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 5
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 9) & (Alterid == 2)


** Block 6
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 9) & (Alterid == 2)


** Block 7
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 9) & (Alterid == 1) 


** Block 8
replace BS2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 7) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 9) & (Alterid == 1)

replace BS2=0 if Alterid == 3 
replace BS3=0 if Alterid == 3 

* generate Energy-saving situation.  ES1 = no saving(base); ES2 = 10% saving;  ES3 = 20% saving .
gen ES2=-1
gen ES3=-1

** Block 1
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 1) &  (PA_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 2
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 1) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 7) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 2) &  (PA_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 3
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 3) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 4
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 7) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 8) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 4) &  (PA_Scenario == 9) & (Alterid == 1)

** Block 5

replace ES2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PA_Scenario == 9) & (Alterid == 1)

** Block 6
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 5) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PA_Scenario == 7) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 8) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 7
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 1) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 4) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 7) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 9) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PA_Scenario == 9) & (Alterid == 2)

** Block 8
replace ES2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 1) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 2) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 3) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 5) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 7) & (Alterid == 1)
replace ES2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PA_Scenario == 8) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PA_Scenario == 9) & (Alterid == 2)

replace ES2 = 0 if Alterid == 3 
replace ES3 = 0 if Alterid == 3

* generate fitness facility situation.  FF = 1 if there is fitness facility inside the building
gen FF=-1

** Block 1
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 1) & (PA_Scenario == 9) & (Alterid == 1)
   
** Block 2
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 6) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 2) & (PA_Scenario == 9) & (Alterid == 2)

** Block 3
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 3) & (PA_Scenario == 9) & (Alterid == 1)

** Block 4
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 2) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 5) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 4) & (PA_Scenario == 9) & (Alterid == 2)

** Block 5
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 6) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 7) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 5) & (PA_Scenario == 9) & (Alterid == 1)
									  
** Block 6
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 1) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 2) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 3) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 5) & (Alterid == 1)
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 6) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 6) & (PA_Scenario == 9) & (Alterid == 1)								  
									  
** Block 7
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 4) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 5) & (Alterid == 1)
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 7) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 8) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 7) & (PA_Scenario == 9) & (Alterid == 1)
									  
** Block 8
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 1) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 2) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 3) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 4) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 5) & (Alterid == 2) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 6) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 7) & (Alterid == 1)
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 8) & (Alterid == 1) 
replace FF = 1 if (AssignBlock == 8) & (PA_Scenario == 9) & (Alterid == 2)								  
									  
replace FF = 0 if Alterid == 3 

*gen opt-out
gen optout = 1 if Alterid == 3
replace optout = 0 if optout ==.
drop AssignBlock PA CountABCr1 CountABCr2 CountABCr3
order ID randomR PA_Scenario Alterid Choice option1 option2 option3 rent - optout

save "$path/Nlogit residential building.dta",replace 
export delimited "$path/Nlogit residential building.csv",replace 




