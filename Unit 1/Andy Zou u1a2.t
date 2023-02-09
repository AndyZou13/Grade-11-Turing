%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

var name : string
var minutes : int

%%%%%% MAIN CODE %%%%%%
put "Please Identify yourself:"
get name

put "Cell phone minutes used:"
get minutes

if name = "Ethan" and minutes <=300 then
    put "Amount Due: $30"
elsif name = "Ethan" and minutes >=301 then
    put "Amount Due: $", 30 + (minutes-300) * 0.1
end if

if name = "Fatima" and minutes <=400 then
    put "Amount Due: $40"
elsif name = "Fatima" and minutes >=401 then
    put "Amount Due: $", 40 + (minutes-400) * 0.35
end if
