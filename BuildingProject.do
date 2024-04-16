* Define relative path 
global path "/Users/yanyuma/Documents/Stata/data_LA building_0329"
*import excel "$path/raw data-0329.xlsx", firstrow clear
*gen ID = _n
*drop uuid vbrowserr15oe-csid
*save "$path/rawdata_building.dta",replace

* control group - no price information /treatment group - price information 
use "$path/rawdata_building.dta", clear
drop if  randomR!= 2 //  =1 keep control group =2 treatment group 
tab AssignBlock  

******************** for part A: Residentaial building ********************
*drop invaild questionary
*drop Block*PB*
*drop Block*PC*
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
/*
drop if (Block1PA1 == Block1PA2) & (Block1PA1== Block1PA3) & (Block1PA1== Block1PA4) & (Block1PA1== Block1PA5) & (Block1PA1== Block1PA6) & (Block1PA1== Block1PA7) & (Block1PA1== Block1PA8) & (Block1PA1== Block1PA9)  & Block1PA1 !=. 
drop if (Block2PA1 == Block2PA2) & (Block2PA1== Block2PA3) & (Block2PA1== Block2PA4) & (Block2PA1== Block2PA5) & (Block2PA1== Block2PA6) & (Block2PA1== Block2PA7) & (Block2PA1== Block2PA8) & (Block2PA1== Block2PA9)  & Block2PA1 !=. 
drop if (Block3PA1 == Block3PA2) & (Block3PA1== Block3PA3) & (Block3PA1== Block3PA4) & (Block3PA1== Block3PA5) & (Block3PA1== Block3PA6) & (Block3PA1== Block3PA7) & (Block3PA1== Block3PA8) & (Block3PA1== Block3PA9)  & Block3PA1 !=. 
drop if (Block4PA1 == Block4PA2) & (Block4PA1== Block4PA3) & (Block4PA1== Block4PA4) & (Block4PA1== Block4PA5) & (Block4PA1== Block4PA6) & (Block4PA1== Block4PA7) & (Block4PA1== Block4PA8) & (Block4PA1== Block4PA9)  & Block4PA1 !=. 
drop if (Block5PA1 == Block5PA2) & (Block5PA1== Block5PA3) & (Block5PA1== Block5PA4) & (Block5PA1== Block5PA5) & (Block5PA1== Block5PA6) & (Block5PA1== Block5PA7) & (Block5PA1== Block5PA8) & (Block5PA1== Block5PA9)  & Block5PA1 !=. 
drop if (Block6PA1 == Block6PA2) & (Block6PA1== Block6PA3) & (Block6PA1== Block6PA4) & (Block6PA1== Block6PA5) & (Block6PA1== Block6PA6) & (Block6PA1== Block6PA7) & (Block6PA1== Block6PA8) & (Block6PA1== Block6PA9)  & Block6PA1 !=. 
drop if (Block7PA1 == Block7PA2) & (Block7PA1== Block7PA3) & (Block7PA1== Block7PA4) & (Block7PA1== Block7PA5) & (Block7PA1== Block7PA6) & (Block7PA1== Block7PA7) & (Block7PA1== Block7PA8) & (Block7PA1== Block7PA9)  & Block7PA1 !=. 
drop if (Block8PA1 == Block8PA2) & (Block8PA1== Block8PA3) & (Block8PA1== Block8PA4) & (Block8PA1== Block8PA5) & (Block8PA1== Block8PA6) & (Block8PA1== Block8PA7) & (Block8PA1== Block8PA8) & (Block8PA1== Block8PA9)  & Block8PA1 !=. 
*/
tab AssignBlock  // total 282 for control , 286 for treatment

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
order Alterid, after(PA_Scenario)
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
replace BS2 = 1 if (AssignBlock == 7) &  (PA_Scenario == 2) & (Alterid == 1)
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

replace BS2=0 if Alterid == 3 & Choice == 1 
replace BS3=0 if Alterid == 3 & Choice == 1

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
replace ES3 = 1 if (AssignBlock == 1) &  (PA_Scenario == 8) & (Alterid == 2)
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

replace ES2 = 0 if Alterid == 3 & Choice == 1
replace ES3 = 0 if Alterid == 3 & Choice == 1

* generate fitness facility situation.  FF = 1 if there is fitness facility inside the building
gen FF=-1

** Block 1
replace FF = 1 if (AssignBlock == 1 & (PA_Scenario == 1 & Alterid == 1) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 2) | ///
                                      (PA_Scenario == 4 & Alterid == 1) | ///
                                      (PA_Scenario == 5 & Alterid == 2) | ///
                                      (PA_Scenario == 6 & Alterid == 1) | ///
                                      (PA_Scenario == 7 & Alterid == 2) | ///
                                      (PA_Scenario == 8 & Alterid == 2) | ///
                                      (PA_Scenario == 9 & Alterid == 1))
   
** Block 2
replace FF = 1 if (AssignBlock == 2 & (PA_Scenario == 1 & Alterid == 1) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 1) | ///
                                      (PA_Scenario == 4 & Alterid == 2) | ///
                                      (PA_Scenario == 5 & Alterid == 1) | ///
                                      (PA_Scenario == 6 & Alterid == 2) | ///
                                      (PA_Scenario == 7 & Alterid == 2) | ///
                                      (PA_Scenario == 8 & Alterid == 2) | ///
                                      (PA_Scenario == 9 & Alterid == 2))

** Block 3
replace FF = 1 if (AssignBlock == 3 & (PA_Scenario == 1 & Alterid == 1) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 2) | ///
                                      (PA_Scenario == 4 & Alterid == 1) | ///
                                      (PA_Scenario == 5 & Alterid == 2) | ///
                                      (PA_Scenario == 6 & Alterid == 1) | ///
                                      (PA_Scenario == 7 & Alterid == 1) | ///
                                      (PA_Scenario == 8 & Alterid == 2) | ///
                                      (PA_Scenario == 9 & Alterid == 1))

** Block 4
replace FF = 1 if (AssignBlock == 4 & (PA_Scenario == 1 & Alterid == 1) | ///
                                      (PA_Scenario == 2 & Alterid == 1) | ///
                                      (PA_Scenario == 3 & Alterid == 1) | ///
                                      (PA_Scenario == 4 & Alterid == 2) | ///
                                      (PA_Scenario == 5 & Alterid == 1) | ///
                                      (PA_Scenario == 6 & Alterid == 1) | ///
                                      (PA_Scenario == 7 & Alterid == 1) | ///
                                      (PA_Scenario == 8 & Alterid == 1) | ///
                                      (PA_Scenario == 9 & Alterid == 2))

** Block 5
replace FF = 1 if (AssignBlock == 5 & (PA_Scenario == 1 & Alterid == 2) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 1) | ///
                                      (PA_Scenario == 4 & Alterid == 1) | ///
                                      (PA_Scenario == 5 & Alterid == 2) | ///
                                      (PA_Scenario == 6 & Alterid == 2) | ///
                                      (PA_Scenario == 7 & Alterid == 1) | ///
                                      (PA_Scenario == 8 & Alterid == 2) | ///
                                      (PA_Scenario == 9 & Alterid == 1))
									  
** Block 6
replace FF = 1 if (AssignBlock == 6 & (PA_Scenario == 1 & Alterid == 1) | ///
                                      (PA_Scenario == 2 & Alterid == 1) | ///
                                      (PA_Scenario == 3 & Alterid == 1) | ///
                                      (PA_Scenario == 4 & Alterid == 2) | ///
                                      (PA_Scenario == 5 & Alterid == 1) | ///
                                      (PA_Scenario == 6 & Alterid == 2) | ///
                                      (PA_Scenario == 7 & Alterid == 2) | ///
                                      (PA_Scenario == 8 & Alterid == 1) | ///
                                      (PA_Scenario == 9 & Alterid == 1))									  
									  
** Block 7
replace FF = 1 if (AssignBlock == 7 & (PA_Scenario == 1 & Alterid == 2) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 2) | ///
                                      (PA_Scenario == 4 & Alterid == 2) | ///
                                      (PA_Scenario == 5 & Alterid == 1) | ///
                                      (PA_Scenario == 6 & Alterid == 1) | ///
                                      (PA_Scenario == 7 & Alterid == 2) | ///
                                      (PA_Scenario == 8 & Alterid == 2) | ///
                                      (PA_Scenario == 9 & Alterid == 1))	
									  
** Block 8
replace FF = 1 if (AssignBlock == 8 & (PA_Scenario == 1 & Alterid == 2) | ///
                                      (PA_Scenario == 2 & Alterid == 2) | ///
                                      (PA_Scenario == 3 & Alterid == 2) | ///
                                      (PA_Scenario == 4 & Alterid == 1) | ///
                                      (PA_Scenario == 5 & Alterid == 2) | ///
                                      (PA_Scenario == 6 & Alterid == 1) | ///
                                      (PA_Scenario == 7 & Alterid == 1) | ///
                                      (PA_Scenario == 8 & Alterid == 1) | ///
                                      (PA_Scenario == 9 & Alterid == 2))									  
									  
replace FF = 0 if Alterid == 3 & Choice == 1

*gen opt-out
gen optout = 1 if Alterid == 3 & Choice == 1
replace optout = 0 if optout ==.
order rent - optout, after (PA)

******* Mixed Logit Model *******
egen group = group(ID PA_Scenario) 
order group, before(PA_Scenario)

// Preference Space 
*ssc install mixlogit
*mixlogit Choice rent optout,rand(BS2 BS3 ES2 ES3 FF) group(group) id(ID) corr trace gradient
gen mrent = -1 * rent 
mixlogit Choice optout,rand(mrent BS2 BS3 ES2 ES3 FF) group(group) id(ID)  

* WTP coefficent
* mixlbeta mrent BS2 BS3 ES2 ES3 FF, saving("$path/WTP_PAcontrol.dta") replace ///control
mixlbeta mrent BS2 BS3 ES2 ES3 FF, saving("$path/WTP_PAtreatment.dta") replace 

* regression result
est save "$path/WTP_PAtreatment", replace    

use "/Users/yanyuma/Documents/Stata/data_LA building_0329/WTP_PAtreatment.dta", clear
summarize mrent BS2 BS3 ES2 ES3 FF 

merge 1:1 ID using "$path/rawdata_building.dta"
keep if _merge == 3

gen wtp_BS2 = BS2/mrent 
gen wtp_BS3 = BS3/mrent 
gen wtp_ES2 = ES2/mrent 
gen wtp_ES3 = ES3/mrent 
gen wtp_FF = FF/mrent

summarize wtp*






******************** for part B: Public Residentaial building ********************
* control group - no price information /treatment group - price information 
use "$path/rawdata_building.dta", clear
drop if  randomR!= 2 //  =1 keep control group =2 treatment group 
tab AssignBlock   

*drop invaild questionary
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

tab AssignBlock  // total 292 for control , 292 for treatment

*******Compress choice information********
order ID S1-S13
*combine Block*PB1
replace Block1PB1 = Block2PB1 if Block2PB1 !=.
replace Block1PB1 = Block3PB1 if Block3PB1 !=.
replace Block1PB1 = Block4PB1 if Block4PB1 !=.
replace Block1PB1 = Block5PB1 if Block5PB1 !=.
replace Block1PB1 = Block6PB1 if Block6PB1 !=.
replace Block1PB1 = Block7PB1 if Block7PB1 !=.
replace Block1PB1 = Block8PB1 if Block8PB1 !=.

drop Block2PB1 Block3PB1 Block4PB1 Block5PB1 Block6PB1 Block7PB1 Block8PB1
rename Block1PB1 PB1
label var PB1 "Scenario 1: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB2
replace Block1PB2 = Block2PB2 if Block2PB2 !=.
replace Block1PB2 = Block3PB2 if Block3PB2 !=.
replace Block1PB2 = Block4PB2 if Block4PB2 !=.
replace Block1PB2 = Block5PB2 if Block5PB2 !=.
replace Block1PB2 = Block6PB2 if Block6PB2 !=.
replace Block1PB2 = Block7PB2 if Block7PB2 !=.
replace Block1PB2 = Block8PB2 if Block8PB2 !=.

drop Block2PB2 Block3PB2 Block4PB2 Block5PB2 Block6PB2 Block7PB2 Block8PB2
rename Block1PB2 PB2
label var PB2 "Scenario 2: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB3
replace Block1PB3 = Block2PB3 if Block2PB3 !=.
replace Block1PB3 = Block3PB3 if Block3PB3 !=.
replace Block1PB3 = Block4PB3 if Block4PB3 !=.
replace Block1PB3 = Block5PB3 if Block5PB3 !=.
replace Block1PB3 = Block6PB3 if Block6PB3 !=.
replace Block1PB3 = Block7PB3 if Block7PB3 !=.
replace Block1PB3 = Block8PB3 if Block8PB3 !=.

drop Block2PB3 Block3PB3 Block4PB3 Block5PB3 Block6PB3 Block7PB3 Block8PB3
rename Block1PB3 PB3
label var PB3 "Scenario 3: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB4
replace Block1PB4 = Block2PB4 if Block2PB4 !=.
replace Block1PB4 = Block3PB4 if Block3PB4 !=.
replace Block1PB4 = Block4PB4 if Block4PB4 !=.
replace Block1PB4 = Block5PB4 if Block5PB4 !=.
replace Block1PB4 = Block6PB4 if Block6PB4 !=.
replace Block1PB4 = Block7PB4 if Block7PB4 !=.
replace Block1PB4 = Block8PB4 if Block8PB4 !=.

drop Block2PB4 Block3PB4 Block4PB4 Block5PB4 Block6PB4 Block7PB4 Block8PB4
rename Block1PB4 PB4
label var PB4 "Scenario 4: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB5
replace Block1PB5 = Block2PB5 if Block2PB5 !=.
replace Block1PB5 = Block3PB5 if Block3PB5 !=.
replace Block1PB5 = Block4PB5 if Block4PB5 !=.
replace Block1PB5 = Block5PB5 if Block5PB5 !=.
replace Block1PB5 = Block6PB5 if Block6PB5 !=.
replace Block1PB5 = Block7PB5 if Block7PB5 !=.
replace Block1PB5 = Block8PB5 if Block8PB5 !=.

drop Block2PB5 Block3PB5 Block4PB5 Block5PB5 Block6PB5 Block7PB5 Block8PB5
rename Block1PB5 PB5
label var PB5 "Scenario 5: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB6
replace Block1PB6 = Block2PB6 if Block2PB6 !=.
replace Block1PB6 = Block3PB6 if Block3PB6 !=.
replace Block1PB6 = Block4PB6 if Block4PB6 !=.
replace Block1PB6 = Block5PB6 if Block5PB6 !=.
replace Block1PB6 = Block6PB6 if Block6PB6 !=.
replace Block1PB6 = Block7PB6 if Block7PB6 !=.
replace Block1PB6 = Block8PB6 if Block8PB6 !=.
 
drop Block2PB6 Block3PB6 Block4PB6 Block5PB6 Block6PB6 Block7PB6 Block8PB6
rename Block1PB6 PB6
label var PB6 "Scenario 6: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB7
replace Block1PB7 = Block2PB7 if Block2PB7 !=.
replace Block1PB7 = Block3PB7 if Block3PB7 !=.
replace Block1PB7 = Block4PB7 if Block4PB7 !=.
replace Block1PB7 = Block5PB7 if Block5PB7 !=.
replace Block1PB7 = Block6PB7 if Block6PB7 !=.
replace Block1PB7 = Block7PB7 if Block7PB7 !=.
replace Block1PB7 = Block8PB7 if Block8PB7 !=.

drop Block2PB7 Block3PB7 Block4PB7 Block5PB7 Block6PB7 Block7PB7 Block8PB7
rename Block1PB7 PB7
label var PB7 "Scenario 7: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB8
replace Block1PB8 = Block2PB8 if Block2PB8 !=.
replace Block1PB8 = Block3PB8 if Block3PB8 !=.
replace Block1PB8 = Block4PB8 if Block4PB8 !=.
replace Block1PB8 = Block5PB8 if Block5PB8 !=.
replace Block1PB8 = Block6PB8 if Block6PB8 !=.
replace Block1PB8 = Block7PB8 if Block7PB8 !=.
replace Block1PB8 = Block8PB8 if Block8PB8 !=.

drop Block2PB8 Block3PB8 Block4PB8 Block5PB8 Block6PB8 Block7PB8 Block8PB8
rename Block1PB8 PB8
label var PB8 "Scenario 8: 1-optionA; 2-OptionB; 3-optout"

*combine Block*PB9
replace Block1PB9 = Block2PB9 if Block2PB9 !=.
replace Block1PB9 = Block3PB9 if Block3PB9 !=.
replace Block1PB9 = Block4PB9 if Block4PB9 !=.
replace Block1PB9 = Block5PB9 if Block5PB9 !=.
replace Block1PB9 = Block6PB9 if Block6PB9 !=.
replace Block1PB9 = Block7PB9 if Block7PB9 !=.
replace Block1PB9 = Block8PB9 if Block8PB9 !=.

drop Block2PB9 Block3PB9 Block4PB9 Block5PB9 Block6PB9 Block7PB9 Block8PB9
rename Block1PB9 PB9
label var PB9 "Scenario 9: 1-optionA; 2-OptionB; 3-optout"

* convert data from wide to long form 
sort AssignBlock
reshape long PB, i(ID) j(PB_Scenario)
  
* Replicate choice sets for each respondent
sort ID PB_Scenario
expand 3
sort ID PB_Scenario
gen Alterid = mod(_n,3)
replace Alterid = 3 if Alterid == 0
order Alterid, after(PB_Scenario)
order S1-S13, after(PB)

gen Choice=.
replace Choice=1 if Alterid == PB
replace Choice=0 if Choice == .
order Choice, after(Alterid)

* generate Public building annual tax above current 
** Block 1
gen tax = 1.2     if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 2
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 3
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 4
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 5
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 6
replace tax = 1.2 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 7
replace tax = 1.2 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 8
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.1 if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1   if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.1 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1   if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.2 if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 2)

replace tax = 0 if tax == .

* generate building surviving situation.  BS1 = not life-safe(base); BS2 = life-safe;  BS3 = immediately occupied.
gen BS2=-1
gen BS3=-1

** Block 1
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 2

replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 3
replace BS2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 4
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 5
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 6
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 7
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 8
replace BS3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 2)

replace BS2 = 0 if Alterid == 3 & Choice == 1
replace BS3 = 0 if Alterid == 3 & Choice == 1

* generate Energy-saving situation.  ES1 = no saving(base); ES2 = 10% saving;  ES3 = 20% saving .
gen ES2=-1
gen ES3=-1

** Block 1
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 2
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 3
replace ES2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 4
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 1)


** Block 5
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 6
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 7
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 8
replace ES2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 2)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 1)

replace ES2 = 0 if Alterid == 3 & Choice == 1
replace ES3 = 0 if Alterid == 3 & Choice == 1

*gen opt-out
gen optout = 1 if Alterid == 3 & Choice == 1
replace optout = 0 if optout ==.
order tax - optout, after (PB)

******* Mixed Logit Model *******
egen group = group(ID PB_Scenario) 
order group, before(PB_Scenario)

// Preference Space 
*ssc install mixlogit
*mixlogit Choice rent optout,rand(BS2 BS3 ES2 ES3 FF) group(group) id(ID) corr trace gradient
gen mtax = -1 * tax
mixlogit Choice optout,rand(mtax BS2 BS3 ES2 ES3) group(group) id(ID)  

* WTP coefficent
* mixlbeta mtax BS2 BS3 ES2 ES3, saving("$path/WTP_PCcontrol.dta") replace 
mixlbeta mtax BS2 BS3 ES2 ES3, saving("$path/WTP_PCtreatment.dta") replace 

* regression result
est save "$path/WTP_PCtreatment", replace    

use "/Users/yanyuma/Documents/Stata/data_LA building_0329/WTP_PCtreatment.dta", clear
summarize mtax BS2 BS3 ES2 ES3

merge 1:1 ID using "$path/rawdata_building.dta"
keep if _merge == 3

gen wtp_BS2 = BS2/mtax
gen wtp_BS3 = BS3/mtax
gen wtp_ES2 = ES2/mtax 
gen wtp_ES3 = ES3/mtax 

summarize wtp*





