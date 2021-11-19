menuState = {
	name = "menu",
	init = function(self)
		fadeOverlay:fade("in", 30)
	end,
	update = function(self)
		if (btnp(5)) then
			transit(gameplayState)
		end
	end,
	draw = function(self)
		print("main menu", 16, 16, 7)
		print("press x to transit", 16, 96, 7)
	end
}