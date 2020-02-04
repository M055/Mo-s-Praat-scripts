directory$="/Users/Mohinish/Desktop/desktop_stuff/work/OT/ItaJapOTstims/wavsJapIt/Hi_Jap_files"
Create Strings as file list... list 'directory$'/*.wav
numberOfFiles = Get number of strings
meanRms=0
for ifile to numberOfFiles
   select Strings list
   fileName$ = Get string... ifile
   Read from file... 'directory$'/'fileName$'
   soundId'ifile' = selected ("Sound")
   rms'ifile' = Get root-mean-square... 0 0
   meanRms = meanRms + rms'ifile'
endfor

meanRms = meanRms/numberOfFiles

for ifile to numberOfFiles
   select Strings list
   fileName$ = Get string... ifile
   scalingFactor = meanRms/rms'ifile'
   tmp$ = left$(fileName$, index(fileName$, ".")-1)
   select Sound 'tmp$'
   Multiply... scalingFactor
   Write to WAV file... 'directory$'/scaled/'fileName$'
endfor