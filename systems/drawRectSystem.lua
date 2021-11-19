function createDrawRectSystem()
    return createSystem(
        {"id", "pos", "box"},
        function(e)
            if (e.id.class == "rect") then
                rectfill(e.pos.x, e.pos.y, e.pos.x + e.box.w, e.pos.y+ e.box.h, 8)
            end
        end
    )
end