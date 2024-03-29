local _,ns = ...
ns.db = {}

tinsert(ns.db,true and  { --RichOfPandaria =潘达利亚的宝藏(金币)
	icon = 9,
	[862] = { --潘达利亚
		["船载储物箱"] = {
			coord = 70137450,
			quest = 31396,
			desc = "沉船船底",
			icon = 9,
		},
	},
	[807] = { --四风
		["[ 兔妖宝箱 ]"] = {
			["desc"] = "(23.72,28.32)入口隐藏在灌木丛中。",
			["icon"] = 28,
			["coord"] =23253067, -- [1]
			quest=31405,
		},
		["一箱被偷的货物"] = {
			["desc"] = "在汇风岭的兔子洞里，宝箱，随机附魔项链",
			["icon"] = 9,
			["coord"] =43953808, -- [1]
			quest=31406,
		},
	},
	[809] = { --崑莱
		["失窃的林精宝箱"] = {
			["desc"] = "凛风洞深处(坐标：31.9 50.4)  ",
			["icon"] = 28,
			["coord"] =59405300, --洞口
			redir = "HowlingwindCavern",
		},
		["遗失的冒险者的遗产"] = {
			["desc"] = "废弃营地  ",
			["icon"] = 9,
			["coord"] =36707980, -- [1]
			quest=31418,
		},
		["墨墨的宝箱"] = {
			["desc"] = "房间里",
			["icon"] = 28,
			["coord"] =48107300, -- [1]
			quest=31868,
		},
		["精灵的衣箱山洞"] = {--"林精的衣箱"
			["desc"] = "凛风洞深处，随机附魔披风，56.3 71.5",
			["icon"] = 28,
			["coord"] =73107350, -- [1]
			redir = "PrankstersHollow"
		},
		["猢狲宝箱"] = {
			["desc"] = "肘锤洞任务怪[邪恶的]裘裘背后 100金 ",
			["icon"] = 28,
			["coord"] =50306180, -- [1]
			redir = "KnucklethumpHole",
		},
		[86471] = {
			["desc"] = "走道非洞穴 右侧雕像背后 ",
			["icon"] = 28,
			["coord"] =64264516, -- [1]
			quest=31420,
		},
		[86422] = {
			["desc"] = "水潭底部",
			["coord"] =72063388, -- [1]
			quest=31416
		},
		[86427] = { 
			["coord"] =57807630, -- [1]
			quest=31422,
		},
	},
	[806] = { --翠玉
		[85780] = {
			["coord"] =26293181, -- [1]
			quest=31400,
		},
		["神龛"] = {
			["desc"] = "被斥责 ",
			["coord"] =46408070, -- [1]
			quest=31865,
		},
		[85781] = {
			["desc"] = "在铁腕机坪边上的一口井里。",
			["coord"] =31962775, -- [1]
			quest=31401, 
		},
		["秘藏的宝藏"] = {--???
			["desc"] = "临风岛山洞(坐标：64 ,25)",
			["icon"] = 28,
			["coord"] =64042510, -- [1]
			quest=31866,
		},
		["船载储物箱"] = {--??
			["desc"] = "翡翠林地图边缘 (坐标：51.4 100.0)  沉没在南部海岸的联盟船只造成的",
			["icon"] = 28,
			["coord"] =51429998, -- [1]
			quest=31396,
		},
		[86216] = {
			["desc"] = "努卡努卡营地西北边,玉盘湖中央。",
			["coord"] =23595108, -- [1]
			quest=31404, 
		},
	},
	[873] = { --客栈
		["被遗忘的密码箱"] = {
			["desc"] = "客栈二楼 10金 ",
			["icon"] = 28,
			["coord"] =55377114, -- [1]
			 quest=31867,
		},
		[86473] = {
			["desc"] = "石匠之愚山顶，黑市的东南边 ",
			["coord"] =75247634, -- [1]
			quest=31428,
		},
	},
	[810] = { --螳螂
		["一箱被丢弃的货物*"] = {
			["desc"] = "蟠龙脊内燃烧的帐篷 (坐标：62.8 34.0)",
			["coord"] =62743440, -- [1]
			quest=31427,
		},
		[86517] = {
			["desc"] = "科里维斯根部",
			["coord"] =53835991, -- [1]
			quest=31424,
		},
		[86472] = {
			["desc"] = "黯光枯木树根下(坐标：65.8 86.0) ",
			["coord"] = 65808610, -- [1]
			quest=31426, 
		},
		[86516] = { --山洞
			["desc"] = "砮皂寺西边的山洞 (坐标：48.4 89.2)",
			["icon"] = 28,
			["coord"] =32766160, -- [1]
			redir = "NiuzaoCatacombs"
		},
	},
	[857] = { --蛮荒
		[87266] = {
			["desc"] = "刷新稀有猴子的船头。",
			["coord"] =52318844, -- [1]
			quest=31411,
		},
		[86220] = {
			["desc"] = "朱家堡西边山洞(坐标：75.0 55.1) *由玩家提供的位置 100金 ",
			["icon"] = 28,
			["coord"] =71180862, -- [1]
			quest=31408,
		},
		["装备箱+"] = {
			["desc"] = "船舱底层，宝箱，随机附魔鞋子",
			["coord"] =41949262, -- [1]
			quest=31410,
		},
	},
	["PrankstersHollow"] = { --崑莱山洞
		["林精的衣箱"] = {
			["desc"] = "凛风洞深处，随机附魔披风，56.3 71.5",
			quest=31412, 
			coord = 54706980,
		},
	},
	["KnucklethumpHole"] = { -- 崑莱山洞
		["猢狲宝箱的洞口"] = {
			coord = 51892701,
			["desc"] = "肘锤洞任务怪[邪恶的]裘裘背后 100金 ",
			quest = 31414,
		},
    },
	["HowlingwindCavern"] = { -- 崑莱山洞
		["失窃的林精宝箱"] = {
			coord = 41404420,
			["desc"] = "凛风洞深处(坐标：31.9 50.4)  ",
			quest=31415, 
		},
    },
	["NiuzaoCatacombs"] = { -- 螳螂山洞
		[86516] = {
			coord = {56406480,36908760,48408860,64502150},
			["desc"] = "砮皂寺西边的山洞 (坐标：48.4 89.2)",
			quest=31423, 
		},
	},
})

tinsert(ns.db,true and  { --LostAndFound =装备
	[807] = { --四风
		[86218] = {
			["desc"] = "竹子丛里。非武僧职业可以获得的唯一武僧风格法杖。",
			["coord"] = {
				15402920, -- [1]
				14903360, -- [2]
				17503570, -- [3]
				19103780, -- [4]
				19004250, -- [5]
			},
			quest = 86218,
		},
		[87524] = {
			["coord"] = 92153889, 
			quest=31869,
		},
		[86079] = {
			["coord"] = 45403802, 
			 quest=31292,
		},
		[85973] = {
			["coord"] = 46642476, -- [1]
			quest=31284,
		},
	},
	[809] = { --崑莱
		[86125] = {
			["desc"] = "洞穴最深处,与冰块中的npc64227冰封小径运货人对话获得。",
			["icon"] = 28,
			["coord"] =37507800, -- [1]
			quest=31304
		},
		[86430] = {
			["icon"] = 28,
			["coord"] =52605150, -- [1]
			 quest=31419,
		},
		[86393] = {
			["desc"] = "不息山的顶峰的云壬的石像边。特效类似于[萨格拉斯的诅咒视界]。",
			["coord"] =44495273, -- [1]
			quest=31417,
		},
		[88723] = {
			["desc"] = "武器架上。",
			["coord"] ={70006380,7120626}, -- [1]
			quest=31421, 
		},
		[86394] = { --山洞
			["desc"] = "深石窟,在洞里第二层,在底层水池中的大石头上.特殊模型.",
			["icon"] = 28,
			["coord"] =52837130, -- [1]
			redir = "TheDeeper"
		},
	},
	[806] = { --翠玉
		[86199] = {
			["desc"] = "npc64272。玉婆婆前青玉战士雕像(坐标：39.2,46.6)。模型类似[流光碧空之歌]",
			["coord"] =39244641, -- [1]
			quest=31307,
		},
		[85777] = {
			["desc"] = "矿洞入口和内部都可能刷新。",
			["icon"] = 28,
			["coord"] =46262952, -- [1]
			redir = "GreenstoneQuarry"
		},
		[86196] = {
			["desc"] = "神龙之心南，说是在河里",
			["coord"] = {
				45306479, -- [1]
				47016757, -- [2]
				45997160, -- [3]
			},
			quest=31402, 
		},
		[86198] = {
			["desc"] = "十雷台的唤魂者之座。特殊模型",
			["coord"] = {
				41251789, -- [2]
				39871430, -- [3]
				41991755,
			},
			quest=31403,
		},
		[85776] = {
			["desc"] = "欧文的许愿井，十雷台西北边。卡拉克西风格模型",
			["coord"] =39360725, -- [1]
			quest=31397,
		},
	},
	[810] = { --螳螂
		[86518] = {
			["desc"] = " 奥苏尔火营，稀有精英隆恩附近的火盆.",
			["coord"] = {66304470,66804800}, -- [1]
			quest=31425, 
		},
	},
	[858] = { --悚然
		[86523] = {
			["desc"] = "闷水壶的冒险码头，海底2个岩石之间的海草上。卡拉克西风格模型",
			["coord"] =56707750, -- [1]
			quest=31434,
		},
		[86519] = {
			["desc"] = "一根底部覆盖着紫色灌木的柱子，比其他的柱子都高。卡拉克西风格模型",
			["coord"] =71883596, -- [1]
			quest=31429,
		},
		[86526] = {
			["desc"] = "暮根沼泽，在沼泽内的一小圈干地，附近有些石头和骨头。",
			["coord"] =54325685, -- [1]
			quest=31437,
		},
		[86524] = {
			["desc"] = "扎尼维斯的白色的岩石，在那个根部。特殊模型。",
			["coord"] =30299083, -- [1]
			 quest=31435, 
		},

		[86522] = {
			["desc"] = "挂在任务怪背后的墙壁上&树根上插着。卡拉克西风格模型",
			["coord"] =66766389, -- [1]
			icon = 28,
			quest=31433, 
		},

		[86529] = {
			["desc"] = "绿名海螺npc65552“拉帕纳微光海螺”对话获得",
			["coord"] =42076305, -- [1]
			quest=31432,
		},
		
		[86527] = {
			["desc"] = "毒水崖 琥珀孵育室门口，藏在灌木丛中比较难发现，",
			["coord"] =28894218, -- [1]
			quest=31438,
		},
		
		[86521] = {
			["desc"] = "恐惧之心西北，靠近水边的三个石头中间。",
			["coord"] =32993012, -- [1]
			quest=31431,
		},
		[86525] = {
			["desc"] = "泥鳞窟，水下洞穴，任务怪背后。",
			["coord"] =25725432, -- [1]
			icon = 28,
			quest=31436,
		},
		[86520] = {
			["desc"] = "找到这样一棵树，附近有3个螳螂人在控制一个巨虫。卡拉克西风格模型。",
			["coord"] =49063030, -- [1]
			quest=31430,
		},
	},
	[857] = { --蛮荒
		[86124] = {
			["desc"] = "站在海滩面朝大海的熊猫人npc德明大叔，就在他屁股后地面插着。简易鱼竿模型",
			["coord"] =50744919, -- [1]
			quest=31409,
		},
	},
	["TheDeeper"] = { -- 崑莱山洞
		[86394] = {
			coord = 24106580,
			["desc"] = "深石窟,在洞里第二层,在底层水池中的大石头上.特殊模型.",
			quest=31413,
		},
    },
	["GreenstoneQuarry"] = { -- 翠玉林山洞
		[85777] = {
			coord = {33107800,44007050,43703850,38704750,32606270,38981480},
			["desc"] = "矿洞入口和内部都可能刷新。",
			quest=31399,
		},
	},
})

tinsert(ns.db,true and  { --RareElite =玩具
	[807] = { --四风
		[86565] = {
			["desc"] = "黑蹄",
			["coord"] = {
				35396078, -- [1]
				31856130, -- [2]
				38595790, -- [3]
			},
		},
		[86576] = {
			["desc"] = "撕裂者纳拉克",
			["coord"] = {
				9554611, -- [1]
				12125187, -- [2]
				12285894, -- [3]
				8756392, -- [4]
			},
		},
		[86587] = {
			["desc"] = "納斯拉·斑皮",
			["coord"] =88821809, -- [1]
		},
		[86591] = {
			["desc"] = "波罗波斯",
			["coord"] = 13723878, -- [1]
		},
		[86580] = {
			["desc"] = "塞勒纳",
			["coord"] = {
				58174192, -- [1]
				55932752, -- [2]
				56573616, -- [3]
			},
		},
		[86583] = {
			["desc"] ="萨尔因作战斥候+",
			["coord"] = {
				68285318, -- [1]
				68286287, -- [2]
				72295842, -- [3]
				74385318, -- [4]
			},
		},
		[86569] = {
			["desc"] = "苏里克夏",
			["coord"] =36832647, -- [1]
		},
		[86572]= {
			["desc"] = "虬达",
			["coord"] =18547570, -- [1]
		},
	},
	[809] = { --崑莱
		[86573] = {
			["desc"] ="哈瓦克" ,
			["coord"] =57687348, -- [1]
		},
		[86566] = {
			["desc"] = "考达多罗斯",
			["coord"] =48988009, -- [1]
		},
		[86592] = {
			["desc"] = "斯克里奇",
			["coord"] = {
				44966426, -- [1]
				47556472, -- [2]
				46276198, -- [3]
			},
		},
		[86588] = {
			["desc"] = "漫游者阿波尼+",
			["coord"] =40604210, -- [1]
		},
		[86577] = {
			["desc"] ="斯基提克" ,
			["coord"] =37788072, -- [1]
		},
		[86570] = {
			["desc"] = "波尔金黑拳",
			["coord"] =57534806, -- [1]
		},
		[86584] = {
			["desc"] = "预言者奈松+",
			["coord"] =64631346, -- [1]
		},
		[86581] = {
			["desc"] = "被放逐的诺拉克斯",
			["coord"] =73827716, -- [1]
		},
	},
	[806] = { --翠玉
		[87780] = {
			["desc"] ="马尔泰弱智",
			["coord"] =56013099, -- [1]
		},
		[90078] = {
			["desc"] = "罗布·悲鸣",
			["coord"] =28162155, -- [1]
		},
	},	
	[811] = { --恒春谷
		[86586] = {
			["desc"] = "独眼者摩多",
			["coord"] = {
				39685349, -- [1]
				44114878, -- [2]
				36355946, -- [3]
			},
		},
		[86590] = {
			["desc"] = "迅云艾然",
			["coord"] =41347050, -- [1]
		},
		[86594] = {
			["desc"] ="纳纳斯少校",
			["coord"] =34699203, -- [1]
		},
		[86568] = {
			["desc"] = "利眼约里克",
			["coord"] =86644286, -- [1]
		},
		[86579] = {
			["desc"] = "凋零的卡尔提克",
			["coord"] =14175819, -- [1]
		},
		[86571] = {
			["desc"] = "灵魂窃贼康格",
			["coord"] =14843359, -- [1]
		},
		[86575] = {
			["desc"] ="乌戈拉克斯" ,
			["coord"] =42322402, -- [1]
		},
		[86582] = {
			["desc"] = "撒罕潮猎者",
			["coord"] =61745584, -- [1]
		},
	},
	[858] = { --悚然
		[86589] = {
			["desc"] = "艾利天镜+",
			["coord"] =33812301, -- [1]
		},
		[86578] = {
			["desc"] ="嘎洛克+" ,
			["coord"] =38202888, -- [1]
		},
		[86564] = {
			["desc"] = "黑化者卡尔+",
			["coord"] =71633742, -- [1]
		},
		[86567] = {
			["desc"] ="破坏者哒克" ,
			["coord"] =24822834, -- [1]
		},
		[86585] = {
			["desc"] ="奥米斯格林洛克" ,
			["coord"] = {
				41055971, -- [1]
				38486177, -- [2]
				35246261, -- [3]
				38115846, -- [4]
				36816701, -- [5]
			},
		},
		[86574] = {
			["desc"] = "“利刃”科罗尔+",
			["coord"] =73542277, -- [1]
		},
		[86593] = {
			["desc"] = "聪明的伊克伊克+ 树洞里。",
			["coord"] =54656652, -- [1]
		},
		[86563] = {
			["desc"] = "纳拉什沃登提斯",
			["coord"] =64745765, -- [1]
		},
	},
})

tinsert(ns.db,true and { --博学者
	level = 2,
	achieve = true,
	[807] = { --四风
		[684602] = {
			coord = 61203460,
		},
		[685801] = {
			coord = 18803170,
		},
		[685003] = {
			coord = 83102120,
			desc = "似乎有问题 参考30.8 30.5",
		},
		[685601] = {
			coord = 20305590,
		},
		[685602] = {
			coord = 55004720,
		},
		[685603] = {
			coord = 34606400,
		},
	},
	[809] = { --崑莱
		[684604] = {
			coord = 74508350,
		},
		[675401] = { --洞口修正
			coord = 52974655,
			desc = "山洞里(58.29 71.53)",
		},
		[685805] = {
			coord = 63104080,
		},
		[685004] = {
			coord = 45756189,
		},
		[684701] = {
			coord = 50407920,
		},
		[684703] = {
			coord = 71706300,
		},
		[685502] = {
			coord = 43805120,
		},
		[685506] = {
			coord = 67804830,
		},
		[685507] = {
			coord = 41004240,
		},
		[723003] = {
			coord = 44705240,
		},
	},
	[806] = { --翠玉
		[684601] = {
			coord = 66008760,
		},
		[675403] = {
			coord = 42301750,
		},
		[685803] = {
			coord = 35703050,
		},
		[685001] = {
			coord = 26502830,
		},
		[671601] = {
			coord = 67702940,
		},
		[685501] = {
			coord = 47104520,
		},
		[685503] = {
			coord = 55805680,
		},
		[723002] = {
			coord = 37303010,
		},
	},
	[810] = { --螳螂
		[684702] = {
			coord = 65405000,
		},
		[684704] = {
			coord = 84007280,
		},
		[685505] = {
			coord = 37706290,
		},
	},
	[858] = { --悚然
		[685701] = {
			coord = 48303290,
		},
		[685702] = {
			coord = 59905510,
		},
		[685703] = { --洞口修正
			coord = 53601550,
			desc = "洞口"
		},
		[685704] = {
			coord = 35503260,
		},
		[671603] = {
			coord = 67406090,
		},
	},
	[857] = { --蛮荒
		[684603] = {
			coord = 30303860,
		},
		[675402] = {
			coord = 51003170,
		},
		[685002] = { --山洞修正
			coord = 52208600,
			desc = "山洞里面",
		},
		[671604] = {
			coord = 32802950,
		},
		[685504] = {
			coord = 40505660,
			desc = "楼梯往上",
		},
		[723001] = {
			coord = 81401140,
		},
		[685604] = {
			coord = 72203100,
		},
	},
	[811] = { --恒春谷
		[675404] = {
			coord = 40207740,
		},
		[685802] = {
			coord = 52906850,
		},
		[685804] = {
			coord = 26602160,
		},
		[685508] = {
			coord = 68704430,
		},
	},
	[873] = { --客栈
		[671602] = {
			coord = 57721310,
			desc = "山洞",
		},
	},
	["TheAncientPassage"] = { --山洞里
		[671602] = {
			coord = 55131620,
		},
	},
})

local npc = {}
for i = 1,7 do
	npc[i] = GetAchievementCriteriaInfo(6606,i)
end
tinsert(ns.db,true and  {--PetTamers =宠物对战
	level = 2,
	icon = 29,
	[807] = { --四风
		[npc[2]] = {
			coord = 46004360,
			desc = "",
			quest = 31955,
		},
	},
	[809] = { --崑莱
		[npc[4]] = {
			coord = 35807360,
			desc = "",
			quest = 31956,
		},
		["土灵"] = {
			coord = 64809360,
			desc = "",
			quest = 32441,
		},
	},
	[811] = { --恒春谷
		[npc[7]] = {
			coord = 67604080,
			desc = "",
			quest = 31958,
		},
	},
	[858] = { --悚然
		[npc[6]] = {
			coord = 55003760,
			desc = "",
			quest = 31957,
		},
		["水灵"] = {
			coord = 61208760,
			desc = "",
			quest = 32439,
		},
	},
	[806] = {--翠玉
		[npc[1]] = {
			coord = 48005400,
			desc = "",
			quest = 31953,
		},
		["风灵"] = {
			coord = 28803600,
			desc = "",
			quest = 32440,
		},
	},
	[857] = {--蛮荒
		[npc[3]] = {
			coord = 62204580,
			desc = "",
			quest = 31954,
		},
	},
	[810] = {--螳螂
		[npc[5]] = {
			coord = 36205220,
			desc = "",
			quest = 31991,
		},
		["火灵"] = {
			coord = 57004220,
			desc = "",
			quest = 32434,
		},
	},
})

---------------------
----以下不要修改----
---------------------

ns.mapscale = {
	[806] = { --翠玉林
		0.4500933135463645, 
		0.4499587726878093,
		0.4705534206845249,
		0.2926539118731085,
	},
	[873] = { --客栈
		0.115611615263164, 
		0.1156116127819066, 
		0.5117761936403419,
		0.4823858033307175,
	},
	[811] = { --恒春谷
		0.1632799786118908, 
		0.1631456303065864,
		0.4042208283541151,
		0.4574103326724259, 
	},
	[858] = { --悚然
		0.3449545330796179,
		0.3450220518230708,
		0.1684327024909846, 
		0.5087710454828307, 
	},
	[857] = { --蛮荒
		0.3021214165847387, 
		0.3021208503206008,
		0.3741431304475718,
		0.6564074552525323,
	},
	[807] = { --四风
		0.2529764589708267, 
		0.2529761597573952,
		0.3914645989001039, 
		0.5397887140930443, 
	},
	[810] = { --螳螂
		0.370199006437579,
		0.3701986912220293,
		0.1078738485208499,
		0.2050388951142818,
	},
	[809] = { --崑莱
		0.4033651894330519,
		0.4034319729651503,
		0.2522206005004135,
		0.1025192009316251, 
	}
}

ns.Icons = {
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
	[29] = { icon = "Interface\\Icons\\Tracking_WildPet"}
}

--[[ local mt = {
	__add = function(a,b)
		for mapid,t1 in pairs(b) do
			if not a[mapid] then  --直接复制
				a[mapid] = t1
			else --合并
				for name,t2 in pairs(t1) do
					a[mapid][name] = t2
				end
			end
		end
		return a
	end}

setmetatable(LostAndFound,mt)
setmetatable(PetTamers,mt)

ns.db = LostAndFound + PetTamers ]]

-- ns.db = {
	-- [mapid] = {
		-- [itemid] = {
			-- [coord] = {12345678, 23456789},--如果坐标唯一可以[coord] = 12345678,
			-- icon = texture,
			-- redir = mapname,--该坐标是其他地图的补充
			-- desc = "",--额外信息
		-- },
	-- },
-- }



--mapid 可以是地图唯一id也可以是名称 注意:山洞里必需使用名称 区域地图推荐mapid
--itemid 装备id 或者名称 如果是id直接调用物品图标

--重新定义数据库
--宝物猎人相关
--精英玩具相关
--宝藏相关
--博学者成就相关
--宠物训练师相关
--每个数据库都有自己默认图标 自己的开光状态 以及其他信息

--name = function(id) 用于返回名称
--link = function(id) 用于返回链接
--check = function(id) 用于返回状态检查


