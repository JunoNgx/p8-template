function createOutOfBoundsLoopSystem()
    return createSystem(
        {"outofboundsloop"},
		function(e)
			if (e.pos.x > 131) then e.pos.x = -4 end
			if (e.pos.x < -4) then e.pos.x = 131 end
			if (e.pos.y > 131) then e.pos.y = -4 end
			if (e.pos.y < -4) then e.pos.y = 131 end
		end
    )
end