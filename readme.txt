0.1 第一个版本,实现从handnotes导入的数据 占用79k
0.2 支持物品链接,左键输入链接 占用84k
0.3 调整数据库结构 子地图问题修复 数据库导入 如果是物品id直接用物品材质 占用100k
0.4 更新数据库 清理部分不掉落玩具的稀有 82k
0.5 添加宠物对战 继续瘦身 70k
0.6 完成检测功能 已经完成的半透明 加入山洞坐标 待测试 73k
0.61 测试完毕 修正数据中
0.62 加了个库用于获取地图比例偏移
0.7 折腾了数据库 实现上级地图显示 需要在该组数据表内加level = 2, 占用91k

TODO:
1 密你地图显示
4 博学者声望点

使用:
丢interface/addon文件夹 左键物品聊天框po出链接

astrolabe库的功能:
同一个pin在不同地图级别上都能显示 减少了数据输入量(数据通过计算获得)
自动将信息更新在小地图上