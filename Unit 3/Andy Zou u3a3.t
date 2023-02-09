%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3
% Course Sec :
% First Name :
% Last Name  :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%

var user_input : string
var t : int
var num : int
var n : int
var n1 : int := 0

%%%%% FUNCTIONS AND PROCEDURES %%%%%
setscreen ("text")
function isPrime (var a : int) : boolean
    if a <= 1 then
	result false
    end if
    for i : 2 .. a - 1
	n := a mod i
	if n = 0 then
	    result false
	end if
    end for
    result true
end isPrime

function nextPrime (var s : int) : int
    if s <= 1 then
	result 2
    end if
    loop
	s += 1
	if isPrime (s) = true then
	    result s
	else
	end if
    end loop
end nextPrime

proc primeFactor (var q : int)
    var o : int
    for k : 2 .. q
	o := k
	loop
	    if isPrime (o) = true and q mod o = 0 then
		put k
		q div= o
	    end if
	    exit when not q mod o = 0
	end loop
    end for
end primeFactor

proc hailstone (var n : int)
    loop
	if n mod 2 = 0 then
	    n div= 2
	    put n
	else
	    n *= 3
	    n += 1
	    put n
	end if
	exit when n = 1
    end loop
end hailstone

function hailstonesteps (var k : int) : int
    var counter : int := 0
    loop
	if k mod 2 = 0 then
	    k := k div 2
	    counter += 1
	else
	    k *= 3
	    k += 1
	    counter += 1
	end if
	exit when k = 1
    end loop
    result counter
end hailstonesteps


%%%%% MAIN CODE %%%%%
loop
    put "Please enter an integer"
    get user_input : *
    if strintok (user_input) = true then
	t := strint (user_input)
	put "Is it prime? ", isPrime (t)
	put repeat ("*", 50)
	put "The next prime is ", nextPrime (t)
	put repeat ("*", 50)
	t := strint (user_input)
	put "The prime factors are: "
	primeFactor (t)
	put repeat ("*", 50)
	t := strint (user_input)
	put "The hailstone sequence is: "
	hailstone (t)
	put repeat ("*", 50)
	t := strint (user_input)
	put "The number of steps it takes to get to 1 is: ", hailstonesteps (t)
	put repeat ("*", 50)
	put ""
    end if
end loop
