/*
Navicat MySQL Data Transfer

Source Server         : My
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : renren_security

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-12-27 18:05:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_msg
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_type` varchar(1000) DEFAULT NULL COMMENT '消息类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `text` varchar(5000) DEFAULT NULL COMMENT '文本内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `uploader_id` bigint(20) DEFAULT NULL COMMENT '上传者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统消息表';

-- ----------------------------
-- Table structure for sys_msg_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_user`;
CREATE TABLE `sys_msg_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_msg_id` bigint(20) DEFAULT NULL COMMENT '系统消息id',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态  0：未读   1：已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息用户关系表';
