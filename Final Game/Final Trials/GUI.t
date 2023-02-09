setscreen ("graphics:500:500")
Draw.FillBox (230, 95, 390, 155, purple)
Draw.FillBox (235, 100, 385, 150, blue)
var x : int 
var y : int
var dummy1: int
var dummy2: int
loop
Mouse.ButtonWait ("up", x, y, dummy1, dummy2)
if x <= 385 and x >= 235 and y <= 150 and y >= 100 then
    cls
end if
end loop
