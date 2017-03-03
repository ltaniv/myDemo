/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.20 : Database - demo
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` VARCHAR(30) NOT NULL COMMENT '手机号码',
  `password` VARCHAR(30) NOT NULL COMMENT '密码',
  `role_id` VARCHAR(15) NOT NULL COMMENT '角色引用',
  `real_name` VARCHAR(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT '姓别',
  `birthday` DATE DEFAULT NULL COMMENT '生日',
  `input_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `online` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '在线状态 0｜不在线、1｜在线',
  `enabled` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0｜禁用、1｜默认可用',
  `explain` VARCHAR(30) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`),
  CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

INSERT  INTO `admin`(`id`,`account`,`password`,`role_id`,`real_name`,`sex`,`birthday`,`input_time`,`online`,`enabled`,`explain`) VALUES (1,'18374501672','123123','1','杨坤',1,'2016-11-06','2016-07-30 21:05:15',0,1,NULL),(2,'18374501673','111111','1','杨某',1,NULL,'2016-08-08 15:30:36',0,1,NULL);

/*Table structure for table `admin_accredit` */

DROP TABLE IF EXISTS `admin_accredit`;

CREATE TABLE `admin_accredit` (
  `role_id` VARCHAR(15) NOT NULL COMMENT '角色引用',
  `project_module_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`project_module_id`),
  UNIQUE KEY `role_id` (`role_id`,`project_module_id`),
  KEY `project_module_id` (`project_module_id`),
  CONSTRAINT `admin_accredit_ibfk_1` FOREIGN KEY (`project_module_id`) REFERENCES `project_module` (`id`),
  CONSTRAINT `admin_accredit_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `admin_accredit` */

INSERT  INTO `admin_accredit`(`role_id`,`project_module_id`) VALUES ('1',1),('1',2),('1',3),('1',4),('1',5),('1',6),('1',7),('1',8),('1',9),('1',10),('1',11),('1',12),('1',13);

/*Table structure for table `admin_role` */

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `id` VARCHAR(15) NOT NULL,
  `role_name` VARCHAR(15) NOT NULL COMMENT '中文角色名',
  `remark` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `admin_role` */

INSERT  INTO `admin_role`(`id`,`role_name`,`remark`) VALUES ('1','管理员',NULL),('2','Test1',NULL),('3','Test2',NULL);

/*Table structure for table `attribute_name` */

DROP TABLE IF EXISTS `attribute_name`;

CREATE TABLE `attribute_name` (
  `id` INT(10) UNSIGNED NOT NULL,
  `attribute_name` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `attribute_name` */

/*Table structure for table `attribute_table` */

DROP TABLE IF EXISTS `attribute_table`;

CREATE TABLE `attribute_table` (
  `id` VARCHAR(10) NOT NULL COMMENT '属性码',
  `attribute_name_id` INT(10) UNSIGNED NOT NULL COMMENT '属性名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`attribute_name_id`),
  KEY `fk_Attribute_Table_Attribute_Name_1` (`attribute_name_id`),
  CONSTRAINT `fk_Attribute_Table_Attribute_Name_1` FOREIGN KEY (`attribute_name_id`) REFERENCES `attribute_name` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `attribute_table` */

/*Table structure for table `attribute_value` */

DROP TABLE IF EXISTS `attribute_value`;

CREATE TABLE `attribute_value` (
  `attribute_name_id` INT(10) UNSIGNED NOT NULL,
  `attribute_value` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`attribute_name_id`),
  CONSTRAINT `fk_Attribute_Value_Attribute_Name_1` FOREIGN KEY (`attribute_name_id`) REFERENCES `attribute_name` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `attribute_value` */

/*Table structure for table `behavior_admin_pwderr` */

DROP TABLE IF EXISTS `behavior_admin_pwderr`;

CREATE TABLE `behavior_admin_pwderr` (
  `ip` VARCHAR(15) NOT NULL,
  `account` VARCHAR(11) NOT NULL,
  `role` VARCHAR(30) NOT NULL,
  `total` INT(1) UNSIGNED NOT NULL COMMENT '密码错误（2｜验证、3｜提醒、5｜锁定）',
  `invalid` DATETIME DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`ip`,`account`,`role`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `behavior_admin_pwderr` */

/*Table structure for table `browsing_history` */

DROP TABLE IF EXISTS `browsing_history`;

CREATE TABLE `browsing_history` (
  `user_member_id` INT(10) UNSIGNED NOT NULL,
  `object_id` INT(10) UNSIGNED NOT NULL COMMENT '对象引用（）',
  `open_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '浏览时间',
  PRIMARY KEY (`user_member_id`,`object_id`),
  CONSTRAINT `fk_Browsing_History_User_Member_1` FOREIGN KEY (`user_member_id`) REFERENCES `user_member` (`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `browsing_history` */

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `building_name` VARCHAR(30) NOT NULL COMMENT '楼盘名称或小区名',
  `building_alias` VARCHAR(30) DEFAULT NULL COMMENT '别名',
  `business_circle_id` VARCHAR(8) NOT NULL COMMENT '商圈引用',
  `address_detail` VARCHAR(50) NOT NULL COMMENT '详细地址',
  `longitude_latitude` VARCHAR(20) NOT NULL COMMENT '经纬度坐标',
  `intro` TEXT NOT NULL COMMENT '项目简介',
  `feature_vals` VARCHAR(50) NOT NULL COMMENT '项目特色',
  `sale_address` VARCHAR(50) DEFAULT NULL COMMENT '售楼地址',
  `property_type_vals` VARCHAR(50) NOT NULL COMMENT '物业类别',
  `property_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '物业公司引用',
  `property_company_name` VARCHAR(30) DEFAULT NULL COMMENT '输入物业公司名',
  `property_office_address` VARCHAR(50) DEFAULT NULL COMMENT '物业办公地点',
  `property_phone` VARCHAR(12) DEFAULT NULL COMMENT '物业电话',
  `develop_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '开发公司引用',
  `develop_company_name` VARCHAR(30) DEFAULT NULL COMMENT '开发公司名称',
  `agent_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '代理公司引用',
  `agent_company_name` VARCHAR(30) DEFAULT NULL COMMENT '代理公司',
  `invest_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '投资公司引用',
  `invest_company_name` VARCHAR(30) DEFAULT NULL COMMENT '投资公司名称',
  `info_facility` TEXT COMMENT '配套设施',
  `info_traffic` TEXT COMMENT '交通状况',
  `info_peripheral` TEXT COMMENT '周边信息',
  `attributes` TEXT NOT NULL COMMENT 'JSON属性集合',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `publish_user_id` INT(10) UNSIGNED NOT NULL COMMENT '作者用户引用',
  `last_update_user_id` INT(10) UNSIGNED NOT NULL COMMENT '更新小区用户引用',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  `src_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '来源（0正常、1提交）',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态（0正常、1禁用、2 审核中）',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_Building_Company_1` (`property_company_id`),
  KEY `fk_Building_Admin_1` (`publish_user_id`),
  KEY `fk_Building_Admin_2` (`last_update_user_id`),
  KEY `fk_Building_Business_Circle_1` (`business_circle_id`),
  KEY `fk_Building_Company_2` (`develop_company_id`),
  KEY `fk_Building_Company_3` (`invest_company_id`),
  KEY `fk_Building_Company_4` (`agent_company_id`),
  CONSTRAINT `fk_Building_Admin_1` FOREIGN KEY (`publish_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_Building_Admin_2` FOREIGN KEY (`last_update_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_Building_Business_Circle_1` FOREIGN KEY (`business_circle_id`) REFERENCES `business_circle` (`id`),
  CONSTRAINT `fk_Building_Company_1` FOREIGN KEY (`property_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_Building_Company_2` FOREIGN KEY (`develop_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_Building_Company_3` FOREIGN KEY (`invest_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_Building_Company_4` FOREIGN KEY (`agent_company_id`) REFERENCES `company` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `building` */

/*Table structure for table `business_circle` */

DROP TABLE IF EXISTS `business_circle`;

CREATE TABLE `business_circle` (
  `id` VARCHAR(8) NOT NULL COMMENT 'ID',
  `province_id` VARCHAR(2) NOT NULL,
  `city_id` VARCHAR(4) NOT NULL,
  `district_id` VARCHAR(6) NOT NULL COMMENT '区县ID',
  `attribute_table_id` VARCHAR(10) DEFAULT NULL COMMENT '自定属性引用',
  `business_circle_name` VARCHAR(15) NOT NULL COMMENT '商圈名称',
  `rank` INT(10) UNSIGNED DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fk_Business_Circle_District _1` (`district_id`),
  KEY `fk_Business_Circle_Attribute_Table_1` (`attribute_table_id`),
  KEY `fk_Business_Circle_Province_1` (`province_id`),
  KEY `fk_Business_Circle_City_1` (`city_id`),
  CONSTRAINT `fk_Business_Circle_Attribute_Table_1` FOREIGN KEY (`attribute_table_id`) REFERENCES `attribute_table` (`id`),
  CONSTRAINT `fk_Business_Circle_City_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_Business_Circle_District _1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_Business_Circle_Province_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `business_circle` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` VARCHAR(4) NOT NULL COMMENT 'ID',
  `province_id` VARCHAR(2) DEFAULT NULL COMMENT '省份引用',
  `city_name` VARCHAR(15) NOT NULL COMMENT '省/市/区县/商圈   名称',
  `rank` INT(10) UNSIGNED DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fk_City_Province_1` (`province_id`),
  CONSTRAINT `fk_City_Province_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `city` */

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `user_member_id` INT(10) UNSIGNED NOT NULL,
  `object_id` INT(10) UNSIGNED NOT NULL COMMENT '收藏住宅楼盘',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`user_member_id`,`object_id`),
  CONSTRAINT `fk_collect_User_Member_1` FOREIGN KEY (`user_member_id`) REFERENCES `user_member` (`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(30) NOT NULL COMMENT '公司名',
  `address_code` VARCHAR(8) NOT NULL COMMENT '地址代码',
  `address_detail` VARCHAR(30) NOT NULL COMMENT '地址（详细部分）',
  `website` VARCHAR(30) DEFAULT NULL COMMENT '网址',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
  `responsible_person` VARCHAR(15) DEFAULT NULL COMMENT '责任人',
  `telephone` VARCHAR(12) NOT NULL COMMENT '联系电话（座机）',
  `fax` VARCHAR(12) DEFAULT NULL COMMENT '传真',
  `intro` VARCHAR(200) DEFAULT NULL COMMENT '简介',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `src_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '来源（0正常、1提交）',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态（0正常、1禁用、2 审核中）',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `company` */

/*Table structure for table `company_agency` */

DROP TABLE IF EXISTS `company_agency`;

CREATE TABLE `company_agency` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(30) NOT NULL COMMENT '公司名',
  `address_code` VARCHAR(8) NOT NULL COMMENT '地址代码',
  `address_detail` VARCHAR(30) NOT NULL COMMENT '地址（详细部分）',
  `telephone` VARCHAR(12) NOT NULL COMMENT '联系电话（座机）',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `src_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '来源（0正常、1提交）',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态（0正常、1禁用、2 审核中）',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `company_agency` */

/*Table structure for table `company_staff_building` */

DROP TABLE IF EXISTS `company_staff_building`;

CREATE TABLE `company_staff_building` (
  `user_company_staff_id` INT(10) UNSIGNED NOT NULL COMMENT '经纪人ID',
  `building_id` INT(10) UNSIGNED NOT NULL COMMENT '小区ID',
  `flag` VARCHAR(10) DEFAULT NULL COMMENT '标记',
  PRIMARY KEY (`user_company_staff_id`),
  KEY `fk_Office_Staff_Building_Building_1` (`building_id`),
  CONSTRAINT `fk_Office_Staff_Building_Building_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_Office_Staff_Building_User_Office_Staff_1` FOREIGN KEY (`user_company_staff_id`) REFERENCES `user_company_staff` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `company_staff_building` */

/*Table structure for table `company_subagency` */

DROP TABLE IF EXISTS `company_subagency`;

CREATE TABLE `company_subagency` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `company_agency_id` INT(10) UNSIGNED NOT NULL COMMENT '总公司ID',
  `company_subname` VARCHAR(30) NOT NULL COMMENT '公司名',
  `address_code` VARCHAR(8) NOT NULL COMMENT '区域代码',
  `address_detail` VARCHAR(30) NOT NULL COMMENT '地址（详细部分）',
  `telephone` VARCHAR(12) NOT NULL COMMENT '联系电话（座机）',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `src_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '来源（0正常、1提交）',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态（0正常、1禁用、2 审核中）',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_Company_Subagency_Company_Agency_1` (`company_agency_id`),
  CONSTRAINT `fk_Company_Subagency_Company_Agency_1` FOREIGN KEY (`company_agency_id`) REFERENCES `company_agency` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `company_subagency` */

/*Table structure for table `delegate_rent` */

DROP TABLE IF EXISTS `delegate_rent`;

CREATE TABLE `delegate_rent` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `building_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '楼盘引用',
  `user_member_id` INT(10) UNSIGNED NOT NULL COMMENT '普通会员引用',
  `building_name` VARCHAR(30) DEFAULT NULL COMMENT '楼盘名称',
  `room_txt` VARCHAR(14) NOT NULL COMMENT '户型',
  `acreage` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT '面积',
  `floor_txt` VARCHAR(6) NOT NULL COMMENT '楼盘（1/25）',
  `quote` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '期价',
  `facility_vals` VARCHAR(100) DEFAULT NULL COMMENT '配套设施',
  `real_name` VARCHAR(15) NOT NULL COMMENT '真实姓名',
  `sex` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `mobile` VARCHAR(11) NOT NULL COMMENT '手机号',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `action_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_Delegate_Rent_Building_1` (`building_id`),
  KEY `fk_Delegate_Rent_User_Member_1` (`user_member_id`),
  CONSTRAINT `fk_Delegate_Rent_Building_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_Delegate_Rent_User_Member_1` FOREIGN KEY (`user_member_id`) REFERENCES `user_member` (`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `delegate_rent` */

/*Table structure for table `delegate_sell` */

DROP TABLE IF EXISTS `delegate_sell`;

CREATE TABLE `delegate_sell` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `building_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '楼盘引用',
  `user_member_id` INT(10) UNSIGNED NOT NULL COMMENT '普通会员引用',
  `building_name` VARCHAR(30) DEFAULT NULL COMMENT '楼盘名称',
  `room_txt` VARCHAR(14) NOT NULL COMMENT '户型',
  `acreage` DECIMAL(5,2) UNSIGNED NOT NULL COMMENT '面积',
  `floor_txt` VARCHAR(6) NOT NULL COMMENT '楼盘（1/25）',
  `orientation_val` VARCHAR(10) NOT NULL COMMENT '朝向',
  `quote` INT(10) UNSIGNED NOT NULL COMMENT '期价',
  `real_name` VARCHAR(15) NOT NULL COMMENT '真实姓名',
  `sex` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '性别',
  `mobile` VARCHAR(11) NOT NULL COMMENT '手机号',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `action_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_Delegate_Sell_Building_1` (`building_id`),
  KEY `fk_Delegate_Sell_User_Member_1` (`user_member_id`),
  CONSTRAINT `fk_Delegate_Sell_Building_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_Delegate_Sell_User_Member_1` FOREIGN KEY (`user_member_id`) REFERENCES `user_member` (`user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `delegate_sell` */

/*Table structure for table `district` */

DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `id` VARCHAR(6) NOT NULL COMMENT 'ID',
  `province_id` VARCHAR(2) NOT NULL,
  `city_id` VARCHAR(4) NOT NULL COMMENT '父ID',
  `district_name` VARCHAR(15) NOT NULL COMMENT '省/市/区县/商圈   名称',
  `rank` INT(10) UNSIGNED DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fk_District _City_1` (`city_id`),
  KEY `fk_District _Province_1` (`province_id`),
  CONSTRAINT `fk_District _City_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_District _Province_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `district` */

/*Table structure for table `house_rent` */

DROP TABLE IF EXISTS `house_rent`;

CREATE TABLE `house_rent` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '住宅引用',
  `user_company_staff_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '经纪人引用',
  `rent_title` VARCHAR(30) NOT NULL COMMENT '出租标题',
  `house_type_val` VARCHAR(10) NOT NULL COMMENT '类型（住宅、公寓）',
  `rental` INT(10) UNSIGNED DEFAULT NULL COMMENT '租金',
  `mode_vals` VARCHAR(10) NOT NULL COMMENT '出租方式（整租、合租）',
  `address` VARCHAR(30) NOT NULL COMMENT '详细地址',
  `describe` TEXT NOT NULL COMMENT '描述',
  `facility_vals` VARCHAR(100) NOT NULL COMMENT '配置设置',
  `feature_vals` VARCHAR(30) DEFAULT NULL COMMENT '特色',
  `room_txt` VARCHAR(14) NOT NULL COMMENT '居室户型（3/2/1/1）室厅卫厨阳',
  `acreage` INT(10) UNSIGNED DEFAULT NULL COMMENT '面积',
  `floor_txt` VARCHAR(6) NOT NULL COMMENT '楼层',
  `azimuth_val` VARCHAR(4) NOT NULL COMMENT '朝向',
  `landlord_phone` VARCHAR(13) NOT NULL COMMENT '电话',
  `landlord_name` VARCHAR(15) NOT NULL COMMENT '出租用户',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `check_user_id` INT(10) UNSIGNED NOT NULL COMMENT '审核用户引用',
  `last_update_time` DATETIME NOT NULL COMMENT '更新时间',
  `action_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_House_Rent_Housing_Sell_1` (`housing_id`),
  KEY `fk_House_Rent_User_Office_Staff_1` (`user_company_staff_id`),
  KEY `fk_House_Rent_Admin_1` (`check_user_id`),
  CONSTRAINT `fk_House_Rent_Admin_1` FOREIGN KEY (`check_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_House_Rent_Housing_Sell_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`),
  CONSTRAINT `fk_House_Rent_User_Office_Staff_1` FOREIGN KEY (`user_company_staff_id`) REFERENCES `user_company_staff` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `house_rent` */

/*Table structure for table `house_sell` */

DROP TABLE IF EXISTS `house_sell`;

CREATE TABLE `house_sell` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '住宅出售引用',
  `user_company_staff_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '经纪人引用',
  `sale_title` VARCHAR(30) NOT NULL COMMENT '出售标题',
  `quote` INT(10) UNSIGNED NOT NULL COMMENT '出价',
  `room_txt` VARCHAR(14) NOT NULL COMMENT '户型（3/2/1/1）室厅卫厨阳',
  `acreage` INT(10) UNSIGNED NOT NULL COMMENT '建筑面积',
  `orientation_val` VARCHAR(10) NOT NULL COMMENT '朝向',
  `floor_txt` VARCHAR(5) NOT NULL COMMENT '楼层 5/25',
  `structure_val` VARCHAR(10) NOT NULL COMMENT '结构',
  `decoration_val` VARCHAR(10) NOT NULL COMMENT '装修',
  `house_type_vals` VARCHAR(10) NOT NULL COMMENT '住宅类别',
  `property_val` VARCHAR(10) NOT NULL COMMENT '产权性质',
  `describe` TEXT NOT NULL COMMENT '房源描述',
  `facility_vals` VARCHAR(100) NOT NULL COMMENT '配套信息',
  `check_user_id` INT(10) UNSIGNED NOT NULL COMMENT '审核用户引用',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `action_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_House_Sell_Old_Housing_Sell_1` (`housing_id`),
  KEY `fk_House_Sell_Old_User_Office_Staff_1` (`user_company_staff_id`),
  KEY `fk_House_Sell_Admin_1` (`check_user_id`),
  CONSTRAINT `fk_House_Sell_Admin_1` FOREIGN KEY (`check_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_House_Sell_Old_Housing_Sell_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`),
  CONSTRAINT `fk_House_Sell_Old_User_Office_Staff_1` FOREIGN KEY (`user_company_staff_id`) REFERENCES `user_company_staff` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `house_sell` */

/*Table structure for table `housing` */

DROP TABLE IF EXISTS `housing`;

CREATE TABLE `housing` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `building_id` INT(10) UNSIGNED NOT NULL COMMENT '楼盘引用',
  `feature_vals` VARCHAR(50) NOT NULL COMMENT '项目特色',
  `intro` TEXT NOT NULL COMMENT '项目简介',
  `sale_caption` VARCHAR(30) DEFAULT NULL COMMENT '出售标题（如：天上人间第一期、二期）',
  `sale_price` INT(10) UNSIGNED NOT NULL COMMENT '最低价',
  `sale_price_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销售价格类型（均、低）',
  `sale_status_val` VARCHAR(10) NOT NULL COMMENT '销售状态',
  `sale_phone` VARCHAR(12) NOT NULL COMMENT '销售电话',
  `sale_address` VARCHAR(50) DEFAULT NULL COMMENT '售楼地址',
  `floor_info` VARCHAR(200) DEFAULT NULL COMMENT '楼层状况',
  `building_type_vals` VARCHAR(50) NOT NULL COMMENT '建筑类别',
  `decoration_vals` VARCHAR(50) NOT NULL COMMENT '装修状况',
  `decoration_materials` VARCHAR(200) DEFAULT NULL COMMENT '建材装修',
  `property_type_vals` VARCHAR(50) NOT NULL COMMENT '物业类别',
  `property_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '物业公司引用',
  `property_company_name` VARCHAR(30) DEFAULT NULL COMMENT '输入物业公司名',
  `property_office_address` VARCHAR(50) DEFAULT NULL COMMENT '物业办公地点',
  `property_phone` VARCHAR(12) DEFAULT NULL COMMENT '物业电话',
  `develop_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '开发商公司引用',
  `develop_company_name` VARCHAR(30) DEFAULT NULL COMMENT '开发商公司名称',
  `agent_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '代理公司',
  `agent_company_name` VARCHAR(30) DEFAULT NULL COMMENT '代理公司',
  `investment_company_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '投资公司',
  `investment_company_name` VARCHAR(30) DEFAULT NULL COMMENT '投资公司名称',
  `info_facility` TEXT COMMENT '配套设施',
  `info_traffic` TEXT COMMENT '交通状况',
  `info_peripheral` TEXT COMMENT '周边信息',
  `attributes` TEXT NOT NULL COMMENT 'JSON属性集合',
  `publish_user_id` INT(10) UNSIGNED NOT NULL COMMENT '发布用户引用',
  `last_update_user_id` INT(10) UNSIGNED NOT NULL COMMENT '最后更新用户引用',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `action_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `status_mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `remark` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Housing_Sell_Building_1` (`building_id`),
  KEY `fk_Housing_Admin_1` (`publish_user_id`),
  KEY `fk_Housing_Admin_2` (`last_update_user_id`),
  CONSTRAINT `fk_Housing_Admin_1` FOREIGN KEY (`publish_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_Housing_Admin_2` FOREIGN KEY (`last_update_user_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_Housing_Sell_Building_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing` */

/*Table structure for table `housing_house_type` */

DROP TABLE IF EXISTS `housing_house_type`;

CREATE TABLE `housing_house_type` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '楼盘ID',
  `house_type_title` VARCHAR(20) DEFAULT NULL COMMENT '户型名称',
  `room_txt` VARCHAR(14) NOT NULL COMMENT '户型（3/2/1/1）室厅卫厨阳',
  `distribute` VARCHAR(30) NOT NULL COMMENT '户型分布',
  `acreage_building` DECIMAL(5,2) UNSIGNED DEFAULT NULL COMMENT '建筑面积',
  `acreage_inside` DECIMAL(5,2) UNSIGNED DEFAULT NULL COMMENT '套内面积',
  PRIMARY KEY (`id`),
  KEY `fk_house_type_Housing_1` (`housing_id`),
  CONSTRAINT `fk_house_type_Housing_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing_house_type` */

/*Table structure for table `housing_licence` */

DROP TABLE IF EXISTS `housing_licence`;

CREATE TABLE `housing_licence` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '楼盘ID',
  `credentials` VARCHAR(50) NOT NULL COMMENT '预售许可证',
  `range` VARCHAR(100) NOT NULL COMMENT '预售许可证预售范围',
  PRIMARY KEY (`id`),
  KEY `fk_Housing_Licence_Housing_1` (`housing_id`),
  CONSTRAINT `fk_Housing_Licence_Housing_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing_licence` */

/*Table structure for table `housing_occupancy_record` */

DROP TABLE IF EXISTS `housing_occupancy_record`;

CREATE TABLE `housing_occupancy_record` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '楼盘ID',
  `record_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `describe` VARCHAR(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `fk_Occupancy_Record_Housing_1` (`housing_id`),
  CONSTRAINT `fk_Occupancy_Record_Housing_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing_occupancy_record` */

/*Table structure for table `housing_open_record` */

DROP TABLE IF EXISTS `housing_open_record`;

CREATE TABLE `housing_open_record` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '住宅楼盘引用',
  `record_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `describe` VARCHAR(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `fk_Opening_Quotation_Record_Housing_1` (`housing_id`),
  CONSTRAINT `fk_Opening_Quotation_Record_Housing_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing_open_record` */

/*Table structure for table `housing_price_record` */

DROP TABLE IF EXISTS `housing_price_record`;

CREATE TABLE `housing_price_record` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `housing_id` INT(10) UNSIGNED NOT NULL COMMENT '住宅楼盘引用',
  `record_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `max_price` INT(10) UNSIGNED DEFAULT NULL COMMENT '最高价（元/平方米）',
  `average_price` INT(10) UNSIGNED DEFAULT NULL COMMENT '均价（元/平方米）',
  `min_price` INT(10) UNSIGNED DEFAULT NULL COMMENT '最低价（元/平方米）',
  `describe` VARCHAR(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `fk_Housing_Price_Trends_Housing_1` (`housing_id`),
  CONSTRAINT `fk_Housing_Price_Trends_Housing_1` FOREIGN KEY (`housing_id`) REFERENCES `housing` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `housing_price_record` */

/*Table structure for table `metro` */

DROP TABLE IF EXISTS `metro`;

CREATE TABLE `metro` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` VARCHAR(4) NOT NULL COMMENT '城市引用',
  `metro_name` VARCHAR(30) NOT NULL COMMENT '地铁名称（2号线）',
  `rank` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fk_Metro_City_1` (`city_id`),
  CONSTRAINT `fk_Metro_City_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `metro` */

/*Table structure for table `metro_station` */

DROP TABLE IF EXISTS `metro_station`;

CREATE TABLE `metro_station` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `metro_id` INT(10) UNSIGNED NOT NULL COMMENT '地铁线引用',
  `business_circle_id` VARCHAR(8) DEFAULT NULL COMMENT '商圈引用',
  `metro_station_name` VARCHAR(30) NOT NULL COMMENT '站点名称',
  `rank` INT(10) UNSIGNED DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fk_Metro_Station_Metro_1` (`metro_id`),
  KEY `fk_Metro_Station_Business_Circle_1` (`business_circle_id`),
  CONSTRAINT `fk_Metro_Station_Business_Circle_1` FOREIGN KEY (`business_circle_id`) REFERENCES `business_circle` (`id`),
  CONSTRAINT `fk_Metro_Station_Metro_1` FOREIGN KEY (`metro_id`) REFERENCES `metro` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `metro_station` */

/*Table structure for table `project_module` */

DROP TABLE IF EXISTS `project_module`;

CREATE TABLE `project_module` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `module_name` VARCHAR(20) NOT NULL COMMENT '模块名称',
  `alias` VARCHAR(20) DEFAULT NULL COMMENT '别名',
  `icon` VARCHAR(20) DEFAULT NULL COMMENT '图标',
  `href` VARCHAR(50) DEFAULT NULL COMMENT 'servletPath或锚',
  `parent_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '父模块',
  `rank` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '列队',
  PRIMARY KEY (`id`),
  UNIQUE KEY `href` (`href`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `project_module_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `project_module` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `project_module` */

INSERT  INTO `project_module`(`id`,`module_name`,`alias`,`icon`,`href`,`parent_id`,`rank`) VALUES (1,'管理员','管理员信息','icon-admin','/admin/account/',NULL,1),(2,'用户管理',NULL,'icon-users','/admin/user/',NULL,2),(3,'小区信息',NULL,'icon-flag','/admin/biotope/',NULL,3),(4,'楼盘管理维护',NULL,'icon-building','/admin/building/',NULL,4),(5,'公司相关',NULL,'icon-company','/admin/company/',NULL,5),(6,'资讯',NULL,'icon-info','/admin/info/',NULL,6),(7,'地理位置',NULL,'icon-address','/admin/address/',NULL,7),(8,'学校',NULL,'icon-school','/admin/school/',NULL,8),(9,'自定属性',NULL,'icon-attr','/admin/attribute/',NULL,9),(10,'角色管理',NULL,NULL,'#/role/list',1,1),(11,'用户列表',NULL,NULL,'#/user/list',1,2),(12,'会员',NULL,NULL,'#/member/list',2,1),(13,'经纪人',NULL,NULL,'#/broker/list',2,2);

/*Table structure for table `province` */

DROP TABLE IF EXISTS `province`;

CREATE TABLE `province` (
  `id` VARCHAR(2) NOT NULL COMMENT 'ID',
  `province_name` VARCHAR(15) NOT NULL COMMENT '省名称',
  `rank` INT(10) UNSIGNED DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `province` */

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `school_category_id` INT(10) UNSIGNED NOT NULL,
  `business_circle_id` VARCHAR(8) NOT NULL COMMENT '地址代码',
  `school_name` VARCHAR(30) NOT NULL,
  `address_detail` VARCHAR(50) NOT NULL COMMENT '地址详细',
  PRIMARY KEY (`id`),
  KEY `fk_school_school_category_1` (`school_category_id`),
  KEY `fk_School_Business_Circle_1` (`business_circle_id`),
  CONSTRAINT `fk_School_Business_Circle_1` FOREIGN KEY (`business_circle_id`) REFERENCES `business_circle` (`id`),
  CONSTRAINT `fk_school_school_category_1` FOREIGN KEY (`school_category_id`) REFERENCES `school_category` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `school` */

/*Table structure for table `school_category` */

DROP TABLE IF EXISTS `school_category`;

CREATE TABLE `school_category` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `school_category_name` VARCHAR(30) NOT NULL COMMENT '学校类别',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `school_category` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` VARCHAR(11) NOT NULL COMMENT '手机号',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
  `password` VARCHAR(30) NOT NULL COMMENT '密码',
  `email_code` VARCHAR(6) DEFAULT NULL COMMENT '邮箱验证码（未认证则不为空）',
  `address_code` VARCHAR(8) DEFAULT NULL COMMENT '地址代码',
  `action_mark` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT '行为（正常、禁用、锁定）\r\n非正常就读备注说明',
  `status_mark` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT '状态（登录中、密码错误锁定）',
  `remark` VARCHAR(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `user_company_staff` */

DROP TABLE IF EXISTS `user_company_staff`;

CREATE TABLE `user_company_staff` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `company_subagency_id` INT(10) UNSIGNED NOT NULL COMMENT '经纪人公司引用',
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT '用户信息引用',
  `real_name` VARCHAR(20) NOT NULL COMMENT '真实姓名',
  `sex` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT '性别',
  `birthday` DATE DEFAULT NULL COMMENT '生日',
  `id_number` VARCHAR(18) DEFAULT NULL COMMENT '身份证号',
  `job_number` VARCHAR(20) DEFAULT NULL COMMENT '工号',
  `intro` VARCHAR(90) DEFAULT NULL COMMENT '简介',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `is_verify` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否身份认证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_subagency_id` (`company_subagency_id`,`user_id`),
  KEY `fk_User_Office_Staff_User_1` (`user_id`),
  CONSTRAINT `fk_User_Office_Staff_Company_Subagency_1` FOREIGN KEY (`company_subagency_id`) REFERENCES `company_subagency` (`id`),
  CONSTRAINT `fk_User_Office_Staff_User_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_company_staff` */

/*Table structure for table `user_member` */

DROP TABLE IF EXISTS `user_member`;

CREATE TABLE `user_member` (
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT '引用用户表主键',
  `real_name` VARCHAR(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` TINYINT(1) UNSIGNED DEFAULT NULL COMMENT '姓别',
  `birthday` DATE DEFAULT NULL COMMENT '生日',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_User_Member_User_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `user_member` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
