%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%TITLE: Hole in one
%Description: This animation shows a ball rolling into a hole and 
%             a hole in one text flies across the screen.

%%%%%% GLOBAL VARIABLES %%%%%%%

var posx : int :=500
var posy : int :=100
var sizex : int :=25
var sizey : int :=25
var wordx : int :=1020
var wordy : int :=900
var font : int
%%%%%% MAIN CODE %%%%%%
setscreen("graphics:1000;1000")
colourback(green)
font := Font.New ("Arial:18:bold")
loop
Draw.Oval(500, 500, 25, 25, black)
Draw.FillOval(500, 500, 25, 25, black)
Draw.Oval(posx, posy, sizex, sizey, red)
Draw.FillOval(posx, posy, sizex, sizey, red)
delay (80)
cls
posy +=10
if posx >= 500 and posy >= 500 then
posy := 500
sizex -=2
sizey -=2
Draw.Text("HOLE IN ONE!!!!", wordx, wordy, font, red)
wordx -=10
end if
if sizex <= 0 and sizey <= 0 then
sizex := 0
sizey := 0
end if
if wordx = -210 then
wordx :=1020
end if
end loop
