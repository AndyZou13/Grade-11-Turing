setscreen("graphics:640,400")
var x : int := 640
var h : int := 110
Draw.FillBox (10,10,h,20,green)
Draw.Box (x,200,x + 10,210,black)

loop
cls
x -= 10
if x < -10 then
    x := 640
    h -= 10
end if
Draw.FillBox (10,10,h,20,green)
Draw.Box (x,200,x + 10,210,black)
delay (100)
end loop
