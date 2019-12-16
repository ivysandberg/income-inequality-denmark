// Data: Using wage/salary data = average annual salary
 
// College/HS Log Wage Ratio (Compare to Figure 1 in AA)
import excel /Users/ivysandberg/Desktop/Denmark/AvgSalary_byEducation.xlsx, firstrow
gen Year = real(YEAR)

* Wage premium to a Bachelor's Deg
gen colprem = BACHELOR/UPPER_SECONDARY
gen lcolprem = log(colprem)

* Figure 2a Bachelor premium relative to upper secondary
scatter lcolprem Year, c(l) xlabel(2004(3)2019, labsize(small)) legend(region(lstyle(none))) ytitle("Log Salary Gap", size(medium)) ti("Denmark Bachelor/UpSecondary Log Income Ratio (ann salary), 2004-2018", size(medium)) legend(size(small)) saving("fig1-clp-hsg-gap.gph", replace)

* Wage premium to Post-Grad
gen post_colprem = LONGCYCLEHIGHERED/UPPER_SECONDARY
gen lpost_colprem = log(post_colprem)

* Figure 2b Graduate premium relative to upper secondary
scatter lpost_colprem Year, c(l) xlabel(2004(3)2019, labsize(small)) legend(region(lstyle(none))) ytitle("Log Salary Gap") ti("Denmark PostGrad/UpSecondary Income Ratio (ann salary), 2004-2018", size(medium)) legend(size(small)) saving("fig2-clp-hsg-gap.gph", replace)


// Bachelor/Vocational Log Wage Ratio
gen colprem_vocational = BACHELOR/VOCATIONAL
gen lcolprem_vocational = log(colprem_vocational)

* Figure 3a Bachelor premium relative to vocational
scatter lcolprem_vocational Year, c(l) xlabel(2004(3)2019, labsize(small)) legend(region(lstyle(none))) ytitle("Log Salary Gap") ti("Denmark Bachelor/Vocational Income Ratio (annual salary), 2004-2018", size(medium)) legend(size(small)) saving("fig3-clp-hsg-gap.gph", replace)


// HigherEd/Vocational Ratio
gen post_vocational = LONGCYCLEHIGHERED/VOCATIONAL
gen lpost_vocational = log(post_vocational)

* Figure 3b Graduate premium relative to vocational 
scatter lpost_vocational Year, c(l) xlabel(2004(3)2019, labsize(small)) legend(region(lstyle(none))) ytitle("Log Salary Gap") ti("Denmark PostGrad/Vocational Income Ratio (annual salary), 2004-2018", size(medium)) legend(size(small)) saving("fig3-clp-hsg-gap.gph", replace)


clear

// College/high-school relative supply (Compare to Fig 2 in AA)
import excel /Users/ivysandberg/Desktop/Denmark/NumberPeople_EduGroup.xlsx, firstrow

gen Year = real(YEAR)

gen colhs_relsupply = BACHELOR/UPPER_SECONDARY
gen lcolhs_relsupply = log(colhs_relsupply)

* Figure 5 Bachelor supply relative to upper secondary  
scatter lcolhs_relsupply Year, c(l) xlabel(2006(3)2019, labsize(small)) legend(region(lstyle(none))) ylab(.4(.1)1.2) ytitle("Log Relative Supply Index") ti("Denmark College/High-School Log Relative Supply, 2006-2019", size(medium)) saving("fig2-relative-supply-index-titled.gph",replace)

* use efficiency weights to account for productivity
gen efficient_bachsupply = BACHELOR*colprem
gen eff_colhs_relsupply = efficient_bachsupply/UPPER_SECONDARY
gen leff_colhs_relsupply = log(eff_colhs_relsupply)

* Figure 5 Bachelor supply relative to upper secondary with efficiency weights
scatter leff_colhs_relsupply Year, c(l) xlabel(2006(3)2019, labsize(small)) legend(region(lstyle(none))) ylab(.9(.1)1.2) ytitle("Log Relative Supply Index") ti("Denmark Bachelor/UpSecondary Relative Supply, 2006-2019", size(medium)) saving("fig2-relative-supply-index-titled.gph",replace)


* efficiency weights to account for vocational
gen efficient_vocsupply = BACHELOR*colprem_vocational
gen eff_vochs_relsupply = efficient_vocsupply/VOCATIONAL
gen leff_vochs_relsupply = log(eff_vochs_relsupply)

* Figure 6 Bachelor supply relative to vocational with efficiency weights  
scatter leff_vochs_relsupply Year, c(l) xlabel(2006(3)2019, labsize(small)) legend(region(lstyle(none))) ylab(-.8(.1)-.3) ytitle("Log Relative Supply Index") ti("Denmark Bachelor/Vocational Relative Supply, 2006-2019", size(medium)) saving("fig2-relative-supply-index-titled.gph",replace)

