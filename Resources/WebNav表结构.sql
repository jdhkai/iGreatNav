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

 Date: 29/08/2019 21:02:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for navigation_cate
-- ----------------------------
DROP TABLE IF EXISTS `navigation_cate`;
CREATE TABLE `navigation_cate` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `theme_color` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主题颜色 以十六进制表示，以#号开头',
  `intro` varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介 简短说明，不宜过长',
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
-- Table structure for navigation_common
-- ----------------------------
DROP TABLE IF EXISTS `navigation_common`;
CREATE TABLE `navigation_common` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='常用导航表 ';

-- ----------------------------
-- Table structure for navigation_float
-- ----------------------------
DROP TABLE IF EXISTS `navigation_float`;
CREATE TABLE `navigation_float` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `text_color` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '颜色 十六进制表示，以#号开头',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '层 显示在上层还是下层,1表示上层，2表示下层',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='悬浮链接表 ';

-- ----------------------------
-- Table structure for navigation_urls
-- ----------------------------
DROP TABLE IF EXISTS `navigation_urls`;
CREATE TABLE `navigation_urls` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `short_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短名称',
  `long_name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '长名称',
  `url` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cate_id` int(11) NOT NULL COMMENT '所属分类编号',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='导航链接表 ';

-- ----------------------------
-- Table structure for search_nav_urls
-- ----------------------------
DROP TABLE IF EXISTS `search_nav_urls`;
CREATE TABLE `search_nav_urls` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `icon` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `leader_id` int(11) NOT NULL COMMENT '领导编号 上级领导编号，为0表示该链接为领导链接。即在页面上第一个显示的链接，其它只有在鼠标悬停后再显示',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='搜索导航表 ';

-- ----------------------------
-- Table structure for site_banner
-- ----------------------------
DROP TABLE IF EXISTS `site_banner`;
CREATE TABLE `site_banner` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `title` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告标题 长度不超过8个中文字符',
  `image` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片 支持jpg/png/gif',
  `order_value` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='网站轮播图 ';

SET FOREIGN_KEY_CHECKS = 1;
