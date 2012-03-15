%Pong Version 3.6

%Repeat Game Loop
loop

    %Setup Screen
    setscreen ("graphics")
    setscreen ("nocursor")

    randomize
    colorback (7)
    color (brightred)
    cls

    %Player 1
    var x : int := maxx - 60
    var y : int := 150

    %Player 2
    var x2 : int := 50
    var y2 : int := 150

    %1P or 2P
    var player : string

    %Difficulty
    var difficulty : string (1)
    var difficulty2 : int := 0

    %Replay
    var replay : string
    var replay2 : string

    %Ball
    var x3 : int := maxx div 2
    var y3 : int := maxy div 2

    %Ball Randomize
    var randx : int
    var randy : int

    %Ball Change
    var xchange : int := -1
    var ychange : int := 1

    %Determines if Key is Pressed
    var chars : array char of boolean

    %Special Moves
    var special : string := 'n'

    %Determines If User Wants Help
    var help : string (1)

    %Determines if Key is Pressed after Winning the Game
    var null : string (1)

    %Points
    var points1 : int := 0
    var points2 : int := 0

    %Different Fonts
    var font1, font2, font3 : int
    font1 := Font.New ("sans serif:24:bold")
    font2 := Font.New ("sans serif:10:bold")
    font3 := Font.New ("sans serif:40:bold")

    %Game Speed
    var speed : string (1)
    var speed2 : int := 0
    var speed3 : string (1)
    var speedup : int := 0
    var speedup2 : string
    var changespeed : string
    var changespeed2 : int := 1
    var changespeed3 : int

    %Score Limit
    var score : int := 0
    %Makes Ball Flash at Beginning of Game
    var flash : int := 0

    %Setup
    loop
	cls
	Font.Draw ("Pong", 255, 250, font3, brightred) %Title
	locate (12, 35)
	put "Version 3.6"
	locate (13, 34)
	put "By: Alex Kidd"
	locate (23, 34)
	put "Press H for Help."
	locate (24, 27)
	put "Press any other Key to Continue"
	getch (help)
	if help = 'h' or help = 'H' then
	    cls
	    Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	    Font.Draw ("Help", 275, maxy - 57, font1, brightred)
	    locate (6, 6)
	    put "Controls:" ..
	    locate (7, 10)
	    put "Player 1 Uses Up and Down Arrows."
	    locate (8, 10)
	    put "Use Left to Smash the Ball and Right to Reverse the Ball.(If Enabled)"
	    locate (9, 10)
	    put "Player 2 Uses W and S Keys."
	    locate (10, 10)
	    put "Use D to Smash the Ball and A to Reverse the Ball.(If Enabled)"
	    locate (12, 20)
	    put "In Survival Mode a point is given every time,"
	    locate (13, 20)
	    put "the ball makes it to the computers side."
	    locate (14, 20)
	    put "The computer will never miss."
	    locate (15, 20)
	    put "Try and Get the Highest Score."
	    locate (24, 30)
	    put "Press any Key to Continue"
	    getch (null)
	end if
	exit when help not= 'h' and help not= 'H'
    end loop

    loop
	cls
	Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	Font.Draw ("Mode Select", 225, maxy - 57, font1, brightred)
	locate (12, 20)
	put "Would you like to play 1P, 2P, or Survival(1P)?"
	locate (13, 20)
	put "Type 1,2, or s and press Enter. " ..
	get player
	if player = '1' or player = '1p' or player = '1P' then
	    player := '1'
	elsif player = '2' or player = '2p' or player = '2P' then
	    player := '2'
	elsif player = 's' or player = 'S' or player = 'Survival' or player = 'survival' then
	    player := 's'
	end if
	exit when player = '1' or player = '2' or player = 's'
    end loop

    if player = '1' then
	cls
	Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	Font.Draw ("Comp. Difficulty", 200, maxy - 57, font1, brightred)
	locate (12, 20)
	put "Enter Computer Difficulty between 1 and 3"
	locate (13, 20)
	put "1 is the Easiest and 3 is the Hardest"
	locate (15, 20)
	put "If you write in a Stupid Number"
	locate (16, 20)
	put "be Prepared for a Stupidly Hard Computer!"
	getch (difficulty)
	difficulty2 := strint (difficulty)
    end if

    cls
    Font.Draw ("Pong", 275, maxy - 22, font1, brightred)     %Title
    Font.Draw ("Game Speed", 225, maxy - 57, font1, brightred)
    locate (12, 20)
    put "Enter Game Speed between 0 and 9"
    locate (13, 20)
    put "0 is the Fastest and 9 is the Slowest"
    getch (speed)
    speed2 := strint (speed)
    speed3 := speed

    if player not= 's' then
	loop
	    cls
	    Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	    Font.Draw ("Speed Increase", 205, maxy - 57, font1, brightred)
	    locate (12, 20)
	    put "Choose when speed should increase if game goes,"
	    locate (13, 20)
	    put "for a long time without anyone missing the ball."
	    locate (15, 20)
	    put "Choises are: Never, long, medium, or short"
	    locate (16, 24)
	    put "Type n, l, m, or s and press Enter. " ..
	    get changespeed
	    if changespeed = 'n' or changespeed = 'N' or changespeed = 'never' or changespeed = 'Never' then
		changespeed2 := 0
	    elsif changespeed = 'l' or changespeed = 'L' or changespeed = 'long' or changespeed = 'Long' then
		changespeed2 := 5000
	    elsif changespeed = 'm' or changespeed = 'M' or changespeed = 'medium' or changespeed = 'Medium' then
		changespeed2 := 2500
	    elsif changespeed = 's' or changespeed = 'S' or changespeed = 'short' or changespeed = 'Short' then
		changespeed2 := 1000
	    end if
	    exit when changespeed2 = 0 or changespeed2 = 5000 or changespeed2 = 2500 or changespeed2 = 1000
	end loop
    end if
    changespeed3 := changespeed2

    if player not= 's' then
	loop
	    cls
	    Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	    Font.Draw ("Special", 267, maxy - 57, font1, brightred)
	    locate (12, 20)
	    put "Would you like to use Special Moves?"
	    locate (13, 20)
	    put "You can use Smash, Reverse, Both or None."
	    locate (14, 20)
	    put "Type s, r, b, or n and press Enter. " ..
	    get special
	    if special = 's' or special = 'S' or special = 'smash' or special = 'Smash' then
		special := 's'
	    elsif special = 'r' or special = 'R' or special = 'reverse' or special = 'Reverse' then
		special := 'r'
	    elsif special = 'b' or special = 'B' or special = 'both' or special = 'Both' then
		special := 'b'
	    elsif special = 'n' or special = 'N' or special = 'none' or special = 'None' then
		special := 'n'
	    end if
	    exit when special = 's' or special = 'r' or special = 'b' or special = 'n'
	end loop
    end if

    if player not= 's' then
	cls
	Font.Draw ("Pong", 275, maxy - 22, font1, brightred) %Title
	Font.Draw ("Points", 270, maxy - 57, font1, brightred)
	locate (12, 20)
	put "How many Points would you like to Play too?"
	locate (13, 20)
	put "Type Points and press Enter. " ..
	get score
    end if

    %Game Loop
    loop

	setscreen ("offscreenonly")
	%Randomizes Starting Ball Direction
	randint (randx, 1, 2)
	randint (randy, 1, 2)
	if randx = 1 then
	    xchange := -2
	else
	    xchange := 2
	end if

	if randy = 1 then
	    ychange := -2
	else
	    ychange := 2
	end if

	loop
	    if player not= 's' and changespeed2 not= 0 and speed2 not= 1 then
		speedup := speedup + 1
		speedup2 := intstr (speedup)
		if speedup > changespeed2 then
		    speed2 := speed2 - 1
		    speed3 := intstr (speed2)
		    changespeed2 := changespeed2 + changespeed2
		end if
	    end if
	    delay (speed2)
	    cls

	    %Player 1 Score
	    if player not= 's' then
		locate (23, 3)
		put points1
	    end if

	    %Player 2 Score
	    locate (23, 78)
	    put points2

	    %Draws Everything on Screen
	    drawfillbox (x, y, x + 10, y + 80, 3)     %Player1
	    drawfillbox (x2, y2, x2 + 10, y2 + 80, 6)     %Player 2
	    drawfillbox (0, 0, maxx, 30, 10)     %Top of play area
	    drawfillbox (0, maxy, maxx, maxy - 30, 10)     %Bottom of play area
	    drawfillbox (x3, y3, x3 + 5, y3 + 5, 14)     %Ball
	    Font.Draw ("Pong", 275, maxy - 22, font1, brightred)     %Title
	    Font.Draw ("P2", 15, 17, font2, brightred)     %Write Player1 under Player1
	    Font.Draw ("P1", 612, 17, font2, brightred)     %Write Player2 under Player2
	    Font.Draw ("Speed", 280, 17, font2, brightred)     %Write Speed
	    Font.Draw (speed3, 324, 17, font2, brightred)     %Write Speed
	    View.Update

	    %Makes Ball Flash at Beginning of Game
	    if flash = 0 then
		for a : 1 .. 3
		    drawfillbox (x3, y3, x3 + 5, y3 + 5, 14)
		    delay (200)
		    View.Update
		    drawfillbox (x3, y3, x3 + 5, y3 + 5, red)
		    delay (200)
		    View.Update
		end for
		flash := 1
	    end if

	    %Player 1 Movement
	    Input.KeyDown (chars)
	    if chars (KEY_UP_ARROW) and y < 286 then
		y := y + 2
	    end if
	    if chars (KEY_DOWN_ARROW) and y > 33 then
		y := y - 2
	    end if

	    %Player 2 Movement
	    if player = '2' then
		if chars ('w') and y2 < 286 then
		    y2 := y2 + 2
		end if
		if chars ('s') and y2 > 33 then
		    y2 := y2 - 2
		end if
	    else
		if difficulty2 = 1 then
		    if y3 > y2 + 80 and y2 < 286 and x3 < 200 and xchange = -2 then
			y2 := y2 + 2
		    elsif y3 < y2 and y2 > 33 and x3 < 200 and xchange = -2 then
			y2 := y2 - 2
		    elsif y3 > y2 + 80 and y2 < 286 and xchange = -4 then
			y2 := y2 + 2
		    elsif y3 < y2 and y2 > 33 and xchange = -4 then
			y2 := y2 - 2
		    end if

		elsif difficulty2 = 2 then
		    if y3 > y2 + 60 and y2 < 286 and x3 < 235 and xchange = -2 then
			y2 := y2 + 2
		    elsif y3 < y2 + 20 and y2 > 33 and x3 < 235 and xchange = -2 then
			y2 := y2 - 2
		    elsif y3 > y2 + 80 and y2 < 286 and xchange = -4 then
			y2 := y2 + 2
		    elsif y3 < y2 and y2 > 33 and xchange = -4 then
			y2 := y2 - 2
		    end if

		elsif difficulty2 = 3 then
		    if y3 > y2 + 40 and y2 < 286 and x3 < 270 and xchange = -2 then
			y2 := y2 + 2
		    elsif y3 < y2 + 40 and y2 > 33 and x3 < 270 and xchange = -2 then
			y2 := y2 - 2
		    elsif y3 > y2 + 80 and y2 < 286 and xchange = -4 then
			y2 := y2 + 2
		    elsif y3 < y2 and y2 > 33 and xchange = -4 then
			y2 := y2 - 2
		    end if

		else
		    if y3 > y2 + 80 and y2 < 286 then
			y2 := y2 + 2
		    end if
		    if y3 < y2 and y2 > 33 then
			y2 := y2 - 2
		    end if
		end if
	    end if

	    %Ball Direction Change
	    if y3 > 362 then
		ychange := -2
	    end if
	    if y3 < 33 then
		ychange := 2
	    end if
	    if x3 > maxx - 5 then
		xchange := -2
	    end if
	    if x3 < 0 then
		xchange := 2
	    end if

	    %Player 1 Hitting The Ball
	    if x3 > x - 5 and x3 < x + 10 and y3 > y and y3 < y + 80 then
		xchange := -2
		if ychange = 0 then
		    randint (randy, 1, 2)
		    if randy = 1 then
			ychange := -2
		    else
			ychange := 2
		    end if
		end if
	    end if

	    %Player 2 Hitting The Ball
	    if x3 < x2 + 11 and x3 > x2 and y3 > y2 and y3 < y2 + 80 then
		xchange := 2
		if ychange = 0 then
		    randint (randy, 1, 2)
		    if randy = 1 then
			ychange := -2
		    else
			ychange := 2
		    end if
		end if
	    end if

	    %Player 1 Specials
	    if special = 'b' or special = 's' then
		if chars (KEY_LEFT_ARROW) and x3 > x - 5 and x3 < x + 10 and y3 > y and y3 < y + 80 then
		    ychange := 0
		    xchange := -4
		end if
	    end if
	    if special = 'b' or special = 'r' then
		if chars (KEY_RIGHT_ARROW) and x3 > x - 5 and x3 < x + 10 and y3 > y and y3 < y + 80 then
		    if ychange = 2 then
			ychange := -2
		    else
			ychange := 2
		    end if
		end if
	    end if

	    %Player 2 Special
	    if special = 'b' or special = 's' then
		if chars ('d') and x3 < x2 + 11 and x3 > x2 and y3 > y2 and y3 < y2 + 80 then
		    ychange := 0
		    xchange := 4
		end if
	    end if
	    if special = 'b' or special = 'r' then
		if chars ('a') and x3 < x2 + 11 and x3 > x2 and y3 > y2 and y3 < y2 + 80 then
		    if ychange = 2 then
			ychange := -2
		    else
			ychange := 2
		    end if
		end if
	    end if

	    %Ball Movement
	    x3 := x3 + xchange
	    y3 := y3 + ychange

	    %Random Direction After point is Scored
	    if x3 > maxx - 30 or x3 < 30 then
		randint (randx, 1, 2)
		randint (randy, 1, 2)
		if randx = 1 then
		    xchange := -2
		else
		    xchange := 2
		end if

		if randy = 1 then
		    ychange := -2
		else
		    ychange := 2
		end if
	    end if

	    %Player 2 Points
	    if x3 > maxx - 30 then
		points1 := points1 + 1
		x3 := maxx div 2
		y3 := maxy div 2
		speed2 := strint (speed)
		speed3 := speed
		changespeed2 := changespeed3
		speedup := 0

		for a : 1 .. 3
		    exit when points1 = score or points2 = score
		    drawfillbox (x3, y3, x3 + 5, y3 + 5, 14)
		    delay (200)
		    View.Update
		    drawfillbox (x3, y3, x3 + 5, y3 + 5, red)
		    delay (200)
		    View.Update
		end for

		delay (1000)
	    end if

	    %Player 1 Points
	    if player = '1' or player = '2' then
		if x3 < 30 then
		    points2 := points2 + 1
		    x3 := maxx div 2
		    y3 := maxy div 2
		    speed2 := strint (speed)
		    speed3 := speed
		    changespeed2 := changespeed3
		    speedup := 0

		    for a : 1 .. 3
			exit when points1 = score or points2 = score
			drawfillbox (x3, y3, x3 + 5, y3 + 5, 14)
			delay (200)
			View.Update
			drawfillbox (x3, y3, x3 + 5, y3 + 5, red)
			delay (200)
			View.Update
		    end for

		    delay (1000)
		end if
	    else
		if x3 < 61 then
		    points2 := points2 + 1
		end if
	    end if

	    %Winning Game
	    if score not= 0 then
		exit when points1 = score or points2 = score
	    elsif player = 's' then
		exit when x3 > maxx - 40
	    end if
	end loop

	cls
	if player not= 's' then
	    if points2 = score then
		Font.Draw ("Congratulations Player 1, you Win!!!", 65, maxy div 2, font1, brightred)
	    elsif points1 = score and player = '2' then
		Font.Draw ("Congratulations Player 2, you Win!!!", 65, maxy div 2, font1, brightred)
	    else
		Font.Draw ("YOU LOSE!!!", 220, maxy div 2, font1, brightred)
	    end if
	else
	    Font.Draw ("Congratulations!!!", 200, maxy div 2, font1, brightred)
	    locate (15, 28)
	    put "You got ", points2, " points on speed ", speed2, "."
	end if
	locate (24, 30)
	delay (1000)
	put "Press any key to Continue."
	View.Update
	getch (null)

	replay := ' '
	replay2 := ' '
	points1 := 0
	points2 := 0
	y := 150
	y2 := 150
	x3 := maxx div 2
	y3 := maxy div 2
	flash := 0
	speed2 := strint (speed)
	changespeed2 := changespeed3
	speedup := 0

	setscreen ("nooffscreenonly")
	loop
	    cls
	    locate (12, 20)
	    put "Would you like to Play Again?"
	    locate (13, 20)
	    put "Type Yes or No and press Enter. " ..
	    get replay
	    exit when replay = 'n' or replay = 'N' or replay = 'No' or replay = 'no'
	    exit when replay = 'y' or replay = 'Y' or replay = 'Yes' or replay = 'yes'
	end loop
	loop
	    exit when replay = 'n' or replay = 'N' or replay = 'No' or replay = 'no'
	    cls
	    delay (500)
	    locate (12, 20)
	    put "Would you like to Play Again With Same Settings?"
	    locate (13, 20)
	    put "Type Yes or No and press Enter. " ..
	    get replay2
	    exit when replay2 = 'n' or replay2 = 'N' or replay2 = 'No' or replay2 = 'no'
	    exit when replay2 = 'y' or replay2 = 'Y' or replay2 = 'Yes' or replay2 = 'yes'
	end loop
	exit when replay2 = 'n' or replay2 = 'N' or replay2 = 'No' or replay2 = 'no'
	exit when replay = 'n' or replay = 'N' or replay = 'No' or replay = 'no'
    end loop
    exit when replay = 'n' or replay = 'N' or replay = 'No' or replay = 'no'
end loop
