%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U
% Course Sec : 05
% First Name : Andy
% Last Name  : Zou
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% GLOBAL VARIABLES %%%%%%%
var font : int
var font1 : int
var font2 : int

%%%%%% MAIN CODE %%%%%%
setscreen("graphics:1050;600")
colourback(white)
cls
font := Font.New ("Arial:12:bold")
font1 := Font.New ("Arial:18:bold")
font2 := Font.New ("Arial:24:bold")
Draw.Box (0, 530, 1050, 550, blue)
Draw.FillBox (0, 530, 1050, 550, brightblue)
Draw.Box (0, 70, 1050, 50, blue)
Draw.FillBox (0, 70, 1050, 50, brightblue)


Draw.Star(180, 350, 280, 450, blue)
Draw.FillStar(180, 350, 280, 450, blue)

Draw.Text("Computer Science", 380, 400, font2, brightblue)
Draw.Text("For kids of all ages!", 405, 350, font1, brightblue)

Draw.Star(870, 350, 770, 450, blue)
Draw.FillStar(870, 350, 770, 450, blue)


Draw.Text ("Contact Info", 20, 205, font1, blue)

Draw.Oval (15, 185, 3, 3, blue)
Draw.FillOval (15, 185, 3, 3, blue)
Draw.Text ("Address : 1000 Carlton Road, Markham, Ontario", 27, 180, font, black)

Draw.Oval (15, 160, 3, 3, blue)
Draw.FillOval (15, 160, 3, 3, blue)
Draw.Text ("Email : 073883183@gapps.yrdsb.ca", 27, 155, font, black)

Draw.Oval (15, 135, 3, 3, blue)
Draw.FillOval (15, 135, 3, 3, blue)
Draw.Text ("Cell : 905-940-8840", 27, 130, font, black)

Draw.Oval (15, 110, 3, 3, blue)
Draw.FillOval (15, 110, 3, 3, blue)
Draw.Text ("Name : Andy Zou", 27, 105, font, black)

Draw.Oval (875, 150, 150, 75, blue)
Draw.Text ("No experience required!", 740, 150, font1, black)
