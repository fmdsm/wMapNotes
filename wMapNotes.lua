local _,ns = ...
local size = 16 --图标大小

local db,icon_cache = ns.db,ns.Icons

local icons = {}
local index = 0

--/run print(IsQuestFlaggedCompleted(31415))

local GetCurrentMapAreaID,IsQuestFlaggedCompleted,GetAchievementInfo,GetAchievementCriteriaInfo = GetCurrentMapAreaID,IsQuestFlaggedCompleted,GetAchievementInfo,GetAchievementCriteriaInfo
local GetMapInfo,GetItemIcon= GetMapInfo,GetItemIcon
local WorldMapButton = WorldMapButton
local floor,pairs,type,select = floor,pairs,type,select

local cave_cache = {}
local function GetCaveInfo(group,name)
	if not cave_cache[name] then
		local item = nil
		for id,info in pairs(db[group][name]) do
			if not(info.quest and IsQuestFlaggedCompleted(info.quest) == 1) then
				item = id
				break
			end
		end
		cave_cache[name] =  item
	end
	return cave_cache[name]
end

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
			local info = db[self.group][self.mapid][self.name]
			local name = info.redir and GetCaveInfo(self.group,info.redir) or self.name
			GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
			if self.achieveid then
				GameTooltip:SetAchievementByID(self.achieveid)
				self.link = GetAchievementLink(self.achieveid)
			elseif type(name)=="number" then
				GameTooltip:SetItemByID(name)
				_,self.link = GameTooltip:GetItem()
			else
				GameTooltip:AddLine(name)
				self.link = nil
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

local Scale = ns.mapscale
local function SetMapPin(group,mapid,coord,name,t,isCompleted,flag,achieveid)
	local x,y = floor(coord/10000)/10000,(coord%10000)/10000 --0<x,y<1
		local icon = GetPinFrame()
		icon.mapid = mapid
		icon.name = name
		icon.group = group
		icon.achieveid = achieveid
		icon:ClearAllPoints()
		if flag then --上一级显示
			local scale = ns.mapscale[mapid] --判断空值
			if not scale then index = index - 1 return end
			icon:SetPoint("CENTER",WorldMapButton,"TOPLEFT",(scale[3]+x*scale[1])*WorldMapButton:GetWidth(),-(scale[4]+y*scale[2])*WorldMapButton:GetHeight())
		else
			icon:SetPoint("CENTER",WorldMapButton,"TOPLEFT",x*WorldMapButton:GetWidth(),-y*WorldMapButton:GetHeight())
		end
		icon.texture:SetTexture(t.icon)
		if t.tCoordLeft then
			icon.texture:SetTexCoord(t.tCoordLeft,t.tCoordRight,t.tCoordTop,t.tCoordBottom)
		else
			icon.texture:SetTexCoord(0,1,0,1)
		end
		if isCompleted then
			icon:SetAlpha(0.5)
		else
			icon:SetAlpha(1)
		end
		icon:Show()
end

local function GetIconCache(id)
	if not icon_cache[id] then
		icon_cache[id] = {icon = GetItemIcon(id)}
	end
	return icon_cache[id]
end
local function ImportDate(infos,group,mapid,defaulticon,flag,achieve)
	for name,info in pairs(infos) do
		local texture,isCompleted,achieveid
		if achieve then
			achieveid = floor(name/100)
			local subid =name%100
			texture = {icon = select(10,GetAchievementInfo(achieveid))}
			_ , _,isCompleted = GetAchievementCriteriaInfo(achieveid,subid)
		else
			texture = (type(info.icon) == "number" and icon_cache[info.icon]) or (type(info.icon) == "table" and info.icon)  or(type(name)=="number" and GetIconCache(name))or   defaulticon --指定icon id>指定icon table>物品材质>默认9(金币图标)
			isCompleted = (info.quest and IsQuestFlaggedCompleted(info.quest)) or (info.redir and not GetCaveInfo(group,info.redir))
		end
		--如果有任务id检查是否完成任务 1完成 nil未完成 如果是洞口则检查洞穴内任务情况 not(nil完成 id未完成)
		if type(info.coord) == "number" then 
			SetMapPin(group,mapid,info.coord,name,texture,isCompleted,flag,achieveid)
		else
			for i,coord in pairs(info.coord) do
				SetMapPin(group,mapid,coord,name,texture,isCompleted,flag,achieveid)
			end
		end
	end
end
local Event = CreateFrame("Frame")
Event:RegisterEvent("WORLD_MAP_UPDATE")
Event:SetScript("OnEvent",function(self,event,...)
	index = 0
	--依次显示不同组
	local mapid = select(5,GetMapInfo()) or GetCurrentMapAreaID() --优先使用洞穴名称
	for i,group in pairs(ns.db) do
		defaulticon = group.icon and icon_cache[group.icon] or icon_cache[8]
		--先导入对应的组
		if group[mapid] then
			ImportDate(group[mapid],i,mapid,defaulticon,false,group.achieve)
		end
		--导入上级的组
		if mapid == 862 and group.level == 2 then
			for _mapid,t  in pairs(group) do
				if type(t) == "table" then
					ImportDate(t,i,_mapid,defaulticon,true,group.achieve)
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
	local x,y = GetPlayerMapPosition("player")
	DEFAULT_CHAT_FRAME:AddMessage(format("玩家当前坐标:x = %.4f y = %.4f ",x*100,y*100))
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