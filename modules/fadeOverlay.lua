fadeOverlay = {
	isActive = false,
	timer = 0,
	projectedTimeTaken = 0,
	position = 0,
	velocity = 0,
	table = {
		-- Table contains the data of appropriate colors over time
		-- to complete the course of fading in/out
		{0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0},
		{1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0},
		{2 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 0},
		{3 , 3 , 3 , 3 , 3 , 3 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 0},
		{4 , 4 , 4 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 0 , 0 , 0 , 0 , 0},
		{5 , 5 , 5 , 5 , 5 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0},
		{6 , 6 , 13, 13, 13, 13, 5 , 5 , 5 , 5 , 1 , 1 , 1 , 0 , 0},
		{7 , 6 , 6 , 6 , 6 , 13, 13, 13, 5 , 5 , 5 , 1 , 1 , 0 , 0},
		{8 , 8 , 8 , 8 , 2 , 2 , 2 , 2 , 2 , 2 , 0 , 0 , 0 , 0 , 0},
		{9 , 9 , 9 , 4 , 4 , 4 , 4 , 4 , 4 , 5 , 5 , 0 , 0 , 0 , 0},
		{10, 10, 9 , 9 , 9 , 4 , 4 , 4 , 5 , 5 , 5 , 5 , 0 , 0 , 0},
		{11, 11, 11, 3 , 3 , 3 , 3 , 3 , 3 , 3 , 0 , 0 , 0 , 0 , 0},
		{12, 12, 12, 12, 12, 3 , 3 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0},
		{13, 13, 13, 5 , 5 , 5 , 5 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 0},
		{14, 14, 14, 13, 4 , 4 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 0 , 0},
		{15, 15, 6 , 13, 13, 13, 5 , 5 , 5 , 5 , 5 , 1 , 1 , 0 , 0}
	},

	fade = function(self, _mode, _durationInTicks)

		self.isActive = true
		self.timer = 0
		self.projectedTimeTaken = _durationInTicks

		local beginPos, finalPos
		if (_mode == "in") then
			beginPos = 15
			finalPos = 1
		elseif (_mode == "out") then
			beginPos = 1
			finalPos = 15
		end

		self.position = beginPos
		self.velocity = (finalPos - beginPos)/_durationInTicks
	end,

	update = function(self)
		if (self.isActive) then
			self.timer += 1
			self.position += self.velocity

			if self.timer >= self.projectedTimeTaken then
				self.isActive = false
			end

		end
	end,

	draw = function(self)
		if (not self.isActive) then return end

		for color = 0, 15 do
			pal(
				color,
				self.table[color+1][flr(self.position+1)],
				1
			)
		end
		
	end
}
