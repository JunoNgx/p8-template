pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- pico-8 template
-- by Juno Nguyen

-- fade library by kometbomb
-- http://kometbomb.net/pico8/fadegen.html
-- entity component system by selfsame
-- https://www.lexaloffle.com/bbs/?pid=44917
-- boilerplate by ojdon
-- https://github.com/ojdon/pico8-boilerplate

#include Constants.lua

#include modules/core.lua
#include modules/fadeOverlay.lua
#include modules/core.lua

#include states/splashState.lua
#include states/menuState.lua
#include states/gameplayState.lua
#include states/transitState.lua

#include systems/motionSystem.lua

#include systems/drawRectSystem.lua
#include systems/drawRectShadowSystem.lua

#include entities/Timer.lua
#include entities/Entity.lua


function _init()
	resetEntitiesAndSystems()

	currentState = splashState
	-- currentState = gameplayState
	currentState:init()
end

function _update()
	if (currentState.name ~= "transit") then
		for systemId, systemFunc in pairs(logicSystems) do
			systemFunc(world)
		end
	end

	currentState:update()
	fadeOverlay:update()
end

function _draw()
	if (currentState.name ~= "transit") then
		cls()
		for systemId, systemFunc in pairs(visualSystems) do
			systemFunc(world)
		end
	end


	currentState:draw()
	fadeOverlay:draw()
end

function resetEntitiesAndSystems()
	world = {}
	logicSystems = {}
	visualSystems = {}
end

-->8
-- update system
-- updateSystems = {
-- 	motionSys = createSystem({"pos", "vel"},
-- 		function(e)
-- 			e.pos.x += e.vel.x
-- 			e.pos.y += e.vel.y
-- 		end
-- 	),

-- 	timerSys = createSystem ({"timer"},
-- 		function(e)
-- 			if (e.timer.lifetime > 0) then
-- 				e.timer.lifetime -= 1
-- 			else
-- 				e.timer.trigger()
-- 				del(world, e)
-- 			end
-- 		end
-- 	),

-- 	outOfBoundsLoopSys = createSystem({"outofboundsloop"},
-- 		function(e)
-- 			if (e.pos.x > 131) then e.pos.x = -4 end
-- 			if (e.pos.x < -4) then e.pos.x = 131 end
-- 			if (e.pos.y > 131) then e.pos.y = -4 end
-- 			if (e.pos.y < -4) then e.pos.y = 131 end
-- 		end
-- 	),

-- 	collisionSys = createSystem({"id"},
-- 		function(e)
-- 			if (e.id.class == "player") then
-- 				enemies = getid("enemy")
-- 				for ee in all(enemies) do
-- 					-- if coll()
-- 				end
-- 			end
-- 		end
-- 	)
-- }

-->8
-- draw systems
-- drawSystems = {
-- 	-- keys are removed so each system can be iterated through in sequence
-- 	-- which should facilitate layer drawing

-- 	-- shadow draw
-- 	createSystem({"id", "pos", "box", "shadow"},
-- 		function(e)

-- 			if (e.id.class == "rect") then
-- 				rectfill(
-- 					e.pos.x + e.shadow.x,
-- 					e.pos.y + e.shadow.y,
-- 					e.pos.x + e.box.w + e.shadow.x,
-- 					e.pos.y+ e.box.h + e.shadow.y,
-- 					5
-- 				)
-- 			end
-- 		end
-- 	),

-- 	-- main draw
-- 	createSystem({"id", "pos", "box"},
-- 		function(e)
-- 			if (e) then
-- 				if (e.id) then
-- 					if (e.id.class == "rect") then
-- 						rectfill(e.pos.x, e.pos.y, e.pos.x + e.box.w, e.pos.y+ e.box.h, 8)
-- 					end
-- 				end
-- 			end
-- 		end
-- 	),

-- 	-- hitbox draw when enabled
-- 	createSystem({"id", "pos", "box"},
-- 		function(e)
-- 			if not (C.DEBUG_DRAW_HITBOX) then return end
-- 			rect(e.pos.x, e.pos.y, e.pos.x + e.box.w, e.pos.y+ e.box.h, 8)
-- 		end
-- 	)
-- }


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08555580000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05855850000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05588550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05588550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05855850000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08555580000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000077777770077777077777077777007777707777707077077777770000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707700070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007777707000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070070007070007070007007000007000707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000070070070077707070007077707007000007770707000070070070000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77000000000000000000000000000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000000000000000000000003000035000380003a0003900034000320002d000250001f0001d0001d0001f000210000000025000260002200000000000000000000000000000000000000000000000000000
