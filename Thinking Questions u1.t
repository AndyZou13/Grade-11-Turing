var num : int 
var counter : int := 1

put "Enter a positive integer"
get num

for i :1..num
put repeat ("*", counter)
counter += 1
end for


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var num1 : int
var counter1 : int := 0

put "Enter a positive integer"
get num1

for i1:1..num1
counter1 += 1
put repeat ("*", counter1)
if counter1 = num1 then
for :1..num1
counter1 -= 1
put repeat ("*", counter1)
end for
end if
end for


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var num2 : int
var counter2 : int := 11
var math : int := 100
var disp : int := 1

put "Enter a positive integer"
get num2

for i2 : 1..num2
put repeat(intstr(disp),1)
disp += counter2
counter2 += math
math *= 10
end for


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var num3 : int
var counter3 : real := 1
var n : real

put "Enter a positive integer"
get num3

for i3 : 1..num3
n:= sqrt(num3)
counter3 +=1
if counter3 = n then
put num3, " is a perfect square."
exit
end if
end for
if counter3 ~= n then
put num3, " is not a perfect square."
end if


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var num4 : int
var n2 : real

put "Enter a positive integer"
get num4

if num4 = 1 then
put num4, " is neither prime nor composite."
end if

for i4:2..num4-1
n2 := num4 mod i4
if n2 > 0 then
put num4, " is a prime number."
exit
elsif n2 = 0 then
put num4, " is a composite number."
exit
end if
end for
