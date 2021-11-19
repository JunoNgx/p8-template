function createMotionSystem()
    return createSystem(
        {"pos", "vel"},
		function(e)
			e.pos.x += e.vel.x
			e.pos.y += e.vel.y
		end
    )
end