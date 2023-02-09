%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

var name : string
var hours : int

%%%%%% MAIN CODE %%%%%%
put "Please identify yourself: "
get name

put "Number of hours worked: "
get hours

if name = "Alice" then
put "Total earnings: $", 13.52 * hours
end if

if name = "Bob" then
put "Total earnings: $", 14.96 * hours
end if

if name = "Caroline" then
put "Total earnings: $", 15.14 * hours
end if

if name = "David" then
put "Total earnings: $", 16.17 * hours
end if
 
