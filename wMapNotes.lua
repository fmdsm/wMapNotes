local _,ns = ...
local size = 15 --图标大小

local db = ns.db
local icon_cache = {
	[1] = UnitPopupButtons.RAID_TARGET_1, -- Star
	[2] = UnitPopupButtons.RAID_TARGET_2, -- Circle
	[3] = UnitPopupButtons.RAID_TARGET_3, -- Diamond
	[4] = UnitPopupButtons.RAID_TARGET_4, -- Triangle
	[5] = UnitPopupButtons.RAID_TARGET_5, -- Moon
	[6] = UnitPopupButtons.RAID_TARGET_6, -- Square
	[7] = UnitPopupButtons.RAID_TARGET_7, -- Cross
	[8] = UnitPopupButtons.RAID_TARGET_8, -- Skull
	[9] = { icon = "Interface\\Minimap\\Tracking\\Auctioneer"},
	[10] = { icon = "Interface\\Minimap\\Tracking\\Banker"},
	[11] = { icon = "Interface\\Minimap\\Tracking\\BattleMaster"},
	[12] = { icon = "Interface\\Minimap\\Tracking\\FlightMaster"},
	[13] = { icon = "Interface\\Minimap\\Tracking\\Innkeeper"},
	[14] = { icon = "Interface\\Minimap\\Tracking\\Mailbox"},
	[15] = { icon = "Interface\\Minimap\\Tracking\\Repair"},
	[16] = { icon = "Interface\\Minimap\\Tracking\\StableMaster"},
	[17] = { icon = "Interface\\Minimap\\Tracking\\Class"},
	[18] = { icon = "Interface\\Minimap\\Tracking\\Profession"},
	[19] = { icon = "Interface\\Minimap\\Tracking\\TrivialQuests"},
	[20] = { icon = "Interface\\Minimap\\Tracking\\Ammunition"},
	[21] = { icon = "Interface\\Minimap\\Tracking\\Food"},
	[22] = { icon = "Interface\\Minimap\\Tracking\\Poisons"},
	[23] = { icon = "Interface\\Minimap\\Tracking\\Reagents"},
	[24] = { icon = "Interface\\TargetingFrame\\UI-PVP-Alliance",
		tCoordLeft = 0.05, tCoordRight = 0.65, tCoordTop = 0, tCoordBottom = 0.6},
	[25] = { icon = "Interface\\TargetingFrame\\UI-PVP-Horde",
		tCoordLeft = 0.05, tCoordRight = 0.65, tCoordTop = 0, tCoordBottom = 0.6},
	[26] = { icon = "Interface\\TargetingFrame\\UI-PVP-FFA",
		tCoordLeft = 0.05, tCoordRight = 0.65, tCoordTop = 0, tCoordBottom = 0.6},
	[27] = { icon = "Interface\\PVPFrame\\PVP-ArenaPoints-Icon"},
	[28] = { icon = "Interface\\Icons\\Spell_Arcane_PortalDalaran"},
}

local icons = {}
local index = 0

local GetCurrentMapAreaID,IsQuestFlaggedCompleted = GetCurrentMapAreaID,IsQuestFlaggedCompleted
local GetMapInfo,GetItemInfo= GetMapInfo,GetItemInfo
local WorldMapButton = WorldMapButton
local floor,pairs,type,select = floor,pairs,type,select
local function GetPinFrame()
	index = index + 1
	if #icons < index then
		local icon = CreateFrame("BUTTON",nil,WorldMapButton)
		icon:SetID(index)
		icon:SetSize(size,size)
		icon:SetFrameStrata("HIGH")

		icon.texture = icon:CreateTexture(nil,"ARTWORK")
		icon.texture:SetAllPoints(icon)
		icon.texture:Show()
		
		icon:SetScript("OnEnter",function(self)
			local info = db[self.mapid][self.name]
			GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
			if type(self.name)=="number" then
				GameTooltip:SetItemByID(self.name)
				_,self.link = GameTooltip:GetItem()
			else
				GameTooltip:AddLine(self.name)
			end
			GameTooltip:AddLine(info.desc)
			GameTooltip:Show()
		end)
		icon:SetScript("OnLeave",function(self)
			GameTooltip:Hide()
		end)
		icon:RegisterForClicks("LeftButtonUp")
		icon:SetScript("OnClick",function(self,button)
			if button == "LeftButton" and self.link then
				DEFAULT_CHAT_FRAME:AddMessage(self.link)
			end
		end)
		tinsert(icons,icon)
	end
	return icons[index]
end

local function SetMapPin(mapid,coord,name,t,isComplete)
	local x,y = floor(coord/10000)/10000,(coord%10000)/10000
		local icon = GetPinFrame()
		icon.mapid = mapid
		icon.name = name
		icon:ClearAllPoints()
		icon:SetPoint("CENTER",WorldMapButton,"TOPLEFT",x*WorldMapButton:GetWidth(),-y*WorldMapButton:GetHeight())
		icon.texture:SetTexture(t.icon)
		if t.tCoordLeft then
			icon.texture:SetTexCoord(t.tCoordLeft,t.tCoordRight,t.tCoordTop,t.tCoordBottom)
		else
			icon.texture:SetTexCoord(0,1,0,1)
		end
		if isComplete == 1 then
			icon:SetAlpha(0.5)
		else
			icon:SetAlpha(1)
		end
		icon:Show()
end

local function GetItemIcon(id)
	if not icon_cache[id] then
		local itemicon = select(10,GetItemInfo(id))
		if itemicon then
			icon_cache[id] = {icon = itemicon}
		else
			return icon_cache[26]
		end
	end
	return icon_cache[id]
end

local Event = CreateFrame("Frame")
Event:RegisterEvent("WORLD_MAP_UPDATE")
Event:SetScript("OnEvent",function(self,event,...)
	index = 0
	local mapid = select(5,GetMapInfo()) or GetCurrentMapAreaID() --优先使用洞穴名称
	if db[mapid] then
		for name,info in pairs(db[mapid]) do
			local texture = (type(info.icon) == "number" and icon_cache[info.icon]) or (type(info.icon) == "table" and info.icon)  or(type(name)=="number" and GetItemIcon(name))or   icon_cache[9]--指定icon id>指定icon table>物品材质>默认9(金币图标)
			local isCompleted = info.quest and IsQuestFlaggedCompleted(info.quest)
			if type(info.coord) == "number" then 
				SetMapPin(mapid,info.coord,name,texture,isCompleted)
			else
				for i,coord in pairs(info.coord) do
					SetMapPin(mapid,coord,name,texture,isCompleted)
				end
			end
		end
	end
	for i = index + 1 ,#icons do
		icons[i]:Hide()
	end
end)
--local savedb = {}
SLASH_MAPNOTES1 = "/wmn"
SlashCmdList["MAPNOTES"] = function(cmd)
	local name1,_,_,_,name2 = GetMapInfo()
	DEFAULT_CHAT_FRAME:AddMessage("当前区域id = "..GetCurrentMapAreaID().." 当前区域名称 = "..(name2 or name1))
	--DEFAULT_CHAT_FRAME:AddMessage("玩家位置坐标:"
	-- for mapid,t1 in pairs(db) do
		-- if not savedb[mapid] then savedb[mapid] = {} end
		-- for coord,t2 in pairs(t1) do
			-- id = t2.item or t2.npc or t2.title or "未知"
			-- if not savedb[mapid][id] then savedb[mapid][id] = {} end
			-- if not savedb[mapid][id].coord then savedb[mapid][id].coord = {} end
			-- tinsert(savedb[mapid][id].coord ,coord)
			-- if t2.desc then savedb[mapid][id].desc = t2.desc end
			-- savedb[mapid][id].icon = t2.icon 
		-- end
	-- end
	-- wMapNotesDB = savedb
	-- print("转换数据成功,重载后保存")
end