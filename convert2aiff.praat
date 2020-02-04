
! ---------------------
! Read in all the files
! ---------------------
for i from 1 to n
snd'i'=selected("Sound",i)
endfor

! ---------------------
! Fix all durations
! ---------------------
for i from 1 to n
currsnd=snd'i'
select 'currsnd'
currsndname$=selected$("Sound")
dur=Get total duration
durfactor = finaldur/dur
Lengthen (overlap-add): 75, 600, 'durfactor'
Write to AIFF file... 'outdir$''currsndname$'.aiff
endfor


printline Done!
printline -------------
