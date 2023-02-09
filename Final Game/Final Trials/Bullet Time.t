setscreen ("graphics:640:400")

var x : int := 640
var y := Rand.Int(5,350)
var x2 : int := 0
loop
    cls
    x -= 2
    x2 += 2
    if x < -10 then
	x := 640
    end if
    Draw.Box (x, y, x + 10, y + 10, black)
    Draw.FillBox (x2, y, x2 + 5, y + 5, blue)
    if x2 + 5 >= x then
	exit
    end if
    delay (10)
end loop
