%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Danielle
% Last Name  : Fong
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%
var streamin : int
var streamout : int
var base : string
var num : string
var final : array 1 .. 3 of array 1 .. 2000 of string
var counter : int := 1
setscreen ("text")
%%%%% FUNCTIONS %%%%%
function bindec (value : string) : int
    var store : int := 0
    var exponent : int := length (value)
    for decreasing i : length (value) .. 1
	store += 2 ** exponent
	exponent -= 1
    end for
    result store
end bindec

function decbin (value : string) : string
    var divide : int := strint (value)
    var store : string := ""
    var remainder : int
    var final : string := ""
    loop
	remainder := divide rem 2
	store += intstr (remainder)
	divide := divide div 2
	exit when divide = 0
    end loop
    for decreasing i : length (store) .. 1
	final += store (i)
    end for
    result final
end decbin

function dechex (value : string) : string
    var divide : int := strint (value)
    var store : string := ""
    var remainder : int
    var final : string := ""
    var hex : string := ""
    loop
	remainder := divide rem 16
	store += intstr (remainder)
	divide := divide div 16
	exit when divide = 0
    end loop
    for decreasing i : length (store) .. 1
	if store (i) = "1" then
	    hex := "1"
	elsif store (i) = "2" then
	    hex := "2"
	elsif store (i) = "3" then
	    hex := "3"
	elsif store (i) = "4" then
	    hex := "4"
	elsif store (i) = "5" then
	    hex := "5"
	elsif store (i) = "6" then
	    hex := "6"
	elsif store (i) = "7" then
	    hex := "7"
	elsif store (i) = "8" then
	    hex := "8"
	elsif store (i) = "9" then
	    hex := "9"
	elsif store (i) = "10" then
	    hex := "A"
	elsif store (i) = "11" then
	    hex := "B"
	elsif store (i) = "12" then
	    hex := "C"
	elsif store (i) = "13" then
	    hex := "D"
	elsif store (i) = "14" then
	    hex := "E"
	elsif store (i) = "15" then
	    hex := "F"
	end if
	final += hex
    end for
    result final
end dechex

function hexdec (value : string) : int
    var store : int := 0
    var exponent : int := 0
    var hex : string := ""
    for decreasing i : length (value) .. 1
	if value (i) = "1" then
	    hex := "1"
	elsif value (i) = "0" then
	    hex := "0"
	elsif value (i) = "2" then
	    hex := "2"
	elsif value (i) = "3" then
	    hex := "3"
	elsif value (i) = "4" then
	    hex := "4"
	elsif value (i) = "5" then
	    hex := "5"
	elsif value (i) = "6" then
	    hex := "6"
	elsif value (i) = "7" then
	    hex := "7"
	elsif value (i) = "8" then
	    hex := "8"
	elsif value (i) = "9" then
	    hex := "9"
	elsif value (i) = "A" then
	    hex := "10"
	elsif value (i) = "B" then
	    hex := "11"
	elsif value (i) = "C" then
	    hex := "12"
	elsif value (i) = "D" then
	    hex := "13"
	elsif value (i) = "E" then
	    hex := "14"
	elsif value (i) = "F" then
	    hex := "15"
	end if
	store += strint (hex) * 16 ** exponent
	exponent += 1
    end for
    result store
end hexdec

%%%%% MAIN CODE %%%%%
open : streamin, "number.txt", get
open : streamout, "Danielle's numbers_converted.txt", put
put : streamout, "Base 2" : 20, "Base 10" : 20, "Base 16"
put : streamout, repeat ("*", 65)
get : streamin, base : *
get : streamin, base : *
loop
    get : streamin, base, num
    if base = "2" then
	final (1) (counter) := num
	final (2) (counter) := intstr (bindec (num))
	final (3) (counter) := dechex (intstr (bindec (num)))
	counter += 1
    end if
    if base = "10" then
	final (1) (counter) := decbin (num)
	final (2) (counter) := num
	final (3) (counter) := dechex (num)
	counter += 1
    end if
    if base = "16" then
	final (1) (counter) := decbin (intstr (hexdec (num)))
	final (2) (counter) := intstr (hexdec (num))
	final (3) (counter) := num
	counter += 1
    end if
    exit when eof (streamin)
end loop
for i : 1 .. 2000
    put : streamout, final (1) (i) : 20, final (2) (i) : 20, final (3) (i) : 20
end for

