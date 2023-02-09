%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%

var veginput : real
var veg : real
var meatinput : real
var meat : real
var fruitinput : real
var fruit : real
var fishinput: real
var fish : real
var totalbf : real
var n : real

%%%%% FUNCTIONS AND PROCEDURES %%%%%

function round2dp (num:real) : real
var o : real
o:= num*100
o := round(o)
o /= 100
result  o
end round2dp

function supermarket (var veg, meat, fruit, fish:real) : real
veg := veginput * 1.29
meat := meatinput * 2.49
fruit := fruitinput * 1.49
fish:= fishinput * 2.99
totalbf := veginput + meatinput + fruitinput + fishinput
result totalbf
end supermarket

%%%%% MAIN CODE %%%%%

put "How much veggie did you purchase?"
get veginput
put "How much meat did you purchase?"
get meatinput
put "How much fruit did you purchase?"
get fruitinput
put "How much fish did you purchase?"
get fishinput

n:=supermarket (veginput, meatinput, fruitinput, fishinput)
put "Your total before tax is $", round2dp (n)..
put ". Your total after tax is $", round2dp (n * 1.13)
