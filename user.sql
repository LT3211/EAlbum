/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : album

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-02 19:35:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `headIcon` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('c5e3824751de413ab19abf3128549e93', '1377981923@qq.com', '段誉', '666666', '/FileUpload/c5e3824751de413ab19abf3128549e93/headIcon/c616294e7d1d4d0a9177d936917a13e8_MischiefCubs_ZH-CN5217361502_1920x1080.jpg', '凌波微步、北冥神功', '5', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo');
