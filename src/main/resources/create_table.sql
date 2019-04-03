/*
Navicat MySQL Data Transfer

Source Server         : 10.16.8.29
Source Server Version : 50505
Source Host           : 10.16.8.29:3308
Source Database       : h2_de_conf

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-02-13 19:09:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_cls
-- ----------------------------
CREATE TABLE if not exists `api_cls` (
                         `api_id` int(11) DEFAULT NULL,
                         `cls_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_path
-- ----------------------------
CREATE TABLE if not exists `api_path` (
                          `register_id` varchar(100) NOT NULL,
                          `version` varchar(50) DEFAULT NULL,
                          `url` varchar(300) DEFAULT NULL,
                          `method` varchar(20) DEFAULT NULL,
                          `summary` varchar(200) DEFAULT NULL,
                          `description` varchar(500) DEFAULT NULL,
                          `tags` varchar(500) DEFAULT NULL,
                          `parameters` varchar(3000) DEFAULT NULL,
                          `responses` varchar(1000) DEFAULT NULL,
                          `gmt_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_ref_definition
-- ----------------------------
CREATE TABLE if not exists `api_ref_definition` (
                                    `register_id` varchar(100) NOT NULL,
                                    `version` varchar(50) NOT NULL,
                                    `name` varchar(300) DEFAULT NULL,
                                    `type` varchar(100) DEFAULT NULL,
                                    `properties` varchar(2000) DEFAULT NULL,
                                    `description` varchar(500) DEFAULT NULL,
                                    `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cls
-- ----------------------------
CREATE TABLE if not exists `cls` (
                     `cls_id` varchar(50) NOT NULL,
                     `cls_name` varchar(50) NOT NULL,
                     `cls_pid` varchar(50) NOT NULL,
                     `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dm_cls
-- ----------------------------
CREATE TABLE if not exists `dm_cls` (
                        `dm_id` int(11) DEFAULT NULL,
                        `cls_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2advanced
-- ----------------------------
CREATE TABLE if not exists `h2advanced` (
                            `dm_id` varchar(50) NOT NULL,
                            `dm_conn_code` varchar(100) DEFAULT NULL,
                            `dm_db_engine` char(50) NOT NULL DEFAULT '0',
                            `dm_db_charset` char(50) NOT NULL DEFAULT '0',
                            `is_share_db` tinyint(4) DEFAULT NULL,
                            `db_num` int(11) DEFAULT NULL,
                            `is_share_table` tinyint(4) DEFAULT NULL,
                            `share_db_key` varchar(50) DEFAULT NULL,
                            `share_table_key` varchar(50) DEFAULT NULL,
                            `mycat_tb_type` char(1) DEFAULT NULL,
                            `table_num` int(11) DEFAULT NULL,
                            `is_share_rw` int(11) DEFAULT NULL,
                            `create_by` varchar(50) DEFAULT NULL,
                            `modified_by` varchar(50) DEFAULT NULL,
                            `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                            `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2advanced_dep
-- ----------------------------
CREATE TABLE if not exists `h2advanced_dep` (
                                `dm_id` varchar(50) NOT NULL,
                                `deploy_version_id` varchar(50) NOT NULL,
                                `dm_conn_code` varchar(100) DEFAULT NULL,
                                `dm_db_engine` char(50) NOT NULL DEFAULT '0',
                                `dm_db_charset` char(50) NOT NULL DEFAULT '0',
                                `is_share_db` tinyint(4) DEFAULT NULL,
                                `db_num` int(11) DEFAULT NULL,
                                `is_share_table` tinyint(4) DEFAULT NULL,
                                `share_db_key` varchar(50) DEFAULT NULL,
                                `share_table_key` varchar(50) DEFAULT NULL,
                                `mycat_tb_type` char(1) DEFAULT NULL,
                                `table_num` int(11) DEFAULT NULL,
                                `is_share_rw` int(11) DEFAULT NULL,
                                `create_by` varchar(50) DEFAULT NULL,
                                `modified_by` varchar(50) DEFAULT NULL,
                                `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                                `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`dm_id`,`deploy_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2capp
-- ----------------------------
CREATE TABLE if not exists `h2capp` (
                        `capp_id` varchar(50) NOT NULL,
                        `capp_name` varchar(100) DEFAULT NULL,
                        `svn` varchar(255) DEFAULT NULL,
                        `apk_url` varchar(255) DEFAULT NULL,
                        `web_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2capp_dep
-- ----------------------------
CREATE TABLE if not exists `h2capp_dep` (
                            `capp_id` varchar(100) NOT NULL,
                            `version` varchar(100) NOT NULL,
                            `capp_name` varchar(100) DEFAULT NULL,
                            `svn` varchar(255) DEFAULT NULL,
                            `apk_url` varchar(255) DEFAULT NULL,
                            `web_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2capp_release
-- ----------------------------
CREATE TABLE if not exists `h2capp_release` (
                                `capp_id` varchar(50) NOT NULL,
                                `capp_version` varchar(50) NOT NULL,
                                `pre_version_id` varchar(50) DEFAULT '0',
                                `profile_type` char(1) NOT NULL,
                                `description` text,
                                `is_running` tinyint(4) NOT NULL,
                                `create_by` varchar(50) DEFAULT NULL,
                                `modified_by` varchar(50) DEFAULT NULL,
                                `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                                `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`capp_id`,`capp_version`,`profile_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2column
-- ----------------------------
CREATE TABLE if not exists `h2column` (
                          `dm_id` varchar(50) NOT NULL,
                          `column_name` varchar(50) NOT NULL,
                          `column_c_name` varchar(50) DEFAULT NULL,
                          `column_index` int(11) NOT NULL,
                          `column_type` varchar(2) NOT NULL,
                          `column_size` varchar(5) DEFAULT NULL,
                          `column_precision` varchar(5) DEFAULT NULL,
                          `is_null` tinyint(2) NOT NULL,
                          `is_primary_key` tinyint(2) NOT NULL,
                          `def_value` varchar(50) DEFAULT NULL,
                          `create_by` varchar(50) DEFAULT NULL,
                          `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                          `modified_by` varchar(50) DEFAULT NULL,
                          `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          `dm_cls` varchar(50) DEFAULT NULL,
                          PRIMARY KEY (`dm_id`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2column_dep
-- ----------------------------
CREATE TABLE if not exists `h2column_dep` (
                              `dm_id` varchar(50) NOT NULL,
                              `deploy_version_id` varchar(50) NOT NULL,
                              `column_name` varchar(50) NOT NULL,
                              `column_c_name` varchar(50) DEFAULT NULL,
                              `column_index` int(11) NOT NULL,
                              `column_type` varchar(15) NOT NULL,
                              `column_size` varchar(5) DEFAULT NULL,
                              `column_precision` varchar(5) DEFAULT NULL,
                              `is_null` tinyint(2) NOT NULL,
                              `is_primary_key` tinyint(2) NOT NULL,
                              `def_value` varchar(50) DEFAULT NULL,
                              `create_by` varchar(50) DEFAULT NULL,
                              `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                              `modified_by` varchar(50) DEFAULT NULL,
                              `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              UNIQUE KEY `h2dm_id` (`dm_id`,`deploy_version_id`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component
-- ----------------------------
CREATE TABLE if not exists `h2component` (
                             `comp_id` varchar(50) NOT NULL,
                             `comp_name` varchar(100) NOT NULL,
                             `comp_desc` varchar(200) DEFAULT NULL,
                             `app_name` varchar(100) NOT NULL DEFAULT '',
                             `create_by` varchar(50) DEFAULT NULL,
                             `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                             `modified_by` varchar(50) DEFAULT NULL,
                             `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             `comp_tags` varchar(300) DEFAULT NULL,
                             PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_api
-- ----------------------------
CREATE TABLE if not exists `h2component_api` (
                                 `id` varchar(50) NOT NULL,
                                 `comp_id` varchar(50) NOT NULL,
                                 `intf_type` char(1) NOT NULL COMMENT '0-http 1-rpc',
                                 `tag_id` varchar(255) NOT NULL COMMENT 'controller名称和描述,一个对应的标签',
                                 `path` varchar(255) NOT NULL,
                                 `api_in` varchar(1000) NOT NULL,
                                 `notes` varchar(255) DEFAULT NULL,
                                 `value` varchar(100) NOT NULL,
                                 `response` varchar(50) NOT NULL,
                                 `http_method` varchar(10) NOT NULL,
                                 `open` char(1) NOT NULL DEFAULT '1',
                                 `create_by` varchar(45) NOT NULL,
                                 `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `modified_by` varchar(45) DEFAULT NULL,
                                 `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 `api_cls` varchar(50) NOT NULL DEFAULT '0299',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_api_release
-- ----------------------------
CREATE TABLE if not exists `h2component_api_release` (
                                         `id` varchar(50) NOT NULL,
                                         `comp_id` varchar(50) NOT NULL,
                                         `comp_version_id` varchar(50) NOT NULL,
                                         `intf_type` char(1) NOT NULL COMMENT '0-http 1-rpc',
                                         `tag_id` varchar(255) NOT NULL COMMENT 'controller名称和描述,一个对应的标签',
                                         `path` varchar(255) NOT NULL,
                                         `api_in` varchar(1000) NOT NULL,
                                         `notes` varchar(255) DEFAULT NULL,
                                         `value` varchar(100) NOT NULL,
                                         `response` varchar(50) NOT NULL,
                                         `http_method` varchar(10) NOT NULL,
                                         `open` char(1) NOT NULL DEFAULT '1',
                                         `create_by` varchar(45) NOT NULL DEFAULT 'system',
                                         `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                         `modified_by` varchar(45) DEFAULT NULL,
                                         `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                         PRIMARY KEY (`id`,`comp_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_api_tag
-- ----------------------------
CREATE TABLE if not exists `h2component_api_tag` (
                                     `tag_id` varchar(50) NOT NULL,
                                     `comp_id` varchar(50) NOT NULL,
                                     `tag_name` varchar(50) NOT NULL,
                                     `dm_id` varchar(50) DEFAULT NULL,
                                     `tag_desc` varchar(150) DEFAULT NULL,
                                     `create_by` varchar(50) NOT NULL,
                                     `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                                     `modified_by` varchar(45) DEFAULT NULL,
                                     `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                     PRIMARY KEY (`tag_id`),
                                     UNIQUE KEY `u_h2component_dm` (`comp_id`,`dm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_build
-- ----------------------------
CREATE TABLE if not exists `h2component_build` (
                                   `id` int(50) NOT NULL AUTO_INCREMENT,
                                   `comp_id` varchar(50) DEFAULT NULL,
                                   `script` text,
                                   `repo_path` varchar(500) DEFAULT NULL,
                                   `repo_username` varchar(100) DEFAULT '',
                                   `repo_password` varchar(100) DEFAULT NULL,
                                   `repo_type` varchar(50) DEFAULT NULL,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_conf
-- ----------------------------
CREATE TABLE if not exists `h2component_conf` (
                                  `comp_id` varchar(50) NOT NULL,
                                  `app_name` varchar(255) NOT NULL,
                                  `app_port` varchar(10) NOT NULL,
                                  `sql_info` varchar(300) DEFAULT NULL,
                                  `nosql_info` varchar(300) DEFAULT NULL,
                                  `middleware_type` char(1) NOT NULL,
                                  `register_addr` varchar(100) NOT NULL,
                                  `zipkin_addr` varchar(255) DEFAULT NULL,
                                  `turbine_addr` varchar(255) DEFAULT NULL,
                                  `endpoint_type` char(10) DEFAULT NULL,
                                  `tenant_type` char(1) NOT NULL,
                                  `open_swagger` char(1) NOT NULL,
                                  `pkg_path` varchar(255) NOT NULL,
                                  PRIMARY KEY (`comp_id`),
                                  KEY `rrr` (`comp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_dependency
-- ----------------------------
CREATE TABLE if not exists `h2component_dependency` (
                                        `id` varchar(50) NOT NULL,
                                        `com_cur_id` varchar(50) NOT NULL,
                                        `com_den_id` varchar(50) NOT NULL,
                                        `com_den_version_id` varchar(50) NOT NULL,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_dependency_api
-- ----------------------------
CREATE TABLE if not exists `h2component_dependency_api` (
                                            `den_id` varchar(50) NOT NULL,
                                            `api_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_dependency_api_release
-- ----------------------------
CREATE TABLE if not exists `h2component_dependency_api_release` (
                                                    `den_id` varchar(50) NOT NULL,
                                                    `api_id` varchar(50) DEFAULT NULL,
                                                    `comp_version_id` varchar(50) NOT NULL,
                                                    PRIMARY KEY (`den_id`,`comp_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_dependency_release
-- ----------------------------
CREATE TABLE if not exists `h2component_dependency_release` (
                                                `id` varchar(50) NOT NULL,
                                                `com_cur_id` varchar(50) NOT NULL,
                                                `com_cur_version_id` varchar(50) NOT NULL,
                                                `com_den_id` varchar(50) NOT NULL,
                                                `com_den_version_id` varchar(50) NOT NULL,
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2component_res
-- ----------------------------
CREATE TABLE if not exists `h2component_res` (
                                 `comp_id` varchar(50) NOT NULL,
                                 `is_parent` varchar(50) NOT NULL,
                                 `pnt_group` varchar(50) DEFAULT NULL,
                                 `pnt_artifact` varchar(50) DEFAULT NULL,
                                 `pnt_version` varchar(50) DEFAULT NULL,
                                 `cur_group` varchar(50) NOT NULL,
                                 `cur_artifact` varchar(50) NOT NULL,
                                 `cur_version` varchar(50) NOT NULL,
                                 `jdk_version` varchar(50) NOT NULL,
                                 `docker_template` char(1) NOT NULL,
                                 `app_type` char(3) NOT NULL,
                                 `scloud_type` char(2) DEFAULT NULL,
                                 `base_frame` char(10) DEFAULT NULL,
                                 `individual_cmpt` char(3) DEFAULT NULL,
                                 `other_cmpt` char(3) DEFAULT NULL,
                                 PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2comp_dm_rel
-- ----------------------------
CREATE TABLE if not exists `h2comp_dm_rel` (
                               `dm_id` varchar(50) DEFAULT NULL,
                               `dm_version` int(11) DEFAULT NULL,
                               `comp_id` varchar(50) DEFAULT NULL,
                               `com_version` varchar(50) DEFAULT NULL,
                               UNIQUE KEY `u_h2dm_name` (`dm_id`,`comp_id`,`dm_version`,`com_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2comp_release
-- ----------------------------
CREATE TABLE if not exists `h2comp_release` (
                                `comp_id` varchar(50) NOT NULL,
                                `comp_version` varchar(50) NOT NULL,
                                `pre_version_id` varchar(50) NOT NULL DEFAULT '0',
                                `profile_type` char(1) NOT NULL,
                                `description` text,
                                `boot_name` varchar(100) NOT NULL,
                                `is_running` tinyint(2) NOT NULL,
                                `tags` varchar(300) DEFAULT NULL,
                                `create_by` varchar(50) DEFAULT NULL,
                                `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                                `modified_by` varchar(50) DEFAULT NULL,
                                `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`comp_id`,`comp_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2dm
-- ----------------------------
CREATE TABLE if not exists `h2dm` (
                      `dm_id` varchar(50) NOT NULL,
                      `dm_name` varchar(50) NOT NULL,
                      `dm_tb_name` varchar(50) NOT NULL,
                      `dm_type` char(2) NOT NULL DEFAULT '00',
                      `dm_desc` varchar(150) DEFAULT NULL,
                      `create_by` varchar(50) DEFAULT NULL,
                      `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                      `modified_by` varchar(50) DEFAULT NULL,
                      `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                      `dm_cls` varchar(50) NOT NULL DEFAULT '0199',
                      PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2dm_dep
-- ----------------------------
CREATE TABLE if not exists `h2dm_dep` (
                          `dm_id` varchar(50) NOT NULL,
                          `dm_name` varchar(50) NOT NULL,
                          `dm_tb_name` varchar(50) NOT NULL,
                          `dm_type` char(2) NOT NULL DEFAULT '00',
                          `dm_version` varchar(100) NOT NULL,
                          `dm_desc` varchar(150) DEFAULT NULL,
                          `create_by` varchar(50) DEFAULT NULL,
                          `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                          `modified_by` varchar(50) DEFAULT NULL,
                          `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          PRIMARY KEY (`dm_id`,`dm_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2dm_release
-- ----------------------------
CREATE TABLE if not exists `h2dm_release` (
                              `dm_id` varchar(50) NOT NULL,
                              `dm_version` int(11) NOT NULL,
                              `pre_version_id` int(11) NOT NULL DEFAULT '0',
                              `profile_type` char(1) NOT NULL,
                              `description` text,
                              `is_running` tinyint(4) NOT NULL,
                              `create_by` varchar(50) DEFAULT NULL,
                              `modified_by` varchar(50) DEFAULT NULL,
                              `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                              `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                              PRIMARY KEY (`dm_id`,`dm_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2index
-- ----------------------------
CREATE TABLE if not exists `h2index` (
                         `dm_id` varchar(50) NOT NULL,
                         `deploy_version_id` varchar(50) DEFAULT NULL,
                         `index_name` varchar(50) NOT NULL,
                         `index_type` char(1) NOT NULL DEFAULT '0',
                         `index_column` varchar(100) NOT NULL,
                         `index_method` char(1) NOT NULL DEFAULT '0',
                         `create_by` varchar(50) DEFAULT NULL,
                         `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                         `modified_by` varchar(50) DEFAULT NULL,
                         `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         UNIQUE KEY `h2dm_id2` (`dm_id`,`deploy_version_id`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2index_dep
-- ----------------------------
CREATE TABLE if not exists `h2index_dep` (
                             `dm_id` varchar(50) NOT NULL,
                             `deploy_version_id` varchar(50) DEFAULT NULL,
                             `index_name` varchar(50) NOT NULL,
                             `index_type` char(1) NOT NULL DEFAULT '0',
                             `index_column` varchar(100) NOT NULL,
                             `index_method` char(1) NOT NULL DEFAULT '0',
                             `create_by` varchar(50) DEFAULT NULL,
                             `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                             `modified_by` varchar(50) DEFAULT NULL,
                             `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             UNIQUE KEY `h2dm_id3` (`dm_id`,`deploy_version_id`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2tenant
-- ----------------------------
CREATE TABLE if not exists `h2tenant` (
                          `tenant_id` varchar(50) NOT NULL,
                          `component_id` varchar(50) NOT NULL,
                          `create_by` varchar(50) DEFAULT NULL,
                          `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                          `modified_by` varchar(50) DEFAULT NULL,
                          `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          PRIMARY KEY (`tenant_id`,`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2_comp_tag
-- ----------------------------
CREATE TABLE if not exists `h2_comp_tag` (
                             `tag_id` varchar(50) NOT NULL,
                             `tag_name` varchar(200) NOT NULL,
                             PRIMARY KEY (`tag_id`),
                             UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for h2_comp_tag_relation
-- ----------------------------
CREATE TABLE if not exists `h2_comp_tag_relation` (
                                      `tag_id` varchar(30) NOT NULL,
                                      `h2_comp_version` varchar(10) NOT NULL,
                                      `h2_comp_id` varchar(30) NOT NULL,
                                      UNIQUE KEY `tag_id` (`tag_id`,`h2_comp_version`,`h2_comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_subscribe
-- ----------------------------
CREATE TABLE if not exists `user_subscribe` (
                                `subscribe_id` varchar(50) NOT NULL,
                                `addressee_id` varchar(50) NOT NULL,
                                `api_dm_id` varchar(50) NOT NULL,
                                `subscribe_type` varchar(1) NOT NULL,
                                `gmt_create` datetime NOT NULL,
                                PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
