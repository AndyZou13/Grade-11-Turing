%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

var num : real :=-17.2
var counter : int :=0
var num1 : real :=4
var counter1 : int :=0
var num2 : real :=-17
var jump : real :=-14
var num3 : real :=3
var jump1: real :=-6

%%%%%% MAIN CODE %%%%%%
put num
loop 
   num += 3.7
   counter +=1
   put num
exit when counter = 7
end loop

put repeat("*", 50)

put num1
for : 1..8
    num1 *=-1.5
    put num1
end for

put repeat("*", 50)

for : -14..49 by 3
num2 += jump
jump += 3
end for
put num2

put repeat("*", 50)

loop
num3 += jump1
jump1 *= -2
exit when jump1 = 196608
end loop
put num3
