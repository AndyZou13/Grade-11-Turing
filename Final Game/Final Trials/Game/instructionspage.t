setscreen ("graphics:500;500")

var mouseX, mouseY, click : int

var font5 : int
font5 := Font.New ("impact:30")
var font6 : int
font6 := Font.New ("futura:15")
var font7 : int
font7 := Font.New ("impact:25")
var font8 : int
font8 := Font.New ("chewy:22")
var font9 : int
font9 := Font.New ("impact:15")

var home : int
home := Pic.FileNew ("titlepage.bmp")
Pic.Draw (home, 0, 0, picCopy)
var arrows : int
arrows := Pic.FileNew ("arrowkeys.bmp")
Pic.SetTransparentColor (arrows, white)
Pic.Draw (arrows, -100, -20, picMerge)
var xKey : int
xKey := Pic.FileNew ("xKey.bmp")
Pic.SetTransparentColor (xKey, white)
Pic.Draw (xKey, 240, 17, picMerge)

var instructions1 : string := "    We've been targeted and are under attack by an unknown"
var instructions2 : string := "       alien species. All our defences are down and you're our"
var instructions3 : string := "        only hope to protect the Earth from being destroyed!"
Draw.Text (instructions1, 50, 350, font6, white)
Draw.Text (instructions2, 50, 330, font6, white)
Draw.Text (instructions3, 50, 310, font6, white)

var control1 : string := "CONTROLS"
var control2 : string := "arrow keys to move"
var control3 : string := "x-key to shoot"
Draw.Text ("________________________", 35, 270, font7, white)
Draw.Text (control1, 180, 210, font7, white)
Draw.Text (control2, 70, 50, font9, white)
Draw.Text (control3, 300, 50, font9, white)

loop
    loop
	Draw.Text ("ALERT! ALERT! ALERT!", 95, 400, font5, 40)
	delay (185)
	Draw.Text ("ALERT! ALERT! ALERT!", 95, 400, font5, white)
	delay (185)
	mousewhere (mouseX, mouseY, click)
	Draw.Text ("Back", 10, 465, font8, white)
	if mouseX >= 10 and mouseX <= 80 and mouseY >= 465 and mouseY <= 495 then
	    Draw.Text ("Back", 10, 465, font8, 40)
	end if
	exit when mouseX >= 10 and mouseX <= 20 and mouseY >= 465 and mouseY <= 480 and click = 1
    end loop
end loop
