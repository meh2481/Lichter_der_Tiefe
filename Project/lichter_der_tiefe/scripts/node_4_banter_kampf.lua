-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.flag = 403

    v.warn = 401
end

-- check
function update(me, dt)

    if isFlag(v.warn, 1) and isFlag(v.flag, 0) and node_isEntityIn(me, v.n) then

		setFlag(v.flag, 1)

		setControlHint(DATA_TEXTS.banter_kampf_1, 0, 0, 0, 4 )
	end
end

