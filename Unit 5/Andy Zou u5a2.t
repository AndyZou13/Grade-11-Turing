var stream1 : int
var stream2 : int
var str : string
var str2 : string
var str3 : string
var name : flexible array 1 .. 0 of int
var hardSales : flexible array 1 .. 0 of real
var softSales : flexible array 1 .. 0 of real
var num : int := 1

proc employee (n : int)
new name, num
name(num) := n
num += 1
end employee

open : stream1, "2050_sales_summary.txt", get
open : stream2, "2050_employee_bonus.txt", put

get : stream1, str:*, str

loop
get : stream1, str, str2, str3
employee(strint(str))
put : stream2, intstr(name(num))
exit when eof (stream1)
end loop
