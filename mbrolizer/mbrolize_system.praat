! 	comment Script to convert sound + textgrid with phonemes to MBROLA
!	comment ---------------------------------------------------------
!	comment The appropriate TextGrid tier contains the phonemes, MBROLA style
!	comment NOTES:
!	comment  >Label the phonemes according to the MBROLA database
!	comment  >Empty "phonemes" are replaced by a "_" (pause)
!	comment  >MBROLA does not like underscore in names...
!	comment  
!	comment ADD TO YOUR MENU:
!	comment  >Open script in PRAAT
!	comment  >Add to Dynamic menu: 
!	comment		Class 1: Sound; Class 2: TextGrid; Command: MBROLIZE
!	comment  >Now when you select a sound and a textgrid, the script is available 
!	comment ________________________________________________
! 	comment questions/comments; mohinish.s@gmail.com

form Convert to MBROLA
	comment Script to convert a sound plus a TextGrid into MBROLA
	comment Read first few lines of script for help
 	choice Sex_of_speaker: 1
      button Male
      button Female
	natural Phoneme_tier 1
 	sentence Output_directory /Users/mohinish/Desktop/
	sentence Mbrola_Database /Applications/mbrola/en1/en1
endform

phonetier = phoneme_tier
dir$ = output_directory$
if sex_of_speaker = 1
   xlf = 60
   xmf = 300
   xmaxf = 5000
   xm=100
else
   xlf = 120
   xmf = 350
   xmaxf = 5500
   xm=200
endif

sndname$=selected$("Sound")
snd = selected("Sound")
tgd = selected("TextGrid")

outfile1$= (dir$ + sndname$ + "m.pho")
outfile$= (dir$ + "tempmbrola.pho")
clearinfo
printline Output file: 'outfile$'
filedelete 'outfile$'

select tgd
Extract tier... phonetier
dumvar1 = selected("IntervalTier")

Down to TableOfReal (any)
tor = selected("TableOfReal")
	
phonemes = Get number of rows
!** phonemes is the number of phonemes **

for i from 1 to 'phonemes'
	phstart'i' = Get value... 'i' 1
	phend'i' = Get value... 'i' 2
	phlen'i' = Get value... 'i' 3
endfor

!** This piece gets the pitch contour **
select snd
To Pitch (ac)... 0 'xlf' 15 no 0.03 0.45 0.01 0.35 0.14 'xmf'

dumvar2 = selected("Pitch")
!	Kill octave jumps
!	Interpolate
!	Smooth... 10

Down to PitchTier
pit = selected("PitchTier")
	
!** For all phonemes, get relevant part of pitch **
for i from 1 to 'phonemes'
	select tgd
	currphoneme$ = Get label of interval... phonetier 'i'
	llx = length(currphoneme$)
	if llx < 1
		currphoneme$ = "_"
	endif
	printline Current phoneme: 'currphoneme$'
	fileappend "'outfile$'" 'currphoneme$' 'tab$'

	dum = phlen'i'
	dum = round(dum*1000)
	fileappend "'outfile$'" 'dum' 'tab$'

	x1 = phstart'i'
	x2 = phend'i'
	x = x2 - x1
	xstep = x / 20
	select pit
	for ix from 1 to 20
		dum1 = ix * 5
		dum2 = x1 + (ix * xstep)
		dum3 = Get value at time... 'dum2'
		fileappend "'outfile$'" 'dum1' 'tab$' 'dum3' 'tab$'
	endfor
	fileappend "'outfile$'" 'newline$'
endfor
fileappend "'outfile$'" 'newline$'

system /Applications/mbrola/mbrola /Applications/mbrola/en1/en1 tempmbrola.pho xxxx.wav
system cd 'dir$'
system mkdir soundz
system mv tempmbrola.pho xxxx.pho

select dumvar1
plus tor
plus dumvar2
plus pit
Remove

