n=numberOfSelected("Sound")
printline start
for i from 1 to n
snd'i'=selected("Sound",i)

endfor

for i from 1 to n
currsnd=snd'i'
select 'currsnd'
currsndname$=selected$("Sound")
dur=Get total duration
printline 'currsndname$' 'dur'
endfor
