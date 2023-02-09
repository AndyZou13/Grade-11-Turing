var stream1 : int
var stream2 : int
var str : string
var str2 : string
var str3 : real
var name : flexible array 1 .. 0 of int
var hard, soft : flexible array 1 .. 0 of real
var num : int

function findEmployee (n : int) : int
    for i : 1 .. upper (name)
	if n = name (i) then
	    result i
	end if
    end for
    result upper (name) + 1
end findEmployee

proc newone (n : int)
    if findEmployee (n) = upper (name) + 1 then
	new name, upper (name) + 1
	name (upper (name)) := n
	num := upper (name)
	new hard, upper (hard) + 1
	hard (upper (hard)) := 0
	new soft, upper (soft) + 1
	soft (upper (soft)) := 0
	num := findEmployee (n)
    else
	num := findEmployee (n)
    end if

end newone

open : stream1, "2050_sales_summary.txt", get
open : stream2, "2053_employee_bonus.txt", put

get : stream1, str : *, str
put : stream2, "Employee Name" : 20, "Software Sales" : 20, "Hardware Sales" : 20, "Bonus Amount"
put : stream2, repeat ("*", 150)
loop
    get : stream1, str, str2, str3
    newone (strint (str))
    if str2 = "Hardware" then
	hard (num) += str3
    elsif str2 = "Software" then
	soft (num) += str3
    end if
    exit when eof (stream1)
end loop
for i : 1 .. upper (name)
    put : stream2, intstr (name (i)) : 13, soft (i) : 20, hard (i) : 20, soft (i) * .01 + hard (i) * .02 : 18 : 2
end for
