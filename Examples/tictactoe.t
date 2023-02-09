%%%%% GLOBAL VARIABLES %%%%%
var posx : int
var posy : int
var row : int
var col : int
var dummy1 : int
var dummy2 : int
var turn : string := "X"
var counter : int := 0
var grid : array 1 .. 3 of array 1 .. 3 of string
for i : 1 .. 3
    for j : 1 .. 3
	grid (i) (j) := ""
    end for
end for

%%%%% FUNCTIONS & PROCEDURES %%%%%
procedure drawO (r, c : int)
    if grid (c) (r) = "" then
	Draw.Oval (100 * c - 50, 350 - 100 * r, 40, 40, blue)
	grid (c) (r) := "O"
	turn := "X"
	counter += 1
    end if
end drawO

procedure drawX (r, c : int)
    if grid (c) (r) = "" then
	Draw.Line (100 * c - 90, 390 - 100 * r, 100 * c - 10, 310 - 100 * r, red)
	Draw.Line (100 * c - 90, 310 - 100 * r, 100 * c - 10, 390 - 100 * r, red)
	grid (c) (r) := "X"
	turn := "O"
	counter += 1
    end if
end drawX

function winner (p : string) : boolean
    %%% COLUMNS %%%
    if grid (1) (1) = p and grid (1) (2) = p and grid (1) (3) = p then
	result true
    elsif grid (2) (1) = p and grid (2) (2) = p and grid (2) (3) = p then
	result true
    elsif grid (3) (1) = p and grid (3) (2) = p and grid (3) (3) = p then
	result true

	%%% ROWS %%%
    elsif grid (1) (1) = p and grid (2) (1) = p and grid (3) (1) = p then
	result true
    elsif grid (1) (2) = p and grid (2) (2) = p and grid (3) (2) = p then
	result true
    elsif grid (1) (3) = p and grid (2) (3) = p and grid (3) (3) = p then
	result true

	%%% DIAGONALS %%%
    elsif grid (1) (1) = p and grid (2) (2) = p and grid (3) (3) = p then
	result true
    elsif grid (1) (3) = p and grid (2) (2) = p and grid (3) (1) = p then
	result true

	%%% ELSE = NO WINNER %%%
    else
	result false
    end if
end winner

%%%%% MAIN CODE %%%%%
setscreen ("graphics:300;300")
Draw.Line (0, 100, 300, 100, purple)
Draw.Line (0, 200, 300, 200, purple)
Draw.Line (100, 0, 100, 300, purple)
Draw.Line (200, 0, 200, 300, purple)

loop
    Mouse.ButtonWait ("down", posx, posy, dummy1, dummy2)
    col := posx div 100 + 1
    row := 3 - posy div 100
    if turn = "X" then
	drawX (row, col)
	if winner ("X") then
	    cls
	    locatexy (120, 150)
	    put "X WON THE GAME"
	    exit
	elsif counter = 9 then  
	    cls
	    locatexy(135, 150)
	    put "DRAW GAME!"
	    exit
	end if
    elsif turn = "O" then
	drawO (row, col)
	if winner ("O") then
	    cls
	    locatexy (120, 150)
	    put "O WON THE GAME"
	    exit
	end if
    end if
end loop





