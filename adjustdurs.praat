form Set output directory
	real Target_duration 0.25	
	text outdir ~/Desktop/
endform

targdur = target_duration

n = numberOfSelected("Sound")
for i to n
	snd'i'=selected("Sound",i)
endfor


for i to n
	select snd'i'
	dur = Get total duration
	dur = 'targdur' / 'dur'
	select snd'i'
	Lengthen (overlap-add): 75, 600, 'dur'
	ss$ = selected$("Sound",-1)
	outsnd$ = outdir$+ss$+".wav"
	Save as WAV file... 'outsnd$'
endfor


