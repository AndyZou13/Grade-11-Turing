%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec : 05 
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%

var stream : int 
var stream2 : int
var str : string 
var str2 : string
var str3 : string
var money : real
var z1 : real := 0
var her1 : real := 0
var pos1 : real := 0
var de1 : real := 0
var hermes1 : real := 0
var z2 : real := 0
var her2 : real := 0
var pos2 : real := 0
var de2 : real := 0
var hermes2 : real := 0
var bonus1 : real := 0
var bonus2 : real := 0
var bonus3 : real := 0
var bonus4 : real := 0
var bonus5 : real := 0

%%%%% MAIN CODE %%%%%
open : stream, "2017_sales_summary.txt", get
open : stream2, "2017_employee_bonus.txt", put
get : stream, str :*
get : stream, str :*
put : stream2, "Employee Name" : 25 , "Software Sales" : 25 , "Hardware Sales" : 25 , "Bonus Amount"
put : stream2, repeat("*",100)

loop
get : stream, str, str2, str3
money := strreal(str3)
if str = "Zeus" then
if str2 = "Hardware" then
z1 += money
elsif str2 = "Software" then
z2 += money
end if
end if

if str = "Hera" then
if str2 = "Hardware" then
her1 += money
elsif str2 = "Software" then
her2 += money
end if
end if

if str = "Poseidon" then
if str2 = "Hardware" then
pos1 += money
elsif str2 = "Software" then
pos2 += money
end if
end if

if str = "Hermes" then
if str2 = "Hardware" then
hermes1 += money
elsif str2 = "Software" then
hermes2 += money
end if
end if

if str = "Demeter" then
if str2 = "Hardware" then
de1 += money
elsif str2 = "Software" then
de2 += money
end if
end if

exit when eof(stream)
end loop

bonus1 := z2*0.01 + z1*0.02
put : stream2, "Zeus" : 10, z2 : 25 : 2, z1 : 25 : 2, bonus1 : 24 : 2
bonus2 := her2*0.01 + her1*0.02
put : stream2, "Hera" : 10, her2 : 25 : 2, her1 : 25 : 2, bonus2 : 24 : 2
bonus3 := pos2*0.01 + pos1*0.02
put : stream2, "Poseidon" : 10, pos2 : 25 : 2, pos1 : 25 : 2, bonus3 : 24 : 2
bonus4 := hermes2*0.01 + hermes1*0.02
put : stream2, "Hermes" : 10, hermes2 : 25 : 2, hermes1 : 25 : 2, bonus4 : 24 : 2
bonus5 := de2*0.01 + de1*0.02
put : stream2, "Demeter" : 10, de2 : 25 : 2, de1 : 25 : 2, bonus5 : 24 : 2
