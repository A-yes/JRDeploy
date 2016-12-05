/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50632
Source Host           : localhost:3306
Source Database       : jrd_app

Target Server Type    : MYSQL
Target Server Version : 50632
File Encoding         : 65001

Date: 2016-12-05 10:21:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jrdeploy
-- ----------------------------
DROP TABLE IF EXISTS `jrdeploy`;
CREATE TABLE `jrdeploy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `profile` varchar(50) DEFAULT 'null',
  `module` varchar(50) DEFAULT NULL,
  `context_path` varchar(255) DEFAULT NULL,
  `port` varchar(6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `branch` varchar(50) DEFAULT 'null',
  `host` varchar(16) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `host_port` varchar(6) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `jrd_path` varchar(255) DEFAULT NULL,
  `jetty_path` varchar(255) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
