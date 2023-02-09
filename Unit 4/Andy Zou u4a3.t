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


%%%%% FUNCTIONS AND PROCEDURES %%%%%

function translate (m : string) : string
var n : string := ""
if m = ".-" then
n := "A"
elsif m = "-..." then
n := "B"
elsif m = "-.-." then
n := "C"
elsif m = "-.." then
n := "D"
elsif m = "." then
n := "E"
elsif m = "..-." then
n := "F"
elsif m = "--." then
n := "G"
elsif m = "...." then
n := "H"
elsif m = ".." then
n := "I"
elsif m = ".---" then
n := "J"
elsif m = "-.-" then
n := "K"
elsif m = ".-.." then
n := "L"
elsif m = "--" then
n := "M"
elsif m = "-." then
n := "N"
elsif m = "---" then
n := "O"
elsif m = ".--." then
n := "P"
elsif m = "--.-" then
n := "Q"
elsif m = ".-." then
n := "R"
elsif m = "..." then
n := "S"
elsif m = "-" then
n := "T"
elsif m = "..-" then
n := "U"
elsif m = "...-" then
n := "V"
elsif m = ".--" then
n := "W"
elsif m = "-..-" then
n := "X"
elsif m = "-.--" then
n := "Y"
elsif m = "--.." then
n := "Z"
end if
result n
end translate

function translateSentence (str : string) : string
var word : string := ""
var coun : int := 1
for i :1 .. length(str)
if str(i) = " " then
word += translate(str(coun .. i-1))
coun := i + 1
end if
end for
word += translate(str(coun .. length(str)))
result word
end translateSentence

%%%%% MAIN CODE %%%%%

open : stream, "ciphertext.txt", get
open : stream2, "englishtext.txt", put

loop
get : stream, str :*
put : stream2, translateSentence(str)
exit when eof(stream)
end loop
