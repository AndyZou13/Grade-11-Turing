
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%

var c : string
View.Set("text")

%%%%% FUNCTIONS AND PROCEDURES %%%%%

function reverseNumber (var b : string) : string
var a : string := ""
for decreasing i : length(b) .. 1
a += b(i)
end for
result a
end reverseNumber

function isPalindromic (var num : string) : boolean
var n : string := ""
n :=reverseNumber(num)
if num = n then
result true
else
result false 
end if
end isPalindromic

function longestPalindromic (var num1 : string) : string
var n1 : boolean
var numb : string := ""
var len : int := length(num1)
n1 := isPalindromic(num1)
if n1 = true then
result num1
else
for i : 1..len
for k : i .. len
var h : string := num1(i .. k)
n1 := isPalindromic(h)
if n1 = true and length(h) > length(numb) then
numb := h
end if
end for
end for
end if
result numb
end longestPalindromic
%%%%% MAIN CODE %%%%%

loop
put "Please enter positive integer: "
get c:*
if strintok(c) = true then
put "Reverse : ", reverseNumber (c)
put "Palindromic : ", isPalindromic (c)
put "Longest Palindromic : ", longestPalindromic (c)
put ""
end if
end loop
