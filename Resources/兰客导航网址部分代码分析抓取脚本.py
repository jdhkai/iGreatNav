import os
import re
import pymysql

import traceback

file_path = "/Users/chenwei/Downloads/兰客导航地址.txt"
file_content = ''
with open(file_path,'r') as f:
	file_content = f.read()
url_pattern = r'<a href=\"(.*?)\" target="_blank" rel="nofollow">\s*<img src=\"(.*?)\"\s?/>\s*<div class="linktxt">(.*?)</div>'

pattern = re.compile(url_pattern)
result = pattern.findall(file_content)

db = pymysql.connect(host="localhost",user="root",password="cCNuQrQJ]nBuD>)4",database="WebNav",charset="UTF8",use_unicode=True)
cursor = db.cursor()

cateId = 6
canAddNode = ['豆瓣电影本周口碑榜 - 在线观看','Bensound - 免费商用背景音乐 Free','Videvo - 免费库存视频素材','下厨房 - 美食爱好者的分享平台',
			  'Google Play - 谷歌应用商店','攝影札記 - 新奇好玩的攝影資訊','PngImg - 免费透明PNG图像','Sketch Swap - 一画换一画','Stahlseite - 光影很强重工业摄影图片','SocialBeta - 社交媒体和数字营销平台','Archdaily - 世界最受欢迎的建筑网站','rdlp.jp - 商品销售页面设计','Type is Beautiful - 文字排版','Rafael-Varona - 清新小众的动图世界','Vector Magic - 最强大的位图转矢量','Qbrushes - 高质量笔刷下载网站','logomoose - 标志灵感','Colourco 在线颜色搭配工具','Vaufonts - 在线生成艺术字体']#可对cateId进行自增的节点

try:
	for item in result:
		address = item[0]
		#  处理链接中通过lackk.com平台进行跳转的链接
		if address.startswith('http://lackk.com/go/?url='):
			address = address.replace('http://lackk.com/go/?url=','')
		icon = item[1]
		# 处理lackk.com平台图片没有前缀的问题
		if icon.startswith('img'):
			icon = "http://lackk.com/nav/%s" %(icon)
		longName = item[2]
		shortName = longName
		# 将文字中前半部分的名称作为shortName，以-分隔
		if shortName.find('-')>-1:
			shortName = shortName.split('-')[0].strip()
		print(address)
		sql = "insert into navigation_urls(icon,short_name,long_name,url,created_by,created_time,order_value,cate_id) values('%s',\'%s\',\'%s\','%s',1,'2019-08-28 18:27:28',0,%d)" %(icon,pymysql.escape_string(shortName),pymysql.escape_string(longName),address,cateId)
		cursor.execute(sql)
		if longName in canAddNode:
			cateId += 1
	db.commit()
except Exception as e:
	print("出现异常....")
	traceback.print_exc()
	print(e)
	db.rollback()
db.close()
