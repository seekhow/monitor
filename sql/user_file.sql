/*
Navicat MySQL Data Transfer

Source Server         : MySQLConnectTest
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-09-04 14:18:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_file`
-- ----------------------------
DROP TABLE IF EXISTS `user_file`;
CREATE TABLE `user_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT '',
  `user_name` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `user_status` int(10) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_file
-- ----------------------------
INSERT INTO `user_file` VALUES ('1', 'admin', 'admin', 'man', 'admin', '2017-04-11 16:00:00', '0', 'Manager');
INSERT INTO `user_file` VALUES ('2', 'test1', 'qh', 'man', '111', '2017-05-01 11:11:11', '1', 'Normal');
INSERT INTO `user_file` VALUES ('3', 'test2', 'test2', 'woman', '123', '2017-05-10 19:21:10', '1', 'Normal');
INSERT INTO `user_file` VALUES ('13', 'qh', 'qh', 'man', 'qh', '2017-05-24 19:47:02', null, 'Normal');
