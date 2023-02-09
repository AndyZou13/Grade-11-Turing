setscreen ("graphics:500;500,noecho")
var xu, yu : int := 100
var speed : int := 2
var speedcounter : int := 250
var mousex, mousey, btnnum, btndown, btn : int
var x, y, bn, bd, b : int
var ua : array char of boolean
var xs : array 1 .. 5 of int
var ys : array 1 .. 5 of int
var ss : array 1 .. 5 of int := init (1, 0, 0, 0, 0)
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
var multiplier : int := 1
var displayscore : string := "000000000"
var counter : int := 10
var level : int := 1
var health : int := 10
var highscore : string := ""
var highmultiplier : string := ""
var highestlevel : string := ""
var bul : array 1 .. 3 of array 1 .. 5 of int := init (
    init (-10, -10, -10, -10, -10),
    init (-10, -10, -10, -10, -10),
    init (0, 0, 0, 0, 0)
    )
var scores : flexible array 1 .. 0 of int
var names : flexible array 1 .. 0 of string
var highestmulti : flexible array 1 .. 0 of int
var stream1 : int
var lastbullet : int
var font, font1, font2 : int
font := Font.New ("Chewy:48:Bold")
font1 := Font.New ("Chewy:24:Bold")
font2 := Font.New ("Chewy:36:Bold")
Pic.SetTransparentColor (earthship, white)
Pic.SetTransparentColor (enemyship1, white)
Pic.SetTransparentColor (enemyship2, white)
Pic.SetTransparentColor (enemyship3, white)
Pic.SetTransparentColor (enemyship4, white)
Pic.SetTransparentColor (enemyship5, white)

proc bullet1 () %Procedure to call bullet to the ship
    bul (1) (1) := xu + 3
    bul (2) (1) := yu + 8
    bul (3) (1) := 3
end bullet1

proc bullet2 ()
    bul (1) (2) := xu + 3
    bul (2) (2) := yu + 8
    bul (3) (2) := 3
end bullet2

proc bullet3 ()
    bul (1) (3) := xu + 3
    bul (2) (3) := yu + 8
    bul (3) (3) := 3
end bullet3

proc bullet4 ()
    bul (1) (4) := xu + 3
    bul (2) (4) := yu + 8
    bul (3) (4) := 3
end bullet4

proc bullet5 ()
    bul (1) (5) := xu + 3
    bul (2) (5) := yu + 8
    bul (3) (5) := 3
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
	multiplier := 1
    end if
    if xu + 10 > xs (1) - 10 and xu - 10 < xs (1) + 10 and yu + 10 > ys (1) - 10 and yu - 10 < ys (1) + 10 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	h -= health
    end if
    if bul (1) (1) > xs (1) and bul (1) (1) < xs (1) + 10 and bul (2) (1) > ys (1) - 10 and bul (2) (1) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (1) := -10
	bul (3) (1) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (1) and bul (1) (2) < xs (1) + 10 and bul (2) (2) > ys (1) - 10 and bul (2) (2) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (2) := -10
	bul (3) (2) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (1) and bul (1) (3) < xs (1) + 10 and bul (2) (3) > ys (1) - 10 and bul (2) (3) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (3) := -10
	bul (3) (3) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (1) and bul (1) (4) < xs (1) + 10 and bul (2) (4) > ys (1) - 10 and bul (2) (4) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (4) := -10
	bul (3) (4) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (1) and bul (1) (5) < xs (1) + 10 and bul (2) (5) > ys (1) - 10 and bul (2) (5) < ys (1) + 20 then
	xs (1) := Rand.Int (510, 650)
	ys (1) := Rand.Int (45, 455)
	bul (1) (5) := -10
	bul (3) (5) := 0
	score += 10 * multiplier
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
    if bul (1) (1) > xs (2) and bul (1) (1) < xs (2) + 10 and bul (2) (1) > ys (2) - 10 and bul (2) (1) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (2) and bul (1) (2) < xs (2) + 10 and bul (2) (2) > ys (2) - 10 and bul (2) (2) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (2) and bul (1) (3) < xs (2) + 10 and bul (2) (3) > ys (2) - 10 and bul (2) (3) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (2) and bul (1) (4) < xs (2) + 10 and bul (2) (4) > ys (2) - 10 and bul (2) (4) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (2) and bul (1) (5) < xs (2) + 10 and bul (2) (5) > ys (2) - 10 and bul (2) (5) < ys (2) + 20 then
	xs (2) := Rand.Int (510, 650)
	ys (2) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	score += 10 * multiplier
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
    if bul (1) (1) > xs (3) and bul (1) (1) < xs (3) + 10 and bul (2) (1) > ys (3) - 10 and bul (2) (1) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (3) and bul (1) (2) < xs (3) + 10 and bul (2) (2) > ys (3) - 10 and bul (2) (2) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (3) and bul (1) (3) < xs (3) + 10 and bul (2) (3) > ys (3) - 10 and bul (2) (3) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (3) and bul (1) (4) < xs (3) + 10 and bul (2) (4) > ys (3) - 10 and bul (2) (4) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (3) and bul (1) (5) < xs (3) + 10 and bul (2) (5) > ys (3) - 10 and bul (2) (5) < ys (3) + 20 then
	xs (3) := Rand.Int (510, 650)
	ys (3) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	score += 10 * multiplier
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
    if bul (1) (1) > xs (4) and bul (1) (1) < xs (4) + 10 and bul (2) (1) > ys (4) - 10 and bul (2) (1) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (1) := -10
	bul (3) (1) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (2) > xs (4) and bul (1) (2) < xs (4) + 10 and bul (2) (2) > ys (4) - 10 and bul (2) (2) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (2) := -10
	bul (3) (2) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (3) > xs (4) and bul (1) (3) < xs (4) + 10 and bul (2) (3) > ys (4) - 10 and bul (2) (3) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (3) := -10
	bul (3) (3) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (4) > xs (4) and bul (1) (4) < xs (4) + 10 and bul (2) (4) > ys (4) - 10 and bul (2) (4) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (4) := -10
	bul (3) (4) := 0
	score += 10 * multiplier
	multiplier += 1
	counter -= 1
    end if
    if bul (1) (5) > xs (4) and bul (1) (5) < xs (4) + 10 and bul (2) (5) > ys (4) - 10 and bul (2) (5) < ys (4) + 20 then
	xs (4) := Rand.Int (510, 650)
	ys (4) := Rand.Int (45, 405)
	bul (1) (5) := -10
	bul (3) (5) := 0
	score += 10 * multiplier
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
    
	if bul (1) (1) > xs (5) and bul (1) (1) < xs (5) + 10 and bul (2) (1) > ys (5) - 10 and bul (2) (1) < ys (5) + 20 then
	    xs (5) := Rand.Int (510, 650)
	    ys (5) := Rand.Int (45, 405)
	    bul (1) (1) := -10
	    bul (3) (1) := 0
	    score += 10 * multiplier
	    multiplier += 1
	    counter -= 1
	end if
	if bul (1) (2) > xs (5) and bul (1) (2) < xs (5) + 10 and bul (2) (2) > ys (5) - 10 and bul (2) (2) < ys (5) + 20 then
	    xs (5) := Rand.Int (510, 650)
	    ys (5) := Rand.Int (45, 405)
	    bul (1) (2) := -10
	    bul (3) (2) := 0
	    score += 10 * multiplier
	    multiplier += 1
	    counter -= 1
	end if
	if bul (1) (3) > xs (5) and bul (1) (3) < xs (5) + 10 and bul (2) (3) > ys (5) - 10 and bul (2) (3) < ys (5) + 20 then
	    xs (5) := Rand.Int (510, 650)
	    ys (5) := Rand.Int (45, 405)
	    bul (1) (3) := -10
	    bul (3) (3) := 0
	    score += 10 * multiplier
	    multiplier += 1
	    counter -= 1
	end if
	if bul (1) (4) > xs (5) and bul (1) (4) < xs (5) + 10 and bul (2) (4) > ys (5) - 10 and bul (2) (4) < ys (5) + 20 then
	    xs (5) := Rand.Int (510, 650)
	    ys (5) := Rand.Int (45, 405)
	    bul (1) (4) := -10
	    bul (3) (4) := 0
	    score += 10 * multiplier
	    multiplier += 1
	    counter -= 1
	end if
	if bul (1) (5) > xs (5) and bul (1) (5) < xs (5) + 10 and bul (2) (5) > ys (5) - 10 and bul (2) (5) < ys (5) + 20 then
	    xs (5) := Rand.Int (510, 650)
	    ys (5) := Rand.Int (45, 405)
	    bul (1) (5) := -10
	    bul (3) (5) := 0
	    score += 10 * multiplier
	    multiplier += 1
	    counter -= 1
	end if
    end checkship5

    proc boost () %speed boost for user ship
	if speedcounter <= 150 then
	    speedcounter := 150
	    speed := 1
	    return
	end if
	speed := 4
	speedcounter -= 3
    end boost

    proc shipspawn () %Draws all the enemyships
	Pic.Draw (enemy, xs (1) - 27, ys (1) - 33, picMerge)
	Pic.Draw (enemy, xs (2) - 27, ys (2) - 33, picMerge)
	Pic.Draw (enemy, xs (3) - 27, ys (3) - 33, picMerge)
	Pic.Draw (enemy, xs (4) - 27, ys (4) - 33, picMerge)
	Pic.Draw (enemy, xs (5) - 27, ys (5) - 33, picMerge)
    end shipspawn

    proc Bulletspawn () %draws all the bullets offscreen
	Draw.FillBox (bul (1) (1), bul (2) (1), bul (1) (1) + 4, bul (2) (1) + 4, yellow)
	Draw.FillBox (bul (1) (2), bul (2) (2), bul (1) (2) + 4, bul (2) (2) + 4, yellow)
	Draw.FillBox (bul (1) (3), bul (2) (3), bul (1) (3) + 4, bul (2) (3) + 4, yellow)
	Draw.FillBox (bul (1) (4), bul (2) (4), bul (1) (4) + 4, bul (2) (4) + 4, yellow)
	Draw.FillBox (bul (1) (5), bul (2) (5), bul (1) (5) + 4, bul (2) (5) + 4, yellow)
    end Bulletspawn

    proc bulletLeave () %Cheks if bullet has left the screen
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

    proc bulletMove () %Speed of the bullet
	bul (1) (1) += bul (3) (1)
	bul (1) (2) += bul (3) (2)
	bul (1) (3) += bul (3) (3)
	bul (1) (4) += bul (3) (4)
	bul (1) (5) += bul (3) (5)
    end bulletMove

    proc userinput () %controling user ship
	if ua (KEY_UP_ARROW) then
	    yu += speed
	end if
	if ua (KEY_LEFT_ARROW) then
	    xu -= speed
	end if
	if ua (KEY_RIGHT_ARROW) then
	    xu += speed
	end if
	if ua (KEY_DOWN_ARROW) then
	    yu -= speed
	end if
	if ua ('x') then
	    bullet ()
	end if
	if ua ('z') then
	    boost ()
	end if
	if not ua ('z') then
	    speed := 2
	end if
    end userinput

    proc dispscore () %displaying score
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

    proc highscoreSave () %saving highscore
	if strint (highscore) < strint (displayscore) then
	    highscore := displayscore
	end if
	if strint (highmultiplier) < multiplier then
	    highmultiplier := intstr (multiplier)
	end if
    end highscoreSave

    proc scoreBoard () %Drawning scoreboard
	Draw.FillBox (0, 0, 500, 43, 20)
	Draw.Text ("Health: ", 15, 33, defFontID, white)
	Draw.Text (intstr (h - 16), 70, 33, defFontID, white)
	Draw.Text ("/100", 95, 33, defFontID, white)
	Draw.Text ("Score: ", 15, 5, defFontID, white)
	Draw.Text (displayscore, 65, 5, defFontID, white)
	Draw.Text ("Combo: ", 190, 5, defFontID, white)
	Draw.Text (intstr (multiplier), 240, 5, defFontID, white)
	Draw.FillBox (15, 16, 116, 26, white)
	Draw.FillBox (15, 16, h, 26, green)
	Draw.Box (14, 15, 116, 27, black)
	Draw.Text ("Level: ", 350, 33, defFontID, white)
	Draw.Text (intstr (level), 400, 33, defFontID, white)
	Draw.Text ("Enemy Speed: ", 300, 5, defFontID, white)
	Draw.Text (intstr (ss (1)), 400, 5, defFontID, white)
	Draw.FillBox (175, 15, 270, 26, white)
	Draw.FillBox (170, 15, speedcounter + 20, 26, blue)
	Draw.Box (169, 14, 271, 27, black)
    end scoreBoard

    proc createscoreboard () %Streaming scores to text file
	open : stream1, "highscores.txt", put
	put : stream1, "Name" : 20, "Score" : 20, "Highest Multiplier" : 30, "Highest Level" : 20
	put : stream1, repeat ("*", 150)
	close (stream1)
    end createscoreboard

    process music % playing background music
	loop
	    Music.PlayFile ("Ark.mp3")
	end loop
    end music

    proc Levels () %levels of difficulty
	if counter = 1 then
	    level += 1
	    counter := 10
	end if
	View.Update

    end Levels

    proc countdown () %countdown before gamestart
	Pic.Draw (back, 0, 0, picCopy)
	Draw.FillBox (15, 10, 116, 20, white)
	Pic.Draw (earthship, xu, yu, picMerge)
	shipspawn ()
	scoreBoard ()
	Bulletspawn ()
	View.Set ("offscreenonly")
	View.Update
	Input.KeyDown (ua)
	Draw.Text ("3", 250, 250, font, gray)
	View.Update
	delay (1000)
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
	Draw.Text ("2", 250, 250, font, gray)
	View.Update
	delay (1000)
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
	Draw.Text ("1", 250, 250, font, gray)
	View.Update
	delay (1000)
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
	Draw.Text ("Start!", 180, 250, font, gray)
	View.Update
	delay (1000)
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
    end countdown

    proc startscreen () %difficulty selection
	loop
	    Pic.Draw (back, 0, 0, picCopy)
	    Draw.FillBox (15, 10, 116, 20, white)
	    Pic.Draw (earthship, xu, yu, picMerge)
	    shipspawn ()
	    scoreBoard ()
	    Bulletspawn ()
	    Draw.Text ("Choose difficulty", 75, 375, font2, white)
	    Draw.Text ("Easy", 215, 325, font1, green)
	    Draw.Text ("Medium", 190, 285, font1, yellow)
	    Draw.Text ("Hard", 215, 245, font1, red)
	    Draw.Text ("Insane", 200, 205, font1, white)
	    View.Set ("offscreenonly")
	    View.Update
	    Draw.Text ("Insane", 200, 205, font1, red)
	    View.Set ("offscreenonly")
	    View.Update
	    Mouse.Where (x, y, bn)
	    mousex := x
	    mousey := y
	    if Mouse.ButtonMoved ("down") then
		Mouse.Where (x, y, bn)
		mousex := x
		mousey := y
		if mousex > 215 and mousex < 285 and mousey > 325 and mousey < 350 then
		    health := 10
		    exit
		end if
		if mousex > 190 and mousex < 310 and mousey > 285 and mousey < 310 then
		    health := 20
		    exit
		end if
		if mousex > 215 and mousex < 285 and mousey > 245 and mousey < 270 then
		    health := 50
		    exit
		end if
		if mousex > 200 and mousex < 290 and mousey > 205 and mousey < 230 then
		    health := 100
		    exit
		end if
	    end if
	    delay (10)
	end loop
    end startscreen

    proc gameScreen () %main game code
	createscoreboard ()
	countdown ()
	fork music
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
		exit
	    end if
	    delay (10)
	    if ua (KEY_ESC) then
		Input.Pause
	    end if
	end loop
    end gameScreen

    proc endscreen () % end screen
	loop
	    cls
	    Pic.Draw (back, 0, 0, picCopy)
	    Draw.Text ("Game Over", 80, 350, font, white)
	    h := 16
	    scoreBoard ()
	    dispscore ()
	    Draw.Text ("Play Again", 170, 250, font1, green)
	    Draw.Text ("Main Menu", 165, 180, font1, yellow)
	    View.Update
	    Draw.Text ("Game Over", 80, 350, font, gray)
	    View.Update
	    Mouse.Where (x, y, bn)
	    mousex := x
	    mousey := y
	    if mousex > 170 and mousex < 330 and mousey > 250 and mousey < 275 then
		Mouse.ButtonWait ("down", x, y, btn, btnnum)
		if x > 170 and x < 330 and y > 250 and y < 275 then
		    exit
		end if
	    end if
	end loop
    end endscreen

    proc reset () %reset game
	score := 0
	multiplier := 1
	displayscore := "000000000"
	h := 116
	xu := 100
	yu := 100
	level := 1
	counter := 10
	speedcounter := 250
	for i : 1 .. 2
	    for o : 1 .. 5
		bul (i) (o) := -10
	    end for
	end for
	for i : 1 .. 5
	    xs (i) := Rand.Int (510, 600)
	    bul (3) (i) := 0
	end for
    end reset

    loop
	startscreen ()
	gameScreen ()
	endscreen ()
	reset ()
    end loop
