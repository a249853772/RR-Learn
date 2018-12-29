/*
Navicat MySQL Data Transfer

Source Server         : My
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : renren_security

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-12-29 16:43:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'WQ-20180319BVMV1546071141776', '1546073009928', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1546074000000', '1546072200000', '5', 'WAITING', 'CRON', '1531705243000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1531706400000', '-1', '5', 'PAUSED', 'CRON', '1531705243000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-07-16 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-16 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2018-07-16 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-16 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-07-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-16 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-07-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-07-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-07-17 10:18:10');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1064', '2018-07-17 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2018-07-17 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-07-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2018-07-17 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 13:30:01');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-17 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-07-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-07-17 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-07-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-07-17 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-17 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-17 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-18 00:00:02');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-18 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2018-07-18 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-18 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-07-18 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-07-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-07-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-07-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-07-18 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-07-18 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-07-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-18 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-18 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-18 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2018-07-19 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-07-19 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 10:00:01');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'renren', '0', null, '1035', '2018-07-19 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-07-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-07-19 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-19 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-19 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-07-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-07-20 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-07-20 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-20 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-20 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'renren', '0', null, '1081', '2018-07-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-07-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-07-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-20 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'renren', '0', null, '1055', '2018-07-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-07-20 17:30:02');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-07-23 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-23 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-07-23 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-07-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-23 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-07-23 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-23 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-23 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-07-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-24 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-07-24 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-24 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-24 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-07-24 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 09:00:01');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-07-24 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-08-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-08-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-08-13 16:30:02');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-08-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-08-13 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'test', 'renren', '0', null, '1175', '2018-08-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-08-13 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-08-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'test', 'renren', '0', null, '1045', '2018-08-13 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-08-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'test', 'renren', '0', null, '1042', '2018-08-13 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-08-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-08-13 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-08-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'test', 'renren', '0', null, '1101', '2018-08-13 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-13 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'test', 'renren', '0', null, '1485', '2018-08-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-08-14 00:30:01');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-08-14 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-08-14 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-08-14 02:30:01');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-08-14 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-08-14 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-08-14 05:30:01');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-08-14 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-08-14 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-08-14 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-08-14 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'test', 'renren', '0', null, '1292', '2018-08-14 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-08-14 10:30:02');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-08-14 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-08-14 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-08-14 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-08-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'test', 'renren', '0', null, '2149', '2018-08-14 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2018-08-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'test', 'renren', '0', null, '1205', '2018-08-14 14:00:02');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-08-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2018-08-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-08-14 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'test', 'renren', '0', null, '1101', '2018-08-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-08-14 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'test', 'renren', '0', null, '1074', '2018-08-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'test', 'renren', '0', null, '1106', '2018-08-14 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'test', 'renren', '0', null, '1215', '2018-12-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'test', 'renren', '0', null, '1118', '2018-12-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'test', 'renren', '0', null, '1056', '2018-12-26 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-12-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-26 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-26 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-26 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-26 22:00:02');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-26 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-26 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-12-26 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-12-27 00:00:01');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-27 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-12-27 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-27 04:00:02');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-27 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-27 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-27 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-27 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-27 07:30:01');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-27 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2018-12-27 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-27 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'test', 'renren', '0', null, '1075', '2018-12-27 10:00:03');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-27 10:30:02');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-27 11:30:04');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-12-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'test', 'renren', '0', null, '1127', '2018-12-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-27 13:30:03');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-27 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-27 15:00:02');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'test', 'renren', '0', null, '1169', '2018-12-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-12-27 16:30:03');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'test', 'renren', '0', null, '1215', '2018-12-27 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'test', 'renren', '0', null, '1116', '2018-12-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 19:30:01');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-12-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-27 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 22:30:01');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 00:00:02');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-28 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-28 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-28 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-28 04:30:01');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-28 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-28 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-28 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('336', '1', 'testTask', 'test', 'renren', '0', null, '1143', '2018-12-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'test', 'renren', '0', null, '1064', '2018-12-28 10:30:02');
INSERT INTO `schedule_job_log` VALUES ('338', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-12-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-28 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('342', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-12-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'test', 'renren', '0', null, '1061', '2018-12-28 13:30:02');
INSERT INTO `schedule_job_log` VALUES ('344', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-28 14:30:02');
INSERT INTO `schedule_job_log` VALUES ('346', '1', 'testTask', 'test', 'renren', '0', null, '1039', '2018-12-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'test', 'renren', '0', null, '1189', '2018-12-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '1', 'testTask', 'test', 'renren', '0', null, '1120', '2018-12-28 16:00:02');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'test', 'renren', '0', null, '1038', '2018-12-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('350', '1', 'testTask', 'test', 'renren', '0', null, '1306', '2018-12-28 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'test', 'renren', '0', null, '1148', '2018-12-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-12-28 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'test', 'renren', '0', null, '1070', '2018-12-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('354', '1', 'testTask', 'test', 'renren', '0', null, '1035', '2018-12-28 19:00:01');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-12-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'test', 'renren', '0', null, '1063', '2018-12-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('358', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-28 21:00:01');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-28 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-12-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('362', '1', 'testTask', 'test', 'renren', '0', null, '1038', '2018-12-28 23:00:01');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-12-28 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '1', 'testTask', 'test', 'renren', '0', null, '1191', '2018-12-29 00:00:04');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('366', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2018-12-29 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-12-29 02:00:01');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-29 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('370', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 03:00:01');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-29 03:30:01');
INSERT INTO `schedule_job_log` VALUES ('372', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-12-29 04:00:01');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('374', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 05:00:01');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-12-29 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('376', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-29 06:00:01');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'test', 'renren', '0', null, '1052', '2018-12-29 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('378', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-12-29 07:00:01');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-29 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('380', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-29 08:00:01');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-29 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('382', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-29 09:30:01');
INSERT INTO `schedule_job_log` VALUES ('384', '1', 'testTask', 'test', 'renren', '0', null, '1090', '2018-12-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('386', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-12-29 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('388', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('390', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 13:00:01');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-29 13:30:02');
INSERT INTO `schedule_job_log` VALUES ('392', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-29 14:00:02');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-12-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('394', '1', 'testTask', 'test', 'renren', '0', null, '1217', '2018-12-29 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'test', 'renren', '0', null, '1039', '2018-12-29 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('396', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-12-29 16:00:02');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'test', 'renren', '0', null, '1213', '2018-12-29 16:30:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', 'SL集团', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '长沙分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', '0');
INSERT INTO `sys_dept` VALUES ('6', '0', '山林CF', '0', '0');
INSERT INTO `sys_dept` VALUES ('7', '6', '南京分部', '0', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父字典类型id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0', '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0', '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0', '0');
INSERT INTO `sys_dict` VALUES ('4', '消息类型', 'msgtype', '0', '系统消息', '0', null, '0', '7');
INSERT INTO `sys_dict` VALUES ('5', '消息类型', 'msgtype', '1', '订阅消息', '1', null, '0', '7');
INSERT INTO `sys_dict` VALUES ('6', '系统通知', 'sys_notify', '0', '通告', '0', null, '0', '4');
INSERT INTO `sys_dict` VALUES ('7', '消息', 'msg', '0', '消息', '0', null, '0', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '1716', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:09');
INSERT INTO `sys_log` VALUES ('2', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '2904', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:09');
INSERT INTO `sys_log` VALUES ('3', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '560', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:10');
INSERT INTO `sys_log` VALUES ('4', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '150', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:09');
INSERT INTO `sys_log` VALUES ('5', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '678', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:10');
INSERT INTO `sys_log` VALUES ('6', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '768', '0:0:0:0:0:0:0:1', '2018-07-17 10:18:10');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"消息室\",\"url\":\"webSocket.html\",\"perms\":\"user:view\",\"type\":1,\"icon\":\"fa fa-comments-o\",\"orderNum\":0}', '41', '0:0:0:0:0:0:0:1', '2018-07-17 16:20:59');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":42,\"parentId\":41,\"parentName\":\"消息室\",\"name\":\"进入\",\"perms\":\"user:view\",\"type\":2,\"orderNum\":0}', '63', '0:0:0:0:0:0:0:1', '2018-07-17 16:23:21');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":41,\"parentName\":\"消息室\",\"name\":\"进入\",\"perms\":\"\",\"type\":2,\"orderNum\":0}', '55', '0:0:0:0:0:0:0:1', '2018-07-17 16:39:39');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"管理员\",\"deptId\":6,\"deptName\":\"山林CF\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42],\"deptIdList\":[6,7],\"createTime\":\"Jul 18, 2018 11:02:31 AM\"}', '373', '0:0:0:0:0:0:0:1', '2018-07-18 11:02:32');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"test\",\"password\":\"5d4870574b50071dbbf29ec5c8c2477dcc29b0ad83d4205d66b8a8e0f1fba022\",\"salt\":\"48UlWT4z1idi90YXypBj\",\"email\":\"249853772@qq.com\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jul 18, 2018 11:03:23 AM\",\"deptId\":7,\"deptName\":\"南京分部\"}', '261', '0:0:0:0:0:0:0:1', '2018-07-18 11:03:24');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"test\",\"salt\":\"48UlWT4z1idi90YXypBj\",\"email\":\"249853772@qq.com\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jul 18, 2018 11:03:24 AM\",\"deptId\":6,\"deptName\":\"山林CF\"}', '117', '0:0:0:0:0:0:0:1', '2018-07-18 11:03:56');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"zhouboyun\",\"password\":\"e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"zhouboyun@sl.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"SL集团\"}', '38', '0:0:0:0:0:0:0:1', '2018-07-18 11:15:51');
INSERT INTO `sys_log` VALUES ('14', 'test', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"zhouboyun\",\"password\":\"6a69aebdc74f6514ce4d050febf0dbd2973ecc789a47ae30f9addd9725f24d16\",\"salt\":\"48UlWT4z1idi90YXypBj\",\"email\":\"zhouboyun@sl.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"SL集团\"}', '182', '0:0:0:0:0:0:0:1', '2018-07-18 13:09:57');
INSERT INTO `sys_log` VALUES ('15', 'zhouboyun', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"集团管理员\",\"deptId\":1,\"deptName\":\"SL集团\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jul 18, 2018 1:15:32 PM\"}', '105', '0:0:0:0:0:0:0:1', '2018-07-18 13:15:32');
INSERT INTO `sys_log` VALUES ('16', 'zhouboyun', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"zhouboyun\",\"password\":\"6a69aebdc74f6514ce4d050febf0dbd2973ecc789a47ae30f9addd9725f24d16\",\"salt\":\"48UlWT4z1idi90YXypBj\",\"email\":\"zhouboyun@sl.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"SL集团\"}', '87', '0:0:0:0:0:0:0:1', '2018-07-18 13:15:56');
INSERT INTO `sys_log` VALUES ('17', 'test', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"csdl\",\"password\":\"463e1d17df3ecffb62f9aaee88ffdab77790cb5d7fc9b472830f4ddfd005e1f6\",\"salt\":\"vZGow8OGayl13lP7Ligj\",\"email\":\"2498555@qq.com\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Dec 26, 2018 3:58:53 PM\",\"deptId\":7,\"deptName\":\"南京分部\"}', '104', '0:0:0:0:0:0:0:1', '2018-12-26 15:58:53');
INSERT INTO `sys_log` VALUES ('18', 'test', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"管理员\",\"deptId\":6,\"deptName\":\"山林CF\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52],\"deptIdList\":[6,7],\"createTime\":\"Jul 18, 2018 11:02:31 AM\"}', '760', '127.0.0.1', '2018-12-27 13:53:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '1', '消息室', 'webSocket.html', 'user:view', '1', 'fa fa-comments-o', '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '进入', null, 'user:view', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '1', '系统消息用户关系表', 'modules/mytest/sysmsguser.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('44', '43', '查看', null, 'sys:sysmsguser:list,sys:sysmsguser:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '43', '新增', null, 'sys:sysmsguser:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '43', '修改', null, 'sys:sysmsguser:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('47', '43', '删除', null, 'sys:sysmsguser:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '1', '系统消息表', 'modules/mytest/sysmsg.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('49', '48', '查看', null, 'sys:sysmsg:list,sys:sysmsg:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '48', '新增', null, 'sys:sysmsg:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '48', '修改', null, 'sys:sysmsg:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '48', '删除', null, 'sys:sysmsg:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_msg
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_type` varchar(100) DEFAULT NULL COMMENT '消息类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `text` varchar(5000) DEFAULT NULL COMMENT '文本内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `uploader_id` bigint(20) DEFAULT NULL COMMENT '上传者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统消息表';

-- ----------------------------
-- Records of sys_msg
-- ----------------------------
INSERT INTO `sys_msg` VALUES ('4', '6', '你好', 'hello world', '2018-12-27 15:55:27', '2018-12-29 16:23:19', '2');

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

-- ----------------------------
-- Records of sys_msg_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', null, '6', '2018-07-18 11:02:31');
INSERT INTO `sys_role` VALUES ('2', '集团管理员', null, '1', '2018-07-18 13:15:32');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('4', '2', '1');
INSERT INTO `sys_role_dept` VALUES ('5', '2', '2');
INSERT INTO `sys_role_dept` VALUES ('6', '2', '3');
INSERT INTO `sys_role_dept` VALUES ('7', '2', '4');
INSERT INTO `sys_role_dept` VALUES ('8', '2', '5');
INSERT INTO `sys_role_dept` VALUES ('9', '1', '6');
INSERT INTO `sys_role_dept` VALUES ('10', '1', '7');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('42', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('43', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('44', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('45', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('46', '2', '17');
INSERT INTO `sys_role_menu` VALUES ('47', '2', '18');
INSERT INTO `sys_role_menu` VALUES ('48', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('49', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('50', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('51', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('52', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('53', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('54', '2', '23');
INSERT INTO `sys_role_menu` VALUES ('55', '2', '24');
INSERT INTO `sys_role_menu` VALUES ('56', '2', '25');
INSERT INTO `sys_role_menu` VALUES ('57', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('58', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('59', '2', '6');
INSERT INTO `sys_role_menu` VALUES ('60', '2', '7');
INSERT INTO `sys_role_menu` VALUES ('61', '2', '8');
INSERT INTO `sys_role_menu` VALUES ('62', '2', '9');
INSERT INTO `sys_role_menu` VALUES ('63', '2', '10');
INSERT INTO `sys_role_menu` VALUES ('64', '2', '11');
INSERT INTO `sys_role_menu` VALUES ('65', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('66', '2', '13');
INSERT INTO `sys_role_menu` VALUES ('67', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('68', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('69', '2', '29');
INSERT INTO `sys_role_menu` VALUES ('70', '2', '30');
INSERT INTO `sys_role_menu` VALUES ('71', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('72', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('73', '2', '33');
INSERT INTO `sys_role_menu` VALUES ('74', '2', '34');
INSERT INTO `sys_role_menu` VALUES ('75', '2', '35');
INSERT INTO `sys_role_menu` VALUES ('76', '2', '36');
INSERT INTO `sys_role_menu` VALUES ('77', '2', '37');
INSERT INTO `sys_role_menu` VALUES ('78', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('79', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('80', '2', '40');
INSERT INTO `sys_role_menu` VALUES ('81', '2', '41');
INSERT INTO `sys_role_menu` VALUES ('82', '2', '42');
INSERT INTO `sys_role_menu` VALUES ('83', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('84', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('85', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('86', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('87', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('88', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('89', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('90', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('91', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('92', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('93', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('94', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('95', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('96', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('97', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('98', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('99', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('100', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('101', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('102', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('103', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('104', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('105', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('106', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('107', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('108', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('109', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('110', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('111', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('112', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('113', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('114', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('115', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('116', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('117', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('118', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('119', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('120', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('121', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('122', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('123', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('124', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('125', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('126', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('127', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('128', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('129', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('130', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('131', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('132', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('133', '1', '52');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'zhouboyun', '6a69aebdc74f6514ce4d050febf0dbd2973ecc789a47ae30f9addd9725f24d16', '48UlWT4z1idi90YXypBj', 'zhouboyun@sl.com', '13333333333', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'test', '5d4870574b50071dbbf29ec5c8c2477dcc29b0ad83d4205d66b8a8e0f1fba022', '48UlWT4z1idi90YXypBj', '249853772@qq.com', null, '1', '6', '2018-07-18 11:03:24');
INSERT INTO `sys_user` VALUES ('3', 'csdl', '463e1d17df3ecffb62f9aaee88ffdab77790cb5d7fc9b472830f4ddfd005e1f6', 'vZGow8OGayl13lP7Ligj', '2498555@qq.com', null, '1', '7', '2018-12-26 15:58:53');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '2', '1');
INSERT INTO `sys_user_role` VALUES ('5', '1', '2');
INSERT INTO `sys_user_role` VALUES ('6', '3', '2');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------
INSERT INTO `tb_token` VALUES ('2', 'fd9e607fdc5a4da5b210f477b1c8b6b7', '2018-07-17 02:04:09', '2018-07-16 14:04:09');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
INSERT INTO `tb_user` VALUES ('2', '17621707762', '17621707762', '2dc0269fa54d269a87536810ec453cb095b4b92f45e63826a21dff1c2e76f169', '2018-07-16 14:03:54');

-- ----------------------------
-- Function structure for queryDictAllChild
-- ----------------------------
DROP FUNCTION IF EXISTS `queryDictAllChild`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryDictAllChild`(`id` bigint) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	SET sTemp = '$';
	SET sTempChd = CAST(id AS CHAR);
	WHILE sTempChd IS NOT NULL DO
	SET sTemp = CONCAT(sTemp,',',sTempChd);
	SELECT GROUP_CONCAT(sys_dict.id) INTO sTempChd FROM sys_dict
	WHERE FIND_IN_SET(sys_dict.parent_id,sTempChd)>0;
	END WHILE;
	RETURN sTemp;
END
;;
DELIMITER ;
