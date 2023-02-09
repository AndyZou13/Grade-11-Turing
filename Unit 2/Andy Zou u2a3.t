%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

var posx : int := 320
var posy : int := 200
var dx : int := 0
var dy : int := 0
var direction : int :=Rand.Int(1,4)

%%%%%% MAIN CODE %%%%%%
loop
if direction = 1 then
dx := 2
elsif direction = 2 then
dx := -2
elsif direction = 3 then
dy := 2
elsif direction = 4 then
dy := -2
end if

posx += dx
posy += dy
Draw.Box (30, 30, 610, 370, black)
Draw.FillOval(posx, posy, 40, 40, red)
delay(10)
cls
if posx < 70 or posx > 570 or posy < 70 or posy > 330 then
dx *=-1
dy *=-1
for : 1..20
posx += dx
posy += dy
Draw.Box (30, 30, 610, 370, black)
Draw.FillOval(posx, posy, 40, 40, red)
delay(10)
cls
end for
dx := 0
dy := 0
direction := Rand.Int(1,4)
end if
end loop
