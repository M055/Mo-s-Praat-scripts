n=numberOfSelected("Sound")
for i to n
	snd'i'=selected("Sound",i)
endfor
outdir$ = "~/Desktop/"

for i to n
	select snd'i'	
	snd$=selected$("Sound")
	Save as WAV file... 'outdir$''snd$'.wav
endfor


printline Done!