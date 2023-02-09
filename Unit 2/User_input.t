var posx : int := 320
var posy : int := 200
var user_input : array char of boolean % The variable that stores user inputs
loop
Draw.FillOval(posx, posy, 50, 50, red) % Draws Object
Input.KeyDown(user_input) % Gets User Input
if user_input(KEY_UP_ARROW) then % Updates Position based on user input
posy += 2
end if
if user_input(KEY_RIGHT_ARROW) then
posx += 2
end if
if user_input(KEY_DOWN_ARROW) then
posy -= 2
end if
if user_input(KEY_LEFT_ARROW) then
posx -= 2
end if
delay(10) % Delays the Program
cls % Erases Object
end loop
