-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false

	v.flag = 407
end

-- check trigger
function update(me, dt)

	if isFlag( v.flag, 0 ) and node_isEntityIn(me, v.n) then

		setFlag( v.flag, 1 )

		setControlHint("Nejl: Bitte tu das nicht, du verschreckst sonst das Licht !", 0, 0, 0, 4 )
	end

end
