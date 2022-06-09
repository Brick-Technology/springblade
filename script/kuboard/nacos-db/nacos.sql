SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE SCHEMA IF NOT EXISTS `nacos_devtest` DEFAULT CHARACTER SET utf8mb4 ;
USE `nacos_devtest` ;

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'blade-demo-dev.yaml','DEFAULT_GROUP','#自定义配置\ndemo:\n  name: demo-name\n\n#放行配置\nblade:\n  secure:\n    skip-url:\n      - /demo/**\n  datasource:\n    demo:\n      master:\n        url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n        username: root\n        password: Db2@4jls2\n      slave:\n        url: jdbc:mysql://stag-mysql:3306/blade_slave?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n        username: root\n        password: Db2@4jls2\n','f4687a56b01256edbff3a92cf5da4227','2022-05-29 16:22:21','2022-05-30 07:57:19','nacos','10.42.3.0','','','','','','yaml','',''),(2,'blade-dev.yaml','DEFAULT_GROUP','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: dev-redis-headless\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    dev:\n      url: jdbc:mysql://dev-mysql-headless:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','5024867bd0ba0497387ebecf02f10a40','2022-05-29 16:22:21','2022-06-05 10:47:56','nacos','10.42.1.0','','','','','','yaml','',''),(3,'blade-prod.yaml','DEFAULT_GROUP','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: prod-redis-headless\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    prod:\n      url: jdbc:mysql://prod-mysql-headless:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','dc2b53ca1e17676d9cc684377cddc9ca','2022-05-29 16:22:21','2022-06-05 10:48:23','nacos','10.42.1.0','','','','','','yaml','',''),(4,'blade-test.yaml','DEFAULT_GROUP','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: test-redis-headless\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    test:\n      url: jdbc:mysql://test-mysql-headless:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','fdacf93ac966bf09975de3fe4d6f144f','2022-05-29 16:22:21','2022-06-05 10:48:12','nacos','10.42.2.0','','','','','','yaml','',''),(5,'blade.yaml','DEFAULT_GROUP','#服务器配置\r\nserver:\r\n  undertow:\r\n    # 以下的配置会影响buffer,这些buffer会用于服务器连接的IO操作,有点类似netty的池化内存管理\r\n    buffer-size: 1024\r\n    # 是否分配的直接内存\r\n    direct-buffers: true\r\n    # 线程配置\r\n    threads:\r\n      # 设置IO线程数, 它主要执行非阻塞的任务,它们会负责多个连接, 默认设置每个CPU核心一个线程\r\n      io: 16\r\n      # 阻塞任务线程池, 当执行类似servlet请求阻塞操作, undertow会从这个线程池中取得线程,它的值设置取决于系统的负载\r\n      worker: 400\r\n\r\n#spring配置\r\nspring:\r\n  cloud:\r\n    sentinel:\r\n      eager: true\r\n  devtools:\r\n    restart:\r\n      log-condition-evaluation-delta: false\r\n    livereload:\r\n      port: 23333\r\n\r\n#feign配置\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n\r\n#对外暴露端口\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"\r\n  endpoint:\r\n    health:\r\n      show-details: always\r\n\r\n#knife4j配置\r\nknife4j:\r\n  #启用\r\n  enable: true\r\n  #基础认证\r\n  basic:\r\n    enable: false\r\n    username: blade\r\n    password: blade\r\n  #增强配置\r\n  setting:\r\n    enableSwaggerModels: true\r\n    enableDocumentManage: true\r\n    enableHost: false\r\n    enableHostText: http://localhost\r\n    enableRequestCache: true\r\n    enableFilterMultipartApis: false\r\n    enableFilterMultipartApiMethodType: POST\r\n    language: zh-CN\r\n    enableFooter: false\r\n    enableFooterCustom: true\r\n    footerCustomContent: Copyright © 2021 SpringBlade All Rights Reserved\r\n\r\n#swagger配置信息\r\nswagger:\r\n  title: SpringBlade 接口文档系统\r\n  description: SpringBlade 接口文档系统\r\n  version: 3.3.0\r\n  license: Powered By SpringBlade\r\n  licenseUrl: https://bladex.vip\r\n  terms-of-service-url: https://bladex.vip\r\n  contact:\r\n    name: smallchill\r\n    email: smallchill@163.com\r\n    url: https://gitee.com/smallc\r\n\r\n#blade配置\r\nblade:\r\n  xss:\r\n    enabled: true\r\n    skip-url:\r\n      - /weixin\r\n  secure:\r\n    skip-url:\r\n      - /test/**\r\n    client:\r\n      - client-id: sword\r\n        path-patterns:\r\n          - /sword/**\r\n      - client-id: saber\r\n        path-patterns:\r\n          - /saber/**\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - blade_notice\r\n\r\n','928001c723bc8b3af0680741e7402938','2022-05-29 16:22:21','2022-05-29 16:22:21',NULL,'10.42.3.0','','',NULL,NULL,NULL,'yaml',NULL,'');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (0,1,'blade-demo-dev.yaml','DEFAULT_GROUP','','#自定义配置\r\ndemo:\r\n  name: demo-name\r\n\r\n#放行配置\r\nblade:\r\n  secure:\r\n    skip-url:\r\n      - /demo/**\r\n  datasource:\r\n    demo:\r\n      master:\r\n        url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: Db2@4jls2\r\n      slave:\r\n        url: jdbc:mysql://stag-mysql:3306/blade_slave?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: Db2@4jls2\r\n','e9bf707b6f272f8b5d55dfb209ef999b','2022-05-29 16:22:20','2022-05-29 16:22:21',NULL,'10.42.3.0','I','',''),(0,2,'blade-dev.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    dev:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','391c7fc8b29832d234de22cf6afdefd5','2022-05-29 16:22:20','2022-05-29 16:22:21',NULL,'10.42.3.0','I','',''),(0,3,'blade-prod.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    prod:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','b3b6ddc62abd0672a9d5933c364717af','2022-05-29 16:22:20','2022-05-29 16:22:21',NULL,'10.42.3.0','I','',''),(0,4,'blade-test.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    test:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','51e6a3dfbc12d031333ff9d4d1ed72b2','2022-05-29 16:22:20','2022-05-29 16:22:21',NULL,'10.42.3.0','I','',''),(0,5,'blade.yaml','DEFAULT_GROUP','','#服务器配置\r\nserver:\r\n  undertow:\r\n    # 以下的配置会影响buffer,这些buffer会用于服务器连接的IO操作,有点类似netty的池化内存管理\r\n    buffer-size: 1024\r\n    # 是否分配的直接内存\r\n    direct-buffers: true\r\n    # 线程配置\r\n    threads:\r\n      # 设置IO线程数, 它主要执行非阻塞的任务,它们会负责多个连接, 默认设置每个CPU核心一个线程\r\n      io: 16\r\n      # 阻塞任务线程池, 当执行类似servlet请求阻塞操作, undertow会从这个线程池中取得线程,它的值设置取决于系统的负载\r\n      worker: 400\r\n\r\n#spring配置\r\nspring:\r\n  cloud:\r\n    sentinel:\r\n      eager: true\r\n  devtools:\r\n    restart:\r\n      log-condition-evaluation-delta: false\r\n    livereload:\r\n      port: 23333\r\n\r\n#feign配置\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n\r\n#对外暴露端口\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\"\r\n  endpoint:\r\n    health:\r\n      show-details: always\r\n\r\n#knife4j配置\r\nknife4j:\r\n  #启用\r\n  enable: true\r\n  #基础认证\r\n  basic:\r\n    enable: false\r\n    username: blade\r\n    password: blade\r\n  #增强配置\r\n  setting:\r\n    enableSwaggerModels: true\r\n    enableDocumentManage: true\r\n    enableHost: false\r\n    enableHostText: http://localhost\r\n    enableRequestCache: true\r\n    enableFilterMultipartApis: false\r\n    enableFilterMultipartApiMethodType: POST\r\n    language: zh-CN\r\n    enableFooter: false\r\n    enableFooterCustom: true\r\n    footerCustomContent: Copyright © 2021 SpringBlade All Rights Reserved\r\n\r\n#swagger配置信息\r\nswagger:\r\n  title: SpringBlade 接口文档系统\r\n  description: SpringBlade 接口文档系统\r\n  version: 3.3.0\r\n  license: Powered By SpringBlade\r\n  licenseUrl: https://bladex.vip\r\n  terms-of-service-url: https://bladex.vip\r\n  contact:\r\n    name: smallchill\r\n    email: smallchill@163.com\r\n    url: https://gitee.com/smallc\r\n\r\n#blade配置\r\nblade:\r\n  xss:\r\n    enabled: true\r\n    skip-url:\r\n      - /weixin\r\n  secure:\r\n    skip-url:\r\n      - /test/**\r\n    client:\r\n      - client-id: sword\r\n        path-patterns:\r\n          - /sword/**\r\n      - client-id: saber\r\n        path-patterns:\r\n          - /saber/**\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - blade_notice\r\n\r\n','928001c723bc8b3af0680741e7402938','2022-05-29 16:22:20','2022-05-29 16:22:21',NULL,'10.42.3.0','I','',''),(4,6,'blade-test.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    test:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','51e6a3dfbc12d031333ff9d4d1ed72b2','2022-05-30 07:50:16','2022-05-30 07:50:17','nacos','10.42.2.0','U','',''),(1,7,'blade-demo-dev.yaml','DEFAULT_GROUP','','#自定义配置\r\ndemo:\r\n  name: demo-name\r\n\r\n#放行配置\r\nblade:\r\n  secure:\r\n    skip-url:\r\n      - /demo/**\r\n  datasource:\r\n    demo:\r\n      master:\r\n        url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: Db2@4jls2\r\n      slave:\r\n        url: jdbc:mysql://stag-mysql:3306/blade_slave?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n        username: root\r\n        password: Db2@4jls2\r\n','e9bf707b6f272f8b5d55dfb209ef999b','2022-05-30 07:57:19','2022-05-30 07:57:19','nacos','10.42.3.0','U','',''),(2,8,'blade-dev.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    dev:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','391c7fc8b29832d234de22cf6afdefd5','2022-05-30 07:57:30','2022-05-30 07:57:31','nacos','10.42.1.1','U','',''),(3,9,'blade-prod.yaml','DEFAULT_GROUP','','#spring配置\r\nspring:\r\n  redis:\r\n    ##redis 单机环境配置\r\n    host: stag-redis\r\n    port: 6379\r\n    password:\r\n    database: 0\r\n    ssl: false\r\n    ##redis 集群环境配置\r\n    #cluster:\r\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\r\n    #  commandTimeout: 5000\r\n\r\n#项目模块集中配置\r\nblade:\r\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\r\n  datasource:\r\n    prod:\r\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\r\n      username: root\r\n      password: Db2@4jls2\r\n','b3b6ddc62abd0672a9d5933c364717af','2022-05-30 07:57:44','2022-05-30 07:57:45','nacos','10.42.3.0','U','',''),(2,10,'blade-dev.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: stag-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    dev:\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','030870ff9df2f14b51300b71ac942b2e','2022-06-02 02:22:19','2022-06-02 02:22:20','nacos','10.42.0.0','U','',''),(4,11,'blade-test.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: stag-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    test:\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','26d94fb2a05e6f95fc698bb890eb5425','2022-06-02 02:22:36','2022-06-02 02:22:36','nacos','10.42.0.0','U','',''),(3,12,'blade-prod.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: stag-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    prod:\n      url: jdbc:mysql://stag-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','f25132c23b7518c957f1e5b4e900c1d9','2022-06-02 02:22:49','2022-06-02 02:22:49','nacos','10.42.2.0','U','',''),(2,13,'blade-dev.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: develop-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    dev:\n      url: jdbc:mysql://develop-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','c5039164cae2627e59350d0a821af455','2022-06-05 07:57:19','2022-06-05 07:57:20','nacos','10.42.1.0','U','',''),(3,14,'blade-prod.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: production-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    prod:\n      url: jdbc:mysql://production-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','feac50e3470a035cabf472dedac0a1ab','2022-06-05 07:57:37','2022-06-05 07:57:38','nacos','10.42.1.0','U','',''),(2,15,'blade-dev.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: dev-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    dev:\n      url: jdbc:mysql://dev-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','eee0974dd8e1fa487cc5dc85a55dcdb6','2022-06-05 10:47:56','2022-06-05 10:47:56','nacos','10.42.1.0','U','',''),(4,16,'blade-test.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: test-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    test:\n      url: jdbc:mysql://test-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','e09ae5991634305ac673f52093f357f9','2022-06-05 10:48:12','2022-06-05 10:48:12','nacos','10.42.2.0','U','',''),(3,17,'blade-prod.yaml','DEFAULT_GROUP','','#spring配置\nspring:\n  redis:\n    ##redis 单机环境配置\n    host: prod-redis\n    port: 6379\n    password:\n    database: 0\n    ssl: false\n    ##redis 集群环境配置\n    #cluster:\n    #  nodes: 127.0.0.1:7001,127.0.0.1:7002,127.0.0.1:7003\n    #  commandTimeout: 5000\n\n#项目模块集中配置\nblade:\n  #通用开发生产环境数据库地址(特殊情况可在对应的子工程里配置覆盖)\n  datasource:\n    prod:\n      url: jdbc:mysql://prod-mysql:3306/blade?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&tinyInt1isBit=false&allowMultiQueries=true&serverTimezone=GMT%2B8\n      username: root\n      password: Db2@4jls2\n','619d22fccb515700180ff82c743f8022','2022-06-05 10:48:22','2022-06-05 10:48:23','nacos','10.42.1.0','U','','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;
