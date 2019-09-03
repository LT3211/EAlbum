/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : album

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-02 19:35:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for picdir
-- ----------------------------
DROP TABLE IF EXISTS `picdir`;
CREATE TABLE `picdir` (
  `id` varchar(255) NOT NULL,
  `picName` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `picDesc` varchar(255) DEFAULT NULL,
  `picAddress` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `picCover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picdir
-- ----------------------------
INSERT INTO `picdir` VALUES ('2f36c58837b74367a78bab0d41f80a0e', '绿色', '2019-08-31 16:32:38', '33', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\2f36c58837b74367a78bab0d41f80a0e', 'c5e3824751de413ab19abf3128549e93', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\2f36c58837b74367a78bab0d41f80a0e\\picCover\\b40ee1d9a5204629b0d2bf2e30ffd508_ZaanseSchans_ZH-CN5665496862_1920x1080.jpg');
INSERT INTO `picdir` VALUES ('635e9e81198747d98433d0cf9adb07b3', '绿', '2019-08-31 16:35:17', '2', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\635e9e81198747d98433d0cf9adb07b3', 'c5e3824751de413ab19abf3128549e93', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\635e9e81198747d98433d0cf9adb07b3\\picCover\\9aaef033fa714f348f5611e53b6297ee_LeGivre_EN-AU7576437900_1920x1080.jpg');
INSERT INTO `picdir` VALUES ('d4e84aeea8e4477c897dc2340132c178', '1', '2019-08-31 16:32:48', '绿色', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\d4e84aeea8e4477c897dc2340132c178', 'c5e3824751de413ab19abf3128549e93', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\d4e84aeea8e4477c897dc2340132c178\\picCover\\77787c582f3f4bc3818d5aa06794b819_UpHellyAa_ZH-CN7287698551_1920x1080.jpg');
INSERT INTO `picdir` VALUES ('da5a021a91064efb903032d2ba931d7a', '1', '2019-08-31 16:35:08', '绿', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\da5a021a91064efb903032d2ba931d7a', 'c5e3824751de413ab19abf3128549e93', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\da5a021a91064efb903032d2ba931d7a\\picCover\\f0306bba24734846b1c2e4a196dbf568_NutcrackerSeason_EN-AU8373379424_1920x1080.jpg');
INSERT INTO `picdir` VALUES ('f59c9d08f4f243708ea2564db0ba2826', '背景', '2019-08-31 16:31:13', '网站背景', 'D:\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\f59c9d08f4f243708ea2564db0ba2826', 'c5e3824751de413ab19abf3128549e93', '\\FileUpload\\c5e3824751de413ab19abf3128549e93\\photo\\f59c9d08f4f243708ea2564db0ba2826\\picCover\\4ae9608565104dd6a48b38b949f83836_MozambiqueSandbar_EN-AU11463522567_1920x1080.jpg');
