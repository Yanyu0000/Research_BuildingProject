********* DATA CLEAN FOR NLOGIT *********
********* RESIDENTIAL PUBLIC OFFICE *********

* Define relative path 
global path "/Users/yanyuma/Documents/Stata/data_LA building_final"    
import excel "$path/raw data-final.xlsx", firstrow clear
drop uuid vbrowserr15oe-csid
gen ID = _n                 // total 603

* Keep Los Angeles Only
drop if S10 == 1            // S10 Live in LA: control group 255; treatment group 263; total 518  

* Keep vaild answer: For Residential building 
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

* Keep vaild answer: For Public building 
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
tab AssignBlock  // total 480
count if randomR == 1  //  235 for control 
count if randomR == 2  //  245 for treatment 

* Keep vaild answer: For Office building 
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
tab AssignBlock  // total 466
count if randomR == 1  //   227 for control 
count if randomR == 2  //   239 for treatment 

save "$path/Nlogit clean data for three building.dta",replace 

******************** for part A: Residentaial building ********************
use "$path/Nlogit clean data for three building.dta", clear
drop Block*PB* Block*PC*

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

save "$path/Nlogit data clean residential building.dta",replace 
export delimited "$path/Nlogit data clean residential building.csv",replace 











******************** for part B: Public Residentaial building ********************
use "$path/Nlogit clean data for three building.dta", clear
drop Block*PA* Block*PC*

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
gen option1 = (Alterid == 1)
gen option2 = (Alterid == 2)
gen option3 = (Alterid == 3)
order Alterid option1 option2 option3, after(PB_Scenario)
order S1-S13, after(PB)

gen Choice=.
replace Choice=1 if Alterid == PB
replace Choice=0 if Choice == .
order Choice, after(Alterid)

* generate Public building annual tax above current 
** Block 1
gen tax = 1         if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 2
replace tax = 1.001 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 2) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 2) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 2) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 3
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 3) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 3) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 4
replace tax = 1     if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 4) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 4) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 4) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 4) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 5
replace tax = 1.001 if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 5) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 5) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 5) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 5) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 6
replace tax = 1.002 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 6) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 6) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 6) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 6) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 7
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 7) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 7) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 7) &  (PB_Scenario == 9) & (Alterid == 2)

** Block 8
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 8) &  (PB_Scenario == 1) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 2) & (Alterid == 2)
replace tax = 1.001 if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 1)
replace tax = 1     if (AssignBlock == 8) &  (PB_Scenario == 3) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 8) &  (PB_Scenario == 4) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 8) &  (PB_Scenario == 5) & (Alterid == 2)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 1)
replace tax = 1.001 if (AssignBlock == 8) &  (PB_Scenario == 6) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 7) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 8) & (Alterid == 2)
replace tax = 1     if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 1)
replace tax = 1.002 if (AssignBlock == 8) &  (PB_Scenario == 9) & (Alterid == 2)

replace tax = 0 if tax == .

* generate building surviving situation.  BS1 = not life-safe(base); BS2 = life-safe;  BS3 = immediately occupied.
gen BS2=-1
gen BS3=-1

** Block 1
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 6) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 7) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 8) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 9) & (Alterid == 1)

** Block 2
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 2) &  (PB_Scenario == 2) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 2) &  (PB_Scenario == 3) & (Alterid == 2)
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
replace BS2 = 1 if (AssignBlock == 4) &  (PB_Scenario == 1) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 4) &  (PB_Scenario == 2) & (Alterid == 1)
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
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 1)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace BS2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 1)
replace BS3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 2)
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

replace BS2 = 0 if Alterid == 3 
replace BS3 = 0 if Alterid == 3 

* generate Energy-saving situation.  ES1 = no saving(base); ES2 = 10% saving;  ES3 = 20% saving .
gen ES2=-1
gen ES3=-1

** Block 1
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 1) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 1) &  (PB_Scenario == 3) & (Alterid == 2)
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
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 2) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 3) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 4) & (Alterid == 2)
replace ES2 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 1)
replace ES3 = 1 if (AssignBlock == 7) &  (PB_Scenario == 5) & (Alterid == 2)
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

replace ES2 = 0 if Alterid == 3 
replace ES3 = 0 if Alterid == 3 

*gen opt-out
gen optout = 1 if Alterid == 3
replace optout = 0 if optout ==.
drop AssignBlock PB  CountABCr1 CountABCr2 CountABCr3
order ID randomR PB_Scenario Alterid Choice option1 option2 option3 tax - optout

save "$path/Nlogit data clean public building.dta",replace 
export delimited "$path/Nlogit data clean public building.csv", replace










******************** for part C: Office building ********************
use "$path/Nlogit clean data for three building.dta", clear
drop Block*PA* Block*PB*


******* drop if not work in office building ********
drop if Block1PCScreen == 2  // 
drop if Block2PCScreen == 2  // 
drop if Block3PCScreen == 2  // 
drop if Block4PCScreen == 2  // 
drop if Block5PCScreen == 2  //
drop if Block6PCScreen == 2  // 
drop if Block7PCScreen == 2  // 
drop if Block8PCScreen == 2  // 
tab AssignBlock  // total 310 
count if randomR == 1  // 151 for control 
count if randomR == 2  // 159 for treatment 
drop Block1PCScreen
drop Block2PCScreen
drop Block3PCScreen
drop Block4PCScreen
drop Block5PCScreen
drop Block6PCScreen
drop Block7PCScreen
drop Block8PCScreen
drop CountABCr1 CountABCr2 CountABCr3  

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

save "$path/Nlogit data clean office building.dta",replace 
export delimited "$path/Nlogit data clean office building.csv", replace



