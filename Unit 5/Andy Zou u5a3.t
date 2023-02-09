var stream1 : int
var stream2 : int
var str1 : string
var str2 : string
var dummy : string
var numbs : array 1 .. 3 of array 1 .. 2000 of string
var c : int := 1

function bindec (n : string) : int
    var b : int := 1
    var r : int := 0
    for decreasing i : length (n) .. 1
	r += b * strint (n (i))
	b *= 2
    end for
    result r
end bindec

function decbin (n : int) : string
    var w : string := ""
    var r : string := ""
    var f : int
    var k : int := n
    loop
	f := k mod 2
	w += intstr (f)
	exit when k div 2 = 0
	k := k div 2
    end loop
    for decreasing i : length (w) .. 1
	r += w (i)
    end for
    result r
end decbin

function dechex (n : int) : string
    var w : string := ""
    var r : string := ""
    var f : int
    var k : int := n
    loop
	f := k mod 16
	if f >= 10 then
	    if f = 10 then
		w += "A"
	    elsif f = 11 then
		w += "B"
	    elsif f = 12 then
		w += "C"
	    elsif f = 13 then
		w += "D"
	    elsif f = 14 then
		w += "E"
	    elsif f = 15 then
		w += "F"
	    end if
	end if
	if f < 10 then
	    w += intstr (f)
	end if
	exit when k div 16 = 0
	k := k div 16
    end loop
    for decreasing i : length (w) .. 1
	r += w (i)
    end for
    if r (1) = "0" then
	result r (2 .. (length (r)))
    end if
    result r
end dechex

function hexdec (n : string) : int
    var b : int := 1
    var r : int := 0
    for decreasing i : length (n) .. 1
	if n (i) = "A" then
	    r += b * 10
	elsif n (i) = "B" then
	    r += b * 11
	elsif n (i) = "C" then
	    r += b * 12
	elsif n (i) = "D" then
	    r += b * 13
	elsif n (i) = "E" then
	    r += b * 14
	elsif n (i) = "F" then
	    r += b * 15
	end if
	if strintok (n (i)) = true then
	    r += b * strint (n (i))
	end if
	b *= 16
    end for
    result r
end hexdec

open : stream1, "number.txt", get
open : stream2, "numbers_converted.txt", put

get : stream1, dummy : *
get : stream1, dummy

loop
    get : stream1, str1, str2
    if str1 = "2" then
	numbs (1) (c) := str2
	numbs (2) (c) := intstr (bindec (str2))
	numbs (3) (c) := dechex (bindec (str2))
	c += 1
    end if
    if str1 = "10" then
	numbs (1) (c) := decbin (strint (str2))
	numbs (2) (c) := str2
	numbs (3) (c) := dechex (strint (str2))
	c += 1
    end if
    if str1 = "16" then
	numbs (1) (c) := decbin (hexdec (str2))
	numbs (2) (c) := intstr (hexdec (str2))
	numbs (3) (c) := str2
	c += 1
    end if
    exit when eof (stream1)
end loop
put : stream2, "Base 2" : 20, "Base 10" : 20, "Base 16" : 20
put : stream2, repeat ("*", 150)
for i : 1 .. 2000
    put : stream2, numbs (1) (i) : 20, numbs (2) (i) : 20, numbs (3) (i) : 20
end for
