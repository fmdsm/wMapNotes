local GetCurrentMapAreaID = GetCurrentMapAreaID
local GetPlayerMapPosition = GetPlayerMapPosition
local SetMapToCurrentZone = SetMapToCurrentZone

local tomapid = 862
local mapids = { [807] = true,[809] = true,[811] = true,[858]= true,[806]= true,[857]= true,[810]= true,[873]= true}
local cache = {}
local result = {}
local Event = CreateFrame("Frame")
local lock = false

local color = {
	[1] = {1,0,0},
	[2] = {0,1,0},
	[3] = {1,1,1},
}
local function print(msg,level)
	DEFAULT_CHAT_FRAME:AddMessage(msg,unpack(color[level or 3]))
end
wLib_mapDB = wLib_mapDB or {}

local mapid
local function GetCoord()
	local coord = {}
	SetMapToCurrentZone()
	--mapid = GetCurrentMapAreaID()
	coord[1],coord[2] = GetPlayerMapPosition("player")
	if coord[1] == 0 and coord[2] == 0 then return nil end
	SetMapByID(tomapid)
	coord[3],coord[4] = GetPlayerMapPosition("player")
	return coord
end

local function Compare(x1,y1,x2,y2,d)
	local dist = sqrt((x2-x1)^2+(y2-y1)^2)
	return  dist>= d 
end

local function Calc(p1,p2)
	local x1,y1,X1,Y1 = unpack(p1)
	local x2,y2,X2,Y2 =unpack(p2)
	local scaleX = (X2-X1)/(x2-x1)
	local scaleY = (Y2-Y1)/(y2-y1)
	local offsetX = X1 - scaleX * x1
	local offsetY = Y1 - scaleY * y1
	print(format("一组计算结果 scaleX:%.4f scaleY:%.4f offsetX:%.4f offsetY:%.4f",scaleX,scaleY,offsetX,offsetY))
	return scaleX,scaleY,offsetX,offsetY
end

local function OnStart()
	if lock then return end
	SetMapToCurrentZone()
	mapid = GetCurrentMapAreaID()
	if not mapids[mapid] then return end
	print("开始统计")
	Event:SetScript("OnUpdate",function(self,elapsed)
		self.elapsed = (self.elapsed or 0) - elapsed
		if self.elapsed<0 then
			local coord = GetCoord()
			if coord then
				if not cache[mapid] then --没有初始数据
					cache[mapid] = coord
					print("初始化一个坐标")
				else
					if Compare(cache[mapid][1],cache[mapid][2],coord[1],coord[2],0.3) then --距离大于1符合条件
						tinsert(result ,{mapid,Calc(cache[mapid],coord)})--计算保存结果 
						print("保存了一条新记录",1)
						cache[mapid] = nil
					end
				end
			end
			self.elapsed = 1
		end
	end)
end
local function OnPaused()
	print("暂停统计")
	lock = true
	Event:SetScript("OnUpdate",nil)
end
local function OnRestart()
	print("恢复统计")
	lock = false
	OnStart()
end

--不断获取当前mapid玩家坐标和上级地图玩家坐标

--Event:RegisterEvent("WORLD_MAP_UPDATE")
Event:RegisterEvent("ZONE_CHANGED") --其他子区域/有名称的地图
Event:RegisterEvent("ZONE_CHANGED_INDOORS") --出入室内外
Event:RegisterEvent("ZONE_CHANGE_NEW_AREA") --主区域改变/出入副本
Event:RegisterEvent("PLAYER_LOGIN")
Event:RegisterEvent("PLAYER_REGEN_DISABLED")
Event:RegisterEvent("PLAYER_REGEN_ENABLED")
Event:SetScript("OnEvent",function(self,event)
	if event == "PLAYER_LOGIN" then
		--hooksecurefunc("WorldMapFrame_OnShow",)
		WorldMapFrame:HookScript("OnShow",OnPaused)
		--hooksecurefunc("WorldMapFrame_OnHide",)
		WorldMapFrame:HookScript("OnHide",OnRestart)
	elseif event == "PLAYER_REGEN_DISABLED" then
		OnPaused()
	elseif event == "PLAYER_REGEN_ENABLED" then
		OnRestart()
	else
		OnStart()
	end
end)

SLASH_LIBMAP1 = "/lm"
SlashCmdList["LIBMAP"] = function(cmd)
	if cmd == "reset" then
		wipe(wLib_mapDB)
	elseif cmd == "save" then
		for k,v in pairs(result) do
			tinsert(wLib_mapDB,v)
		end
		wipe(result)
	end
	print(format("已保存%d 未保存%d",#wLib_mapDB,#result))
	for k,v in pairs (wLib_mapDB) do
		print(format("id:%d scale:X=%.4f Y=%.4f offset:X=%.4f Y=%.4f",unpack(v)))
	end
	for k,v in pairs (result) do
		print(format("id:%d scale:X=%.4f Y=%.4f offset:X=%.4f Y=%.4f",unpack(v)))
	end
end

--[[ wLib_mapDB = {
	{
		810, -- [1]
		0.370199006437579, -- [2]
		0.3701986912220293, -- [3]
		0.1078738485208499, -- [4]
		0.2050388951142818, -- [5]
	}, -- [1]
	{
		809, -- [1]
		0.4033651894330519, -- [2]
		0.4034319729651503, -- [3]
		0.2522206005004135, -- [4]
		0.1025192009316251, -- [5]
	}, -- [2]
	{
		806, -- [1]
		0.4500933049947646, -- [2]
		0.4499585878613624, -- [3]
		0.4705534465451245, -- [4]
		0.292653963200355, -- [5]
	}, -- [3]
		{
		806, -- [1]
		0.4500930306615237, -- [2]
		0.4499588909850656, -- [3]
		0.4705536046133432, -- [4]
		0.2926538073593519, -- [5]
	}, -- [1]
	{
		806, -- [1]
		0.4500933135463645, -- [2]
		0.4499587726878093, -- [3]
		0.4705534206845249, -- [4]
		0.2926539118731085, -- [5]
	}, -- [2]
	{
		806, -- [1]
		0.4500934896550733, -- [2]
		0.4499589058712525, -- [3]
		0.4705533351668536, -- [4]
		0.2926538424512198, -- [5]
	}, -- [3]
	{
		873, -- [1]
		0.115611615263164, -- [2]
		0.1156116127819066, -- [3]
		0.5117761936403419, -- [4]
		0.4823858033307175, -- [5]
	}, -- [4]
	{
		873, -- [1]
		0.115612322787508, -- [2]
		0.1156117333201622, -- [3]
		0.5117757331953664, -- [4]
		0.4823857265687724, -- [5]
	}, -- [5]
} ]]