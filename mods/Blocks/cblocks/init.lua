
local colours = {
	{"black",      "Black",      "#000000b0"},
	{"blue",       "Blue",       "#015dbb70"},
	{"brown",      "Brown",      "#a78c4570"},
	{"cyan",       "Cyan",       "#01ffd870"},
	{"dark_green", "Dark Green", "#005b0770"},
	{"dark_grey",  "Dark Grey",  "#303030b0"},
	{"green",      "Green",      "#61ff0170"},
	{"grey",       "Grey",       "#5b5b5bb0"},
	{"magenta",    "Magenta",    "#ff05bb70"},
	{"orange",     "Orange",     "#ff840170"},
	{"pink",       "Pink",       "#ff65b570"},
	{"red",        "Red",        "#ff000070"},
	{"violet",     "Violet",     "#2000c970"},
	{"white",      "White",      "#abababc0"},
	{"yellow",     "Yellow",     "#e3ff0070"},
}

for i = 1, #colours, 1 do

-- wood

minetest.register_node("cblocks:wood_" .. colours[i][1], {
	description = colours[i][2] .. " Wooden Planks",
	tiles = {"default_wood.png^[colorize:" .. colours[i][3]},
	paramtype = "light",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "cblocks:wood_".. colours[i][1] .. " 2",
	recipe = {
		{"group:wood","group:wood", "dye:" .. colours[i][1]},
	}
})

-- stone brick

minetest.register_node("cblocks:stonebrick_" .. colours[i][1], {
	description = colours[i][2] .. " Stone Brick",
	tiles = {"default_stone_brick.png^[colorize:" .. colours[i][3]},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "cblocks:stonebrick_".. colours[i][1] .. " 2",
	recipe = {
		{"default:stonebrick","default:stonebrick", "dye:" .. colours[i][1]},
	}
})

-- glass

minetest.register_node( "cblocks:glass_" .. colours[i][1], {
	description = colours[i][2] .. " Glass",
	tiles = {"cblocks.png^[colorize:" .. colours[i][3]},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "cblocks:glass_".. colours[i][1] .. " 2",
	recipe = {
		{"default:glass","default:glass", "dye:" .. colours[i][1]},
	}
})

end

-- add lucky blocks
if minetest.get_modpath("lucky_block") then
lucky_block:add_blocks({
	{"dro", {"cblocks:wood_"}, 10, true},
	{"dro", {"cblocks:stonebrick_"}, 10, true},
	{"dro", {"cblocks:glass_"}, 10, true},
	{"exp"},
})
end

print ("[MOD] Cblocks loaded")
