var ua : array char of boolean
var counter : int := 0
loop
Input.KeyDown(ua)
if ua('x') then
    counter += 1
    put counter
end if
end loop


