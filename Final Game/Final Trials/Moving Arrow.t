var x1 : int := 70
var x2 : int := 115
var x3 : int := 185
var y1 : int := 70
var y2 : int := 115
var y3 : int := 85
type arrow :
    record
	x : array 1 .. 8 of int
	y : array 1 .. 8 of int
    end record
    
%LEFT ARROW
var LeftArrow : arrow
proc reset ()
    x1 := 70
    x2 := 115
    x3 := 185
    y1 := 70
    y2 := 115
    y3 := 85
end reset
proc redrawLeft ()
    LeftArrow.x (1) := x1
    LeftArrow.x (2) := x2
    LeftArrow.x (3) := x2
    LeftArrow.x (4) := x3
    LeftArrow.x (5) := x3
    LeftArrow.x (6) := x2
    LeftArrow.x (7) := x2
    LeftArrow.x (8) := x1

    LeftArrow.y (1) := y1
    LeftArrow.y (2) := y2
    LeftArrow.y (3) := y3
    LeftArrow.y (4) := y3
    LeftArrow.y (5) := y3 - 30
    LeftArrow.y (6) := y3 - 30
    LeftArrow.y (7) := y2 - 90
    LeftArrow.y (8) := y1
    Draw.FillPolygon (LeftArrow.x, LeftArrow.y, 8, purple)
end redrawLeft

proc leftup ()
    y1 += 2
    y2 += 2
    y3 += 2
end leftup

Draw.FillPolygon (LeftArrow.x, LeftArrow.y, 8, purple)
process Background
    loop
	Music.PlayFile("Ark.mp3")
    end loop
end Background
fork Background
loop
    cls
    redrawLeft ()
    View.Update
    leftup ()
    delay (5)
    if LeftArrow.y (4) > 450 then
	reset ()
    end if
end loop

