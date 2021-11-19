function hasComponents(entity, componentList)
	for component in all(componentList) do
        if not entity[component] then return false end
    end
    return true
end

-- iterate through entire table of entities (world)
-- run a custom function via the second parameter
function createSystem(componentList, processFunc)
    return function(entityContainer)
        for entity in all(entityContainer) do
            if hasComponents(entity, componentList) then processFunc(entity) end
        end
    end
end

-- basic AABB collision detection using pos and box components
function coll(e1, e2)
	if e1.pos.x < e2.pos.x + e2.box.w and
		e1.pos.x + e1.box.w > e2.pos.x and
		e1.pos.y < e2.pos.y + e2.box.h and
		e1.pos.y + e1.box.h > e2.pos.y then

		return true
	end
	return false
end