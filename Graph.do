	
	cd "C:\Users\CERP\Dropbox\Graphs for FUN\Auto Data\Mean repair (Bubble Graph)"
	clear all
	set more off
	mat drop _all
	pause off
	
	sysuse auto
	tab make 
	egen num_make= seq() 
	labmask num_make, val(make)
	drop make
	ren num_make make
	order make, first
	
	
	collapse (mean) price mpg rep78, by(make)

	#delimit ;
	
	twoway 	(scatter 	make price [aweight=rep78], 
						mfcolor(forest_green%50)
						xlabel(3500(2000)16500) 
						yscale(range(0 73))),
						ylabel(1(1)73, valuelabel angle(0) labsize(1))
						title("Average Price by Model" , size(3) color(black) pos(11) box)						
						subtitle("Size of the bubble represents mean level of repair", size(2) color(gray) pos(11))
						ytitle("")
						xtitle("Average Price")
						note("Note: This graph has been created using auto dataset in STATA", size(1))
						scheme(white_tableau)
	
	;
	#delimit cr
	graph export "Auto.png", as(png) width(1920) height(1240) replace
/*
(scatter    make mpg [aweight=rep78],
						mfcolor(navy)
						xlabel(9(1)18) 
						yscale(range(0 73)))
*/						