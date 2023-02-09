var x : int := 200
var y : int := 200
var r : int := 120
var speed : int := 1
var ui : array char of boolean
setscreen("graphics:1000;800")
proc fish (x: int, y: int, r : int)
Draw.FillOval(x, y, r, r div 2, black)
Draw.FillOval(x + 60, y, r div 24, r div 24, white)
Draw.Line(x - 190, y - 50, x - 190, y + 50, black)
Draw.Line(x - 190, y - 50, x - 120, y, black)
Draw.Line(x- 190, y + 50, x - 120, y, black)
end fish

loop
fish(x, y, r)
Input.KeyDown(ui)
if ui(KEY_UP_ARROW) then
cls
y += 3
fish(x, y, r)
end if

if ui(KEY_LEFT_ARROW) then
cls
x -= 3
fish(x, y, r)
end if

if ui(KEY_RIGHT_ARROW) then
cls
x += 3
fish(x, y, r)
end if
if ui(KEY_DOWN_ARROW) then
cls
y -= 3
fish(x, y, r)
end if
if ui(KEY_HOME) then
cls
x := 200
y := 200
r := 120
fish(x, y, r)
end if
delay(10)
end loop
