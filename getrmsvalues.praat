dir$="/Users/Mohinish/Desktop/AudioStimuli/"
Create Strings as file list... list 'dir$'*.wav
numfiles = Get number of strings
filedelete MBrms

for ifile to numfiles
	select Strings list
	fname$ = Get string... ifile
	Read from file... 'dir$''fname$'
	soundid'ifile'=selected("Sound")
	rms'ifile'=Get root-mean-square... 0 0
	rmsx=rms'ifile'
	printline rms'ifile' 'rmsx'
	fileappend italjaprms 'soundid' rms is 'rmsx'
endfor
