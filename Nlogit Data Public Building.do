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


* Keep vaild answer: For Public building
use "$path/rawdata_LA.dta", clear
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
save "$path/Nlogit public building.dta",replace 


******************** for part B: Public Residentaial building ********************
use "$path/Nlogit public building.dta", clear
// drop if  randomR!= 2 //  =1 keep control group =2 treatment group 
tab AssignBlock  

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


save "$path/Nlogit public building.dta",replace 
export delimited "$path/Nlogit public building.csv", replace










