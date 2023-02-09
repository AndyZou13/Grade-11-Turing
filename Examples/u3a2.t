%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec :
% First Name :
% Last Name  :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%
var posx : int
var posy : int
var faceRadius : int
var faceColour : int

%%%%% PROCEDURES %%%%%

% happyFace procedure %
procedure happyFace (x, y, r, c : int)
    var r3 : int := round(r/3)
    var r6 : int := round(r/6)
    var r3_4 :int := round(r/4 * 3)
    Draw.Oval(x + r3, y + r3, r6, r6, c)
    Draw.Oval(x - r3, y + r3, r6, r6, c)
    Draw.Oval(x, y, r, r, c)
    Draw.Arc(x, y, r3_4, r3_4, 180, 360, c)
end happyFace

%%%%% MAIN CODE %%%%%
loop
    posx := Rand.Int(50,590)
    posy := Rand.Int(50,350)
    faceRadius := Rand.Int(1,50)
    faceColour := Rand.Int(1,255)
    happyFace (posx, posy, faceRadius, faceColour)
    delay (5)
end loop
