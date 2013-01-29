-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
	v.mejais = getEntity("1_mejais_ghost")
	v.schacht = getNode("1_banter_schacht")
	v.flag = 107
	v.flagCerajt = 702
	v.flagBeleben = 108
	v.path = 306
	v.time = 0
	v.dt = 0
	
	--debug:
	--setFlag(v.flag, 0)
	
	if isFlag(v.flag, 0) and isFlag(v.flagCerajt, 1) then
		if getFlag(v.path) > 1 then
			setFlag(v.flag, 1)				-- gutes Ende
		else
			setFlag(v.flag, 12)				-- schlechtes Ende
		end
	end
	
end

-- check trigger
function update(me, dt)	

	if getFlag(v.flag) >= 12 or isFlag(v.flag,0) then
		-- nothing
	
	elseif isFlag(v.flag, 1) then
		if node_isEntityIn(me, v.n) then
			setFlag(v.flag, 2)
			
			disableInput()
			setCutscene(1,1)
			
			entity_setState(v.mejais, STATE_WAIT)
			setControlHint("Mejais: Emily?", 0,0,0, 3)
			entity_swimToPosition(v.mejais, entity_getPosition(v.n))
		end
	
	elseif isFlag(v.flag, 2) then
		if entity_isEntityInRange(v.mejais, v.n, 200) then
			setFlag(v.flag, 3)
			v.time = 0
			v.dt = 4
			
			entity_swimToPosition(v.mejais, entity_getPosition(v.mejais))
			setControlHint("Emily: Die Verwandlungen - ich kann sie nicht mehr aufhalten.", 0,0,0, v.dt)
		end

	
	elseif isFlag(v.flag, 3) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 4)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais: Du warst zu lange der Macht der Kristalle ausgesetzt.", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 4) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 5)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Ich habe Angst! Ich koennte Nejl verletzen!", 0,0,0, v.dt)
		end
	
	elseif isFlag(v.flag, 5) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 6)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais: Du musst zurueck in deine Welt.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 6) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 7)
			v.time = 0
			v.dt = 3
			
			setControlHint("Emily: Dann waere Nejl ausser Gefahr!", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 7) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 8)
			v.time = 0
			v.dt = 4
			
			setControlHint("Emily: Aber die Blumen sind verwelkt, wie soll ich hier weg kommen?", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 8) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 9)
			v.time = 0
			v.dt = 3
			
			setControlHint("Mejais: Ich kann dir eine letzte Chance geben.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 9) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 10)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais: Ich werde ins Jenseits uebergehen. Ich geben meine letzte Kraft in die Blumen.", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 10) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 11)
			v.time = 0
			v.dt = 4
			
			setControlHint("Mejais: Dann werden sie noch einmal aufleben. Komm!", 0, 0, 0, v.dt)
		end
	
	elseif isFlag(v.flag, 11) then
		v.time = v.time + dt
		if v.time >= v.dt then
			setFlag(v.flag, 12)
			setFlag(v.flagBeleben, 1)
			
			setCutscene(0)
			enableInput()
			entity_swimToNode(v.mejais, v.schacht)
		end
	end
	
end
