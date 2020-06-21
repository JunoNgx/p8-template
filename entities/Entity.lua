function Entity(_x , _y, _vx, _vy)

    return {
        id = {
            class = "rect"
        },
        pos = {
            x=_x,
            y=_y,
        },
        vel = {
            x=_vx,
            y=_vy
		},
		-- shadows = {
		-- 	x = 2,
		-- 	y = 2
		-- },
		outofboundsloop = true,
        box = {
            w = 4,
            h = 4
		},
		-- draw = function(self, _shadowoffset_x, _shadowoffset_y)
		-- 	local _sox = (_shadowoffset_x) and _shadowoffset_x or 0
		-- 	local _soy = (_shadowoffset_y) and _shadowoffset_y or 0

		-- 	rectfill(
		-- 		e.pos.x+_sox,
		-- 		e.pos.y+_soy,
		-- 		e.pos.x + e.box.w+_sox,
		-- 		e.pos.y+ e.box.h+_soy,
		-- 	8)
		-- end
    }
end