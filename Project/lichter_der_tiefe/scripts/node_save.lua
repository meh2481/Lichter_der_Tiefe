-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()
	v.inNode = false
	v.flag = 704
	
	if node_isFlag(me, 1) then
		v.saved = true
		node_setFlag(me, 0)
		
		if isFlag(801, 1) then
			learnSong(101)
		end
		if isFlag(901, 1) then
			learnSong(102)
		end
		if isFlag(1001, 1) then
			learnSong(103)
		end
		if isFlag(1100, 1) then
			learnSong(104)
		end
	else
		v.saved = false
	end
end

-- check trigger
function update(me, dt)

	-- enter node
	if not v.inNode and node_isEntityIn(me, v.n) then

		v.inNode = true

		if isForm(0) then

			if not v.saved then

				v.saved = true

				pause()
				node_setFlag(me, 1)
				savePoint( me )
				node_setFlag(me, 0)
				unpause()
			end

			changeForm(1)
			setFlag(v.flag, 1)
		end

	end

	-- leave node
	if v.inNode and not node_isEntityIn(me, v.n) then

		v.inNode = false
	end

end