%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%

var cornum : int :=649
var num : int
var counter : int :=10

%%%%%% MAIN CODE %%%%%%
put "Guess the secret number between 1 and 999"
get num

loop
if counter = 1 then
put "Too bad! Try harder next time!"
exit when counter = 1
end if

if num > 649 then
counter -=1
put "Choose a smaller number! You have ", counter ," guesses left."

elsif num < 649 then
counter -=1
put "Choose a bigger number! You have ", counter ," guesses left."

elsif num = 649 then
put "Congratulations! That is the secret number!"
exit
end if

get num

end loop
