form Fader
 	choice Fade_what: 3
		button Fade In
		button Fade Out
		button Fade Both
	real Fade_in_duration 1
	real Fade_out_duration 1
	comment (Duration is in seconds)
endform

mainsound = selected("Sound", -1)
t = Get end time
# Get the point from end where want fadeout to start
x = 't'-'Fade_out_duration'

if 'fade_what' = 1  or 'fade_what' = 3
	Fade in: 0, 0, 'Fade_in_duration', "yes"	
endif

if 'fade_what' = 2  or 'fade_what' = 3
	Fade out: 0, 'x', 'Fade_out_duration', "yes"
endif

