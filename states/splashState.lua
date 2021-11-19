splashState = {
	name = "splash",
	splashTimer,
	init = function(self)
		fadeOverlay:fade("in", 30)
		self.splashTimer = 45
	end,
	update = function(self)
		if (self.splashTimer > 0) then
			self.splashTimer -= 1
		else
			transit(menuState)
		end
	end,
	draw = function()
		spr(192, 32, 48, 64, 32)
	end
}