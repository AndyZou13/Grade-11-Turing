%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programmer(s): Danielle Fong, Andy Zou
% Program Name : Earth Defenders
% Description  : We've been targeted and are under attack by an unknown alien species.
%                All our defences are down and you're our only hope to protect the Earth from being destroyed!
%                Just a hint for you Mr.Chow, There is also a panic button incase your getting overloaded, but that you have to find out yourself :)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% GLOBAL VARIABLES %%%%%
setscreen ("graphics:500;500,noecho")
var w : string := "my hopes and dreams"
var strname, strscore, strcombo : string
var stream : int := 0
var o : string
var savescorecounter : int := 0
var scorecounter : int := 0
var counting : int := 0
var namesaving : string
var keyinput : string (1)
var xu, yu : int := 100
var shipspeed : int := 1
var speed : int := 1
var speedcounter : int := 250
var mousex, mousey, btnnum, btndown, btn : int
var x, y, bn, bd, b : int
var ua : array char of boolean
var xs : array 1 .. 5 of int
var ys : array 1 .. 5 of int
var ss : array 1 .. 5 of int := init (0, 0, 0, 0, 0)
ss (1) := speed
for i : 1 .. 5
    ys (i) := Rand.Int (45, 455)
    xs (i) := Rand.Int (510, 600)
    if i > 1 then
	if ys (i - 1) = ys (i) then
	    ys (i) := Rand.Int (45, 455)
	end if
	xs (i) := Rand.Int (510, 650)
	if xs (i - 1) = xs (i) then
	    xs (i) := Rand.Int (510, 650)
	end if
    end if
end for
var h : int := 116
var ship1 : int := Pic.FileNew ("Defender2.bmp")
var back : int := Pic.FileNew ("Background1.bmp")
var enemy : int := Pic.FileNew ("Enemy.bmp")
var earthship : int := Pic.Rotate (ship1, 270, xu - 90, yu - 90)
var enemyship1 : int := Pic.Rotate (enemy, 180, xs (1), ys (1) - 100)
var enemyship2 : int := Pic.Rotate (enemy, 180, xs (2), ys (2) - 100)
var enemyship3 : int := Pic.Rotate (enemy, 180, xs (3), ys (3) - 100)
var enemyship4 : int := Pic.Rotate (enemy, 180, xs (4), ys (4) - 100)
var enemyship5 : int := Pic.Rotate (enemy, 180, xs (5), ys (5) - 100)
var score : int := 0
var multiplier : int := 0
var displayscore : string := "000000000"
var counter : int := 10
var place1 : int := 1
var place2 : int := 2
var place3 : int := 3
var place4 : int := 4
var place5 : int := 5
var level : int := 1
var stage : int := 1
var health : int := 10
var bul : array 1 .. 3 of array 1 .. 5 of int := init (
    init (-10, -10, -10, -10, -10),
    init (-10, -10, -10, -10, -10),
    init (0, 0, 0, 0, 0)
    )
var scores : flexible array 1 .. 0 of string
var names : flexible array 1 .. 0 of string
var highestmulti : flexible array 1 .. 0 of string
var prevscores : flexible array 1 .. 0 of string
var prevnames : flexible array 1 .. 0 of string
var prevhighestmulti : flexible array 1 .. 0 of string
var stream1 : int
var lastbullet : int
var font, font1, font2 : int
font := Font.New ("Chewy:48:Bold")
font1 := Font.New ("Chewy:24:Bold")
font2 := Font.New ("Chewy:36:Bold")
var mouseX, mouseY : int
var click : int := 1
var screen : int := 0
var font3 : int := Font.New ("chewy:22")
var font4 : int := Font.New ("futura:23")
var font5 : int := Font.New ("impact:30")
var font6 : int := Font.New ("futura:14")
var font7 : int := Font.New ("impact:25")
var font8 : int := Font.New ("chewy:22:Underline")
var font9 : int := Font.New ("impact:15")
var home : int := Pic.FileNew ("titlepage.bmp")
var music_on : int := Pic.FileNew ("musicon.bmp")
var music_off : int := Pic.FileNew ("musicoff.bmp")
var sound_on : int := Pic.FileNew ("soundon.bmp")
var sound_off : int := Pic.FileNew ("soundoff.bmp")
var soundmode : int := 1
var musicmode : int := 1
var arrows : int := Pic.FileNew ("arrowkeys.bmp")
var xKey : int := Pic.FileNew ("xKey.bmp")
var zKey : int := Pic.FileNew ("zKey.bmp")

var instructions1 : string := "We've been targeted and are under attack by an unknown"
var instructions2 : string := "  alien species. All our defences are down and you're our"
var instructions3 : string := "    only hope to protect the Earth from being destroyed!"

var control1 : string := "CONTROLS"
var control2 : string := "arrow keys to move"
var control3 : string := "x-key to shoot"
var control4 : string := "z-key to shoot"

Pic.SetTransparentColor (arrows, black)
Pic.SetTransparentColor (xKey, black)
Pic.SetTransparentColor (zKey, black)
Pic.SetTransparentColor (sound_off, white)
Pic.SetTransparentColor (sound_on, white)
Pic.SetTransparentColor (music_off, white)
Pic.SetTransparentColor (music_on, white)
Pic.SetTransparentColor (earthship, white)
Pic.SetTransparentColor (enemyship1, white)
Pic.SetTransparentColor (enemyship2, white)
Pic.SetTransparentColor (enemyship3, white)
Pic.SetTransparentColor (enemyship4, white)
Pic.SetTransparentColor (enemyship5, white)



%%%%% SUBPROGRAMS %%%%%
process gun     % playing background music
    Music.PlayFile ("Gunsound.mp3")
end gun

process space
    Music.PlayFile ("Space.wav")
end space
proc bullet1 () %Procedure to call bullet to the ship
    bul (1) (1) := xu + 3
    bul (2) (1) := yu + 8
    bul (3) (1) := 3
    if soundmode = 1 then
	fork gun
    end if
end bullet1

proc bullet2 ()
    bul (1) (2) := xu + 3
    bul (2) (2) := yu + 8
    bul (3) (2) := 3
    if soundmode = 1 then
	fork gun
    end if
end bullet2

proc bullet3 ()
    bul (1) (3) := xu + 3
    bul (2) (3) := yu + 8
    bul (3) (3) := 3
    if soundmode = 1 then
	fork gun
    end if
end bullet3

proc bullet4 ()
    bul (1) (4) := xu + 3
    bul (2) (4) := yu + 8
    bul (3) (4) := 3
    if soundmode = 1 then
	fork gun
    end if
end bullet4

proc bullet5 ()
    bul (1) (5) := xu + 3
    bul (2) (5) := yu + 8
    bul (3) (5) := 3
    if soundmode = 1 then
	fork gun
    end if
end bullet5

proc bullet () %Calls Bullet and checks if they are within range and are ok to fire
    if bul (1) (1) = -10 then
	bullet1 ()
	lastbullet := 1
	return
    end if
    if (bul (1) (2) = -10 and bul (1) (lastbullet) > xu + 50) or bul (1) (lastbullet) = -10 then
	bullet2 ()
	lastbullet := 2
	return
    end if
    if (bul (1) (3) = -10 and bul (1) (lastbullet) > xu + 50) or bul (1) (lastbullet) = -10 then
	bullet3 ()
	lastbullet := 3
	return
    end if
    if (bul (1) (4) = -10 and bul (1) (lastbullet) > xu + 50) or bul (1) (lastbullet) = -10 then
	bullet4 ()
	lastbullet := 4
	return
    end if
    if (bul (1) (5) = -10 and bul (1) (lastbullet) > xu + 50) or bul (1) (lastbullet) = -10 then
	bullet5 ()
	lastbullet := 5
	return
    end if
end bullet

proc checkleave () %Checking if user ship has left screen
    if xu > 488 then
	xu := 488
    end if
    if yu > 488 then
	yu := 488
    end if
    if xu < 0 then
	xu := 0
    end if
    if yu < 45 then
	yu := 45
    end if
end checkleave

proc checkship1 () %Checks if ship has hit a bullet or the wall
    if xs (1) < -10 then
	h -= health
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	multiplier := 0
    end if
    if xu + 10 > xs (1) - 10 and xu - 10 < xs (1) + 10 and yu + 10 > ys (1) - 10 and yu - 10 < ys (1) + 10 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	h -= health
	if h > 0 then
	multiplier := 0
	end if
    end if
    if bul (1) (1) > xs (1) and bul (1) (1) < xs (1) + 10 and bul (2) (1) > ys (1) - 10 and bul (2) (1) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (1) := -10
	bul (3) (1) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (1) and bul (1) (2) < xs (1) + 10 and bul (2) (2) > ys (1) - 10 and bul (2) (2) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (2) := -10
	bul (3) (2) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (1) and bul (1) (3) < xs (1) + 10 and bul (2) (3) > ys (1) - 10 and bul (2) (3) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (3) := -10
	bul (3) (3) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (1) and bul (1) (4) < xs (1) + 10 and bul (2) (4) > ys (1) - 10 and bul (2) (4) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (4) := -10
	bul (3) (4) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (1) and bul (1) (5) < xs (1) + 10 and bul (2) (5) > ys (1) - 10 and bul (2) (5) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (5) := -10
	bul (3) (5) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
end checkship1

proc checkship2 ()
    if xs (2) < -10 then
	h -= health
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 455)
	multiplier := 1
    end if
    if xu + 10 > xs (2) - 10 and xu - 10 < xs (2) + 10 and yu + 10 > ys (2) - 10 and yu - 10 < ys (2) + 10 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 455)
	h -= health
	if h > 0 then
	multiplier := 0
	end if
    end if
    if bul (1) (1) > xs (2) and bul (1) (1) < xs (2) + 10 and bul (2) (1) > ys (2) - 10 and bul (2) (1) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (2) and bul (1) (2) < xs (2) + 10 and bul (2) (2) > ys (2) - 10 and bul (2) (2) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (2) and bul (1) (3) < xs (2) + 10 and bul (2) (3) > ys (2) - 10 and bul (2) (3) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (2) and bul (1) (4) < xs (2) + 10 and bul (2) (4) > ys (2) - 10 and bul (2) (4) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (2) and bul (1) (5) < xs (2) + 10 and bul (2) (5) > ys (2) - 10 and bul (2) (5) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
end checkship2

proc checkship3 ()
    if xs (3) < -10 then
	h -= health
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 455)
	multiplier := 1
    end if
    if xu + 10 > xs (3) - 10 and xu - 10 < xs (3) + 10 and yu + 10 > ys (3) - 10 and yu - 10 < ys (3) + 10 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 455)
	h -= health
	if h > 0 then
	multiplier := 0
	end if
    end if
    if bul (1) (1) > xs (3) and bul (1) (1) < xs (3) + 10 and bul (2) (1) > ys (3) - 10 and bul (2) (1) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (3) and bul (1) (2) < xs (3) + 10 and bul (2) (2) > ys (3) - 10 and bul (2) (2) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (3) and bul (1) (3) < xs (3) + 10 and bul (2) (3) > ys (3) - 10 and bul (2) (3) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (3) and bul (1) (4) < xs (3) + 10 and bul (2) (4) > ys (3) - 10 and bul (2) (4) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (3) and bul (1) (5) < xs (3) + 10 and bul (2) (5) > ys (3) - 10 and bul (2) (5) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
end checkship3

proc checkship4 ()
    if xs (4) < -10 then
	h -= health
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 455)
	multiplier := 1
    end if
    if xu + 10 > xs (4) - 10 and xu - 10 < xs (4) + 10 and yu + 10 > ys (4) - 10 and yu - 10 < ys (4) + 10 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 455)
	h -= health
	if h > 0 then
	multiplier := 0
	end if
    end if
    if bul (1) (1) > xs (4) and bul (1) (1) < xs (4) + 10 and bul (2) (1) > ys (4) - 10 and bul (2) (1) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (4) and bul (1) (2) < xs (4) + 10 and bul (2) (2) > ys (4) - 10 and bul (2) (2) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (4) and bul (1) (3) < xs (4) + 10 and bul (2) (3) > ys (4) - 10 and bul (2) (3) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (4) and bul (1) (4) < xs (4) + 10 and bul (2) (4) > ys (4) - 10 and bul (2) (4) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (4) and bul (1) (5) < xs (4) + 10 and bul (2) (5) > ys (4) - 10 and bul (2) (5) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
end checkship4

proc checkship5 ()
    if xs (5) < -10 then
	h -= health
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 455)
	multiplier := 1
    end if
    if xu + 10 > xs (5) - 10 and xu - 10 < xs (5) + 10 and yu + 10 > ys (5) - 10 and yu - 10 < ys (5) + 10 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 455)
	h -= health
	if h > 0 then
	multiplier := 0
	end if
    end if
    if bul (1) (1) > xs (5) and bul (1) (1) < xs (5) + 10 and bul (2) (1) > ys (5) - 10 and bul (2) (1) < ys (5) + 20 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (5) and bul (1) (2) < xs (5) + 10 and bul (2) (2) > ys (5) - 10 and bul (2) (2) < ys (5) + 20 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (5) and bul (1) (3) < xs (5) + 10 and bul (2) (3) > ys (5) - 10 and bul (2) (3) < ys (5) + 20 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (5) and bul (1) (4) < xs (5) + 10 and bul (2) (4) > ys (5) - 10 and bul (2) (4) < ys (5) + 20 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (5) and bul (1) (5) < xs (5) + 10 and bul (2) (5) > ys (5) - 10 and bul (2) (5) < ys (5) + 20 then
	xs (5) := Rand.Int (510, 650)
	ys (5) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	if multiplier = 0 then
	    score += 10
	elsif multiplier > 0 then
	    score += 10 * multiplier
	end if
	multiplier += 1
	counter -= 1
    end if
end checkship5

proc boost ()     %speed boost for user ship
    if speedcounter <= 150 then
	speedcounter := 150
	shipspeed := 1
	return
    end if
    shipspeed := 4
    speedcounter -= 3
end boost

proc shipspawn ()     %Draws all the enemyships D
    Pic.Draw (enemy, xs (1) - 27, ys (1) - 33, picMerge)
    Pic.Draw (enemy, xs (2) - 27, ys (2) - 33, picMerge)
    Pic.Draw (enemy, xs (3) - 27, ys (3) - 33, picMerge)
    Pic.Draw (enemy, xs (4) - 27, ys (4) - 33, picMerge)
    Pic.Draw (enemy, xs (5) - 27, ys (5) - 33, picMerge)
end shipspawn

proc Bulletspawn ()     %draws all the bullets offscreen
    Draw.FillBox (bul (1) (1), bul (2) (1), bul (1) (1) + 4, bul (2) (1) + 4, yellow)
    Draw.FillBox (bul (1) (2), bul (2) (2), bul (1) (2) + 4, bul (2) (2) + 4, yellow)
    Draw.FillBox (bul (1) (3), bul (2) (3), bul (1) (3) + 4, bul (2) (3) + 4, yellow)
    Draw.FillBox (bul (1) (4), bul (2) (4), bul (1) (4) + 4, bul (2) (4) + 4, yellow)
    Draw.FillBox (bul (1) (5), bul (2) (5), bul (1) (5) + 4, bul (2) (5) + 4, yellow)
end Bulletspawn

proc bulletLeave ()     %Cheks if bullet has left the screen
    if bul (1) (1) >= 500 then
	bul (1) (1) := -10
	bul (3) (1) := 0
    end if
    if bul (1) (2) >= 500 then
	bul (1) (2) := -10
	bul (3) (2) := 0
    end if
    if bul (1) (3) >= 500 then
	bul (1) (3) := -10
	bul (3) (3) := 0
    end if
    if bul (1) (4) >= 500 then
	bul (1) (4) := -10
	bul (3) (4) := 0
    end if
    if bul (1) (5) >= 500 then
	bul (1) (5) := -10
	bul (3) (5) := 0
    end if
end bulletLeave

proc bulletMove ()     %Speed of the bullet
    bul (1) (1) += bul (3) (1)
    bul (1) (2) += bul (3) (2)
    bul (1) (3) += bul (3) (3)
    bul (1) (4) += bul (3) (4)
    bul (1) (5) += bul (3) (5)
end bulletMove

proc userinput ()     %controling user ship
    if ua (KEY_UP_ARROW) then
	yu += shipspeed
    end if
    if ua (KEY_LEFT_ARROW) then
	xu -= shipspeed
    end if
    if ua (KEY_RIGHT_ARROW) then
	xu += shipspeed
    end if
    if ua (KEY_DOWN_ARROW) then
	yu -= shipspeed
    end if
    if ua ('x') then
	bullet ()
    end if
    if ua ('z') then
	boost ()
    end if
    if not ua ('z') then
	shipspeed := 1
    end if
end userinput

proc dispscore ()     %displaying score
    if length (intstr (score)) = 2 then
	displayscore := "0000000" + intstr (score)
    end if
    if length (intstr (score)) = 3 then
	displayscore := "000000" + intstr (score)
    end if
    if length (intstr (score)) = 4 then
	displayscore := "00000" + intstr (score)
    end if
    if length (intstr (score)) = 5 then
	displayscore := "0000" + intstr (score)
    end if
    if length (intstr (score)) = 6 then
	displayscore := "0000" + intstr (score)
    end if
    if length (intstr (score)) = 7 then
	displayscore := "000" + intstr (score)
    end if
    if length (intstr (score)) = 8 then
	displayscore := "00" + intstr (score)
    end if
    if length (intstr (score)) = 9 then
	displayscore := "0" + intstr (score)
    end if
    if length (intstr (score)) = 10 then
	displayscore := intstr (score)
    end if
end dispscore

proc scoreBoard ()     %Drawning scoreboard
    Draw.FillBox (0, 0, 500, 43, 20)
    Draw.Text ("Health: ", 15, 33, defFontID, white)
    Draw.Text (intstr (h - 16), 70, 33, defFontID, white)
    Draw.Text ("/100", 95, 33, defFontID, white)
    Draw.Text ("Score: ", 15, 5, defFontID, white)
    Draw.Text (displayscore, 65, 5, defFontID, white)
    Draw.Text ("Boost: ", 160, 33, defFontID, white)
    Draw.Text (intstr (speedcounter - 150), 210, 33, defFontID, white)
    Draw.Text ("/100", 235, 33, defFontID, white)
    Draw.Text ("Combo: ", 190, 5, defFontID, white)
    Draw.Text (intstr (multiplier), 240, 5, defFontID, white)
    Draw.FillBox (15, 16, 116, 26, white)
    Draw.FillBox (15, 16, h, 26, green)
    Draw.Box (14, 15, 116, 27, black)
    Draw.Text ("Level: ", 300, 33, defFontID, white)
    Draw.Text (intstr (level), 350, 33, defFontID, white)
    Draw.Text ("Stage: ", 375, 33, defFontID, white)
    Draw.Text (intstr (stage), 425, 33, defFontID, white)
    Draw.Text ("Health Drain: ", 300, 19, defFontID, white)
    Draw.Text (intstr (health), 410, 19, defFontID, white)
    Draw.Text ("Enemy Speed: ", 300, 5, defFontID, white)
    Draw.Text (intstr (ss (1)), 400, 5, defFontID, white)
    Draw.FillBox (175, 15, 270, 26, white)
    Draw.FillBox (170, 15, speedcounter + 20, 26, blue)
    Draw.Box (169, 14, 271, 27, black)
end scoreBoard

function orderscore (n : string) : string
    for i : 1 .. upper (prevnames)
	if strint (prevscores (i)) > strint (prevscores (place1)) then
	    place5 := place4
	    place4 := place3
	    place3 := place2
	    place2 := place1
	    place1 := i
	end if
	if upper (names) = 2 and strint (prevscores (i)) > strint (prevscores (place2)) and strint (prevscores (i)) < strint (prevscores (place2)) then
	    place5 := place4
	    place4 := place3
	    place3 := place2
	    place2 := i
	end if
	if upper (names) = 3 and strint (prevscores (i)) > strint (prevscores (place3)) and strint (prevscores (i)) < strint (prevscores (place3)) then
	    place5 := place4
	    place4 := place3
	    place3 := i
	end if
	if upper (names) = 4 and strint (prevscores (i)) > strint (prevscores (place4)) and strint (prevscores (i)) < strint (prevscores (place4)) then
	    place5 := place4
	    place4 := i
	end if
    end for
    result "my hopes"
end orderscore

proc highscorescreen ()     % displays highscores

    open : stream1, "highscores.txt", put
    stream += 1
    put : stream1, "Name" : 20, "Score" : 20, "Highest Multiplier" : 30
    put : stream1, repeat ("*", 100)
    for i : 1 .. upper (prevnames)
	put : stream1, prevnames (i) : 20, prevscores (i) : 20, prevhighestmulti (i) : 20
	o := orderscore (w)
    end for
    close (stream1)
    o := orderscore (w)
    loop
	cls
	Pic.Draw (home, 0, 0, picMerge)
	Pic.Draw (home, 0, 0, picMerge)
	Draw.Text ("Back", 10, 470, font1, white)
	Draw.Text ("Name", 15, 400, font8, white)
	Draw.Text ("Score", 135, 400, font8, white)
	Draw.Text ("Combo", 375, 400, font8, white)
	if upper (prevnames) >= 1 then
	    Draw.Text (prevnames (place1), 15, 350, font3, white)
	    Draw.Text (prevscores (place1), 135, 350, font3, white)
	    Draw.Text (prevhighestmulti (place1), 375, 350, font3, white)
	end if
	if upper (prevnames) >= 2 then
	    Draw.Text (prevnames (place2), 15, 300, font3, white)
	    Draw.Text (prevscores (place2), 135, 300, font3, white)
	    Draw.Text (prevhighestmulti (place2), 375, 300, font3, white)
	end if
	if upper (prevnames) >= 3 then
	    Draw.Text (prevnames (place3), 15, 250, font3, white)
	    Draw.Text (prevscores (place3), 135, 250, font3, white)
	    Draw.Text (prevhighestmulti (place3), 375, 250, font3, white)
	end if
	if upper (prevnames) >= 4 then
	    Draw.Text (prevnames (place4), 15, 200, font3, white)
	    Draw.Text (prevscores (place4), 135, 200, font3, white)
	    Draw.Text (prevhighestmulti (place4), 375, 200, font3, white)
	end if
	if upper (prevnames) >= 5 then
	    Draw.Text (prevnames (place5), 15, 150, font3, white)
	    Draw.Text (prevscores (place5), 135, 150, font3, white)
	    Draw.Text (prevhighestmulti (place5), 375, 150, font3, white)
	end if
	View.Set ("offscreenonly")
	View.Update
	mousewhere (mousex, mousey, click)
	if mousex > 10 and mousex < 100 and mousey > 470 and mousey < 500 then
	    Draw.Text ("Back", 10, 470, font1, red)
	    View.Update
	end if
	if mousex > 10 and mousex < 100 and mousey > 470 and mousey < 500 and click = 1 then
	    screen := 0
	    click := 1
	    exit
	end if
    end loop
end highscorescreen

proc savescore ()
    Draw.Text ("Name: ", 80, 250, font1, white)
    View.Update
    locate (16, 23)
    View.Update
    get namesaving
    View.Update
    new prevnames, upper (prevnames) + 1
    prevnames (upper (prevnames)) := namesaving
    new prevscores, upper (prevnames) + 1
    prevscores (upper (prevnames)) := displayscore
    new prevhighestmulti, upper (prevnames) + 1
    prevhighestmulti (upper (prevnames)) := intstr (multiplier)
    screen := 0
    click := 1
    savescorecounter += 1
end savescore

proc Levels ()     %levels of difficulty
    if stage = 5 and counter = 0 then
	stage := 1
	counter := 10
	speed += 1
	level += 1
	delay (10)
	ss (5) := 0
	ss (4) := 0
	ss (3) := 0
	ss (2) := 0
	ss (1) := 0
	for i : 1 .. 5
	    ys (i) := Rand.Int (45, 455)
	    xs (i) := Rand.Int (510, 600)
	    if i > 1 then
		if ys (i - 1) = ys (i) then
		    ys (i) := Rand.Int (45, 455)
		end if
		xs (i) := Rand.Int (510, 650)
		if xs (i - 1) = xs (i) then
		    xs (i) := Rand.Int (510, 650)
		end if
	    end if
	end for
	cls
	Pic.Draw (back, 0, 0, picCopy)
	Draw.FillBox (15, 10, 116, 20, white)
	Pic.Draw (earthship, xu, yu, picMerge)
	shipspawn ()
	scoreBoard ()
	Bulletspawn ()
	View.Set ("offscreenonly")
	View.Update
	Input.KeyDown (ua)
	Draw.Text ("Level Up! Speed + 1", 80, 250, font1, gray)
	View.Update
	delay (2000)
	ss (1) := speed
	cls
    end if
    if counter = 0 then
	counter := 10
	stage += 1
	ss (stage) := speed
    end if
    View.Update
end Levels

proc countdown ()     %countdown before gamestart
    var counting : int := 4
    loop
	counting -= 1
	Pic.Draw (back, 0, 0, picCopy)
	Draw.FillBox (15, 10, 116, 20, white)
	Pic.Draw (earthship, xu, yu, picMerge)
	shipspawn ()
	scoreBoard ()
	Bulletspawn ()
	View.Set ("offscreenonly")
	View.Update
	Input.KeyDown (ua)
	Draw.Text (intstr (counting), 250, 250, font, gray)
	View.Update
	delay (1000)
	cls
	exit when counting = 1
    end loop
    Pic.Draw (back, 0, 0, picCopy)
    Draw.FillBox (15, 10, 116, 20, white)
    Pic.Draw (earthship, xu, yu, picMerge)
    shipspawn ()
    scoreBoard ()
    Bulletspawn ()
    View.Set ("offscreenonly")
    View.Update
    Input.KeyDown (ua)
    Draw.Text ("Start!", 180, 250, font, gray)
    View.Update
    delay (1000)
    cls
end countdown

proc startscreen ()     %difficulty selection
    click := 0
    loop
	Pic.Draw (back, 0, 0, picCopy)
	Draw.FillBox (15, 10, 116, 20, white)
	Draw.FillBox (0, 0, 500, 43, 20)
	Draw.Text ("Choose difficulty", 75, 375, font2, white)
	Draw.Text ("Easy", 75, 325, font1, brightblue)
	Draw.Text ("Medium", 325, 325, font1, yellow)
	Draw.Text ("Hard", 75, 205, font1, red)
	Draw.Text ("Insane", 325, 205, font1, white)
	Draw.Text ("Back", 10, 470, font1, white)
	View.Set ("offscreenonly")
	View.Update
	Draw.Text ("Insane", 325, 205, font1, red)
	View.Set ("offscreenonly")
	View.Update
	click := 0
	mousewhere (mousex, mousey, click)
	if mousex > 10 and mousex < 100 and mousey > 470 and mousey < 500 then
	    Draw.Text ("Back", 10, 470, font1, red)
	    View.Update
	end if
	if mousex > 10 and mousex < 100 and mousey > 470 and mousey < 500 and click = 1 then
	    screen := 0
	    click := 1
	    exit
	end if
	if mousex > 75 and mousex < 145 and mousey > 325 and mousey < 350 and click = 1 then
	    health := 10
	    screen := 3
	    exit
	end if
	if mousex > 325 and mousex < 425 and mousey > 325 and mousey < 350 and click = 1 then
	    health := 20
	    screen := 3
	    exit
	end if
	if mousex > 75 and mousex < 170 and mousey > 205 and mousey < 250 and click = 1 then
	    health := 50
	    screen := 3
	    exit
	end if
	if mousex > 325 and mousex < 460 and mousey > 205 and mousey < 230 and click = 1 then
	    health := 100
	    screen := 3
	    exit
	end if
	delay (10)
    end loop
end startscreen

proc gameScreen ()     %main game code
    countdown ()
    if musicmode = 1 then
	fork space
    end if
    click := 0
    loop
	cls
	exit when h = 0
	Pic.Draw (back, 0, 0, picCopy)
	Draw.FillBox (15, 10, 116, 20, white)
	Pic.Draw (earthship, xu, yu, picMerge)
	shipspawn ()
	scoreBoard ()
	Bulletspawn ()
	View.Set ("offscreenonly")
	View.Update
	Input.KeyDown (ua)
	userinput ()
	bulletMove ()
	bulletLeave ()
	xs (1) -= ss (1)
	xs (2) -= ss (2)
	xs (3) -= ss (3)
	xs (4) -= ss (4)
	xs (5) -= ss (5)
	if speedcounter >= 250 then
	    speedcounter := 250
	elsif speedcounter < 250 then
	    speedcounter += 1
	end if
	checkship1 ()
	checkship2 ()
	checkship3 ()
	checkship4 ()
	checkship5 ()
	checkleave ()
	dispscore ()
	Levels ()
	if h < 20 then
	    h := 0
	end if
	if h = 0 then
	    screen := 4
	    click := 1
	    exit
	end if
	delay (10)
	if ua (KEY_ESC) then
	    Draw.Text ("Press r to restart", 50, 450, font1, white)
	    Draw.Text ("Press space to resume", 50, 375, font1, white)
	    Draw.Text ("Press m to go to main menu", 50, 300, font1, white)
	    View.Set ("offscreenonly")
	    View.Update
	    loop
		getch (keyinput)
		if keyinput = "r" then
		    screen := 3
		    click := 1
		    Music.PlayFileStop
		    exit
		end if
		if keyinput = " " then
		    exit
		end if
		if keyinput = "m" then
		    screen := 0
		    click := 1
		    Music.PlayFileStop
		    exit
		end if
	    end loop
	end if
	exit when click ~= 0
    end loop
end gameScreen

proc endscreen ()     % end screen
    Music.PlayFileStop
    loop
	cls
	Pic.Draw (back, 0, 0, picCopy)
	Draw.Text ("Game Over", 80, 350, font, white)
	h := 16
	scoreBoard ()
	dispscore ()
	Draw.Text ("Game Over", 80, 350, font, gray)
	if savescorecounter = 0 then
	    savescore ()
	end if
	Draw.Text ("Play Again", 170, 250, font1, green)
	Draw.Text ("Main Menu", 165, 180, font1, yellow)
	View.Set ("offscreenonly")
	View.Update
	mousewhere (x, y, click)
	if x > 170 and x < 330 and y > 250 and y < 275 and click = 1 then
	    screen := 3
	    click := 1
	    exit
	end if
	if x > 165 and x < 330 and y > 180 and y < 205 and click = 1 then
	    screen := 0
	    click := 1
	    exit
	end if
	delay (10)
    end loop
end endscreen

proc reset ()     %reset game
    Music.PlayFileStop
    place1 := 1
    place2 := 2
    place3 := 3
    place4 := 4
    place5 := 5
    score := 0
    multiplier := 0
    displayscore := "000000000"
    h := 116
    xu := 100
    yu := 100
    level := 1
    counter := 10
    speedcounter := 250
    savescorecounter := 0
    stage := 1
    for i : 1 .. 2
	for o : 1 .. 5
	    bul (i) (o) := -10
	end for
    end for
    for i : 1 .. 5
	xs (i) := Rand.Int (510, 600)
	bul (3) (i) := 0
	ss (i) := 0
    end for
    speed := 1
    ss (1) := speed
end reset

procedure titlepage ()
    var wy : int := 0
    loop
	cls
	Pic.Draw (home, 0, 0, picMerge)
	Pic.Draw (home, 0, 0, picMerge)
	Draw.Text ("E A R T H  D E F E N D E R S", 45, wy, font4, 30)
	wy += 1
	View.Set ("offscreenonly")
	View.Update
	delay (10)
	Input.KeyDown (ua)
	if ua (KEY_ENTER) then
	    wy := 330
	end if
	exit when wy >= 330
    end loop
    loop
	cls
	Pic.Draw (home, 0, 0, picMerge)
	Pic.Draw (home, 0, 0, picMerge)
	Draw.Text ("E A R T H  D E F E N D E R S", 45, wy, font4, 30)
	mousewhere (mouseX, mouseY, click)
	Draw.Text ("Play", 225, 275, font3, white)
	Draw.Text ("Instructions", 180, 225, font3, white)
	Draw.Text ("Highscores", 183, 175, font3, white)
	if musicmode = 1 then
	    Pic.Draw (music_on, 255, 0, picMerge)
	end if
	if musicmode = -1 then
	    Pic.Draw (music_off, 255, 0, picMerge)
	end if
	if soundmode = 1 then
	    Pic.Draw (sound_on, 165, 0, picMerge)
	end if
	if soundmode = -1 then
	    Pic.Draw (sound_off, 165, 0, picMerge)
	end if
	View.Set ("offscreenonly")
	View.Update
	if mouseX >= 165 and mouseX <= 245 and mouseY >= 0 and mouseY <= 90 and click = 1 then
	    soundmode *= -1
	    click := 0
	    delay (100)
	end if
	if mouseX >= 255 and mouseX <= 305 and mouseY >= 0 and mouseY <= 90 and click = 1 then
	    musicmode *= -1
	    click := 0
	    delay (100)
	end if
	if mouseX >= 225 and mouseX <= 280 and mouseY >= 275 and mouseY <= 295 then
	    Draw.Text ("Play", 225, 275, font3, 49)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	if mouseX >= 180 and mouseX <= 325 and mouseY >= 225 and mouseY <= 245 then
	    Draw.Text ("Instructions", 180, 225, font3, 40)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	if mouseX >= 183 and mouseX <= 328 and mouseY >= 175 and mouseY <= 195 then
	    Draw.Text ("Highscores", 183, 175, font3, yellow)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	if mouseX >= 225 and mouseX <= 280 and mouseY >= 275 and mouseY <= 295 and click = 1 then
	    screen := 2
	    exit
	end if
	if mouseX >= 180 and mouseX <= 325 and mouseY >= 225 and mouseY <= 245 and click = 1 then
	    screen := 1
	    exit
	end if
	if mouseX >= 183 and mouseX <= 328 and mouseY >= 175 and mouseY <= 195 and click = 1 then
	    screen := 5
	    exit
	end if
	delay (10)
    end loop
end titlepage

procedure instructionspage
    loop
	cls
	Pic.Draw (home, 0, 0, picCopy)
	Pic.Draw (arrows, 0, -20, picMerge)
	Pic.Draw (xKey, -30, 17, picMerge)
	Pic.Draw (zKey, 210, 0, picMerge)
	Draw.Text (instructions1, 10, 350, font6, white)
	Draw.Text (instructions2, 10, 330, font6, white)
	Draw.Text (instructions3, 10, 310, font6, white)
	Draw.Text ("________________________", 35, 270, font7, white)
	Draw.Text (control1, 180, 210, font7, white)
	Draw.Text (control2, 170, 50, font9, white)
	Draw.Text (control3, 30, 50, font9, white)
	Draw.Text (control4, 360, 50, font9, white)
	Draw.Text ("ALERT! ALERT! ALERT!", 95, 400, font5, 40)
	Draw.Text ("Back", 10, 465, font3, white)
	mousewhere (mouseX, mouseY, click)
	View.Set ("offscreenonly")
	View.Update
	if mouseX >= 10 and mouseX <= 80 and mouseY >= 465 and mouseY <= 495 then
	    Draw.Text ("Back", 10, 465, font3, 40)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	if mouseX >= 10 and mouseX <= 95 and mouseY >= 465 and mouseY <= 490 and click = 1 then
	    screen := 0
	    click := 1
	    exit
	end if
	delay (10)
    end loop
end instructionspage

%%%%% MAIN CODE %%%%%
setscreen ("graphics:500;500")     %Feel free to change screen dimension!
open : stream1, "highscores.txt", get
stream += 1
get : stream1, strname : *
get : stream1, strname : *

loop
exit when eof (stream1)
    get : stream1, strname, strscore, strcombo
    new prevnames, upper (prevnames) + 1
    prevnames (upper (prevnames)) := strname
    new prevscores, upper (prevnames) + 1
    prevscores (upper (prevnames)) := strscore
    new prevhighestmulti, upper (prevnames) + 1
    prevhighestmulti (upper (prevnames)) := strcombo
end loop

close (stream1)
stream -= 1
open : stream1, "highscores.txt", put
stream += 1
put : stream1, "Name" : 20, "Score" : 20, "Highest Multiplier" : 30
put : stream1, repeat ("*", 100)
for i : 1 .. upper (prevnames)
    put : stream1, prevnames (i) : 20, prevscores (i) : 20, prevhighestmulti (i) : 20
end for
close (stream1)
stream -= 1
loop
    if click = 1 and screen = 0 then
	titlepage
    end if
    if click = 1 and screen = 1 then
	instructionspage
	screen := 0
    end if
    if click = 1 and screen = 2 then
	startscreen ()
    end if
    if click = 1 and screen = 3 then
	reset ()
	gameScreen ()
    end if
    if click = 1 and screen = 4 then
	endscreen ()
	reset ()
    end if
    if click = 1 and screen = 5 then
	highscorescreen ()
    end if
end loop
