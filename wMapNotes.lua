local _,ns = ...
local size = 16 --图标大小

local db,icon_cache = ns.db,ns.Icons

local icons = {}
local index = 0

--/run print(IsQuestFlaggedCompleted(31415))

local GetCurrentMapAreaID,IsQuestFlaggedCompleted,GetAchievementInfo,GetAchievementCriteriaInfo = GetCurrentMapAreaID,IsQuestFlaggedCompleted,GetAchievementInfo,GetAchievementCriteriaInfo
local GetMapInfo,GetItemIcon,GetAchievementLink= GetMapInfo,GetItemIcon,GetAchievementLink
local WorldMapButton = WorldMapButton
local floor,pairs,type,select = floor,pairs,type,select

local function ParseAchieveid(id,num)
	if num == 1 then
		return floor(id/100)
	else
		return floor(id/100),id%100
	end
end

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
			if type(name) == "number" then
				if name>100000 then
					GameTooltip:AddLine(self._name)
					self.link = GetAchievementLink(name)
				else
					GameTooltip:SetItemByID(name)
					_,self.link = GameTooltip:GetItem()
				end
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

--local Scale = ns.mapscale
local function SetMapPin(group,mapid,coord,name,texture,isCompleted,flag)
	local x,y = floor(coord/10000)/10000,(coord%10000)/10000 --0<x,y<1
		local icon = GetPinFrame()
		icon.mapid = mapid
		icon.name = name
		icon.group = group
		icon:ClearAllPoints()
		if flag then --上一级显示
			local scale = ns.mapscale[mapid] --判断空值
			if not scale then index = index - 1 return end
			icon:SetPoint("CENTER",WorldMapButton,"TOPLEFT",(scale[3]+x*scale[1])*WorldMapButton:GetWidth(),-(scale[4]+y*scale[2])*WorldMapButton:GetHeight())
		else
			icon:SetPoint("CENTER",WorldMapButton,"TOPLEFT",x*WorldMapButton:GetWidth(),-y*WorldMapButton:GetHeight())
		end
		icon.texture:SetTexture(texture)
		if isCompleted then
			icon:SetAlpha(0.5)
		else
			icon:SetAlpha(1)
		end
		icon:Show()
end

local cache_quest = {}
local function GetQuestCompleted(id,force)
	if cache_quest[id] or force then
		cache_quest[id] = IsQuestFlaggedCompleted(id)
	end
	return cache_quest[id]
end

local cache_achieve = {}
local function GetAchieveCompleted(id,force)
	if cache_achieve[id] or force then
		cache_achieve[id] = GetAchievementCriteriaInfo(ParseAchieveid(id))
	end
	return cache_achieve[id]
end

local function GetQuestAndAchieveCompleted(id)
	if type(id) == "number" then
		if id>100000 then 
			return GetAchieveCompleted(id,true)
		else
			return GetQuestCompleted(id,true)
		end
	end
end

local function GetIconCache(id)
	if not icon_cache[id] and type(id) == "number" then
		if id>100000 then
			icon_cache[id] = select(10,GetAchievementInfo(ParseAchieveid(id,1)))
		else
			icon_cache[id] =  GetItemIcon(id)
		end
	end
	return icon_cache[id]
end

local function ImportDate(infos,group,mapid,defaulticon,flag)
	for name,info in pairs(infos) do
		local texture = GetIconCache(info.icon or name) or defaulticon
		local isCompleted = GetQuestAndAchieveCompleted(info.quest or name) or (info.redir and not GetCaveInfo(group,info.redir))
		if type(info.coord) == "number" then 
			SetMapPin(group,mapid,info.coord,name,texture,isCompleted,flag)
		else
			for i,coord in pairs(info.coord) do
				SetMapPin(group,mapid,coord,name,texture,isCompleted,flag)
			end
		end
	end
end

local Event = CreateFrame("Frame")
Event:RegisterEvent("WORLD_MAP_UPDATE")
Event:RegisterEvent("PLAYER_LOGIN")
Event:SetScript("OnEvent",function(self,event,...)
	if  event =="WORLD_MAP_UPDATE" then
		index = 0
		--依次显示不同组
		local mapid = select(5,GetMapInfo()) or GetCurrentMapAreaID() --优先使用洞穴名称
		for i,group in pairs(ns.db) do
			defaulticon = GetIconCache(group.icon or 1)
			--先导入对应的组
			if group[mapid] then
				ImportDate(group[mapid],i,mapid,defaulticon,false)
			end
			--导入上级的组
			if mapid == 862 and group.level == 2 then
				for _mapid,t  in pairs(group) do
					if type(t) == "table" then
						ImportDate(t,i,_mapid,defaulticon,true)
					end
				end
			end
		end
		for i = index + 1 ,#icons do
			icons[i]:Hide()
		end
	elseif event == "PLAYER_LOGIN" then
		for _,group in pairs(ns.db) do
			if group.achieve then
				for _,ids in pairs(group) do
					if type(ids)== "table" then
						for id,info in pairs(ids) do
							info._name = GetAchievementCriteriaInfo(ParseAchieveid(id))
						end
					end
				end
			end
		end
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