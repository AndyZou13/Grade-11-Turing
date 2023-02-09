var u : array char of boolean
var y : int := 50
var x2 : int := 700
var x : int := 100
var y2 : int := 50
loop
    Draw.Box (x, y, x + 15, y + 15, black)
    Draw.Box (x2, y2, x2 + 10, y2 + 10, black)
    Draw.Line (0, 50, 640, 50, black)
    Input.KeyDown (u) 
    if u (KEY_UP_ARROW) then 
	for i : 1 .. 25
	    y += 2
	    delay (10)
	    cls
	    Draw.Box (x, y, x + 15, y + 15, black)
	    Draw.Box (x2, y2, x2 + 10, y2 + 10, black)
	    Draw.Line (0, 50, 640, 50, black)
	    x2 -= 1
	end for
	for i : 1 .. 25
	    y -= 2
	    delay (10)
	    cls
	    Draw.Box (x, y, x + 15, y + 15, black)
	    Draw.Box (x2, y2, x2 + 10, y2 + 10, black)
	    Draw.Line (0, 50, 640, 50, black)
	    x2 -= 1
	end for
    end if
    if y < 50 then
	y := 50
    end if
    x2 -= 1
    if x2 < -15 then
    x2 := 640
    end if
    delay (10)
    exit when x = x2 or x + 15 = x2 or x = x2 + 15 or y = y2 + 10 or y + 10 = y2 
    cls
end loop
