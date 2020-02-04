form Insert Silences
	real Sampling_rate 16000
	real Silence_duration 0.04
	real Fade_duration 0.001
	comment (Sampling rate in Hz to match your file, Durations in seconds)
endform

# define sampling rate, silence duration (0.04sec) and the fade duration (0.001sec)
sildur = silence_duration
fadedur = fade_duration

# select sound, make a copy, and get some variables
origsound = selected("Sound", -1)
origsoundname$ = selected$("Sound",-1)
Copy: "'origsoundname$'INS"
mainsound = selected("Sound", -1)
mainsoundname$ = selected$("Sound",-1)
delx = Get sampling period
snddur = Get end time
minus mainsound


# create the silence clip
Create Sound as pure tone: "tone", 1, 0, 'sildur', 'sampling_rate', 1, 0.2, 0.01, 0.01
silclip = selected("Sound",-1)
Edit
editor: " Sound tone"
Select: 0, 'sildur'
Set selection to zero
Close
select silclip
Rename: "toney"
silclipname$ = selected$("Sound")
Edit
endeditor

# get number of clips to modify:
numclips = floor(snddur/sildur)-1


# fire up the editor
select mainsound
Edit
endeditor


for clippy from 1 to numclips

	currtime1 = ((clippy-1)*sildur) + ((clippy-1)*sildur)
	currtime2 = currtime1+sildur

	editor: " Sound 'mainsoundname$'"
	Select: 'currtime1', 'currtime2'

	# Window this bit
	Extract selected sound (time from 0)
	endeditor

	# go and fade clip
	clip = selected("Sound",-1)
	clip$ = selected$("Sound")
	cliplen=Get total duration
	fadept = cliplen-fadedur
	#printline fade end point: 'fadept'  fade dur: 'fadedur'
	Fade in: 0, 0, 'fadedur', "yes"
	Fade out: 0, 'fadept', 'fadedur', "yes"
	Edit
	endeditor

	# Go back and cut the current selection
	editor: " Sound 'mainsoundname$'"
	Cut

	# Copy clip and paste in orig
	editor: " Sound 'clip$'"
	Select: 0, 'cliplen'
	Copy selection to Sound clipboard
	Close

	select clip
	Remove

	editor: " Sound 'mainsoundname$'"
	Paste after selection
	endeditor

	# Insert silence after
	editor: "Sound 'silclipname$'"
	Select: 0, 'sildur'
	Copy selection to Sound clipboard
	endeditor

	editor: " Sound 'mainsoundname$'"
	Paste after selection


endfor
editor: " Sound 'mainsoundname$'"
Close
editor: "Sound 'silclipname$'"
Close
select silclip
Remove

