form Adjust dB
	real Target_dB 70
	text outdir ~/Desktop/
endform

targetdb = target_dB

n=numberOfSelected("Sound")
for i to n
	snd'i' = selected("Sound",i)
endfor

for i to n
	select snd'i'
	ss$ = selected$("Sound",-1)
	outsnd$ = outdir$+ss$+".wav"
	Scale intensity... 'targetdb'
	Save as WAV file... 'outsnd$'
endfor