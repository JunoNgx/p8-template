

gameplayState = {
	name = "gameplay",
	init = function(self)

		fadeOverlay:fade("in", 30)
		world = {}
		e1 = Entity(64, 32, 0, 0.1)
		e1.shadow = {x=1, y=1}
		add(world, e1)
  
		e2 = Entity(32, 32, 0, -1)
		e2.shadow = {x=2, y=3}
		add(world, e2)
  
		add(world, Entity(96, 32, 1, 0))

		-- for i=1,200 do
		-- 	e = Entity(rnd(127), rnd(127), 0.5-rnd(), 0.5-rnd())
		-- 	e.shadow = {x=2, y=2}
		-- 		add(world, e)
		-- end

		-- Timer(4, function()
		-- 	add(world, Entity(12, 12, 1, 1))
		-- end)
		add(visualSystems, createDrawShadowSystem());
		add(visualSystems, createDrawRectSystem());
		add(logicSystems, createMotionSystem());

		end,
	update = function(self)
		if (btn(5)) then transit(menuState) end
	end,
	draw = function(self)
		print(count(world))
	end
}