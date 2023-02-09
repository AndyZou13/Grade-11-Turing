%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%
var intarr : array 1 .. 8 of int := init (18, 19, 13, 21, 12, 22, 17, 32)
var intarr1 : array 1 .. 8 of int := init (2, 4, 16, 1, 34, 7, 15, 48)
var intarr2 : array 1 .. 8 of int := init (4, 3, 12, 6, 16, 25, 14, 50)
var intarr3 : array 1 .. 8 of int := init (3, 5, 13, 7, 30, 24, 18, 14)
var strarr1 : array 1 .. 4 of string := init ("Hi", "AbC", "Hi", "Bye")
var strarr2 : array 1 .. 4 of string := init ("Hi", "AbC", "Hi", "Bye")
var realarr1 : array 1 .. 4 of real := init (1, 12, 6, 18)
%%%%% FUNCTIONS AND PROCEDURES %%%%%
function countFactor (a : array 1 .. * of int, f : int) : int
    var n : int
    var w : int
    var counter : int := 0
    for i : 1 .. upper (a)
	n := a (i)
	w := n mod f
	if w = 0 then
	    counter += 1
	end if
    end for
    result counter
end countFactor

function countRightTriangle (a : array 1 .. * of int, b : array 1 .. * of int, c : array 1 .. * of int) : int
    var count : int := 0
    for i : 1 .. upper (a)
	var a1 : int := a (i)
	var b1 : int := b (i)
	var c1 : int := c (i)
	var n : int
	var n2 : int
	var n3 : int
	n := a1 ** 2 + b1 ** 2
	n2 := a1 ** 2 + c1 ** 2
	n3 := b1 ** 2 + c1 ** 2
	if n = c1 ** 2 or n2 = b1 ** 2 or n3 = a1 ** 2 then
	    count += 1
	end if
    end for
    result count
end countRightTriangle

function arraySearch (a : array 1 .. * of string, i : string) : int
    for n : 1 .. upper (a)
	if a (n) = i then
	    result n
	end if
    end for
    result 0
end arraySearch

function longestString (a : array 1 .. * of string) : string
    var s : string := " "
    var n : int
    for i : 1 .. upper (a)
	n := length (a (i))
	if n > length (s) then
	    s := a (i)
	end if
    end for
    result s
end longestString

function geometricMean (a : array 1 .. * of real) : real
var n : real := 1
var d : real
d := intreal(upper(a))
d := 1/d

for i : 1 .. upper(a)
n *= a(i)
end for
result n**d
end geometricMean


%%%%% MAIN CODE %%%%%

put countFactor (intarr, 2)

put repeat ("*", 50)

put countRightTriangle (intarr1, intarr2, intarr3)

put repeat ("*", 50)

put arraySearch (strarr1, "Hi")
put arraySearch (strarr1, "AbC")
put arraySearch (strarr1, "aBc")
put arraySearch (strarr1, "MrChow")

put repeat ("*", 50)

put longestString (strarr2)

put repeat ("*", 50)

put geometricMean(realarr1)
