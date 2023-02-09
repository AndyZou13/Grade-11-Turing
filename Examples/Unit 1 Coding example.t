loop
var dmins : real
var nmins : real
var gb : real

put "How many day time minutes did you use?"
get dmins
put "How many night time minutes did you use?"
get nmins
put "How many gigabytes (GB) of data did you use?" 
get gb

dmins := dmins * 0.05
nmins := nmins * 0.02
gb := gb * 3.25

put "You will be charged $", dmins + nmins + gb
put ""
put repeat ("*", 50)
put ""
end loop
