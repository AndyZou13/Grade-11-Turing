function reverseString (w : string) : string
    var r : string := ""
    for decreasing i : length (w) .. 1
	r += w (i)
    end for
    result r
end reverseString

put repeat ("*", 50)

function onlyDigits (w : string) : boolean
    result strintok (w)
end onlyDigits

put repeat ("*", 50)

function spaceBreaker (w : string, n : int) : string
    var count := 1
    var r : string := ""
    r += w (1)
    for i : 2 .. length (w)
	if count mod n = 0 then
	    r += " "
	    r += w (i)
	else
	    r += w (i)
	end if
	count += 1
    end for
    result r
end spaceBreaker

function interchange (w : string, n : int) : string
    var x : string := ""
    var y : string := ""
    var r : string := ""
    x := w (1 .. n)
    y := w (n + 1 .. length (w))
    r += y
    r += x
    result r
end interchange

function higestOccurence (w : string) : string
    var word : flexible array 1 .. 0 of string
    var num : flexible array 1 .. 0 of int
    for i : 1 .. upper(word)
    for r : 1 .. length(w)
	if word(i) = w(r) then
	num(i) += 1
	exit
	end if
	end for
    
	
