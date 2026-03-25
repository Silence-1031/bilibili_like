create database if not exists imooc_bilibili;
use imooc_bilibili;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_auth_element_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_element_operation`;
CREATE TABLE `t_auth_element_operation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `elementName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面元素名称',
  `elementCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面元素唯一编码',
  `operationType` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作类型：0可点击  1可见',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--页面元素操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_menu`;
CREATE TABLE `t_auth_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单项目名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制-页面访问表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role`;
CREATE TABLE `t_auth_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色唯一编码',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role_element_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role_element_operation`;
CREATE TABLE `t_auth_role_element_operation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `roleId` bigint(0) NULL DEFAULT NULL COMMENT '角色id',
  `elementOperationId` bigint(0) NULL DEFAULT NULL COMMENT '元素操作id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色与元素操作关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role_menu`;
CREATE TABLE `t_auth_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `roleId` bigint(0) NULL DEFAULT NULL COMMENT '角色id',
  `menuId` bigint(0) NULL DEFAULT NULL COMMENT '页面菜单id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色页面菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_collection_group
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_group`;
CREATE TABLE `t_collection_group`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组名称',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组类型：0默认分组  1用户自定义分组',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_content
-- ----------------------------
DROP TABLE IF EXISTS `t_content`;
CREATE TABLE `t_content`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `contentDetail` json NULL COMMENT '内容详情',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '动态内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_danmu
-- ----------------------------
DROP TABLE IF EXISTS `t_danmu`;
CREATE TABLE `t_danmu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `videoId` bigint(0) NULL DEFAULT NULL COMMENT '视频Id',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '弹幕内容',
  `danmuTime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '弹幕出现时间',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 369 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '弹幕记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5唯一标识串',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_following_group
-- ----------------------------
DROP TABLE IF EXISTS `t_following_group`;
CREATE TABLE `t_following_group`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组名称',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组类型：0特别关注  1悄悄关注 2默认分组  3用户自定义分组',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户关注分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `t_refresh_token`;
CREATE TABLE `t_refresh_token`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `refreshToken` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新令牌',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '刷新令牌记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐值',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_user_coin`;
CREATE TABLE `t_user_coin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `amount` bigint(0) NULL DEFAULT NULL COMMENT '硬币总数',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户硬币表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_following
-- ----------------------------
DROP TABLE IF EXISTS `t_user_following`;
CREATE TABLE `t_user_following`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `followingId` int(0) NULL DEFAULT NULL COMMENT '关注用户id',
  `groupId` int(0) NULL DEFAULT NULL COMMENT '关注分组id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sign` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '签名',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别：0男 1女 2未知',
  `birth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_moments
-- ----------------------------
DROP TABLE IF EXISTS `t_user_moments`;
CREATE TABLE `t_user_moments`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '动态类型：0视频 1直播 2专栏动态',
  `contentId` bigint(0) NULL DEFAULT NULL COMMENT '内容详情id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户动态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` bigint(0) NULL DEFAULT NULL COMMENT '角色id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NOT NULL COMMENT '用户id',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频链接',
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '封面链接',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频标题',
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频类型：0原创 1转载',
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频时长',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在分区：0鬼畜 1音乐 2电影',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '视频简介',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频投稿记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_binary_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_video_binary_picture`;
CREATE TABLE `t_video_binary_picture`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint(0) NULL DEFAULT NULL COMMENT '视频id',
  `frameNo` int(0) NULL DEFAULT NULL COMMENT '帧数',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `videoTimestamp` bigint(0) NULL DEFAULT NULL COMMENT '视频时间戳',
  `createTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '视频二值图记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_video_coin`;
CREATE TABLE `t_video_coin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '视频投稿id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `videoId` bigint(0) NULL DEFAULT NULL COMMENT '视频投稿id',
  `amount` int(0) NULL DEFAULT NULL COMMENT '投币数',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频硬币表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_video_collection`;
CREATE TABLE `t_video_collection`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint(0) NULL DEFAULT NULL COMMENT '视频投稿id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `groupId` bigint(0) NULL DEFAULT NULL COMMENT '收藏分组id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频收藏记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_video_comment`;
CREATE TABLE `t_video_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint(0) NOT NULL COMMENT '视频id',
  `userId` bigint(0) NOT NULL COMMENT '用户id',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论',
  `replyUserId` bigint(0) NULL DEFAULT NULL COMMENT '回复用户id',
  `rootId` bigint(0) NULL DEFAULT NULL COMMENT '根节点评论id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_like
-- ----------------------------
DROP TABLE IF EXISTS `t_video_like`;
CREATE TABLE `t_video_like`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NOT NULL COMMENT '用户id',
  `videoId` bigint(0) NOT NULL COMMENT '视频投稿id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频点赞记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_video_operation`;
CREATE TABLE `t_video_operation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `videoId` bigint(0) NULL DEFAULT NULL COMMENT '视频id',
  `operationType` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作类型：0点赞、1收藏、2投币',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '视频操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_video_tag`;
CREATE TABLE `t_video_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint(0) NOT NULL COMMENT '视频id',
  `tagId` bigint(0) NOT NULL COMMENT '标签id',
  `createTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_view
-- ----------------------------
DROP TABLE IF EXISTS `t_video_view`;
CREATE TABLE `t_video_view`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `videoId` bigint(0) NOT NULL COMMENT '视频id',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `clientId` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户端id',
  `ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '视频观看记录表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO `t_auth_element_operation` (`id`, `elementName`, `elementCode`, `operationType`, `createTime`, `updateTime`) VALUES (1, '视频投稿按钮', 'postVideoButton', '0', '2023-01-24 09:37:06', '2023-01-24 09:37:06');

INSERT INTO `t_auth_menu` (`id`, `name`, `code`, `createTime`, `updateTime`) VALUES (1, '购买邀请码', 'buyInviteCode', '2023-01-24 13:02:03', '2023-01-24 13:02:03');

INSERT INTO `t_auth_role` (`id`, `name`, `createTime`, `updateTime`, `code`) VALUES (1, '等级0', '2023-01-24 09:34:56', '2023-01-24 09:34:56', 'Lv0');
INSERT INTO `t_auth_role` (`id`, `name`, `createTime`, `updateTime`, `code`) VALUES (2, '等级1', '2023-01-24 09:35:08', '2023-01-24 09:35:08', 'Lv1');
INSERT INTO `t_auth_role` (`id`, `name`, `createTime`, `updateTime`, `code`) VALUES (3, '等级2', '2023-01-24 09:35:19', '2023-01-24 09:35:19', 'Lv2');

INSERT INTO `t_auth_role_element_operation` (`id`, `roleId`, `elementOperationId`, `createTime`) VALUES (1, 2, 1, '2023-01-24 09:38:22');

INSERT INTO `t_auth_role_menu` (`id`, `roleId`, `menuId`, `createTime`) VALUES (1, 2, 1, '2023-01-24 13:03:54');

INSERT INTO `t_following_group` (`id`, `userId`, `name`, `updateTime`, `createTime`, `type`) VALUES (1, NULL, '特别关注', '2023-01-23 05:07:55', '2023-01-23 05:07:55', '0');
INSERT INTO `t_following_group` (`id`, `userId`, `name`, `updateTime`, `createTime`, `type`) VALUES (2, NULL, '悄悄关注', '2023-01-23 05:08:11', '2023-01-23 05:08:11', '1');
INSERT INTO `t_following_group` (`id`, `userId`, `name`, `updateTime`, `createTime`, `type`) VALUES (3, NULL, '默认关注', '2023-01-23 05:08:57', '2023-01-23 05:08:57', '2');

INSERT INTO `t_refresh_token` (`id`, `userId`, `refreshToken`, `createTime`) VALUES (2, 2, 'eyJraWQiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiLnrb7lj5HogIUiLCJleHAiOjE2NzU0ODEyMTd9.A4Oi8_f-pOTZ6C1hJx6Md80GN6hAsEDGVzQoFKnWDz8LZNUOu_8r0mXt1bIotfjz9duMrTJGxBussp6ey1vBPPzFiK4JGL9bAIUDIH67eeBxS9s6xwU6pFNrHFGj3ks1HCGiFC44koDL0ddZL_YbFcQ1-sbjn_-fL_eNelCMeSo', '2023-01-28 03:26:57');

INSERT INTO `t_user_following` (`id`, `userId`, `followingId`, `groupId`, `createTime`) VALUES (2, 1, 2, 3, '2023-01-24 06:13:14');


INSERT INTO `t_user_moments` (`id`, `userId`, `type`, `contentId`, `createTime`, `updateTime`) VALUES (11, 2, '0', 2, '2023-01-24 13:58:05', '2023-01-24 13:58:05');
INSERT INTO `t_user_moments` (`id`, `userId`, `type`, `contentId`, `createTime`, `updateTime`) VALUES (12, 2, '0', 2, '2023-01-24 13:58:47', '2023-01-24 13:58:47');

INSERT INTO `t_user_role` (`id`, `userId`, `roleId`, `createTime`) VALUES (1, 1, 1, '2023-01-24 09:39:07');
INSERT INTO `t_user_role` (`id`, `userId`, `roleId`, `createTime`) VALUES (2, 2, 2, '2023-01-24 13:41:45');



INSERT INTO `t_user` (`id`, `phone`, `email`, `password`, `salt`, `createTime`, `updateTime`) VALUES
    (1, '13887654321', NULL, 'e1671797c52e15f763380b45e841ec32', '123456', '2023-01-23 03:41:54', '2023-01-23 04:16:07'),
    (2, '13987654321', NULL, '827ccb0eea8a706c4c34a16891f84e7b', '123456', '2023-01-24 06:12:39', '2023-01-24 06:12:39');
-- 插入更多用户
INSERT INTO `t_user` (`id`, `phone`, `email`, `password`, `salt`, `createTime`, `updateTime`) VALUES (3, '13612345678', 'admin@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-01 10:00:00', '2023-01-01 10:00:00'),
                                                                                                     (4, '13712345678', 'tech@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-02 11:00:00', '2023-01-02 11:00:00'),
                                                                                                     (5, '13812345678', 'game@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-03 12:00:00', '2023-01-03 12:00:00'),
                                                                                                     (6, '13912345678', 'music@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-04 13:00:00', '2023-01-04 13:00:00'),
                                                                                                     (7, '15012345678', 'movie@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-05 14:00:00', '2023-01-05 14:00:00'),
                                                                                                     (8, '15112345678', 'life@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-06 15:00:00', '2023-01-06 15:00:00'),
                                                                                                     (9, '15212345678', 'food@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-07 16:00:00', '2023-01-07 16:00:00'),
                                                                                                     (10, '15312345678', 'travel@bilibili.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '2023-01-08 17:00:00', '2023-01-08 17:00:00');


-- 插入用户信息
INSERT INTO `t_user_info` (`id`, `userId`, `nick`, `avatar`, `sign`, `gender`, `birth`, `createTime`, `updateTime`) VALUES (1, 1, '零零落落test', NULL, NULL, '1', '2000-01-01', '2023-01-23 03:41:54', '2023-01-23 04:19:05');
INSERT INTO `t_user_info` (`id`, `userId`, `nick`, `avatar`, `sign`, `gender`, `birth`, `createTime`, `updateTime`) VALUES (2, 2, '萌新', NULL, NULL, '2', '2000-01-01', '2023-01-24 06:12:39', '2023-01-24 06:12:39');
INSERT INTO `t_user_info` (`id`, `userId`, `nick`, `avatar`, `sign`, `gender`, `birth`, `createTime`, `updateTime`) VALUES
                                                                                                                        (3, 3, '测评博主', '/avatars/.jpg', '立志测评所有店铺', '0', '1990-01-01', '2023-01-01 10:00:00', '2023-01-01 10:00:00'),
                                                                                                                        (4, 4, '技术小哥', '/avatars/tech.jpg', '热爱编程和技术分享', '0', '1995-05-15', '2023-01-02 11:00:00', '2023-01-02 11:00:00'),
                                                                                                                        (5, 5, '游戏达人', '/avatars/game.jpg', '专业游戏代练，带你上分', '0', '1993-08-20', '2023-01-03 12:00:00', '2023-01-03 12:00:00'),
                                                                                                                        (6, 6, '音乐才女', '/avatars/music.jpg', '原创音乐人，分享好音乐', '1', '1992-12-10', '2023-01-04 13:00:00', '2023-01-04 13:00:00'),
                                                                                                                        (7, 7, '影视解说', '/avatars/movie.jpg', '专业影视解说，带你深度观影', '0', '1988-03-25', '2023-01-05 14:00:00', '2023-01-05 14:00:00'),
                                                                                                                        (8, 8, '生活博主', '/avatars/life.jpg', '记录美好生活，分享日常点滴', '1', '1994-07-12', '2023-01-06 15:00:00', '2023-01-06 15:00:00'),
                                                                                                                        (9, 9, '美食探店', '/avatars/food.jpg', '吃货一枚，带你寻觅美味', '1', '1991-11-08', '2023-01-07 16:00:00', '2023-01-07 16:00:00'),
                                                                                                                        (10, 10, '旅行摄影师', '/avatars/travel.jpg', '用镜头记录世界美好瞬间', '0', '1989-09-30', '2023-01-08 17:00:00', '2023-01-08 17:00:00');

-- 2. 标签数据 (t_tag)
-- ============================

INSERT INTO `t_tag` (`id`, `name`, `createTime`) VALUES
                                                     (1, '科技', '2023-01-01 00:00:00'),
                                                     (2, '游戏', '2023-01-01 00:00:00'),
                                                     (3, '音乐', '2023-01-01 00:00:00'),
                                                     (4, '影视', '2023-01-01 00:00:00'),
                                                     (5, '生活', '2023-01-01 00:00:00'),
                                                     (6, '美食', '2023-01-01 00:00:00'),
                                                     (7, '旅行', '2023-01-01 00:00:00'),
                                                     (8, '教程', '2023-01-01 00:00:00'),
                                                     (9, '娱乐', '2023-01-01 00:00:00'),
                                                     (10, '原创', '2023-01-01 00:00:00');

-- 以下未执行
-- ============================
-- 3. 文件数据 (t_file)
-- ============================

INSERT INTO `t_file` (`id`, `url`, `type`, `md5`, `createTime`) VALUES
                                                                    (1, '/videos/tech_tutorial.mp4', 'mp4', 'abc123def456', '2023-01-10 10:00:00'),
                                                                    (2, '/videos/game_highlights.mp4', 'mp4', 'def456ghi789', '2023-01-11 11:00:00'),
                                                                    (3, '/videos/music_cover.mp4', 'mp4', 'ghi789jkl012', '2023-01-12 12:00:00'),
                                                                    (4, '/videos/movie_review.mp4', 'mp4', 'jkl012mno345', '2023-01-13 13:00:00'),
                                                                    (5, '/videos/daily_life.mp4', 'mp4', 'mno345pqr678', '2023-01-14 14:00:00'),
                                                                    (6, '/videos/food_review.mp4', 'mp4', 'pqr678stu901', '2023-01-15 15:00:00'),
                                                                    (7, '/videos/travel_vlog.mp4', 'mp4', 'stu901vwx234', '2023-01-16 16:00:00'),
                                                                    (8, '/thumbnails/tech_thumb.jpg', 'jpg', 'thumb_abc123', '2023-01-10 10:00:00'),
                                                                    (9, '/thumbnails/game_thumb.jpg', 'jpg', 'thumb_def456', '2023-01-11 11:00:00'),
                                                                    (10, '/thumbnails/music_thumb.jpg', 'jpg', 'thumb_ghi789', '2023-01-12 12:00:00'),
                                                                    (11, '/thumbnails/movie_thumb.jpg', 'jpg', 'thumb_jkl012', '2023-01-13 13:00:00'),
                                                                    (12, '/thumbnails/life_thumb.jpg', 'jpg', 'thumb_mno345', '2023-01-14 14:00:00'),
                                                                    (13, '/thumbnails/food_thumb.jpg', 'jpg', 'thumb_pqr678', '2023-01-15 15:00:00'),
                                                                    (14, '/thumbnails/travel_thumb.jpg', 'jpg', 'thumb_stu901', '2023-01-16 16:00:00');

-- ============================
-- 4. 视频数据 (t_video)
-- ============================

INSERT INTO `t_video` (`id`, `userId`, `url`, `thumbnail`, `title`, `type`, `duration`, `area`, `description`, `createTime`, `updateTime`) VALUES
                                                                                                                                               (1, 4, '/videos/tech_tutorial.mp4', '/thumbnails/tech_thumb.jpg', 'Java SpringBoot入门教程', '0', '15:30', '1', '详细讲解SpringBoot框架的基础知识和实战应用', '2023-01-10 10:30:00', '2023-01-10 10:30:00'),
                                                                                                                                               (2, 5, '/videos/game_highlights.mp4', '/thumbnails/game_thumb.jpg', '王者荣耀精彩操作集锦', '0', '08:45', '0', '各路大神的神仙操作，让你大开眼界', '2023-01-11 11:30:00', '2023-01-11 11:30:00'),
                                                                                                                                               (3, 6, '/videos/music_cover.mp4', '/thumbnails/music_thumb.jpg', '周杰伦青花瓷翻唱', '1', '04:20', '1', '用心翻唱经典歌曲，希望大家喜欢', '2023-01-12 12:30:00', '2023-01-12 12:30:00'),
                                                                                                                                               (4, 7, '/videos/movie_review.mp4', '/thumbnails/movie_thumb.jpg', '阿凡达2深度解析', '0', '22:15', '2', '从剧情、特效、哲学内涵全方位解读这部科幻巨作', '2023-01-13 13:30:00', '2023-01-13 13:30:00'),
                                                                                                                                               (5, 8, '/videos/daily_life.mp4', '/thumbnails/life_thumb.jpg', '我的一天Vlog', '0', '12:10', '1', '记录平凡但充实的一天，分享生活小确幸', '2023-01-14 14:30:00', '2023-01-14 14:30:00'),
                                                                                                                                               (6, 9, '/videos/food_review.mp4', '/thumbnails/food_thumb.jpg', '网红餐厅真实测评', '0', '18:35', '1', '实地探店，真实评价，帮你避坑选到好餐厅', '2023-01-15 15:30:00', '2023-01-15 15:30:00'),
                                                                                                                                               (7, 10, '/videos/travel_vlog.mp4', '/thumbnails/travel_thumb.jpg', '云南大理三日游', '0', '25:40', '1', '洱海边的浪漫时光，苍山下的诗意栖居', '2023-01-16 16:30:00', '2023-01-16 16:30:00');

-- ============================
-- 5. 视频标签关联 (t_video_tag)
-- ============================

INSERT INTO `t_video_tag` (`id`, `videoId`, `tagId`, `createTime`) VALUES
                                                                       (1, 1, 1, '2023-01-10 10:30:00'),
                                                                       (2, 1, 8, '2023-01-10 10:30:00'),
                                                                       (3, 2, 2, '2023-01-11 11:30:00'),
                                                                       (4, 2, 9, '2023-01-11 11:30:00'),
                                                                       (5, 3, 3, '2023-01-12 12:30:00'),
                                                                       (6, 3, 10, '2023-01-12 12:30:00'),
                                                                       (7, 4, 4, '2023-01-13 13:30:00'),
                                                                       (8, 4, 8, '2023-01-13 13:30:00'),
                                                                       (9, 5, 5, '2023-01-14 14:30:00'),
                                                                       (10, 5, 10, '2023-01-14 14:30:00'),
                                                                       (11, 6, 5, '2023-01-15 15:30:00'),
                                                                       (12, 6, 6, '2023-01-15 15:30:00'),
                                                                       (13, 7, 5, '2023-01-16 16:30:00'),
                                                                       (14, 7, 7, '2023-01-16 16:30:00');

-- ============================
-- 6. 动态内容数据 (t_content)
-- ============================

INSERT INTO `t_content` (`id`, `contentDetail`, `createTime`) VALUES
                                                                  (1, '{"id": 1, "title": "Java SpringBoot入门教程", "type": "0"}', '2023-01-10 10:35:00'),
                                                                  (2, '{"id": 2, "title": "王者荣耀精彩操作集锦", "type": "0"}', '2023-01-11 11:35:00'),
                                                                  (3, '{"id": 3, "title": "周杰伦青花瓷翻唱", "type": "0"}', '2023-01-12 12:35:00'),
                                                                  (4, '{"id": 4, "title": "阿凡达2深度解析", "type": "0"}', '2023-01-13 13:35:00'),
                                                                  (5, '{"id": 5, "title": "我的一天Vlog", "type": "0"}', '2023-01-14 14:35:00'),
                                                                  (6, '{"id": 6, "title": "网红餐厅真实测评", "type": "0"}', '2023-01-15 15:35:00'),
                                                                  (7, '{"id": 7, "title": "云南大理三日游", "type": "0"}', '2023-01-16 16:35:00');

-- ============================
-- 7. 用户动态数据 (t_user_moments)
-- ============================

INSERT INTO `t_user_moments` (`id`, `userId`, `type`, `contentId`, `createTime`, `updateTime`) VALUES
                                                                                                   (1, 4, '0', 1, '2023-01-10 10:40:00', '2023-01-10 10:40:00'),
                                                                                                   (2, 5, '0', 2, '2023-01-11 11:40:00', '2023-01-11 11:40:00'),
                                                                                                   (3, 6, '0', 3, '2023-01-12 12:40:00', '2023-01-12 12:40:00'),
                                                                                                   (4, 7, '0', 4, '2023-01-13 13:40:00', '2023-01-13 13:40:00'),
                                                                                                   (5, 8, '0', 5, '2023-01-14 14:40:00', '2023-01-14 14:40:00'),
                                                                                                   (6, 9, '0', 6, '2023-01-15 15:40:00', '2023-01-15 15:40:00'),
                                                                                                   (7, 10, '0', 7, '2023-01-16 16:40:00', '2023-01-16 16:40:00');

-- ============================
-- 8. 用户关注数据 (t_user_following)
-- ============================

INSERT INTO `t_user_following` (`id`, `userId`, `followingId`, `groupId`, `createTime`) VALUES
                                                                                            (1, 1, 4, 3, '2023-01-10 11:00:00'),
                                                                                            (2, 1, 6, 3, '2023-01-10 11:05:00'),
                                                                                            (3, 1, 8, 3, '2023-01-10 11:10:00'),
                                                                                            (4, 2, 5, 3, '2023-01-11 12:00:00'),
                                                                                            (5, 2, 7, 3, '2023-01-11 12:05:00'),
                                                                                            (6, 3, 4, 1, '2023-01-12 13:00:00'),
                                                                                            (7, 3, 10, 1, '2023-01-12 13:05:00'),
                                                                                            (8, 4, 6, 3, '2023-01-13 14:00:00'),
                                                                                            (9, 5, 9, 3, '2023-01-14 15:00:00'),
                                                                                            (10, 6, 10, 3, '2023-01-15 16:00:00');

-- ============================
-- 9. 视频点赞数据 (t_video_like)
-- ============================

INSERT INTO `t_video_like` (`id`, `userId`, `videoId`, `createTime`) VALUES
                                                                         (1, 1, 1, '2023-01-10 12:00:00'),
                                                                         (2, 1, 3, '2023-01-10 12:05:00'),
                                                                         (3, 1, 5, '2023-01-10 12:10:00'),
                                                                         (4, 2, 2, '2023-01-11 13:00:00'),
                                                                         (5, 2, 4, '2023-01-11 13:05:00'),
                                                                         (6, 3, 1, '2023-01-12 14:00:00'),
                                                                         (7, 3, 7, '2023-01-12 14:05:00'),
                                                                         (8, 4, 3, '2023-01-13 15:00:00'),
                                                                         (9, 5, 6, '2023-01-14 16:00:00'),
                                                                         (10, 6, 7, '2023-01-15 17:00:00'),
                                                                         (11, 7, 1, '2023-01-16 18:00:00'),
                                                                         (12, 8, 2, '2023-01-17 19:00:00'),
                                                                         (13, 9, 4, '2023-01-18 20:00:00'),
                                                                         (14, 10, 5, '2023-01-19 21:00:00');

-- ============================
-- 10. 视频收藏数据 (t_video_collection)
-- ============================

INSERT INTO `t_video_collection` (`id`, `videoId`, `userId`, `groupId`, `createTime`) VALUES
                                                                                          (1, 1, 2, 1, '2023-01-11 14:00:00'),
                                                                                          (2, 3, 1, 1, '2023-01-12 15:00:00'),
                                                                                          (3, 5, 3, 1, '2023-01-13 16:00:00'),
                                                                                          (4, 2, 4, 1, '2023-01-14 17:00:00'),
                                                                                          (5, 7, 5, 1, '2023-01-15 18:00:00'),
                                                                                          (6, 4, 6, 1, '2023-01-16 19:00:00'),
                                                                                          (7, 6, 7, 1, '2023-01-17 20:00:00'),
                                                                                          (8, 1, 8, 1, '2023-01-18 21:00:00'),
                                                                                          (9, 3, 9, 1, '2023-01-19 22:00:00'),
                                                                                          (10, 5, 10, 1, '2023-01-20 23:00:00');

-- ============================
-- 11. 视频投币数据 (t_video_coin)
-- ============================

INSERT INTO `t_video_coin` (`id`, `userId`, `videoId`, `amount`, `createTime`, `updateTime`) VALUES
                                                                                                 (1, 1, 2, 2, '2023-01-12 10:00:00', '2023-01-12 10:00:00'),
                                                                                                 (2, 2, 1, 1, '2023-01-13 11:00:00', '2023-01-13 11:00:00'),
                                                                                                 (3, 3, 4, 3, '2023-01-14 12:00:00', '2023-01-14 12:00:00'),
                                                                                                 (4, 4, 6, 1, '2023-01-15 13:00:00', '2023-01-15 13:00:00'),
                                                                                                 (5, 5, 3, 2, '2023-01-16 14:00:00', '2023-01-16 14:00:00'),
                                                                                                 (6, 6, 7, 1, '2023-01-17 15:00:00', '2023-01-17 15:00:00'),
                                                                                                 (7, 7, 5, 2, '2023-01-18 16:00:00', '2023-01-18 16:00:00'),
                                                                                                 (8, 8, 1, 1, '2023-01-19 17:00:00', '2023-01-19 17:00:00'),
                                                                                                 (9, 9, 2, 3, '2023-01-20 18:00:00', '2023-01-20 18:00:00'),
                                                                                                 (10, 10, 4, 2, '2023-01-21 19:00:00', '2023-01-21 19:00:00');

-- ============================
-- 12. 用户硬币数据 (t_user_coin)
-- ============================

INSERT INTO `t_user_coin` (`id`, `userId`, `amount`, `createTime`, `updateTime`) VALUES
                                                                                     (1, 1, 100, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (2, 2, 85, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (3, 3, 120, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (4, 4, 95, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (5, 5, 78, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (6, 6, 110, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (7, 7, 92, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (8, 8, 88, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (9, 9, 105, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
                                                                                     (10, 10, 97, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

-- ============================
-- 13. 视频评论数据 (t_video_comment)
-- ============================

INSERT INTO `t_video_comment` (`id`, `videoId`, `userId`, `comment`, `replyUserId`, `rootId`, `createTime`, `updateTime`) VALUES
                                                                                                                              (1, 1, 2, '讲得很清楚，学到了！', NULL, NULL, '2023-01-10 15:00:00', '2023-01-10 15:00:00'),
                                                                                                                              (2, 1, 5, '感谢分享，收藏了', NULL, NULL, '2023-01-10 15:30:00', '2023-01-10 15:30:00'),
                                                                                                                              (3, 1, 4, '回复@学习者: 不客气，一起进步！', 2, 1, '2023-01-10 16:00:00', '2023-01-10 16:00:00'),
                                                                                                                              (4, 2, 1, '操作太秀了，6666', NULL, NULL, '2023-01-11 16:00:00', '2023-01-11 16:00:00'),
                                                                                                                              (5, 2, 3, '这波操作我给满分', NULL, NULL, '2023-01-11 16:30:00', '2023-01-11 16:30:00'),
                                                                                                                              (6, 3, 7, '唱得真好听，支持原创！', NULL, NULL, '2023-01-12 17:00:00', '2023-01-12 17:00:00'),
                                                                                                                              (7, 3, 9, '声音很有磁性，爱了爱了', NULL, NULL, '2023-01-12 17:30:00', '2023-01-12 17:30:00'),
                                                                                                                              (8, 4, 1, '分析得很透彻，涨知识了', NULL, NULL, '2023-01-13 18:00:00', '2023-01-13 18:00:00'),
                                                                                                                              (9, 4, 8, '不同的视角，全新的理解', NULL, NULL, '2023-01-13 18:30:00', '2023-01-13 18:30:00'),
                                                                                                                              (10, 5, 2, '生活真美好，羡慕', NULL, NULL, '2023-01-14 19:00:00', '2023-01-14 19:00:00'),
                                                                                                                              (11, 5, 6, '日常的小确幸最珍贵', NULL, NULL, '2023-01-14 19:30:00', '2023-01-14 19:30:00'),
                                                                                                                              (12, 6, 4, '看起来很好吃的样子', NULL, NULL, '2023-01-15 20:00:00', '2023-01-15 20:00:00'),
                                                                                                                              (13, 6, 10, '下次去试试这家店', NULL, NULL, '2023-01-15 20:30:00', '2023-01-15 20:30:00'),
                                                                                                                              (14, 7, 1, '风景太美了，想去看看', NULL, NULL, '2023-01-16 21:00:00', '2023-01-16 21:00:00'),
                                                                                                                              (15, 7, 3, '拍得很有感觉，技术不错', NULL, NULL, '2023-01-16 21:30:00', '2023-01-16 21:30:00');

-- ============================
-- 14. 弹幕数据 (t_danmu)
-- ============================

INSERT INTO `t_danmu` (`id`, `userId`, `videoId`, `content`, `danmuTime`, `createTime`) VALUES
                                                                                            (1, 1, 1, '666666', '00:00:15', '2023-01-10 18:00:00'),
                                                                                            (2, 2, 1, '讲得太好了', '00:02:30', '2023-01-10 18:05:00'),
                                                                                            (3, 3, 1, '收藏收藏', '00:05:45', '2023-01-10 18:10:00'),
                                                                                            (4, 4, 2, '这操作绝了', '00:01:20', '2023-01-11 19:00:00'),
                                                                                            (5, 5, 2, '大神带带我', '00:03:40', '2023-01-11 19:05:00'),
                                                                                            (6, 6, 3, '好听好听', '00:00:30', '2023-01-12 20:00:00'),
                                                                                            (7, 7, 3, '原唱更好听', '00:02:15', '2023-01-12 20:05:00'),
                                                                                            (8, 8, 4, '深度好文', '00:05:20', '2023-01-13 21:00:00'),
                                                                                            (9, 9, 4, '学到了很多', '00:10:35', '2023-01-13 21:05:00'),
                                                                                            (10, 10, 5, '生活真美好', '00:03:10', '2023-01-14 22:00:00'),
                                                                                            (11, 1, 6, '看着就流口水', '00:02:45', '2023-01-15 23:00:00'),
                                                                                            (12, 2, 6, '价格怎么样', '00:06:20', '2023-01-15 23:05:00'),
                                                                                            (13, 3, 7, '想去大理了', '00:08:15', '2023-01-16 23:00:00'),
                                                                                            (14, 4, 7, '拍得真美', '00:12:30', '2023-01-16 23:05:00'),
                                                                                            (15, 5, 1, '老师讲得清楚', '00:08:45', '2023-01-17 10:00:00');

-- ============================
-- 15. 视频观看记录 (t_video_view)
-- ============================

INSERT INTO `t_video_view` (`id`, `videoId`, `userId`, `clientId`, `ip`, `createTime`) VALUES
                                                                                           (1, 1, 2, 'client_001', '192.168.1.101', '2023-01-10 20:00:00'),
                                                                                           (2, 1, 3, 'client_002', '192.168.1.102', '2023-01-10 20:30:00'),
                                                                                           (3, 1, NULL, 'client_003', '192.168.1.103', '2023-01-10 21:00:00'),
                                                                                           (4, 2, 1, 'client_004', '192.168.1.104', '2023-01-11 20:00:00'),
                                                                                           (5, 2, 4, 'client_005', '192.168.1.105', '2023-01-11 20:30:00'),
                                                                                           (6, 3, 7, 'client_006', '192.168.1.106', '2023-01-12 20:00:00'),
                                                                                           (7, 3, NULL, 'client_007', '192.168.1.107', '2023-01-12 20:30:00'),
                                                                                           (8, 4, 1, 'client_008', '192.168.1.108', '2023-01-13 20:00:00'),
                                                                                           (9, 4, 8, 'client_009', '192.168.1.109', '2023-01-13 20:30:00'),
                                                                                           (10, 5, 2, 'client_010', '192.168.1.110', '2023-01-14 20:00:00'),
                                                                                           (11, 6, 4, 'client_011', '192.168.1.111', '2023-01-15 20:00:00'),
                                                                                           (12, 6, 9, 'client_012', '192.168.1.112', '2023-01-15 20:30:00'),
                                                                                           (13, 7, 1, 'client_013', '192.168.1.113', '2023-01-16 20:00:00'),
                                                                                           (14, 7, 3, 'client_014', '192.168.1.114', '2023-01-16 20:30:00'),
                                                                                           (15, 7, NULL, 'client_015', '192.168.1.115', '2023-01-16 21:00:00');

-- ============================
-- 16. 收藏分组数据 (t_collection_group)
-- ============================

INSERT INTO `t_collection_group` (`id`, `userId`, `name`, `type`, `createTime`, `updateTime`) VALUES
                                                                                                  (1, 1, '学习收藏', '1', '2023-01-10 09:00:00', '2023-01-10 09:00:00'),
                                                                                                  (2, 1, '娱乐收藏', '1', '2023-01-10 09:00:00', '2023-01-10 09:00:00'),
                                                                                                  (3, 2, '技术学习', '1', '2023-01-11 09:00:00', '2023-01-11 09:00:00'),
                                                                                                  (4, 2, '游戏精彩', '1', '2023-01-11 09:00:00', '2023-01-11 09:00:00'),
                                                                                                  (5, 3, '默认收藏夹', '0', '2023-01-12 09:00:00', '2023-01-12 09:00:00'),
                                                                                                  (6, 4, '音乐欣赏', '1', '2023-01-13 09:00:00', '2023-01-13 09:00:00'),
                                                                                                  (7, 5, '影视收藏', '1', '2023-01-14 09:00:00', '2023-01-14 09:00:00'),
                                                                                                  (8, 6, '生活记录', '1', '2023-01-15 09:00:00', '2023-01-15 09:00:00'),
                                                                                                  (9, 7, '美食探店', '1', '2023-01-16 09:00:00', '2023-01-16 09:00:00'),
                                                                                                  (10, 8, '旅行足迹', '1', '2023-01-17 09:00:00', '2023-01-17 09:00:00');

-- ============================
-- 17. 刷新令牌数据 (补充现有数据)
-- ============================

INSERT INTO `t_refresh_token` (`id`, `userId`, `refreshToken`, `createTime`) VALUES
                                                                                 (1, 1, 'refresh_token_user1_2023', '2023-01-01 00:00:00'),
                                                                                 (3, 3, 'refresh_token_user3_2023', '2023-01-01 00:00:00'),
                                                                                 (4, 4, 'refresh_token_user4_2023', '2023-01-01 00:00:00'),
                                                                                 (5, 5, 'refresh_token_user5_2023', '2023-01-01 00:00:00'),
                                                                                 (6, 6, 'refresh_token_user6_2023', '2023-01-01 00:00:00'),
                                                                                 (7, 7, 'refresh_token_user7_2023', '2023-01-01 00:00:00'),
                                                                                 (8, 8, 'refresh_token_user8_2023', '2023-01-01 00:00:00'),
                                                                                 (9, 9, 'refresh_token_user9_2023', '2023-01-01 00:00:00'),
                                                                                 (10, 10, 'refresh_token_user10_2023', '2023-01-01 00:00:00');
