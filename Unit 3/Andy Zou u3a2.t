%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
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
    posx := Rand.Int(1,639)
    posy := Rand.Int(1,399)
    faceRadius := Rand.Int(1,50)
    faceColour := Rand.Int(1,255)
    if posx+faceRadius < 639 and posy+faceRadius < 399 and posx+faceRadius > 75 and posy+faceRadius > 90 then
    happyFace (posx, posy, faceRadius, faceColour)
    end if
    delay (100)
end loop
