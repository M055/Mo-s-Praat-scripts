form Set output directory	
	text outdir /Users/yourshortname/Desktop/
endform

n=numberOfSelected("Sound")


! ---------------------
! Read in all the files
! ---------------------
for i from 1 to n
snd'i'=selected("Sound",i)
endfor

! ---------------------
! Write to aiff
! ---------------------
for i from 1 to n
currsnd=snd'i'
select 'currsnd'
currsndname$=selected$("Sound")
Write to AIFF file... 'outdir$''currsndname$'.aiff
endfor


printline Done!
printline -------------
