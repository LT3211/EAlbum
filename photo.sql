/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : album

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-02 19:35:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` varchar(255) NOT NULL,
  `dirId` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `photoAddr` varchar(255) DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL,
  `photoSize` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('012925bb32ec4e2e937c7aeb6660d10d', 'f59c9d08f4f243708ea2564db0ba2826', '2019-09-01 20:40:10', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\f59c9d08f4f243708ea2564db0ba2826\\012925bb32ec4e2e937c7aeb6660d10d_屏幕截图(1).png', '9', '2670719');
