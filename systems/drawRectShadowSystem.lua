function createDrawShadowSystem()
    return createSystem(
        {"id", "pos", "box", "shadow"},
        function(e)
            if (e.id.class == "rect") then
                rectfill(
                    e.pos.x + e.shadow.x,
                    e.pos.y + e.shadow.y,
                    e.pos.x + e.box.w + e.shadow.x,
                    e.pos.y+ e.box.h + e.shadow.y,
                    5
                )
            end
        end
    )
end