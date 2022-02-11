local autopassOverride = {
	"INVTYPE_CLOAK",
}

-- Classes that should autopass a subtype, 11 classes in total (mop)
-- ["TYPE"] = class that auto passes it
--[[ Changes:
Hunters are the only ones that need Guns/Bows/Crossbows (and no other weapon type)
Fixed caster daggers classes
Added warrior to pass Fist Weapons
Removed rogue from OH Axes
--]]

local autopassTable = {
	["Cloth"]					= {"WARRIOR", "DEATHKNIGHT", "PALADIN", "DRUID", "MONK", "ROGUE", "HUNTER", "SHAMAN"}, --ok
	["Leather"] 				= {"WARRIOR", "DEATHKNIGHT", "PALADIN", "HUNTER", "SHAMAN", "PRIEST", "MAGE", "WARLOCK"}, --ok
	["Mail"] 					= {"WARRIOR", "DEATHKNIGHT", "PALADIN", "DRUID", "MONK", "ROGUE", "PRIEST", "MAGE", "WARLOCK"}, --ok
	["Plate"]					= {"DRUID", "MONK", "ROGUE", "HUNTER", "SHAMAN", "PRIEST", "MAGE", "WARLOCK"}, --ok
	["Shields"] 				= {"DEATHKNIGHT", "DRUID", "MONK", "ROGUE", "HUNTER", "PRIEST", "MAGE", "WARLOCK"}, --ok
	["Bows"] 					= {"DEATHKNIGHT", "PALADIN", "DRUID", "MONK", "SHAMAN", "PRIEST", "MAGE", "WARLOCK", "ROGUE", "WARRIOR"}, --ok hunter only
	["Crossbows"] 				= {"DEATHKNIGHT", "PALADIN", "DRUID", "MONK", "SHAMAN", "PRIEST", "MAGE", "WARLOCK", "ROGUE", "WARRIOR"}, --ok hunter only
	["Daggers"]					= {"WARRIOR", "DEATHKNIGHT", "PALADIN","MONK", "HUNTER"}, --ok
	["Guns"]					= {"DEATHKNIGHT", "PALADIN", "DRUID", "MONK","SHAMAN", "PRIEST", "MAGE", "WARLOCK", "ROGUE", "WARRIOR"}, --ok hunter only
	["Fist Weapons"] 			= {"DEATHKNIGHT", "PALADIN",  "PRIEST", "MAGE", "WARLOCK", "HUNTER", "WARRIOR"}, --ok, war/hunter can equip, but don't use
	["One-Handed Axes"]			= {"DRUID", "PRIEST", "MAGE", "WARLOCK", "HUNTER"}, --ok
	["One-Handed Maces"]		= {"HUNTER", "MAGE", "WARLOCK"}, --ok
	["One-Handed Swords"] 	    = {"DRUID", "SHAMAN", "PRIEST", "HUNTER"}, --ok
	["Polearms"] 				= {"ROGUE", "SHAMAN", "PRIEST", "MAGE", "WARLOCK", "HUNTER"}, --ok
	["Staves"]					= {"WARRIOR", "DEATHKNIGHT", "PALADIN",  "ROGUE", "HUNTER"}, --ok, war can equip, but doesn't use
	["Two-Handed Axes"]			= {"DRUID", "ROGUE", "MONK", "PRIEST", "MAGE", "WARLOCK", "HUNTER"}, --ok
	["Two-Handed Maces"]		= {"MONK", "ROGUE", "HUNTER", "PRIEST", "MAGE", "WARLOCK"}, --ok
	["Two-Handed Swords"]		= {"DRUID", "MONK", "ROGUE", "SHAMAN", "PRIEST", "MAGE", "WARLOCK", "HUNTER"}, --ok
	["Wands"]					= {"WARRIOR", "DEATHKNIGHT", "PALADIN", "DRUID", "MONK", "ROGUE", "HUNTER", "SHAMAN"}, --ok, mage/priest/warlock only
}
-- Returns true if the player should autopass the given item
function RCLootCouncil:AutoPassCheck(subType, equipLoc, link)
	if not tContains(autopassOverride, equipLoc) then
		if subType and autopassTable[subType] then
			return tContains(autopassTable[subType], self.playerClass)
		end
		local id = self:GetItemIDFromLink(link) -- Convert item(hyperlink) to id, used to see if its in the already existing table
		local name = self:GetItemNameFromLink(link) -- Convert item(hyperlink) to string
		local tokenid = ""

		if RCTokenTable[id] then -- It's a token, using the already existing token table
			if string.find(name, "Conqueror") then
			tokenid = "Conqueror"
			elseif string.find(name, "Protector") then
			tokenid = "Protector"
			else string.find(name, "Vanquisher")
			tokenid = "Vanquisher"
			end
			self:Debug("\nToken: "..tokenid, "\nClass "..self.playerClass, "\nAutopass: ", tContains(RCTokenClass[tokenid], self.playerClass))
			return not tContains(RCTokenClass[tokenid], self.playerClass)
		end
	return false
	end
end