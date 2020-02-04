n = numberOfSelected("Sound")
for i to n
	snd'i'=selected("Sound",i)
endfor

printline Sound durations---
for i to n
	select snd'i'
	sndname$=selected$("Sound")
	dur = Get total duration
	printline 'sndname$','dur'
endfor

printline Sound intensities (dB)---
for i to n
	select snd'i'
	sndname$=selected$("Sound")
	db = Get intensity (dB)
	printline 'sndname$','db'
endfor

printline Sound pitch means (Hz)---
for i to n
	select snd'i'
	sndname$=selected$("Sound")
	To Pitch (ac): 0, 75, 15, "yes", 0.03, 0.45, 0.01, 0.35, 0.14, 600
	meanpitch = Get mean: 0, 0, "Hertz"
	printline 'sndname$','meanpitch'
endfor