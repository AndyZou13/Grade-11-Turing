%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

import Dice in "E:/CompSci Assignments/classes/dice.cla"
var d1 : ^Dice
var d2 : ^Dice
var d3 : ^Dice
var d4 : ^Dice
var d5 : ^Dice
var d6 : ^Dice
var n1 : int 
var n2 : int 
var n3 : int 
var n4 : int 
var n5 : int
var n6 : int
var nt : int
var na : real
var bn : int :=0
var sn : int :=7
var input : string(1)

%%%%%% MAIN CODE %%%%%%
loop
cls
bn := 0
sn := 7
new d1
^d1.setSize(50)
^d1.setCentre(70,80)
^d1.roll()
^d1.draw
n1 :=^d1.getNumber
if bn < n1 then
bn := n1
end if
if sn > n1 then
sn := n1
end if
Draw.Text("1", 67, 120, defFontID, black)
Draw.Text(intstr(n1), 67, 35, defFontID, black)
new d2
^d2.setSize(50)
^d2.setCentre(170,80)
^d2.roll()
^d2.draw
n2 :=^d2.getNumber
if bn < n2 then
bn := n2
end if
if sn > n2 then
sn := n2
end if
Draw.Text("2", 167, 120, defFontID, black)
Draw.Text(intstr(n2), 167, 35, defFontID, black)
new d3
^d3.setSize(50)
^d3.setCentre(270,80)
^d3.roll()
^d3.draw
n3 :=^d3.getNumber
if bn < n3 then
bn := n3
end if
if sn > n3 then
sn := n3
end if
Draw.Text("3", 267, 120, defFontID, black)
Draw.Text(intstr(n3), 267, 35, defFontID, black)
new d4
^d4.setSize(50)
^d4.setCentre(370,80)
^d4.roll()
^d4.draw
n4 :=^d4.getNumber
if bn < n4 then
bn := n4
end if
if sn > n4 then
sn := n4
end if
Draw.Text("4", 367, 120, defFontID, black)
Draw.Text(intstr(n4), 367, 35, defFontID, black)
new d5
^d5.setSize(50)
^d5.setCentre(470,80)
^d5.roll()
^d5.draw
n5 :=^d5.getNumber
if bn < n5 then
bn := n5
end if
if sn > n5 then
sn := n5
end if
Draw.Text("5", 467, 120, defFontID, black)
Draw.Text(intstr(n5), 467, 35, defFontID, black)
new d6
^d6.setSize(50)
^d6.setCentre(570,80)
^d6.roll()
^d6.draw
n6 :=^d6.getNumber
if bn < n6 then
bn := n6
end if
if sn > n6 then
sn := n6
end if
Draw.Text("6", 567, 120, defFontID, black)
Draw.Text(intstr(n6), 567, 35, defFontID, black)
nt := n1 + n2 + n3 + n4 + n5 + n6
na := (n1 + n2 + n3 + n4 + n5 + n6)/6
locatexy (240, 375)
put "Press q or Q to exit"
locatexy (230, 355)
put "Press any key to reroll"
locatexy (150, 300)
put "The sum of the 6 dice for this roll: "
locatexy (500, 300)
put nt : 3 : 1
locatexy (150, 285)
put "The average of the 6 dice for the roll: "
locatexy (500, 285)
put na : 3 : 1
locatexy (150, 270)
put "The largest number of the 6 dice rolled: "
locatexy (500, 270)
put bn : 3 : 1
locatexy (150, 255)
put "The smallest number of the 6 dice rolled: "
locatexy (500, 255)
put sn : 3 : 1
getch(input)
exit when input = "q" or input = "Q"
end loop
