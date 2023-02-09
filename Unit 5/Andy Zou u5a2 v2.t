var stream1 : int
var stream2 : int
var str : string
var str2 : string
var str3 : string
var namearray : flexible array 1 .. 0 of int
var hardarray : flexible array 1 .. 0 of real
var softarray : flexible array 1 .. 0 of real
var num : int
var newname : string
var newhard : string
var newsoft : string

proc findName (n : int)
    if upper (namearray) = 0 then
	new namearray, 1
	namearray (1) := n
	newname := intstr (namearray (1))
	return
    end if
    for i : 1 .. upper (namearray)
	if n = namearray (i) then
	    num := i
	    return
	end if
    end for
    if namearray (num) ~= n then
	new namearray, upper (namearray) + 1
	namearray (upper (namearray)) := n
	num := upper (namearray)
	newname := intstr (namearray (num))
	return
    end if
end findName


proc hardwareSales (n : real)
    if upper (hardarray) = 0 then
	new hardarray, 1
	hardarray (1) := n
	newhard := realstr (hardarray (1), 2)
	return
    end if
    for i : 1 .. upper (hardarray)
	if i = num then
	    hardarray (num) += n
	    return
	end if
    end for
    new hardarray, upper (hardarray) + 1
    hardarray (upper (hardarray)) := n
    newhard := realstr (hardarray (num), 2)
    return
end hardwareSales

proc softwareSales (n : real)
    if upper (softarray) = 0 then
	new softarray, 1
	softarray (1) := n
	newsoft := realstr (softarray (num), 2)
	return
    end if
    for i : 1 .. upper (softarray)
	if i = num then
	    softarray (num) += n
	    return
	end if
    end for
    new softarray, upper (softarray) + 1
    softarray (upper (softarray)) := n
    newsoft := realstr (softarray (num), 2)
    return
end softwareSales

open : stream1, "2050_sales_summary.txt", get
open : stream2, "2051_employee_bonus.txt", put

get : stream1, str : *, str

loop
    get : stream1, str, str2, str3
    findName (strint (str))
    if str2 = "Hardware" then
	hardwareSales (strreal (str3))
    elsif str2 = "Software" then
	softwareSales (strreal (str3))
    end if
    put : stream2, newname, newhard, newsoft
    exit when eof (stream1)
end loop


