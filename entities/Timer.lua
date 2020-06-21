function Timer(_lifetimeinsec, _f)
    add(world, {
        timer = {
            lifetime = _lifetimeinsec * 30,
            trigger = _f
        }
    })
end