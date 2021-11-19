function createDrawDebugHitboxSystem()
    return createSystem(
        {"id", "pos", "box"},
		function(e)
			if (not C.DEBUG_DRAW_HITBOX) then return end
			rect(
                e.pos.x, e.pos.y,
                e.pos.x + e.box.w,
                e.pos.y + e.box.h,
                9
            )
		end
	)
end