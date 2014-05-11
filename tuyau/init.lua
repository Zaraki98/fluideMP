-- tuyau

--créé par turbogus et rerem

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

minetest.register_abm({
	nodenames = {"tuyau:tuyau"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:pompe_water" then
			minetest.env:add_node(pos, {name="tuyau:tuyau_water"})
		elseif minetest.env:get_node(pos2).name=="tuyau:pompe_lava" then
			minetest.env:add_node(pos, {name="tuyau:tuyau_lava"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:pompe_seve" then
		--	minetest.env:add_node(pos, {name="tuyau:tuyau_seve"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:pompe_or" then
		--	minetest.env:add_node(pos, {name="tuyau:tuyau_or"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:pompe_gazole" then
		--	minetest.env:add_node(pos, {name="tuyau:tuyau_gazole"})
		else
			local pos1={x=pos.x, y=pos.y+1, z=pos.z}
			local pos3={x=pos.x+1, y=pos.y, z=pos.z}
			local pos4={x=pos.x-1, y=pos.y, z=pos.z}
			local pos5={x=pos.x, y=pos.y, z=pos.z+1}
			local pos6={x=pos.x, y=pos.y, z=pos.z-1}
			
			if minetest.env:get_node(pos1).name=="tuyau:tuyau_water" or minetest.env:get_node(pos2).name=="tuyau:tuyau_water" or minetest.env:get_node(pos3).name=="tuyau:tuyau_water" or minetest.env:get_node(pos4).name=="tuyau:tuyau_water" or minetest.env:get_node(pos5).name=="tuyau:tuyau_water" or minetest.env:get_node(pos6).name=="tuyau:tuyau_water" then
				minetest.env:add_node(pos, {name="tuyau:tuyau_water"})
			elseif minetest.env:get_node(pos1).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos2).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos3).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos4).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos5).name=="tuyau:tuyau_lava" or minetest.env:get_node(pos6).name=="tuyau:tuyau_lava" then
				minetest.env:add_node(pos, {name="tuyau:tuyau_lava"})
			--elseif minetest.env:get_node(pos1).name=="tuyau:tuyau_seve" or minetest.env:get_node(pos2).name=="tuyau:tuyau_seve" or minetest.env:get_node(pos3).name=="tuyau:tuyau_seve" or minetest.env:get_node(pos4).name=="tuyau:tuyau_seve" or minetest.env:get_node(pos5).name=="tuyau:tuyau_seve" or minetest.env:get_node(pos6).name=="tuyau:tuyau_seve" then
			--	minetest.env:add_node(pos, {name="tuyau:tuyau_seve"})
			--elseif minetest.env:get_node(pos1).name=="tuyau:tuyau_or" or minetest.env:get_node(pos2).name=="tuyau:tuyau_or" or minetest.env:get_node(pos3).name=="tuyau:tuyau_or" or minetest.env:get_node(pos4).name=="tuyau:tuyau_or" or minetest.env:get_node(pos5).name=="tuyau:tuyau_or" or minetest.env:get_node(pos6).name=="tuyau:tuyau_or" then
			--	minetest.env:add_node(pos, {name="tuyau:tuyau_or"})
			--elseif minetest.env:get_node(pos1).name=="tuyau:tuyau_gazole" or minetest.env:get_node(pos2).name=="tuyau:tuyau_gazole" or minetest.env:get_node(pos3).name=="tuyau:tuyau_gazole" or minetest.env:get_node(pos4).name=="tuyau:tuyau_gazole" or minetest.env:get_node(pos5).name=="tuyau:tuyau_gazole" or minetest.env:get_node(pos6).name=="tuyau:tuyau_gazole" then
			--	minetest.env:add_node(pos, {name="tuyau:tuyau_gazole"})
			end	
		end
	end,

})

-----------------
--Tuyau remplis
-----------------

--Déclaration du tuyau d'eau :

minetest.register_node("tuyau:tuyau_water", {
	description = "tuyau d'eau",
	tiles = {"tuyau_water.png"},
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
	nodenames = {"tuyau:tuyau_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

--Déclaration du tuyau de lave :

minetest.register_node("tuyau:tuyau_lava", {
	description = "tuyau de lave",
	tiles = {"tuyau_lava.png"},
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
	nodenames = {"tuyau:tuyau_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

--[[

-- MANQUE LES TEXTURES !!

--Déclaration du tuyau de sève :

minetest.register_node("tuyau:tuyau_seve", {
	description = "tuyau de sève",
	tiles = {"tuyau_seve.png"},
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
	nodenames = {"tuyau:tuyau_seve"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

--Déclaration du tuyau d'or :

minetest.register_node("tuyau:tuyau_or", {
	description = "tuyau d'or",
	tiles = {"tuyau_or.png"},
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
	nodenames = {"tuyau:tuyau_or"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

--Déclaration du tuyau de gazole :

minetest.register_node("tuyau:tuyau_gazole", {
	description = "tuyau de gazole",
	tiles = {"tuyau_gazole.png"},
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
	nodenames = {"tuyau:tuyau_gazole"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
	end,
})

]]--

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

--Déclaration de la pompe d'eau :

minetest.register_node("tuyau:pompe_water", {
	description = "pompe d'eau",
	tiles = {"pompe_water.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

--Déclaration de la pompe de lave :

minetest.register_node("tuyau:pompe_lava", {
	description = "pompe de lave",
	tiles = {"pompe_lava.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

--[[

--Déclaration de la pompe de sève :

minetest.register_node("tuyau:pompe_seve", {
	description = "pompe de seve",
	tiles = {"pompe_seve.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

--Déclaration de la pompe d'or :

minetest.register_node("tuyau:pompe_or", {
	description = "pompe d'or",
	tiles = {"pompe_or.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

--Déclaration de la pompe de gazole :

minetest.register_node("tuyau:pompe_gazole", {
	description = "pompe de gazole",
	tiles = {"pompe_gazole.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:pompe',
	groups = {crumbly=3},
})

]]--

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:pompe"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:water_source" or minetest.env:get_node(pos2).name=="default:water_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_water"})
		elseif minetest.env:get_node(pos2).name=="default:lava_source" or minetest.env:get_node(pos2).name=="default:lava_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe_lava"})
		--else if minetest.env:get_node(pos2).name=="fluide:gazole_source" or minetest.env:get_node(pos2).name=="fluide:gazole_flowing" then
		--	minetest.env:add_node(pos, {name="tuyau:pompe_gazole"})
		--else if minetest.env:get_node(pos2).name=="fluide:seve_source" or minetest.env:get_node(pos2).name=="fluide:seve_flowing" then
		--	minetest.env:add_node(pos, {name="tuyau:pompe_seve"})
		--else if minetest.env:get_node(pos2).name=="fluide:or_source" or minetest.env:get_node(pos2).name=="fluide:or_flowing" then
		--	minetest.env:add_node(pos, {name="tuyau:pompe_or"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="default:water_source" and minetest.env:get_node(pos2).name~="default:water_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="default:lava_source" and minetest.env:get_node(pos2).name~="default:lava_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

--[[

minetest.register_abm({
	nodenames = {"tuyau:pompe_seve"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="fluide:seve_source" and minetest.env:get_node(pos2).name~="fluide:seve_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_or"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="fluide:or_source" and minetest.env:get_node(pos2).name~="fluide:or_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:pompe_gazole"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2={x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="fluide:gazole_source" and minetest.env:get_node(pos2).name~="fluide:gazole_flowing" then
			minetest.env:add_node(pos, {name="tuyau:pompe"})
		end
	end,
})

]]--

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

--Déclaration de la sortie d'eau :

minetest.register_node("tuyau:sortie_water", {
	description = "sortie d'eau",
	tiles = {"sortie_water.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

--Déclaration de la sortie de lave :

minetest.register_node("tuyau:sortie_lava", {
	description = "sortie de lave",
	tiles = {"sortie_lava.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

--[[

--Déclaration de la sortie de sève :

minetest.register_node("tuyau:sortie_seve", {
	description = "sortie de sève",
	tiles = {"sortie_seve.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

--Déclaration de la sortie d'or :

minetest.register_node("tuyau:sortie_or", {
	description = "sortie d'or",
	tiles = {"sortie_or.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

--Déclaration de la sortie de gazole :

minetest.register_node("tuyau:sortie_gazole", {
	description = "sortie de gazole",
	tiles = {"sortie_gazole.png"},
	is_ground_content = false,
	walkable = true,
	--pointable = true,
	light_source = 8,
	diggable = true,
	drawtype = "glasslike",
	drop = 'tuyau:sortie',
	groups = {crumbly=3},
})

]]--

-- Gestion

minetest.register_abm({
	nodenames = {"tuyau:sortie"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="tuyau:tuyau_water" then
			minetest.env:add_node(pos, {name="tuyau:sortie_water"})
		elseif minetest.env:get_node(pos2).name=="tuyau:tuyau_lava" then
			minetest.env:add_node(pos, {name="tuyau:sortie_lava"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:tuyau_seve" then
		--	minetest.env:add_node(pos, {name="tuyau:sortie_seve"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:tuyau_or" then
		--	minetest.env:add_node(pos, {name="tuyau:sortie_or"})
		--elseif minetest.env:get_node(pos2).name=="tuyau:tuyau_gazole" then
		--	minetest.env:add_node(pos, {name="tuyau:sortie_gazole"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_water" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="default:water_source"})
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_lava" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="default:lava_source"})
			end
		end
	end,
})

--[[

minetest.register_abm({
	nodenames = {"tuyau:sortie_seve"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_seve" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="fluide:seve_source"})
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_or"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_or" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="fluide:or_source"})
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"tuyau:sortie_gazole"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}
		local pos3 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name~="tuyau:tuyau_gazole" then
			minetest.env:add_node(pos, {name="tuyau:sortie"})
			minetest.env:add_node(pos3, {name="air"})
		else
			
			if minetest.env:get_node(pos3).name=="air" then
				minetest.env:add_node(pos3, {name="gazole_source"})
			end
		end
	end,
})

]]--
minetest.register_on_dignode(function(pos, node)
	if node.name=="tuyau:sortie_water" then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:water_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	
	elseif node.name=="tuyau:sortie_lava" then
		local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.env:get_node(pos2).name=="default:lava_source" then
			minetest.env:add_node(pos2, {name="air"})
		end
	--elseif node.name=="tuyau:sortie_seve" then
	--	local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
	--	if minetest.env:get_node(pos2).name=="fluide:seve_source" then
	--		minetest.env:add_node(pos2, {name="air"})
	--	end
	--elseif node.name=="tuyau:sortie_or" then
	--	local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
	--	if minetest.env:get_node(pos2).name=="fluide:or_source" then
	--		minetest.env:add_node(pos2, {name="air"})
	--	end
	--elseif node.name=="tuyau:sortie_gazole" then
	--	local pos2 = {x=pos.x, y=pos.y-1, z=pos.z}
	--	if minetest.env:get_node(pos2).name=="fluide:gazole_source" then
	--		minetest.env:add_node(pos2, {name="air"})
	--	end
	end	
end
)

