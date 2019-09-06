/*
 Navicat MySQL Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : WebNav

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 05/09/2019 16:24:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for navigation_cate
-- ----------------------------
DROP TABLE IF EXISTS `navigation_cate`;
CREATE TABLE `navigation_cate` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `theme_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主题颜色 以十六进制表示，以#号开头',
  `intro` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介 简短说明，不宜过长',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级标识 顶级为0',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '级别 从0开始',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='导航分类 ';

-- ----------------------------
-- Records of navigation_cate
-- ----------------------------
BEGIN;
INSERT INTO `navigation_cate` VALUES (1, '兰客导航', 'http://lackk.com/nav/img/lackk.png', NULL, '', 0, 0, 1, 1, '2019-08-28 18:27:28', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (2, '内容频道', 'http://lackk.com/nav/img/rss.png', NULL, '', 0, 0, 1, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (3, '快捷键设置', 'http://lackk.com/nav/img/hot%20key.svg', NULL, '', 0, 0, 1, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (4, '自定义网址', 'http://lackk.com/nav/img/settings.svg', NULL, '', 0, 0, 1, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (5, '电视直播', 'http://lackk.com/nav/img/tv.svg', NULL, '', 0, 0, 1, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (6, '今日推荐 * 精选', NULL, '#7ABC48', '* 发现新鲜的内容 #欢迎投稿', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (7, 'Music * FM', NULL, '#D78A3A', '⁣⁣⁣* 发现独特音乐的好去处', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (8, 'Movie * Video', NULL, '#FA0C1B', '* 发现优质创意视频', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (9, 'Read * Forum', NULL, '#DDBD2E', '* 知识、内容、社区平台', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (10, 'App * PC', NULL, '#1F91DB', '* App应用及软件推荐', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (11, 'Photography', NULL, '#000000', '* 收集高质量的摄影网站', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (12, 'Gallery * Pictures', NULL, '#49AE6F', '* 寻找壁纸及图片素材的好地方', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (13, 'Drawing * illustrator', NULL, '#FD763B', '⁣⁣* 绘画 插画', 0, 1, 2, 0, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (14, 'Nice * photo', NULL, '#DCB734', '⁣⁣⁣⁣* 关于有趣/好看的图片收集', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (15, 'Creative Digital', NULL, '#4761E0', '* 创意数字营销', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (16, 'Inspiration', NULL, '#D6B02C', '* 设计灵感社区', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (17, 'website * html5', NULL, '#DF4E2E', '* 网页界面 酷站', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (18, 'Ddesign Tutsplus', NULL, '#2B39DA', '⁣⁣⁣⁣* 设计教程内容平台', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (19, 'Creative * interesting', NULL, '#6845D8', '⁣⁣⁣* 创意、脑动、黑科技', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (20, 'Tool * Web', NULL, '#2993FC', '⁣⁣⁣⁣* 高效好用的在线网页工具', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (21, 'Material', NULL, '#49AE6F', '⁣* 设计师常用的素材网站', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (22, 'Logo * Icon', NULL, '#31AA37', '⁣⁣⁣⁣* 标志图标灵感', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (23, 'Color', NULL, '#FA0C1B', '* 配色灵感和工具', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
INSERT INTO `navigation_cate` VALUES (24, 'Font', NULL, '#ED356E', '⁣⁣⁣⁣* 优秀字体网站', 0, 1, 2, 1, '2019-08-28 23:07:33', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for navigation_common
-- ----------------------------
DROP TABLE IF EXISTS `navigation_common`;
CREATE TABLE `navigation_common` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='常用导航表 ';

-- ----------------------------
-- Records of navigation_common
-- ----------------------------
BEGIN;
INSERT INTO `navigation_common` VALUES (1, 'http://lackk.com/nav/img/top/toutiao.svg', '今日头条', 'https://www.toutiao.com/', 0, 1, '2019-08-28 20:54:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (2, 'http://lackk.com/nav/img/top/douban.svg', '豆瓣', 'http://www.douban.com/', 0, 1, '2019-08-28 20:54:56', NULL, NULL);
INSERT INTO `navigation_common` VALUES (3, 'http://lackk.com/nav/img/top/webstack.png', '设计导航', 'http://webstack.cc/cn/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (4, 'http://lackk.com/nav/img/top/meiriyiwen.jpg', '每日一文', 'https://meiriyiwen.com', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (5, 'http://lackk.com/nav/img/top/chuangzaoshi.png', '创造狮', 'http://www.chuangzaoshi.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (6, 'http://lackk.com/nav/img/top/creativemass.png', '创意导航', 'https://creativemass.cn', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (7, 'http://lackk.com/nav/img/top/seeseed.jpg', 'seeseed', 'http://www.seeseed.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (8, 'http://lackk.com/nav/img/top/uisdc.jpg', '优设导航', 'https://hao.uisdc.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (9, 'http://lackk.com/nav/img/top/webstack.png', '龙轩导航', 'http://ilxdh.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (10, 'http://lackk.com/nav/img/top/shejidaren.jpg', '设计达人', 'http://hao.shejidaren.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (11, 'http://lackk.com/nav/img/top/shejipi.png', '工业设计', 'http://hao.shejipi.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (12, 'http://lackk.com/nav/img/top/uigreat.png', 'UI导航', 'http://so.uigreat.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
INSERT INTO `navigation_common` VALUES (13, 'http://lackk.com/nav/img/top/ubuuk.jpg', '优波导航', 'https://www.ubuuk.com/', 0, 1, '2019-08-28 20:55:00', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for navigation_float
-- ----------------------------
DROP TABLE IF EXISTS `navigation_float`;
CREATE TABLE `navigation_float` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `text_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '颜色 十六进制表示，以#号开头',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '层 显示在上层还是下层,1表示上层，2表示下层',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='悬浮链接表 ';

-- ----------------------------
-- Records of navigation_float
-- ----------------------------
BEGIN;
INSERT INTO `navigation_float` VALUES (1, '主页', 'http://lackk.com/', '#666666', 1, 0, 1, '2019-08-28 23:03:52', NULL, NULL);
INSERT INTO `navigation_float` VALUES (2, '微博', 'https://www.weibo.com/lackk', '#666666', 1, 0, 1, '2019-08-28 23:05:07', NULL, NULL);
INSERT INTO `navigation_float` VALUES (3, '友链', 'ttp://lackk.com/link/', '#666666', 1, 0, 1, '2019-08-28 23:05:07', NULL, NULL);
INSERT INTO `navigation_float` VALUES (4, '联系', 'http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=NVlUVl5edUREG1ZaWA', '#666666', 2, 0, 1, '2019-08-28 23:05:07', NULL, NULL);
INSERT INTO `navigation_float` VALUES (5, 'LIKE', 'http://lackk.com/like/', '#7ABC48', 2, 0, 1, '2019-08-28 23:05:07', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for navigation_urls
-- ----------------------------
DROP TABLE IF EXISTS `navigation_urls`;
CREATE TABLE `navigation_urls` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `short_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短名称',
  `long_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '长名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cate_id` int(11) NOT NULL COMMENT '所属分类编号',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='导航链接表 ';

-- ----------------------------
-- Records of navigation_urls
-- ----------------------------
BEGIN;
INSERT INTO `navigation_urls` VALUES (1, 'http://lackk.com/nav/img/favicons/vip.svg', '优酷、腾讯、爱奇艺', '优酷、腾讯、爱奇艺-VIP视频免费看', 'http://lackk.com/vip', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 6);
INSERT INTO `navigation_urls` VALUES (2, 'http://lackk.com/nav/img/favicons/Google.svg', '谷歌镜像', '谷歌镜像 - 直接使用谷歌搜索', 'https://g.xiesou.com.cn', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 6);
INSERT INTO `navigation_urls` VALUES (3, 'http://lackk.com/nav/img/favicons/douban.svg', '豆瓣电影本周口碑榜', '豆瓣电影本周口碑榜 - 在线观看', 'http://lackk.com/douban', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 6);
INSERT INTO `navigation_urls` VALUES (4, 'https://www.google.cn/s2/favicons?domain=https://music.163.com', '网易云音乐', '网易云音乐 - 每日新发现', 'https://music.163.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (5, 'https://www.google.cn/s2/favicons?domain=http://www.luoo.net/', '落网', '落网 - 独立音乐推荐', 'http://www.luoo.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (6, 'https://www.google.cn/s2/favicons?domain=https://www.last.fm/zh/', 'last.fm', 'last.fm - 世界音乐库', 'https://www.last.fm/zh/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (7, 'http://lackk.com/nav/img/favicons/wooozy.png', 'Wooozy', 'Wooozy - 无解音乐', 'http://www.wooozy.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (8, 'https://www.google.cn/s2/favicons?domain=https://genius.com/', 'Genius', 'Genius - 歌词网站', 'https://genius.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (9, 'https://www.google.cn/s2/favicons?domain=https://streetvoice.cn', '街声', '街声 - StreetVoice', 'https://streetvoice.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (10, 'https://www.google.cn/s2/favicons?domain=douban.fm', 'douban.fm', 'douban.fm - 豆瓣FM', 'https://douban.fm', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (11, 'https://www.google.cn/s2/favicons?domain=https://music.douban.com/', '豆瓣音乐', '豆瓣音乐 - 推荐适合你的唱片', 'https://music.douban.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (12, 'https://www.google.cn/s2/favicons?domain=mixcloud.com', 'Mixcloud', 'Mixcloud - 混音电台', 'https://www.mixcloud.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (13, 'https://www.google.cn/s2/favicons?domain=https://www.itingwa.com', '听蛙有声电台', '听蛙有声电台 - 在声音中聆听文字', 'https://www.itingwa.com/radio', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (14, 'https://www.google.cn/s2/favicons?domain=https://luooqi.com/', '鱼声音乐', '鱼声音乐 - 每日音乐精选', 'https://luooqi.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (15, 'https://www.google.cn/s2/favicons?domain=songtasty.com/', 'SongTasty', 'SongTasty - 用音乐倾听彼此', 'http://songtasty.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (16, 'https://www.google.cn/s2/favicons?domain=xiami.com/', '虾米音乐', '虾米音乐 - 乐随心动', 'https://www.xiami.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (17, 'https://www.google.cn/s2/favicons?domain=moofm.com/', '陌声人', '陌声人 - 一个人的精神良药', 'http://www.moofm.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (18, 'https://www.google.cn/s2/favicons?domain=https://www.bensound.com/', 'Bensound', 'Bensound - 免费商用背景音乐 Free', 'https://www.bensound.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 7);
INSERT INTO `navigation_urls` VALUES (19, 'https://www.google.cn/s2/favicons?domain=https://www.ted.com/', 'TED', 'TED - 值得传播的创意', 'https://www.ted.com/talks?sort=newest&language=zh-tw', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (20, 'https://www.google.cn/s2/favicons?domain=http://www.bilibili.com/', 'bilibili', 'bilibili - 弹幕视频', 'http://www.bilibili.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (21, 'https://www.google.cn/s2/favicons?domain=https://www.nowness.cn/', 'Nowness', 'Nowness - 全球创意生活短片', 'https://www.nowness.cn', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (22, 'https://www.google.cn/s2/favicons?domain=https://www.vmovier.com', '场库', '场库 - 高品质短片分享平台', 'https://www.vmovier.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (23, 'https://www.google.cn/s2/favicons?domain=http://www.lookcf.com/', 'Lookcf', 'Lookcf - 广告创意汇', 'http://www.lookcf.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (24, 'https://www.google.cn/s2/favicons?domain=https://www.tvcbook.com/searchpage.html', 'TVCBOOK', 'TVCBOOK - 视频创作与分发平台', 'https://www.tvcbook.com/searchpage.html', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (25, 'https://www.google.cn/s2/favicons?domain=http://www.tvcx.com/', '红视子TVCX', '红视子TVCX - 创意广告视频资源', 'http://www.tvcx.com/desktop?from=u', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (26, 'https://www.google.cn/s2/favicons?domain=yinyuetai.com', '音悦Tai', '音悦Tai - 让娱乐更美好', 'https://www.yinyuetai.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (27, 'https://www.google.cn/s2/favicons?domain=open.163.com', '网易公开课', '网易公开课 - 国内外名校公开课', 'https://open.163.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (28, 'https://www.google.cn/s2/favicons?domain=www.youtube.com', 'YouTube', 'YouTube- 世界最大的视频平台', 'https://www.youtube.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (29, 'https://www.google.cn/s2/favicons?domain=https://vimeo.com', 'Vimeo', 'Vimeo - 高清创意视频', 'https://vimeo.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (30, 'https://www.google.cn/s2/favicons?domain=www.youku.com', '优酷', '优酷-这世界很酷', 'https://www.youku.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (31, 'https://www.google.cn/s2/favicons?domain=http://www.xinpianchang.com', '新片场', '新片场 - 影视创作人社区', 'http://www.xinpianchang.com/channel/index', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (32, 'https://www.google.cn/s2/favicons?domain=http://mazwai.com', 'Mazwai', 'Mazwai - 免費高畫質影片素材集', 'http://mazwai.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (33, 'https://www.google.cn/s2/favicons?domain=https://www.videvo.net/', 'Videvo', 'Videvo - 免费库存视频素材', 'https://www.videvo.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 8);
INSERT INTO `navigation_urls` VALUES (34, 'http://lackk.com/nav/img/top/meiriyiwen.jpg', '每日一文', '每日一文 - 每天一篇精彩文章', 'https://meiriyiwen.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (35, 'https://www.google.cn/s2/favicons?domain=zhihu.com', '知乎', '知乎 - 知识分享平台', 'https://www.zhihu.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (36, 'https://www.google.cn/s2/favicons?domain=https://zh.wikihow.com/', 'Wikihow', 'Wikihow - 如何去做任何事情', 'https://zh.wikihow.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (37, 'https://www.google.cn/s2/favicons?domain=www.jianshu.com', '简书', '简书 - 创作你的创作', 'https://www.jianshu.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (38, 'https://www.google.cn/s2/favicons?domain=https://www.v2ex.com', 'v2ex', 'v2ex - 分享和探索的地方', 'https://www.v2ex.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (39, 'https://www.google.cn/s2/favicons?domain=https://juejin.im/', '掘金', '掘金 - 一个帮助开发者成长的社区', 'https://juejin.im/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (40, 'https://www.google.cn/s2/favicons?domain=https://www.tumblr.com/', 'Tumblr', 'Tumblr - 为你的所爱而来', 'https://www.tumblr.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (41, 'https://www.google.cn/s2/favicons?domain=https://www.instagram.com', 'Instagram', 'Instagram - 照片墙', 'https://www.instagram.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (42, 'https://www.google.cn/s2/favicons?domain=https://www.facebook.com/', 'Facebook', 'Facebook - 社交网络', 'https://www.facebook.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (43, 'https://www.google.cn/s2/favicons?domain=http://www.voicer.me/', 'Voicer', 'Voicer - 分享生活美学的在线杂志', 'http://www.voicer.me/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (44, 'https://www.google.cn/s2/favicons?domain=https://issuu.com/', 'Issuu', 'Issuu - 最美视觉杂志', 'https://issuu.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (45, 'https://www.google.cn/s2/favicons?domain=http://www.zreading.cn/', '左岸读书', '左岸读书 - 一切成功均源自积累', 'http://www.zreading.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (46, 'https://www.google.cn/s2/favicons?domain=www.guokr.com', '果壳', '果壳 - 科技有意思', 'https://www.guokr.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (47, 'https://www.google.cn/s2/favicons?domain=xinli001.com', '壹心理', '壹心理 - 世界和我爱着你', 'http://xinli001.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (48, 'https://www.google.cn/s2/favicons?domain=songshuhui.net', '科学松鼠会', '科学松鼠会 - 让我们剥开科学的坚果', 'http://songshuhui.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (49, 'https://www.google.cn/s2/favicons?domain=www.xiachufang.com', '下厨房', '下厨房 - 美食爱好者的分享平台', 'http://www.xiachufang.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 9);
INSERT INTO `navigation_urls` VALUES (50, 'https://www.google.cn/s2/favicons?domain=https://sspai.com/', '少数派', '少数派 - 高效工作，品质生活', 'https://sspai.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (51, 'https://www.google.cn/s2/favicons?domain=http://next.36kr.com', 'NEXT', 'NEXT - 不错过任何一个新产品', 'http://next.36kr.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (52, 'https://www.google.cn/s2/favicons?domain=https://www.producthunt.com/', 'Producthunt', 'Producthunt - 发现新鲜有趣的产品', 'https://www.producthunt.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (53, 'https://www.google.cn/s2/favicons?domain=https://www.appinn.com/', '小众软件', '小众软件 - 让你的应用与众不同', 'https://www.appinn.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (54, 'https://www.google.cn/s2/favicons?domain=https://www.iplaysoft.com/', '异次元软件世界', '异次元软件世界 - 软件改变生活', 'https://www.iplaysoft.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (55, 'https://www.google.cn/s2/favicons?domain=https://xbeta.info/', '善用佳软= 善于应用优秀软件', '善用佳软= 善于应用优秀软件', 'https://xbeta.info/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (56, 'https://www.google.cn/s2/favicons?domain=http://zuimeia.com/', '最美应用', '最美应用 - 发现好用、好看、好玩', 'http://zuimeia.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (57, 'https://www.google.cn/s2/favicons?domain=https://www.coolapk.com/', '\"酷安网，发现应用的乐趣', '\"酷安网，发现应用的乐趣', 'https://www.coolapk.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (58, 'https://www.google.cn/s2/favicons?domain=https://play.google.com/', 'Google Play', 'Google Play - 谷歌应用商店', 'https://play.google.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 10);
INSERT INTO `navigation_urls` VALUES (59, 'https://gallery.1x.com/favicon.ico', '1x.com', '1x.com - 纯粹的摄影社区', 'https://gallery.1x.com ', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (60, 'https://www.google.cn/s2/favicons?domain=https://35photo.pro/', '35photo', '35photo - 专业摄影师社交网络', 'https://35photo.pro/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (61, 'https://www.google.cn/s2/favicons?domain=https://www.lensculture.com/', 'LensCulture', 'LensCulture -当代摄影', 'https://www.lensculture.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (62, 'https://www.pexels.com/favicon.ico', 'Pexels', 'Pexels - 免费摄影图库 Free', 'https://www.pexels.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (63, 'https://www.google.cn/s2/favicons?domain=https://unsplash.com/', 'Unsplas', 'Unsplas - 美丽的免费图像 Free', 'https://unsplash.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (64, 'https://www.google.cn/s2/favicons?domain=https://weheartit.com', 'We Heart It', 'We Heart It  - 在挚爱中迷失自己', 'https://weheartit.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (65, 'https://www.google.cn/s2/favicons?domain=http://www.chictopia.com', 'WChictopia', 'WChictopia - 穿搭造型的灵感来源', 'http://www.chictopia.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (66, 'https://www.google.cn/s2/favicons?domain=https://fashioneditorials.com/', 'Fashioneditorials', 'Fashioneditorials - 时尚摄影志', 'https://fashioneditorials.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (67, 'https://www.google.cn/s2/favicons?domain=https://i-d.vice.com', 'i', 'i-d.vice.com - 英国i-D杂志', 'https://i-d.vice.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (68, 'http://www.atelierdore.com/wp-content/themes/garancedore/images/logo-min--colored.svg', 'Atelier Doré', 'Atelier Doré - 创造美丽', 'http://www.atelierdore.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (69, 'https://www.google.cn/s2/favicons?domain=https://www.flickr.com/', 'Flickr', ' Flickr - 你的靈感泉源', 'https://www.flickr.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (70, 'https://www.google.cn/s2/favicons?domain=https://500px.com/', '500px', '500px - 最出色的摄影社区', 'https://500px.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (71, 'https://www.google.cn/s2/favicons?domain=https://tuchong.com', '图虫网', '图虫网 - 优质摄影师交流社区', 'https://tuchong.com/video/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (72, 'https://www.google.cn/s2/favicons?domain=https://smagazine.com/', 'Antoine Verglas', 'Antoine Verglas - 法国时尚摄影师', 'https://smagazine.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (73, 'https://www.google.cn/s2/favicons?domain=https://www.antoineverglas.com/', 'AS Magazine', 'AS Magazine - 爱情与文化摄影杂志', 'https://www.antoineverglas.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (74, 'https://www.google.cn/s2/favicons?domain=http://nikosalpha.com', 'Nikosalpha 摄影师', 'Nikosalpha 摄影师', 'http://nikosalpha.com/featured', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (75, 'https://www.google.cn/s2/favicons?domain=http://www.styleclicker.net/', 'Style Clicker', 'Style Clicker - 德国街头时尚摄影', 'http://www.styleclicker.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (76, 'https://www.google.cn/s2/favicons?domain=www.kurtstallaert.com', 'Holding Still | Kurt Stallaert', 'Holding Still | Kurt Stallaert', 'www.kurtstallaert.com/work', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (77, 'https://www.google.cn/s2/favicons?domain=http://www.smetana.net/', 'Smetana', 'Smetana - Campaigns', 'http://www.smetana.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (78, 'https://www.google.cn/s2/favicons?domain=https://www.estevezandbelloso.com', 'estevez + belloso ', 'estevez + belloso ', 'https://www.estevezandbelloso.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (79, 'https://www.google.cn/s2/favicons?domain=https://www.totallycoolpix.com', 'OtallyCoolPix', 'OtallyCoolPix - 世界新闻摄影', 'https://www.totallycoolpix.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (80, 'https://www.google.cn/s2/favicons?domain=photoblog.hk', '攝影札記', '攝影札記 - 新奇好玩的攝影資訊', 'https://photoblog.hk', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 11);
INSERT INTO `navigation_urls` VALUES (81, 'https://www.vcg.com/favicon.ico', '视觉中国', '视觉中国 - 收费高清图片素材库', 'https://www.vcg.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (82, 'http://www.quanjing.com/image/2018image/public/logo-1.png', '全景网', '全景网 - 收费商业图片素材库', 'http://www.quanjing.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (83, 'https://www.google.cn/s2/favicons?domain=https://librestock.com/', 'LibreStock', 'LibreStock - 搜寻20个免费图库 Free', 'https://librestock.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (84, 'https://www.google.cn/s2/favicons?domain=https://pixabay.com/', 'Pixabay', 'Pixabay - 惊人的免费图片 Free', 'https://pixabay.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (85, 'https://www.google.cn/s2/favicons?domain=https://www.pakutaso.com/', 'Pakutaso', 'Pakutaso - 免费人物素材 Free', 'https://www.pakutaso.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (86, 'https://www.google.cn/s2/favicons?domain=https://www.nicepik.com/', 'Nicepik', 'Nicepik - 基于AI的数百万张图库 Free', 'https://www.nicepik.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (87, 'https://www.google.cn/s2/favicons?domain=https://kaboompics.com/', 'Kaboompics', 'Kaboompics - 媒體也愛用的免費图库 Free', 'https://kaboompics.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (88, 'https://www.google.cn/s2/favicons?domain=https://stocksnap.io/', 'StockSnap', 'StockSnap -美丽的免费库存照片 Free', 'https://stocksnap.io/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (89, 'https://www.google.cn/s2/favicons?domain=https://gratisography.com/', 'Gratisography', 'Gratisography -免费的高分辨率照片 Free', 'https://gratisography.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (90, 'https://www.google.cn/s2/favicons?domain=https://visualhunt.com', 'Visual Hunt', 'Visual Hunt - 免费高清图片搜索 Free', 'https://visualhunt.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (91, 'http://finda.photo/favicon.ico', 'FindA.Photo', 'FindA.Photo - 根据颜色和标签来搜图 Free', 'http://finda.photo/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (92, 'https://www.google.cn/s2/favicons?domain=https://picjumbo.com/', 'Picjumbo', 'Picjumbo - 高质量生活场景照片 Free', 'https://picjumbo.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (93, 'https://www.google.cn/s2/favicons?domain=http://compfight.com/', 'Compfight', 'Compfight - 专门搜寻flickr照片搜尋引擎', 'http://compfight.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (94, 'https://www.google.cn/s2/favicons?domain=https://alpha.wallhaven.cc', 'Wallhaven.cc', 'Wallhaven.cc - 高清壁纸', 'https://alpha.wallhaven.cc', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (95, 'https://www.google.cn/s2/favicons?domain=https://www.goodfon.com/', 'Goodfon.cc', 'Goodfon.cc - 免费下载桌面壁纸', 'https://www.goodfon.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (96, 'https://www.google.cn/s2/favicons?domain=https://magdeleine.co/browse/', 'Hand', 'Hand-picked 色彩分类大图', 'https://magdeleine.co/browse/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (97, 'https://www.google.cn/s2/favicons?domain=https://www.stockvault.net', 'stockvault.net摄影图库', 'stockvault.net摄影图库', 'https://www.stockvault.net', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (98, 'https://www.google.cn/s2/favicons?domain=http://www.animal-photos.org', 'Animal', 'Animal-photos - 高清动物新照片', 'http://www.animal-photos.org/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (99, 'https://www.google.cn/s2/favicons?domain=http://pngimg.com/', 'PngImg', 'PngImg - 免费透明PNG图像', 'http://pngimg.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 12);
INSERT INTO `navigation_urls` VALUES (100, 'https://www.google.cn/s2/favicons?domain=https://folioart.co.uk', 'Folioart', 'Folioart - 插画家和艺术家的作品集', 'https://folioart.co.uk', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (101, 'https://www.google.cn/s2/favicons?domain=https://illustrationage.com/', 'illustrationage', 'illustrationage - 插图画家的终极资源', 'https://illustrationage.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (102, 'https://www.google.cn/s2/favicons?domain=https://www.itsnicethat.com/', 'It\'s Nice That', 'It\'s Nice That - 优秀插画作品及创作的故事', 'https://www.itsnicethat.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (103, 'https://www.google.cn/s2/favicons?domain=https://www.theispot.com/', 'The i spot', 'The i spot - 优秀插画展示目录', 'https://www.theispot.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (104, 'https://www.google.cn/s2/favicons?domain=https://www.pixiv.net', 'Pixiv', 'Pixiv- 日本艺术家插画交流网站', 'https://www.pixiv.net', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (105, 'https://www.google.cn/s2/favicons?domain=https://www.grafolio.com', 'Grafolio', 'Grafolio - 创作者们的游乐园', 'https://www.grafolio.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (106, 'https://www.google.cn/s2/favicons?domain=https://www.artstation.com/', 'Artstation', 'Artstation - 原画游戏设计插画作品网', 'https://www.artstation.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (107, 'https://www.google.cn/s2/favicons?domain=http://www.n8w.com/', 'Nate Williams', 'Nate Williams - 聚集优秀插画家作品的网站', 'http://www.n8w.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (108, 'https://www.google.cn/s2/favicons?domain=http://drawr.net/', 'Drawr', 'Drawr - 可以浏览漫画绘画的过程', 'http://drawr.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (109, 'https://www.google.cn/s2/favicons?domain=http://www.agent002.com', 'Agent002', 'Agent002 - 法国插画作品博客', 'http://www.agent002.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (110, 'https://www.google.cn/s2/favicons?domain=https://www.viz.com/', 'viz.com', 'viz.com - 最好的漫画，动画和全球娱乐', 'https://www.viz.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (111, 'https://www.google.cn/s2/favicons?domain=http://poolga.com/', 'Poolga', 'Poolga - 插画艺术壁纸设计', 'http://poolga.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (112, 'https://www.google.cn/s2/favicons?domain=http://sakiroo.com/', 'SAKIROO', 'SAKIROO - 超人气插画师', 'http://sakiroo.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (113, 'https://www.google.cn/s2/favicons?domain=https://www.gracg.com/', '涂鸦王国', '涂鸦王国 - 原创绘画交流平台', 'https://www.gracg.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (114, 'https://www.google.cn/s2/favicons?domain=https://konachan.net/post', 'konachan', 'konachan- 动漫ACG壁纸', 'https://konachan.net/post', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (115, 'https://www.google.cn/s2/favicons?domain=https://leaveastory.com/', 'leaveastory', 'leaveastory - 用漫画讲述故事交换', 'https://leaveastory.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (116, 'https://www.google.cn/s2/favicons?domain=https://donnadi.com/', 'Donnadi', 'Donnadi - 艺术与时尚结合的作品', 'https://donnadi.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (117, 'https://www.google.cn/s2/favicons?domain=http://www.sketchswap.com/', 'Sketch Swap', 'Sketch Swap - 一画换一画', 'http://www.sketchswap.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 13);
INSERT INTO `navigation_urls` VALUES (118, 'https://www.google.cn/s2/favicons?domain=https://screenmusings.org/', 'Screenmusings', 'Screenmusings - 很美的电影截图集', 'https://screenmusings.org/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 14);
INSERT INTO `navigation_urls` VALUES (119, 'https://www.google.cn/s2/favicons?domain=http://www.stahlseite.de', 'Stahlseite', 'Stahlseite - 光影很强重工业摄影图片', 'http://www.stahlseite.de', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 14);
INSERT INTO `navigation_urls` VALUES (120, 'https://www.google.cn/s2/favicons?domain=https://www.topys.cn/', 'TOPYS', 'TOPYS - 全球顶尖创意分享平台', 'https://www.topys.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (121, 'https://www.google.cn/s2/favicons?domain=http://www.vice.cn/', 'Vice', 'Vice - 异视异色 全球青年文化之声', 'http://www.vice.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (122, 'https://www.google.cn/s2/favicons?domain=https://www.digitaling.com/', '数英网', '数英网 - 数字媒体网站', 'https://www.digitaling.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (123, 'http://www.adquan.com/images/new_logo.png', '广告门：一个行业的跌宕起伏', '广告门：一个行业的跌宕起伏', 'http://www.adquan.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (124, 'https://www.google.cn/s2/favicons?domain=http://www.meihua.info/', '梅花网－ 营销者的信息中心', '梅花网－ 营销者的信息中心', 'http://www.meihua.info/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (125, 'https://www.google.cn/s2/favicons?domain=http://www.qdaily.com/', '好奇心日报', '好奇心日报 - 好奇驱动你的世界', 'http://www.qdaily.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (126, 'https://www.google.cn/s2/favicons?domain=http://www.pitchina.com.cn/', 'PITCHINA', 'PITCHINA - 顶尖创意人社区', 'http://www.pitchina.com.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (127, 'https://www.google.cn/s2/favicons?domain=https://socialbeta.com/', 'SocialBeta', 'SocialBeta - 社交媒体和数字营销平台', 'https://socialbeta.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 15);
INSERT INTO `navigation_urls` VALUES (128, 'https://www.google.cn/s2/favicons?domain=https://scene360.com/', 'scene360', 'scene360 - 幻觉，大胆另类', 'https://scene360.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (129, 'https://www.google.cn/s2/favicons?domain=http://neocha.com/magazine/', 'Neocha', 'Neocha - 亚洲文化的创意及创造力', 'http://neocha.com/magazine/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (130, 'https://www.google.cn/s2/favicons?domain=https://giphy.com', 'Giphy 创意Gif图片搜索引擎', 'Giphy 创意Gif图片搜索引擎', 'https://giphy.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (131, 'https://www.google.cn/s2/favicons?domain=http://huaban.com/', '花瓣', '花瓣 - 中国美图收藏采集站', 'http://huaban.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (132, 'https://static.zcool.cn/git_z/z/site/favicon.ico?version=1542100790615', '站酷 (ZCOOL)', '站酷 (ZCOOL) - 设计师互动平台', 'https://www.zcool.com.cn', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (133, 'https://www.google.cn/s2/favicons?domain=http://www.gtn9.com', '古田路9号', '古田路9号-品牌创意平台', 'http://www.gtn9.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (134, 'https://www.google.cn/s2/favicons?domain=https://dribbble.com/', 'Dribbble', 'Dribbble - 全球UI设计师作品秀社区', 'https://dribbble.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (135, 'https://www.google.cn/s2/favicons?domain=https://www.pinterest.com/', 'Pinterest', 'Pinterest - 全球美图收藏采集站', 'https://www.pinterest.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (136, 'https://www.google.cn/s2/favicons?domain=https://www.behance.net/', 'Behance', 'Behance - 创意视觉艺术展示平台', 'https://www.behance.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (137, 'https://www.google.cn/s2/favicons?domain=https://www.deviantart.com/', 'Deviantart', 'Deviantart - 分享各类艺术创作的设计社区', 'https://www.deviantart.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (138, 'https://www.google.cn/s2/favicons?domain=https://medium.muz.li/', 'muz.li', 'muz.li - 关于设计和交互的最新UX', 'https://medium.muz.li/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (139, 'http://lackk.com/nav/img/favicons/trendlist.jpg', 'trendlist', 'trendlist - 设计趋势', 'http://www.trendlist.org/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (140, 'https://www.booooooom.com/favicon.ico', 'Booooooom', 'Booooooom - 充满想像的艺术社区', 'https://www.booooooom.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (141, 'https://www.google.cn/s2/favicons?domain=https://niice.co/', 'Niice', 'Niice - 与你的团队收集、分享和讨论想法', 'https://niice.co/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (142, 'https://www.google.cn/s2/favicons?domain=https://www.designspiration.net/', 'Designspiration', 'Designspiration - 设计启示录', 'https://www.designspiration.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (143, 'https://www.google.cn/s2/favicons?domain=https://www.inspirationde.com/', 'Inspirationde', 'Inspirationde - 设计灵感资源', 'https://www.inspirationde.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (144, 'https://www.google.cn/s2/favicons?domain=http://www.baubauhaus.com/', 'Baubauhaus', 'Baubauhaus - 设计灵感、插画', 'http://www.baubauhaus.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (145, 'https://www.google.cn/s2/favicons?domain=http://www.fubiz.net/', 'Fubiz', 'Fubiz - 法国超人气创意灵感平台', 'http://www.fubiz.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (146, 'https://www.google.cn/s2/favicons?domain=https://coverjunkie.com', 'Coverjunkie', 'Coverjunkie- 书籍封面设计', 'https://coverjunkie.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (147, 'https://www.google.cn/s2/favicons?domain=https://www.mydesy.com/', '淘靈感', '淘靈感 -台湾灵感创意视觉资讯', 'https://www.mydesy.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (148, 'https://www.google.cn/s2/favicons?domain=https://ello.co/', 'Ello', 'Ello - 创意工作者网络社区和资讯', 'https://ello.co/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (149, 'https://www.google.cn/s2/favicons?domain=https://abduzeedo.com/', 'Abduzeedo', 'Abduzeedo - 创意灵感和教程的设计博客', 'https://abduzeedo.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (150, 'https://www.google.cn/s2/favicons?domain=http://theinspirationgrid.com/', 'Inspiration', 'Inspiration - 创意灵感收录集合', 'http://theinspirationgrid.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (151, 'https://www.google.cn/s2/favicons?domain=https://thefwa.com/', 'FWA', 'FWA - 创意媒体艺术设计作品展', 'https://thefwa.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (152, 'https://www.google.cn/s2/favicons?domain=https://www.thisiscolossal.com/', 'ThisIsColossal', 'ThisIsColossal - 艺术创意设计作品收集博客', 'https://www.thisiscolossal.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (153, 'https://www.google.cn/s2/favicons?domain=http://www.impawards.com/', 'ImpaWards', 'ImpaWards - 电影海报收集平台', 'http://www.impawards.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (154, 'https://www.google.cn/s2/favicons?domain=https://www.koozarch.com/', 'KooZA/rch', 'KooZA/rch - 最具艺术化的图纸', 'https://www.koozarch.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (155, 'https://www.google.cn/s2/favicons?domain=https://www.archdaily.cn', 'Archdaily', 'Archdaily - 世界最受欢迎的建筑网站', 'https://www.archdaily.cn', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 16);
INSERT INTO `navigation_urls` VALUES (156, 'http://www.iiimg.cn/css/ico.jpg', 'iiimg.cn', 'iiimg.cn - 全球酷站中心', 'http://iiimg.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (157, 'https://www.google.cn/s2/favicons?domain=https://www.webdesignclip.com/', 'Webdesignclip', 'Webdesignclip - 日本酷站画廊', 'https://www.webdesignclip.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (158, 'https://www.google.cn/s2/favicons?domain=http://bm.straightline.jp/', 'Awwwards', 'Awwwards -最佳网页设计趋势', 'http://bm.straightline.jp', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (159, 'https://www.google.cn/s2/favicons?domain=https://thefwa.com', 'The FWA', 'The FWA - 互动网页设计', 'https://thefwa.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (160, 'https://www.google.cn/s2/favicons?domain=http://reeoo.com/', 'Reeoo', 'Reeoo - 网页设计的灵感和网站画廊', 'http://reeoo.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (161, 'https://www.google.cn/s2/favicons?domain=https://sitesee.co/', 'Sitesee', 'Sitesee - 收录漂亮的界面设计网站', 'https://sitesee.co/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (162, 'https://www.google.cn/s2/favicons?domain=https://uigarage.net', 'UIgarage', 'UIgarage - UI灵感收集聚合站点', 'https://uigarage.net', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (163, 'https://www.google.cn/s2/favicons?domain=https://rdlp.jp/', 'rdlp.jp', 'rdlp.jp - 商品销售页面设计', 'https://rdlp.jp', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 17);
INSERT INTO `navigation_urls` VALUES (164, 'https://www.google.cn/s2/favicons?domain=https://www.psdvault.com', 'Psd Vault', 'Psd Vault - 令人敬畏的Photoshop', 'https://www.psdvault.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (165, 'https://www.google.cn/s2/favicons?domain=https://www.psdbox.com/', 'Psd box', 'Psd box - 创意Photoshop教程', 'https://www.psdbox.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (166, 'https://www.google.cn/s2/favicons?domain=https://design.tutsplus.com/', 'Tutsplus', 'Tutsplus - 免费设计教程', 'https://design.tutsplus.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (167, 'https://www.google.cn/s2/favicons?domain=https://www.photoshoplady.com/', 'Photoshop Lady', 'Photoshop Lady - 设计教程搜索', 'https://www.photoshoplady.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (168, 'http://lackk.com/nav/img/favicons/photoshoptutorials.png', 'Photoshoptutorials', 'Photoshoptutorials - 设计过程', 'https://www.photoshoptutorials.ws', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (169, 'https://www.google.cn/s2/favicons?domain=https://naldzgraphics.net/', 'Tutorials', 'Tutorials - Naldz Graphics', 'https://naldzgraphics.net/category/tutorials/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (170, 'https://www.google.cn/s2/favicons?domain=http://psd.fanextra.com/', 'PSDFAN', 'PSDFAN - 设计教程文章和资源', 'http://psd.fanextra.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (171, 'http://lackk.com/nav/img/favicons/photoshopstar.png', 'photoshopstar', 'photoshopstar - Free Tutorials', 'https://photoshopstar.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (172, 'https://www.google.cn/s2/favicons?domain=http://www.typetoken.net/', 'typetoken', 'typetoken - 出版物排版设计', 'http://www.typetoken.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (173, 'https://www.google.cn/s2/favicons?domain=www.digitalartsonline.co.uk', '数字艺术在线', '数字艺术在线', 'https://www.digitalartsonline.co.uk/tutorials/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (174, 'https://www.google.cn/s2/favicons?domain=https://www.uisdc.com/', '优设UISDC', '优设UISDC - 优秀设计联盟', 'https://www.uisdc.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (175, 'https://www.google.cn/s2/favicons?domain=https://thetype.com/', 'Type is Beautiful', 'Type is Beautiful - 文字排版', 'https://thetype.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 18);
INSERT INTO `navigation_urls` VALUES (176, 'http://lackk.com/nav/img/favicons/yuni-yoshida.png', 'Yuni', 'Yuni-Yoshida - 创意界的魔法大师', 'http://yuni-yoshida.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 19);
INSERT INTO `navigation_urls` VALUES (177, 'http://lackk.com/nav/img/favicons/sarahillenberge.png', 'Sarahillenberger', 'Sarahillenberger - 视觉新鲜物', 'https://www.sarahillenberger.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 19);
INSERT INTO `navigation_urls` VALUES (178, 'https://www.google.cn/s2/favicons?domain=https://www.ostagram.me/', 'Ostagram', 'Ostagram - 最强大的创意图片匹配科技', 'https://www.ostagram.me/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 19);
INSERT INTO `navigation_urls` VALUES (179, 'https://www.google.cn/s2/favicons?domain=http://www.rafael-varona.com/', 'Rafael', 'Rafael-Varona - 清新小众的动图世界', 'http://www.rafael-varona.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 19);
INSERT INTO `navigation_urls` VALUES (180, 'https://www.google.cn/s2/favicons?domain=https://cloudconvert.com/', 'CloudConvert', 'CloudConvert - 超全面的格式转换', 'https://cloudconvert.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (181, 'http://lackk.com/nav/img/favicons/Weibodang.svg', 'Weibodang', 'Weibodang - 视频下载神器', 'http://weibodang.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (182, 'https://www.google.cn/s2/favicons?domain=https://www.remove.bg', 'Remove.bg', 'Remove.bg - AI智能去除人物图片背景', 'https://www.remove.bg/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (183, 'https://www.google.cn/s2/favicons?domain=https://paintschainer.preferred.tech', 'paintschainer', 'paintschainer - 用AI为你的线稿自动上色', 'https://paintschainer.preferred.tech/index_zh.html', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (184, 'https://www.google.cn/s2/favicons?domain=https://mp3cut.net/cn/', 'mp3cut.net', 'mp3cut.net - 在线剪辑歌曲', 'https://mp3cut.net/cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (185, 'https://www.google.cn/s2/favicons?domain=https://wordmark.it/', 'wordmark.it', 'wordmark.it - 在线预览电脑已安装的字体', 'https://wordmark.it/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (186, 'https://www.google.cn/s2/favicons?domain=https://tinypng.com/', 'TinyPng', 'TinyPng - 超完美PNG压缩工具', 'https://tinypng.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (187, 'https://www.google.cn/s2/favicons?domain=https://squoosh.app/', 'Squoosh', 'Squoosh - 谷歌超强免费在线图片压缩', 'https://squoosh.app/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (188, 'https://www.google.cn/s2/favicons?domain=http://bigjpg.com/', 'Bigjpg', 'Bigjpg - AI人工智能图片放大', 'http://bigjpg.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (189, 'https://www.google.cn/s2/favicons?domain=https://img.top/', 'img.top', 'img.top - 智能图像压缩', 'https://img.top/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (190, 'https://www.google.cn/s2/favicons?domain=https://smallpdf.com/cn', 'Smallpdf', 'Smallpdf - 专注于PDF格式互转', 'https://smallpdf.com/cn', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (191, 'https://www.google.cn/s2/favicons?domain=https://loading.io/', 'Loading', 'Loading - 制作加载动画图标', 'https://loading.io/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (192, 'https://www.google.cn/s2/favicons?domain=https://icons8.com/preloaders/', 'icons8', 'icons8 - GIF加载SVG生成器', 'https://icons8.com/preloaders/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (193, 'http://lackk.com/nav/img/favicons/vectormagic.png', 'Vector Magic', 'Vector Magic - 最强大的位图转矢量', 'https://zh.vectormagic.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 20);
INSERT INTO `navigation_urls` VALUES (194, 'https://www.google.cn/s2/favicons?domain=https://www.pixelsquid.com/', 'PixelSquid', 'PixelSquid - 全透视角度素材', 'https://www.pixelsquid.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (195, 'https://www.google.cn/s2/favicons?domain=http://freebiesbug.com/', 'FreeBiesbug', 'FreeBiesbug - 在线免费设计师资源', 'http://freebiesbug.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (196, 'https://www.google.cn/s2/favicons?domain=https://freedesignresources.net/', 'Freedesignresources', 'Freedesignresources', 'https://freedesignresources.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (197, 'https://www.google.cn/s2/favicons?domain=https://creativemarket.com/', 'creativemarket', 'creativemarket - 创意市场', 'https://creativemarket.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (198, 'https://www.google.cn/s2/favicons?domain=https://psdrepo.com', 'PSDRepo', 'PSDRepo - 每日更新高品質素材', 'https://psdrepo.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (199, 'https://www.google.cn/s2/favicons?domain=https://www.graphicsfuel.com/', 'GraphicsFuel', 'GraphicsFuel - 国外免费设计素材模板下载站', 'https://www.graphicsfuel.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (200, 'https://www.google.cn/s2/favicons?domain=https://www.freepik.com/', 'Freepik', 'Freepik - 免费高质量矢量图下载', 'https://www.freepik.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (201, 'https://www.google.cn/s2/favicons?domain=https://www.toptal.com', 'Subtlepatterns', 'Subtlepatterns - 简洁大气的背景纹理素材', 'https://www.toptal.com/designers/subtlepatterns/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (202, 'https://www.google.cn/s2/favicons?domain=http://www.hituyu.com/', '图鱼', '图鱼 - 完美平铺的底纹', 'http://www.hituyu.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (203, 'https://www.google.cn/s2/favicons?domain=https://www.textures.com/', 'Textures', 'Textures - 优质的纹理、背景', 'https://www.textures.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (204, 'https://www.google.cn/s2/favicons?domain=http://www.58pic.com/', '千图网', '千图网 - 专注设计素材', 'http://www.58pic.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (205, 'https://www.google.cn/s2/favicons?domain=http://588ku.com/', '58库', '58库 - png图片背景素材库', 'http://588ku.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (206, 'https://www.google.cn/s2/favicons?domain=http://www.sccnn.com/', '素材中国', '素材中国 - 免费素材共享平台', 'http://www.sccnn.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (207, 'https://www.google.cn/s2/favicons?domain=http://www.coverr.co/', 'Coverr', 'Coverr - 免费网页背景影片 Free', 'http://www.coverr.co/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (208, 'https://www.google.cn/s2/favicons?domain=http://free-paper-texture.com/', 'Paper texture', 'Paper texture - 高画质纸张纹理素材 Free', 'http://free-paper-texture.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (209, 'https://www.google.cn/s2/favicons?domain=https://www.brusheezy.com/', 'brusheezy', 'brusheezy - 免费笔刷、纹理及图案样式集散地 Free', 'https://www.brusheezy.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (210, 'https://www.google.cn/s2/favicons?domain=https://qbrushes.net/', 'Qbrushes', 'Qbrushes - 高质量笔刷下载网站', 'https://qbrushes.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 21);
INSERT INTO `navigation_urls` VALUES (211, 'https://www.google.cn/s2/favicons?domain=https://www.logonews.cn/', 'Logonews', 'Logonews - 标志情报局', 'https://www.logonews.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (212, 'https://www.google.cn/s2/favicons?domain=http://instantlogosearch.com/', 'Instant', 'Instant - 矢量logo下载', 'http://instantlogosearch.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (213, 'https://www.google.cn/s2/favicons?domain=https://worldvectorlogo.com/', 'IBrand logos', 'IBrand logos - 品牌标志下载', 'http://instantlogosearch.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (214, 'https://www.google.cn/s2/favicons?domain=easyicon.net', 'easyicon', 'easyicon - 图标下载', 'https://www.easyicon.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (215, 'https://www.google.cn/s2/favicons?domain=https://www.iconfont.cn/', 'Iconfont', 'Iconfont - 阿里巴巴矢量图标库', 'https://www.iconfont.cn/collections/index', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (216, 'https://www.google.cn/s2/favicons?domain=https://thenounproject.com/', 'thenounproject', 'thenounproject - 黑白图标', 'https://thenounproject.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (217, 'https://www.google.cn/s2/favicons?domain=https://logopond.com/', 'Logopond', 'Logopond - 国外LOGO展示社区', 'https://logopond.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (218, 'https://www.google.cn/s2/favicons?domain=http://www.logogala.com/', 'logogala', 'logogala - logo灵感', 'http://www.logogala.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (219, 'https://www.google.cn/s2/favicons?domain=https://www.logomoose.com/', 'logomoose', 'logomoose - 标志灵感', 'https://www.logomoose.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 22);
INSERT INTO `navigation_urls` VALUES (220, 'https://www.google.cn/s2/favicons?domain=http://lackk.com/color/', 'Color', 'Color - 常用传统配色灵感收集', 'http://lackk.com/color/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (221, 'https://www.google.cn/s2/favicons?domain=https://color.adobe.com', 'Adobe color', 'Adobe color - 颜色主题探索', 'https://color.adobe.com/zh/explore/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (222, 'https://www.google.cn/s2/favicons?domain=http://www.fashiontrendsetter.com', 'Fashion Trendsetter', 'Fashion Trendsetter - 时尚流行搭配', 'http://www.fashiontrendsetter.com', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (223, 'https://www.google.cn/s2/favicons?domain=http://www.colorfavs.com/', 'ColorFavs', 'ColorFavs- 上传提取图片风格的颜色', 'http://www.colorfavs.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (224, 'https://www.google.cn/s2/favicons?domain=http://www.peise.net/', '配色网', '配色网 - 色彩搭配方案', 'http://www.peise.net/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (225, 'https://www.google.cn/s2/favicons?domain=https://www.design-seeds.com/', 'Design Seeds', 'Design Seeds - 配色图片', 'https://www.design-seeds.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (226, 'https://www.google.cn/s2/favicons?domain=http://nipponcolors.com/', 'Nipponcolors', 'Nipponcolors - 日本传统配色', 'http://nipponcolors.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (227, 'https://www.google.cn/s2/favicons?domain=https://colourco.de/', 'Colourco 在线颜色搭配工具', 'Colourco 在线颜色搭配工具', 'https://colourco.de/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 23);
INSERT INTO `navigation_urls` VALUES (228, 'https://p2.ssl.qhimg.com/t014de4ba13ada26743.png', '360查字体', '360查字体-查版权，免纠纷', 'https://fonts.safe.360.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (229, 'https://www.google.cn/s2/favicons?domain=http://www.hellofont.cn/', '字由', '字由 - 收集了国内外上千款精选字体', 'http://www.hellofont.cn/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (230, 'https://www.google.cn/s2/favicons?domain=http://sicangziti.com/', '私藏字体', '私藏字体 - 收集精品中英日文字体', 'http://sicangziti.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (231, 'https://www.google.cn/s2/favicons?domain=https://www.dafont.com/', 'Dafont', 'Dafont - 大量免费的英文字体', 'https://www.dafont.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (232, 'https://www.google.cn/s2/favicons?domain=http://www.abstractfonts.com/', 'abstractfonts', 'abstractfonts - 超过十三万免费字体', 'http://www.abstractfonts.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (233, 'https://www.google.cn/s2/favicons?domain=https://fontsup.com', 'Fontsup', 'Fontsup - 免费网页设计字体', 'https://fontsup.com/design-blog.html', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (234, 'https://www.google.cn/s2/favicons?domain=https://www.1001freefonts.com/', '1001freefonts', '1001freefonts - 免费高质量的字体下载', 'https://www.1001freefonts.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (235, 'https://www.google.cn/s2/favicons?domain=http://www.qiuziti.com/', 'Qiuziti', 'Qiuziti - 上专图片识别字体并下载', 'http://www.qiuziti.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (236, 'https://www.google.cn/s2/favicons?domain=http://www.losttype.com/browse/', 'losttype', 'losttype - 漂亮的英文字体展示', 'http://www.losttype.com/browse/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
INSERT INTO `navigation_urls` VALUES (237, 'https://vaufonts.com/a1a2c8a8ce1160ca35b6da7c64904f8e.png', 'Vaufonts', 'Vaufonts - 在线生成艺术字体', 'https://vaufonts.com/', 0, 1, '2019-08-28 18:27:28', NULL, NULL, 24);
COMMIT;

-- ----------------------------
-- Table structure for search_nav_urls
-- ----------------------------
DROP TABLE IF EXISTS `search_nav_urls`;
CREATE TABLE `search_nav_urls` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `leader_id` int(11) NOT NULL COMMENT '领导编号 上级领导编号，为0表示该链接为领导链接。即在页面上第一个显示的链接，其它只有在鼠标悬停后再显示',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='搜索导航表 ';

-- ----------------------------
-- Records of search_nav_urls
-- ----------------------------
BEGIN;
INSERT INTO `search_nav_urls` VALUES (1, 'http://lackk.com/nav/img/search/baidu.svg', '百度', 'https://www.baidu.com/s?wd={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (2, 'http://lackk.com/nav/img/search/google.svg', '谷歌', 'https://www.google.com/search?q={queryKey}', 1, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (3, 'https://www.google.cn/s2/favicons?domain=https://www.sogou.com', '搜狗', 'https://www.sogou.com/web?query={queryKey}', 1, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (4, 'https://www.google.cn/s2/favicons?domain=https://cn.bing.com', 'Bing', 'https://cn.bing.com/search?q={queryKey}', 1, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (5, 'https://www.google.cn/s2/favicons?domain=https://yandex.com/', 'Yandex', 'https://yandex.com/search/?text={queryKey}', 1, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (6, 'http://lackk.com/nav/img/search/huaban.svg', '花瓣', 'https://huaban.com/search/?q={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (7, 'https://static.zcool.cn/git_z/z/site/favicon.ico', '站酷', 'https://www.zcool.com.cn/search/content?&word={queryKey}', 6, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (8, 'https://www.google.cn/s2/favicons?domain=https://www.dribbble.com/', '追波', 'https://dribbble.com/search?q={queryKey}', 6, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (9, 'https://www.google.cn/s2/favicons?domain=https://www.pinterest.com/', 'Pinterest', 'https://www.pinterest.com/?q={queryKey}', 6, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (10, 'https://www.google.cn/s2/favicons?domain=https://www.behance.net/', 'Behance', 'https://www.behance.net/search?content=projects&sort=appreciations&time=week&search={queryKey}', 6, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (11, 'http://lackk.com/nav/img/search/tupian.svg', '图片', 'https://yandex.ru/images/search?text={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (12, 'http://lackk.com/nav/img/search/imagebaidu.svg', '百度', 'https://image.baidu.com/search/index?tn=baiduimage&ie=utf-8&word={queryKey}', 11, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (13, 'https://www.google.cn/s2/favicons?domain=google.cn', '谷歌', 'https://www.google.com/search?biw=1610&bih=863&site=imghp&tbm=isch&sa=1&q={queryKey}', 11, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (14, 'https://www.vcg.com/favicon.ico', 'VCG', 'https://www.vcg.com/creative/search?phrase={queryKey}', 11, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (15, 'https://www.google.cn/s2/favicons?domain=https://www.hellorf.com/', '海洛', 'https://www.hellorf.com/image/search?q={queryKey}', 11, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (16, 'http://lackk.com/nav/img/search/creative.svg', '创意', 'https://www.topys.cn/search?k={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (17, 'https://www.google.cn/s2/favicons?domain=https://www.digitaling.com/', '数英', 'https://www.digitaling.com/search?kw={queryKey}', 16, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (18, 'https://www.google.cn/s2/favicons?domain=zhihu.com', '知乎', 'https://www.zhihu.com/search?type=content&q={queryKey}', 16, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (19, 'https://www.google.cn/s2/favicons?domain=weixin.qq.com', '微信', 'https://weixin.sogou.com/weixin?type=2&s_from=input&query={queryKey}', 16, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (20, 'https://www.google.cn/s2/favicons?domain=http://www.qdaily.com', '好奇', 'http://www.qdaily.com/searches?key={queryKey}', 16, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (21, 'http://lackk.com/nav/img/search/googletrans.svg', '翻译', 'https://translate.google.cn/#zh-CN/en/{queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (22, 'https://www.google.cn/s2/favicons?domain=http://fanyi.youdao.com/', '有道', 'http://fanyi.youdao.com/', 21, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (23, 'https://www.google.cn/s2/favicons?domain=https://translate.google.cn/', '简繁', 'https://translate.google.cn/', 21, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (24, 'http://lackk.com/nav/img/search/bilibili.svg', '视频', 'https://search.bilibili.com/all?keyword={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (25, 'https://www.google.cn/s2/favicons?domain=https://www.youtube.com/', 'YTB', 'https://www.youtube.com/results?search_query={queryKey}', 24, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (26, 'https://www.google.cn/s2/favicons?domain=https://www.vmovier.com', '场库', 'https://www.vmovier.com/search?kw={queryKey}', 24, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (27, 'https://www.google.cn/s2/favicons?domain=http://youku.com/', '优酷', 'https://so.youku.com/search_video/q_{queryKey}', 24, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (28, 'https://www.google.cn/s2/favicons?domain=https://v.qq.com/', '腾讯', 'https://v.qq.com/x/search/?q={queryKey}', 24, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (29, 'http://lackk.com/nav/img/search/see.svg', '磁力', 'https://www.cilimao.co/search?word={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (30, 'https://www.google.cn/s2/favicons?domain=https://movie.douban.com', '豆瓣', 'https://movie.douban.com/subject_search?search_text={queryKey}', 29, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (31, 'https://www.google.cn/s2/favicons?domain=http://lackk.com/', 'VIP', 'http://lackk.com/vip/', 29, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (32, 'https://www.google.cn/s2/favicons?domain=https://neets.cc/', '追剧', 'https://neets.cc/search?key={queryKey}', 29, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (33, 'https://www.google.cn/s2/favicons?domain=https://www.jiumodiary.com/', '书籍', 'https://www.jiumodiary.com/', 29, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (34, 'http://lackk.com/nav/img/search/iconfont.png', 'icon', 'https://www.iconfont.cn/search/index?q={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (35, 'https://www.google.cn/s2/favicons?domain=https://www.easyicon.net/', '图标', 'https://www.easyicon.net/iconsearch/{queryKey}', 34, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (36, 'https://www.google.cn/s2/favicons?domain=http://instantlogosearch.com/', 'logo', 'http://instantlogosearch.com/?q={queryKey}', 34, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (37, 'http://lackk.com/nav/img/search/gouwu.svg', '购物', 'https://list.tmall.com/search_product.htm?q={queryKey}', 0, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (38, 'https://www.google.cn/s2/favicons?domain=jd.com', '京东', 'https://search.jd.com/Search?keyword={queryKey}&enc=utf-8&wq={queryKey}', 37, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
INSERT INTO `search_nav_urls` VALUES (39, 'https://www.google.cn/s2/favicons?domain=https://www.taobao.com/', '淘宝', 'https://s.taobao.com/search?q={queryKey}', 37, 0, 0, '2019-08-28 22:56:35', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for site_banner
-- ----------------------------
DROP TABLE IF EXISTS `site_banner`;
CREATE TABLE `site_banner` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告标题 长度不超过8个中文字符',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片 支持jpg/png/gif',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='网站轮播图 ';

-- ----------------------------
-- Records of site_banner
-- ----------------------------
BEGIN;
INSERT INTO `site_banner` VALUES (1, '“动态”系列主题', 'https://s2.ax1x.com/2019/04/28/EMVFk8.gif', 2, 1, '2019-08-28 18:04:05', NULL, NULL);
INSERT INTO `site_banner` VALUES (2, '“综合”系列主题', 'https://s2.ax1x.com/2019/07/27/eM96EQ.jpg', 1, 1, '2019-08-28 18:04:27', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
