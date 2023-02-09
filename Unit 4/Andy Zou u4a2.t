%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%

var stream : int
var stream2 : int
var str : string
var str2 : string
var str3 : string

%%%%% FUNCTIONS AND PROCEDURES %%%%%

function fruit (var f : string): string
if f = "B" then
result "Banana"
elsif f = "F" then
result "Any Fruit"
elsif f = "C" then
result "Cherries"
elsif f = "P" then
result "Pear"
end if
end fruit

function daymonth (var d : string): string
var l : string := ""
var n : string := ""
var w : string := ""
l := d(1..2)
n := d(3..4)
if l = "01" then
l := "Jan"
elsif l = "02" then
l := "Feb"
elsif l = "03" then
l := "Mar"
elsif l = "04" then
l := "Apr"
elsif l = "05" then
l := "May"
elsif l = "06" then
l := "Jun"
elsif l = "07" then
l := "Jul"
elsif l = "08" then
l := "Aug"
elsif l = "09" then
l := "Sep"
elsif l = "10" then
l := "Oct"
elsif l = "11" then
l := "Nov"
elsif l = "12" then
l := "Dec"
end if
w := n + " of " + l
result w
end daymonth

%%%%% MAIN CODE %%%%%
open : stream, "student_info.txt", get
open : stream2, "student_info2.txt", put

put : stream2, "Name" : 20 , "Date of Birth" : 25 , "Favourite Fruit"
put : stream2, repeat("*",80)

loop
get : stream, str, str2, str3
put : stream2, str : 20 , daymonth(str2) : 25 , fruit(str3)
exit when eof(stream)
end loop
