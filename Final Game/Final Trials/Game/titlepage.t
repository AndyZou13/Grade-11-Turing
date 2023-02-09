setscreen ("graphics:500;500")
var mouseX, mouseY, click : int
var screen : int := 1
var font3 : int := Font.New ("chewy:22")
var font4 : int := Font.New ("futura:23")
var font5 : int := Font.New ("impact:30")
var font6 : int := Font.New ("futura:14")
var font7 : int := Font.New ("impact:25")
var font8 : int := Font.New ("chewy:22")
var font9 : int := Font.New ("impact:15")
var home : int := Pic.FileNew ("titlepage.bmp")
var music_on : int := Pic.FileNew ("musicon.bmp")
var music_off : int := Pic.FileNew ("musicoff.bmp")
var sound_on : int := Pic.FileNew ("soundon.bmp")
var sound_off : int := Pic.FileNew ("soundoff.bmp")
var arrows : int := Pic.FileNew ("arrowkeys.bmp")
var xKey : int := Pic.FileNew ("xKey.bmp")
var zKey : int := Pic.FileNew ("zKey.bmp")
Pic.SetTransparentColor (arrows, black)
Pic.SetTransparentColor (xKey, black)
Pic.SetTransparentColor (zKey, black)
Pic.SetTransparentColor (sound_off, white)
Pic.SetTransparentColor (sound_on, white)
Pic.SetTransparentColor (music_off, white)
Pic.SetTransparentColor (music_on, white)

var instructions1 : string := "We've been targeted and are under attack by an unknown"
var instructions2 : string := "  alien species. All our defences are down and you're our"
var instructions3 : string := "    only hope to protect the Earth from being destroyed!"

var control1 : string := "CONTROLS"
var control2 : string := "arrow keys to move"
var control3 : string := "x-key to shoot"
var control4 : string := "z-key to shoot"
screen := 1
procedure titlepage ()
    loop
	cls
	Pic.Draw (home, 0, 0, picMerge)
	Pic.Draw (home, 0, 0, picMerge)
	mousewhere (mouseX, mouseY, click)
	Draw.Text ("E A R T H  D E F E N D E R S", 55, 330, font4, 30)
	Draw.Text ("Play", 225, 245, font3, white)
	Draw.Text ("Instructions", 180, 195, font3, white)
	View.Set ("offscreenonly")
	View.Update
	if mouseX >= 225 and mouseX <= 280 and mouseY >= 245 and mouseY <= 265 then
	    Draw.Text ("Play", 225, 245, font3, 49)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	if mouseX >= 180 and mouseX <= 325 and mouseY >= 195 and mouseY <= 220 then
	    Draw.Text ("Instructions", 180, 195, font3, 40)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	exit when mouseX >= 225 and mouseX <= 280 and mouseY >= 245 and mouseY <= 265 and click = 1
	exit when mouseX >= 180 and mouseX <= 325 and mouseY >= 195 and mouseY <= 220 and click = 1
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
	Draw.Text ("Back", 10, 465, font8, white)
	mousewhere (mouseX, mouseY, click)
	View.Set ("offscreenonly")
	View.Update
	if mouseX >= 10 and mouseX <= 80 and mouseY >= 465 and mouseY <= 495 then
	    Draw.Text ("Back", 10, 465, font8, 40)
	    View.Set ("offscreenonly")
	    View.Update
	end if
	exit when mouseX >= 10 and mouseX <= 20 and mouseY >= 465 and mouseY <= 480 and click = 1
	delay (10)
    end loop
end instructionspage

titlepage
loop
    if click = 1 and screen = 1 and mouseX >= 180 and mouseX <= 325 and mouseY >= 195 and mouseY <= 220 then
	instructionspage
	click := 0
    end if
    if click = 1 and screen = 2 and mouseX >= 10 and mouseX <= 20 and mouseY >= 465 and mouseY <= 480 then
	titlepage
	click := 0
    end if
end loop

