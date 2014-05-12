-- tuyau

-- créé par turbogus et rerem, modifié par Zaraki98

-- code licence gpl v2 ou superieur
-- graphisme sous licence CC-BY-NC-SA

-----------------
--Tuyau vide
-----------------

--Déclaration du tuyau vide :

minetest.register_node("tuyau:tuyau", {
	description = "tuyau",
	tiles = {"tuyau.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:tuyau',
	groups = {crumbly=3},
})

-- Craft du tuyau vide :

minetest.register_craft({
	output = "tuyau:tuyau",
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', '', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

-- Gestion

local fluid = {"water","lava","seve","or","gazole"}
local defluid = {"water","lava"}		-- Default fluide -> defluid 
local aufluid = {"seve","or","gazole"}		-- Autres fluides -> aufluid

for i=1, #fluid do
for j=1, #defluid do
for k=1, #aufluid do 
	local flu = fluid[i]
	local deflu = defluid[j]
	local auflu = aufluid[k]
minetest.register_abm({
	nodenames = {"tuyau:tuyau"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:pompe_"..flu then
			minetest.env:add_node(pos, {name="tuyau:tuyau_"..flu})
		else
			local pos1={x=pos.x, y=pos.y+1, z=pos.z}
			local pos3={x=pos.x+1, y=pos.y, z=pos.z}
			local pos4={x=pos.x-1, y=pos.y, z=pos.z}
			local pos5={x=pos.x, y=pos.y, z=pos.z+1}
			local pos6={x=pos.x, y=pos.y, z=pos.z-1}
			
			if minetest.env:get_node(pos1).name=="tuyau:tuyau_"..flu or minetest.env:get_node(pos2).name=="tuyau:tuyau_"..flu or minetest.env:get_node(pos3).name=="tuyau:tuyau_"..flu or minetest.env:get_node(pos4).name=="tuyau:tuyau_"..flu or minetest.env:get_node(pos5).name=="tuyau:tuyau_"..flu or minetest.env:get_node(pos6).name=="tuyau:tuyau_"..flu then
				minetest.env:add_node(pos, {name="tuyau:tuyau_"..flu})
			end	
		end
	end,

})

-----------------
--Tuyau remplis
-----------------

--Déclaration du tuyau de liquide :

minetest.register_node("tuyau:tuyau_"..flu, {
	description = "tuyau de "..flu,
	tiles = {"tuyau_"..flu..".png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:tuyau',
	groups = {crumbly=3},
})

--Gestion (passage OFF du bloc si en contact avec autre bloc OFF)

minetest.register_abm({
	nodenames = {"tuyau:tuyau_"..flu},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

-----------------
--Pompe
-----------------

--Déclaration de la pompe :

minetest.register_node("tuyau:pompe", {
	description = "pompe",
	tiles = {"pompe.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

-- Craft du tuyau vide :

minetest.register_craft({
	output = "tuyau:pompe",
	recipe = {
		{'default:steel_ingot', 'default:mese', 'default:steel_ingot'},
		{'default:mese', '', 'default:mese'},
		{'default:steel_ingot', 'default:mese', 'default:steel_ingot'},
	}
})

--Déclaration de la pompe de liquide :

minetest.register_node("tuyau:pompe_"..flu, {
	description = "pompe de "..flu,
	tiles = {"pompe_"..flu..".png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})


-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:pompe"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:"..deflu.."_source" or minetest.env:get_node(pos2).name=="default:"..deflu.."_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_"..deflu})
		else if minetest.env:get_node(pos2).name=="fluide:"..auflu.."_source" or minetest.env:get_node(pos2).name=="fluide:"..auflu.."_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_"..auflu})
		end
	end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_"..deflu},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="default:"..deflu.."_source" and minetest.env:get_node(pos2).name~="default:"..deflu.."_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_"..auflu},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="fluide:"..auflu.."_source" and minetest.env:get_node(pos2).name~="fluide:"..auflu.."_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

-----------------
--Sortie
-----------------

--Déclaration de la sortie :

minetest.register_node("tuyau:sortie", {
	description = "sortie",
	tiles = {"sortie.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

-- Craft de la sortie :

minetest.register_craft({
	output = "tuyau:sortie",
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', '', 'default:glass'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
	}
})

--Déclaration de la sortie de liquide :

minetest.register_node("tuyau:sortie_"..flu, {
	description = "sortie de "..flu,
	tiles = {"sortie_"..flu..".png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:sortie"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:tuyau_"..flu then
			minetest.env:add_node(pos, {name="tuyau:sortie_"..flu})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_"..deflu},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_"..deflu then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="default:"..deflu.."_source"})
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_"..auflu},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_"..auflu then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="fluide:"..auflu.."_source"})
			end
		end
	end,
})

minetest.register_on_dignode(function(pos, node)
	if node.name=="tuyau:sortie_"..deflu then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:"..deflu.."_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	elseif node.name=="tuyau:sortie_"..auflu then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="fluide:"..auflu.."_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	end	
end
)

end
end
end
