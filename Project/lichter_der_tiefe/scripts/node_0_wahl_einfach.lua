-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 004


    -- if isFlag(v.flag,0) then
        node_setCursorActivation( me, true )
    -- end
end



function activate(me)

    setFlag(v.flag, 1)
    node_setCursorActivation( me, false )
    setControlHint("Emily: Immer der Nase nach...", 0, 0, 0, 3)
end