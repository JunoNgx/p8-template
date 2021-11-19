transitState = {
	name = "transit",
	timer = 0,
	destinationState,
	init = function()

	end,

	update = function(self)
		if (self.timer > 0) then
			self.timer -=1
		else 
			currentState = self.destinationState
			currentState:init()
		end
	end,
	
	draw = function(self)

	end
}

function transit(_state)
	fadeOverlay:fade("out", 30)
	currentState = transitState
	transitState.destinationState = _state
	transitState.timer = 28
end