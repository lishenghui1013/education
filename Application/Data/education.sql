/*
Navicat MySQL Data Transfer

Source Server         : mysql_connection
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : education

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-24 08:09:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_address
-- ----------------------------
DROP TABLE IF EXISTS `api_address`;
CREATE TABLE `api_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收货地址表自增id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `phone` varchar(11) NOT NULL COMMENT '收货人电话',
  `user_type` varchar(30) NOT NULL COMMENT '类型(COM:机构;TEA:老师;STU:学生)',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `province_id` int(10) NOT NULL COMMENT '省份id',
  `city_id` int(10) NOT NULL COMMENT '市区id',
  `county_id` int(10) NOT NULL COMMENT '县区id',
  `default_status` varchar(2) NOT NULL DEFAULT 'N' COMMENT '是否默认地址(Y:是;N:不是)',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_address
-- ----------------------------

-- ----------------------------
-- Table structure for api_app
-- ----------------------------
DROP TABLE IF EXISTS `api_app`;
CREATE TABLE `api_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '应用id',
  `app_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '应用密码',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '应用状态：0表示禁用，1表示启用',
  `app_info` tinytext NOT NULL COMMENT '应用说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='appId和appSecret表';

-- ----------------------------
-- Records of api_app
-- ----------------------------

-- ----------------------------
-- Table structure for api_appversions
-- ----------------------------
DROP TABLE IF EXISTS `api_appversions`;
CREATE TABLE `api_appversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'APP版本表自增id',
  `app_versions` varchar(10) NOT NULL COMMENT '版本号',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `app_url` varchar(255) NOT NULL COMMENT 'APP下载地址',
  `app_type` varchar(20) NOT NULL COMMENT 'APP类型:(ISO:苹果;ANDR:安卓)',
  `add_user_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_appversions
-- ----------------------------

-- ----------------------------
-- Table structure for api_areas
-- ----------------------------
DROP TABLE IF EXISTS `api_areas`;
CREATE TABLE `api_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cityid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of api_areas
-- ----------------------------
INSERT INTO `api_areas` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `api_areas` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `api_areas` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `api_areas` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `api_areas` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `api_areas` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `api_areas` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `api_areas` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `api_areas` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `api_areas` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `api_areas` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `api_areas` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `api_areas` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `api_areas` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `api_areas` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `api_areas` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `api_areas` VALUES ('17', '110228', '密云县', '110200');
INSERT INTO `api_areas` VALUES ('18', '110229', '延庆县', '110200');
INSERT INTO `api_areas` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `api_areas` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `api_areas` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `api_areas` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `api_areas` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `api_areas` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `api_areas` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `api_areas` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `api_areas` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `api_areas` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `api_areas` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `api_areas` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `api_areas` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `api_areas` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `api_areas` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `api_areas` VALUES ('34', '120221', '宁河县', '120200');
INSERT INTO `api_areas` VALUES ('35', '120223', '静海县', '120200');
INSERT INTO `api_areas` VALUES ('36', '120225', '蓟　县', '120200');
INSERT INTO `api_areas` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `api_areas` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `api_areas` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `api_areas` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `api_areas` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `api_areas` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `api_areas` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `api_areas` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `api_areas` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `api_areas` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `api_areas` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `api_areas` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `api_areas` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `api_areas` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `api_areas` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `api_areas` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `api_areas` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `api_areas` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `api_areas` VALUES ('55', '130133', '赵　县', '130100');
INSERT INTO `api_areas` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `api_areas` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `api_areas` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `api_areas` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `api_areas` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `api_areas` VALUES ('61', '130201', '市辖区', '130200');
INSERT INTO `api_areas` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `api_areas` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `api_areas` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `api_areas` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `api_areas` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `api_areas` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `api_areas` VALUES ('68', '130223', '滦　县', '130200');
INSERT INTO `api_areas` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `api_areas` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `api_areas` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `api_areas` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `api_areas` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `api_areas` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `api_areas` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `api_areas` VALUES ('76', '130301', '市辖区', '130300');
INSERT INTO `api_areas` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `api_areas` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `api_areas` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `api_areas` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `api_areas` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `api_areas` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `api_areas` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `api_areas` VALUES ('84', '130401', '市辖区', '130400');
INSERT INTO `api_areas` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `api_areas` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `api_areas` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `api_areas` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `api_areas` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `api_areas` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `api_areas` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `api_areas` VALUES ('93', '130426', '涉　县', '130400');
INSERT INTO `api_areas` VALUES ('94', '130427', '磁　县', '130400');
INSERT INTO `api_areas` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `api_areas` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `api_areas` VALUES ('97', '130430', '邱　县', '130400');
INSERT INTO `api_areas` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `api_areas` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `api_areas` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `api_areas` VALUES ('101', '130434', '魏　县', '130400');
INSERT INTO `api_areas` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `api_areas` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `api_areas` VALUES ('104', '130501', '市辖区', '130500');
INSERT INTO `api_areas` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `api_areas` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `api_areas` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `api_areas` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `api_areas` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `api_areas` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `api_areas` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `api_areas` VALUES ('112', '130526', '任　县', '130500');
INSERT INTO `api_areas` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `api_areas` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `api_areas` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `api_areas` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `api_areas` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `api_areas` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `api_areas` VALUES ('119', '130533', '威　县', '130500');
INSERT INTO `api_areas` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `api_areas` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `api_areas` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `api_areas` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `api_areas` VALUES ('124', '130601', '市辖区', '130600');
INSERT INTO `api_areas` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `api_areas` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `api_areas` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `api_areas` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `api_areas` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `api_areas` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `api_areas` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `api_areas` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `api_areas` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `api_areas` VALUES ('134', '130627', '唐　县', '130600');
INSERT INTO `api_areas` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `api_areas` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `api_areas` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `api_areas` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `api_areas` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `api_areas` VALUES ('140', '130633', '易　县', '130600');
INSERT INTO `api_areas` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `api_areas` VALUES ('142', '130635', '蠡　县', '130600');
INSERT INTO `api_areas` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `api_areas` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `api_areas` VALUES ('145', '130638', '雄　县', '130600');
INSERT INTO `api_areas` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `api_areas` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `api_areas` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `api_areas` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `api_areas` VALUES ('150', '130701', '市辖区', '130700');
INSERT INTO `api_areas` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `api_areas` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `api_areas` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `api_areas` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `api_areas` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `api_areas` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `api_areas` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `api_areas` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `api_areas` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `api_areas` VALUES ('160', '130726', '蔚　县', '130700');
INSERT INTO `api_areas` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `api_areas` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `api_areas` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `api_areas` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `api_areas` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `api_areas` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `api_areas` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `api_areas` VALUES ('168', '130801', '市辖区', '130800');
INSERT INTO `api_areas` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `api_areas` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `api_areas` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `api_areas` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `api_areas` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `api_areas` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `api_areas` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `api_areas` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `api_areas` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `api_areas` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `api_areas` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `api_areas` VALUES ('180', '130901', '市辖区', '130900');
INSERT INTO `api_areas` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `api_areas` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `api_areas` VALUES ('183', '130921', '沧　县', '130900');
INSERT INTO `api_areas` VALUES ('184', '130922', '青　县', '130900');
INSERT INTO `api_areas` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `api_areas` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `api_areas` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `api_areas` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `api_areas` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `api_areas` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `api_areas` VALUES ('191', '130929', '献　县', '130900');
INSERT INTO `api_areas` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `api_areas` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `api_areas` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `api_areas` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `api_areas` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `api_areas` VALUES ('197', '131001', '市辖区', '131000');
INSERT INTO `api_areas` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `api_areas` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `api_areas` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `api_areas` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `api_areas` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `api_areas` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `api_areas` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `api_areas` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `api_areas` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `api_areas` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `api_areas` VALUES ('208', '131101', '市辖区', '131100');
INSERT INTO `api_areas` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `api_areas` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `api_areas` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `api_areas` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `api_areas` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `api_areas` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `api_areas` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `api_areas` VALUES ('216', '131127', '景　县', '131100');
INSERT INTO `api_areas` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `api_areas` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `api_areas` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `api_areas` VALUES ('220', '140101', '市辖区', '140100');
INSERT INTO `api_areas` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `api_areas` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `api_areas` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `api_areas` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `api_areas` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `api_areas` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `api_areas` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `api_areas` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `api_areas` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `api_areas` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `api_areas` VALUES ('231', '140201', '市辖区', '140200');
INSERT INTO `api_areas` VALUES ('232', '140202', '城　区', '140200');
INSERT INTO `api_areas` VALUES ('233', '140203', '矿　区', '140200');
INSERT INTO `api_areas` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `api_areas` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `api_areas` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `api_areas` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `api_areas` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `api_areas` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `api_areas` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `api_areas` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `api_areas` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `api_areas` VALUES ('243', '140301', '市辖区', '140300');
INSERT INTO `api_areas` VALUES ('244', '140302', '城　区', '140300');
INSERT INTO `api_areas` VALUES ('245', '140303', '矿　区', '140300');
INSERT INTO `api_areas` VALUES ('246', '140311', '郊　区', '140300');
INSERT INTO `api_areas` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `api_areas` VALUES ('248', '140322', '盂　县', '140300');
INSERT INTO `api_areas` VALUES ('249', '140401', '市辖区', '140400');
INSERT INTO `api_areas` VALUES ('250', '140402', '城　区', '140400');
INSERT INTO `api_areas` VALUES ('251', '140411', '郊　区', '140400');
INSERT INTO `api_areas` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `api_areas` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `api_areas` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `api_areas` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `api_areas` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `api_areas` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `api_areas` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `api_areas` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `api_areas` VALUES ('260', '140430', '沁　县', '140400');
INSERT INTO `api_areas` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `api_areas` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `api_areas` VALUES ('263', '140501', '市辖区', '140500');
INSERT INTO `api_areas` VALUES ('264', '140502', '城　区', '140500');
INSERT INTO `api_areas` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `api_areas` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `api_areas` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `api_areas` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `api_areas` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `api_areas` VALUES ('270', '140601', '市辖区', '140600');
INSERT INTO `api_areas` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `api_areas` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `api_areas` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `api_areas` VALUES ('274', '140622', '应　县', '140600');
INSERT INTO `api_areas` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `api_areas` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `api_areas` VALUES ('277', '140701', '市辖区', '140700');
INSERT INTO `api_areas` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `api_areas` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `api_areas` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `api_areas` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `api_areas` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `api_areas` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `api_areas` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `api_areas` VALUES ('285', '140727', '祁　县', '140700');
INSERT INTO `api_areas` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `api_areas` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `api_areas` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `api_areas` VALUES ('289', '140801', '市辖区', '140800');
INSERT INTO `api_areas` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `api_areas` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `api_areas` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `api_areas` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `api_areas` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `api_areas` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `api_areas` VALUES ('296', '140826', '绛　县', '140800');
INSERT INTO `api_areas` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `api_areas` VALUES ('298', '140828', '夏　县', '140800');
INSERT INTO `api_areas` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `api_areas` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `api_areas` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `api_areas` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `api_areas` VALUES ('303', '140901', '市辖区', '140900');
INSERT INTO `api_areas` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `api_areas` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `api_areas` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `api_areas` VALUES ('307', '140923', '代　县', '140900');
INSERT INTO `api_areas` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `api_areas` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `api_areas` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `api_areas` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `api_areas` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `api_areas` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `api_areas` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `api_areas` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `api_areas` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `api_areas` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `api_areas` VALUES ('318', '141001', '市辖区', '141000');
INSERT INTO `api_areas` VALUES ('319', '141002', '尧都区', '141000');
INSERT INTO `api_areas` VALUES ('320', '141021', '曲沃县', '141000');
INSERT INTO `api_areas` VALUES ('321', '141022', '翼城县', '141000');
INSERT INTO `api_areas` VALUES ('322', '141023', '襄汾县', '141000');
INSERT INTO `api_areas` VALUES ('323', '141024', '洪洞县', '141000');
INSERT INTO `api_areas` VALUES ('324', '141025', '古　县', '141000');
INSERT INTO `api_areas` VALUES ('325', '141026', '安泽县', '141000');
INSERT INTO `api_areas` VALUES ('326', '141027', '浮山县', '141000');
INSERT INTO `api_areas` VALUES ('327', '141028', '吉　县', '141000');
INSERT INTO `api_areas` VALUES ('328', '141029', '乡宁县', '141000');
INSERT INTO `api_areas` VALUES ('329', '141030', '大宁县', '141000');
INSERT INTO `api_areas` VALUES ('330', '141031', '隰　县', '141000');
INSERT INTO `api_areas` VALUES ('331', '141032', '永和县', '141000');
INSERT INTO `api_areas` VALUES ('332', '141033', '蒲　县', '141000');
INSERT INTO `api_areas` VALUES ('333', '141034', '汾西县', '141000');
INSERT INTO `api_areas` VALUES ('334', '141081', '侯马市', '141000');
INSERT INTO `api_areas` VALUES ('335', '141082', '霍州市', '141000');
INSERT INTO `api_areas` VALUES ('336', '141101', '市辖区', '141100');
INSERT INTO `api_areas` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `api_areas` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `api_areas` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `api_areas` VALUES ('340', '141123', '兴　县', '141100');
INSERT INTO `api_areas` VALUES ('341', '141124', '临　县', '141100');
INSERT INTO `api_areas` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `api_areas` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `api_areas` VALUES ('344', '141127', '岚　县', '141100');
INSERT INTO `api_areas` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `api_areas` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `api_areas` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `api_areas` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `api_areas` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `api_areas` VALUES ('350', '150101', '市辖区', '150100');
INSERT INTO `api_areas` VALUES ('351', '150102', '新城区', '150100');
INSERT INTO `api_areas` VALUES ('352', '150103', '回民区', '150100');
INSERT INTO `api_areas` VALUES ('353', '150104', '玉泉区', '150100');
INSERT INTO `api_areas` VALUES ('354', '150105', '赛罕区', '150100');
INSERT INTO `api_areas` VALUES ('355', '150121', '土默特左旗', '150100');
INSERT INTO `api_areas` VALUES ('356', '150122', '托克托县', '150100');
INSERT INTO `api_areas` VALUES ('357', '150123', '和林格尔县', '150100');
INSERT INTO `api_areas` VALUES ('358', '150124', '清水河县', '150100');
INSERT INTO `api_areas` VALUES ('359', '150125', '武川县', '150100');
INSERT INTO `api_areas` VALUES ('360', '150201', '市辖区', '150200');
INSERT INTO `api_areas` VALUES ('361', '150202', '东河区', '150200');
INSERT INTO `api_areas` VALUES ('362', '150203', '昆都仑区', '150200');
INSERT INTO `api_areas` VALUES ('363', '150204', '青山区', '150200');
INSERT INTO `api_areas` VALUES ('364', '150205', '石拐区', '150200');
INSERT INTO `api_areas` VALUES ('365', '150206', '白云矿区', '150200');
INSERT INTO `api_areas` VALUES ('366', '150207', '九原区', '150200');
INSERT INTO `api_areas` VALUES ('367', '150221', '土默特右旗', '150200');
INSERT INTO `api_areas` VALUES ('368', '150222', '固阳县', '150200');
INSERT INTO `api_areas` VALUES ('369', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `api_areas` VALUES ('370', '150301', '市辖区', '150300');
INSERT INTO `api_areas` VALUES ('371', '150302', '海勃湾区', '150300');
INSERT INTO `api_areas` VALUES ('372', '150303', '海南区', '150300');
INSERT INTO `api_areas` VALUES ('373', '150304', '乌达区', '150300');
INSERT INTO `api_areas` VALUES ('374', '150401', '市辖区', '150400');
INSERT INTO `api_areas` VALUES ('375', '150402', '红山区', '150400');
INSERT INTO `api_areas` VALUES ('376', '150403', '元宝山区', '150400');
INSERT INTO `api_areas` VALUES ('377', '150404', '松山区', '150400');
INSERT INTO `api_areas` VALUES ('378', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `api_areas` VALUES ('379', '150422', '巴林左旗', '150400');
INSERT INTO `api_areas` VALUES ('380', '150423', '巴林右旗', '150400');
INSERT INTO `api_areas` VALUES ('381', '150424', '林西县', '150400');
INSERT INTO `api_areas` VALUES ('382', '150425', '克什克腾旗', '150400');
INSERT INTO `api_areas` VALUES ('383', '150426', '翁牛特旗', '150400');
INSERT INTO `api_areas` VALUES ('384', '150428', '喀喇沁旗', '150400');
INSERT INTO `api_areas` VALUES ('385', '150429', '宁城县', '150400');
INSERT INTO `api_areas` VALUES ('386', '150430', '敖汉旗', '150400');
INSERT INTO `api_areas` VALUES ('387', '150501', '市辖区', '150500');
INSERT INTO `api_areas` VALUES ('388', '150502', '科尔沁区', '150500');
INSERT INTO `api_areas` VALUES ('389', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `api_areas` VALUES ('390', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `api_areas` VALUES ('391', '150523', '开鲁县', '150500');
INSERT INTO `api_areas` VALUES ('392', '150524', '库伦旗', '150500');
INSERT INTO `api_areas` VALUES ('393', '150525', '奈曼旗', '150500');
INSERT INTO `api_areas` VALUES ('394', '150526', '扎鲁特旗', '150500');
INSERT INTO `api_areas` VALUES ('395', '150581', '霍林郭勒市', '150500');
INSERT INTO `api_areas` VALUES ('396', '150602', '东胜区', '150600');
INSERT INTO `api_areas` VALUES ('397', '150621', '达拉特旗', '150600');
INSERT INTO `api_areas` VALUES ('398', '150622', '准格尔旗', '150600');
INSERT INTO `api_areas` VALUES ('399', '150623', '鄂托克前旗', '150600');
INSERT INTO `api_areas` VALUES ('400', '150624', '鄂托克旗', '150600');
INSERT INTO `api_areas` VALUES ('401', '150625', '杭锦旗', '150600');
INSERT INTO `api_areas` VALUES ('402', '150626', '乌审旗', '150600');
INSERT INTO `api_areas` VALUES ('403', '150627', '伊金霍洛旗', '150600');
INSERT INTO `api_areas` VALUES ('404', '150701', '市辖区', '150700');
INSERT INTO `api_areas` VALUES ('405', '150702', '海拉尔区', '150700');
INSERT INTO `api_areas` VALUES ('406', '150721', '阿荣旗', '150700');
INSERT INTO `api_areas` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `api_areas` VALUES ('408', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `api_areas` VALUES ('409', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `api_areas` VALUES ('410', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `api_areas` VALUES ('411', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `api_areas` VALUES ('412', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `api_areas` VALUES ('413', '150781', '满洲里市', '150700');
INSERT INTO `api_areas` VALUES ('414', '150782', '牙克石市', '150700');
INSERT INTO `api_areas` VALUES ('415', '150783', '扎兰屯市', '150700');
INSERT INTO `api_areas` VALUES ('416', '150784', '额尔古纳市', '150700');
INSERT INTO `api_areas` VALUES ('417', '150785', '根河市', '150700');
INSERT INTO `api_areas` VALUES ('418', '150801', '市辖区', '150800');
INSERT INTO `api_areas` VALUES ('419', '150802', '临河区', '150800');
INSERT INTO `api_areas` VALUES ('420', '150821', '五原县', '150800');
INSERT INTO `api_areas` VALUES ('421', '150822', '磴口县', '150800');
INSERT INTO `api_areas` VALUES ('422', '150823', '乌拉特前旗', '150800');
INSERT INTO `api_areas` VALUES ('423', '150824', '乌拉特中旗', '150800');
INSERT INTO `api_areas` VALUES ('424', '150825', '乌拉特后旗', '150800');
INSERT INTO `api_areas` VALUES ('425', '150826', '杭锦后旗', '150800');
INSERT INTO `api_areas` VALUES ('426', '150901', '市辖区', '150900');
INSERT INTO `api_areas` VALUES ('427', '150902', '集宁区', '150900');
INSERT INTO `api_areas` VALUES ('428', '150921', '卓资县', '150900');
INSERT INTO `api_areas` VALUES ('429', '150922', '化德县', '150900');
INSERT INTO `api_areas` VALUES ('430', '150923', '商都县', '150900');
INSERT INTO `api_areas` VALUES ('431', '150924', '兴和县', '150900');
INSERT INTO `api_areas` VALUES ('432', '150925', '凉城县', '150900');
INSERT INTO `api_areas` VALUES ('433', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `api_areas` VALUES ('434', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `api_areas` VALUES ('435', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `api_areas` VALUES ('436', '150929', '四子王旗', '150900');
INSERT INTO `api_areas` VALUES ('437', '150981', '丰镇市', '150900');
INSERT INTO `api_areas` VALUES ('438', '152201', '乌兰浩特市', '152200');
INSERT INTO `api_areas` VALUES ('439', '152202', '阿尔山市', '152200');
INSERT INTO `api_areas` VALUES ('440', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `api_areas` VALUES ('441', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `api_areas` VALUES ('442', '152223', '扎赉特旗', '152200');
INSERT INTO `api_areas` VALUES ('443', '152224', '突泉县', '152200');
INSERT INTO `api_areas` VALUES ('444', '152501', '二连浩特市', '152500');
INSERT INTO `api_areas` VALUES ('445', '152502', '锡林浩特市', '152500');
INSERT INTO `api_areas` VALUES ('446', '152522', '阿巴嘎旗', '152500');
INSERT INTO `api_areas` VALUES ('447', '152523', '苏尼特左旗', '152500');
INSERT INTO `api_areas` VALUES ('448', '152524', '苏尼特右旗', '152500');
INSERT INTO `api_areas` VALUES ('449', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `api_areas` VALUES ('450', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `api_areas` VALUES ('451', '152527', '太仆寺旗', '152500');
INSERT INTO `api_areas` VALUES ('452', '152528', '镶黄旗', '152500');
INSERT INTO `api_areas` VALUES ('453', '152529', '正镶白旗', '152500');
INSERT INTO `api_areas` VALUES ('454', '152530', '正蓝旗', '152500');
INSERT INTO `api_areas` VALUES ('455', '152531', '多伦县', '152500');
INSERT INTO `api_areas` VALUES ('456', '152921', '阿拉善左旗', '152900');
INSERT INTO `api_areas` VALUES ('457', '152922', '阿拉善右旗', '152900');
INSERT INTO `api_areas` VALUES ('458', '152923', '额济纳旗', '152900');
INSERT INTO `api_areas` VALUES ('459', '210101', '市辖区', '210100');
INSERT INTO `api_areas` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `api_areas` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `api_areas` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `api_areas` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `api_areas` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `api_areas` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `api_areas` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `api_areas` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `api_areas` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `api_areas` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `api_areas` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `api_areas` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `api_areas` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `api_areas` VALUES ('473', '210201', '市辖区', '210200');
INSERT INTO `api_areas` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `api_areas` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `api_areas` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `api_areas` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `api_areas` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `api_areas` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `api_areas` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `api_areas` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `api_areas` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `api_areas` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `api_areas` VALUES ('484', '210301', '市辖区', '210300');
INSERT INTO `api_areas` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `api_areas` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `api_areas` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `api_areas` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `api_areas` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `api_areas` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `api_areas` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `api_areas` VALUES ('492', '210401', '市辖区', '210400');
INSERT INTO `api_areas` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `api_areas` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `api_areas` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `api_areas` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `api_areas` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `api_areas` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `api_areas` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `api_areas` VALUES ('500', '210501', '市辖区', '210500');
INSERT INTO `api_areas` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `api_areas` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `api_areas` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `api_areas` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `api_areas` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `api_areas` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `api_areas` VALUES ('507', '210601', '市辖区', '210600');
INSERT INTO `api_areas` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `api_areas` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `api_areas` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `api_areas` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `api_areas` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `api_areas` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `api_areas` VALUES ('514', '210701', '市辖区', '210700');
INSERT INTO `api_areas` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `api_areas` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `api_areas` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `api_areas` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `api_areas` VALUES ('519', '210727', '义　县', '210700');
INSERT INTO `api_areas` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `api_areas` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `api_areas` VALUES ('522', '210801', '市辖区', '210800');
INSERT INTO `api_areas` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `api_areas` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `api_areas` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `api_areas` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `api_areas` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `api_areas` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `api_areas` VALUES ('529', '210901', '市辖区', '210900');
INSERT INTO `api_areas` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `api_areas` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `api_areas` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `api_areas` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `api_areas` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `api_areas` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `api_areas` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `api_areas` VALUES ('537', '211001', '市辖区', '211000');
INSERT INTO `api_areas` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `api_areas` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `api_areas` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `api_areas` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `api_areas` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `api_areas` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `api_areas` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `api_areas` VALUES ('545', '211101', '市辖区', '211100');
INSERT INTO `api_areas` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `api_areas` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `api_areas` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `api_areas` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `api_areas` VALUES ('550', '211201', '市辖区', '211200');
INSERT INTO `api_areas` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `api_areas` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `api_areas` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `api_areas` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `api_areas` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `api_areas` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `api_areas` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `api_areas` VALUES ('558', '211301', '市辖区', '211300');
INSERT INTO `api_areas` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `api_areas` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `api_areas` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `api_areas` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `api_areas` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `api_areas` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `api_areas` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `api_areas` VALUES ('566', '211401', '市辖区', '211400');
INSERT INTO `api_areas` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `api_areas` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `api_areas` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `api_areas` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `api_areas` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `api_areas` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `api_areas` VALUES ('573', '220101', '市辖区', '220100');
INSERT INTO `api_areas` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `api_areas` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `api_areas` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `api_areas` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `api_areas` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `api_areas` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `api_areas` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `api_areas` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `api_areas` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `api_areas` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `api_areas` VALUES ('584', '220201', '市辖区', '220200');
INSERT INTO `api_areas` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `api_areas` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `api_areas` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `api_areas` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `api_areas` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `api_areas` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `api_areas` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `api_areas` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `api_areas` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `api_areas` VALUES ('594', '220301', '市辖区', '220300');
INSERT INTO `api_areas` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `api_areas` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `api_areas` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `api_areas` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `api_areas` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `api_areas` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `api_areas` VALUES ('601', '220401', '市辖区', '220400');
INSERT INTO `api_areas` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `api_areas` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `api_areas` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `api_areas` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `api_areas` VALUES ('606', '220501', '市辖区', '220500');
INSERT INTO `api_areas` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `api_areas` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `api_areas` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `api_areas` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `api_areas` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `api_areas` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `api_areas` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `api_areas` VALUES ('614', '220601', '市辖区', '220600');
INSERT INTO `api_areas` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `api_areas` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `api_areas` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `api_areas` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `api_areas` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `api_areas` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `api_areas` VALUES ('621', '220701', '市辖区', '220700');
INSERT INTO `api_areas` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `api_areas` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `api_areas` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `api_areas` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `api_areas` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `api_areas` VALUES ('627', '220801', '市辖区', '220800');
INSERT INTO `api_areas` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `api_areas` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `api_areas` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `api_areas` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `api_areas` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `api_areas` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `api_areas` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `api_areas` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `api_areas` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `api_areas` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `api_areas` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `api_areas` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `api_areas` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `api_areas` VALUES ('641', '230101', '市辖区', '230100');
INSERT INTO `api_areas` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `api_areas` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `api_areas` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `api_areas` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `api_areas` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `api_areas` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `api_areas` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `api_areas` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `api_areas` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `api_areas` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `api_areas` VALUES ('652', '230125', '宾　县', '230100');
INSERT INTO `api_areas` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `api_areas` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `api_areas` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `api_areas` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `api_areas` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `api_areas` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `api_areas` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `api_areas` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `api_areas` VALUES ('661', '230201', '市辖区', '230200');
INSERT INTO `api_areas` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `api_areas` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `api_areas` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `api_areas` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `api_areas` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `api_areas` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `api_areas` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `api_areas` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `api_areas` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `api_areas` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `api_areas` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `api_areas` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `api_areas` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `api_areas` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `api_areas` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `api_areas` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `api_areas` VALUES ('678', '230301', '市辖区', '230300');
INSERT INTO `api_areas` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `api_areas` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `api_areas` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `api_areas` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `api_areas` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `api_areas` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `api_areas` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `api_areas` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `api_areas` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `api_areas` VALUES ('688', '230401', '市辖区', '230400');
INSERT INTO `api_areas` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `api_areas` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `api_areas` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `api_areas` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `api_areas` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `api_areas` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `api_areas` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `api_areas` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `api_areas` VALUES ('697', '230501', '市辖区', '230500');
INSERT INTO `api_areas` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `api_areas` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `api_areas` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `api_areas` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `api_areas` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `api_areas` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `api_areas` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `api_areas` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `api_areas` VALUES ('706', '230601', '市辖区', '230600');
INSERT INTO `api_areas` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `api_areas` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `api_areas` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `api_areas` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `api_areas` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `api_areas` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `api_areas` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `api_areas` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `api_areas` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `api_areas` VALUES ('716', '230701', '市辖区', '230700');
INSERT INTO `api_areas` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `api_areas` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `api_areas` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `api_areas` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `api_areas` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `api_areas` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `api_areas` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `api_areas` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `api_areas` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `api_areas` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `api_areas` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `api_areas` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `api_areas` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `api_areas` VALUES ('730', '230715', '红星区', '230700');
INSERT INTO `api_areas` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `api_areas` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `api_areas` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `api_areas` VALUES ('734', '230801', '市辖区', '230800');
INSERT INTO `api_areas` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `api_areas` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `api_areas` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `api_areas` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `api_areas` VALUES ('739', '230811', '郊　区', '230800');
INSERT INTO `api_areas` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `api_areas` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `api_areas` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `api_areas` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `api_areas` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `api_areas` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `api_areas` VALUES ('746', '230901', '市辖区', '230900');
INSERT INTO `api_areas` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `api_areas` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `api_areas` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `api_areas` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `api_areas` VALUES ('751', '231001', '市辖区', '231000');
INSERT INTO `api_areas` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `api_areas` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `api_areas` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `api_areas` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `api_areas` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `api_areas` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `api_areas` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `api_areas` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `api_areas` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `api_areas` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `api_areas` VALUES ('762', '231101', '市辖区', '231100');
INSERT INTO `api_areas` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `api_areas` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `api_areas` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `api_areas` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `api_areas` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `api_areas` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `api_areas` VALUES ('769', '231201', '市辖区', '231200');
INSERT INTO `api_areas` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `api_areas` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `api_areas` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `api_areas` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `api_areas` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `api_areas` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `api_areas` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `api_areas` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `api_areas` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `api_areas` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `api_areas` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `api_areas` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `api_areas` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `api_areas` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `api_areas` VALUES ('784', '310103', '卢湾区', '310100');
INSERT INTO `api_areas` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `api_areas` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `api_areas` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `api_areas` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `api_areas` VALUES ('789', '310108', '闸北区', '310100');
INSERT INTO `api_areas` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `api_areas` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `api_areas` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `api_areas` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `api_areas` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `api_areas` VALUES ('795', '310115', '浦东新区', '310100');
INSERT INTO `api_areas` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `api_areas` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `api_areas` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `api_areas` VALUES ('799', '310119', '南汇区', '310100');
INSERT INTO `api_areas` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `api_areas` VALUES ('801', '310230', '崇明县', '310200');
INSERT INTO `api_areas` VALUES ('802', '320101', '市辖区', '320100');
INSERT INTO `api_areas` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `api_areas` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `api_areas` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `api_areas` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `api_areas` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `api_areas` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `api_areas` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `api_areas` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `api_areas` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `api_areas` VALUES ('812', '320115', '江宁区', '320100');
INSERT INTO `api_areas` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `api_areas` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `api_areas` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `api_areas` VALUES ('816', '320201', '市辖区', '320200');
INSERT INTO `api_areas` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `api_areas` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `api_areas` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `api_areas` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `api_areas` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `api_areas` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `api_areas` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `api_areas` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `api_areas` VALUES ('825', '320301', '市辖区', '320300');
INSERT INTO `api_areas` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `api_areas` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `api_areas` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `api_areas` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `api_areas` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `api_areas` VALUES ('831', '320321', '丰　县', '320300');
INSERT INTO `api_areas` VALUES ('832', '320322', '沛　县', '320300');
INSERT INTO `api_areas` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `api_areas` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `api_areas` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `api_areas` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `api_areas` VALUES ('837', '320401', '市辖区', '320400');
INSERT INTO `api_areas` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `api_areas` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `api_areas` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `api_areas` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `api_areas` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `api_areas` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `api_areas` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `api_areas` VALUES ('845', '320501', '市辖区', '320500');
INSERT INTO `api_areas` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `api_areas` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `api_areas` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `api_areas` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `api_areas` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `api_areas` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `api_areas` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `api_areas` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `api_areas` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `api_areas` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `api_areas` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `api_areas` VALUES ('857', '320601', '市辖区', '320600');
INSERT INTO `api_areas` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `api_areas` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `api_areas` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `api_areas` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `api_areas` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `api_areas` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `api_areas` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `api_areas` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `api_areas` VALUES ('866', '320701', '市辖区', '320700');
INSERT INTO `api_areas` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `api_areas` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `api_areas` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `api_areas` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `api_areas` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `api_areas` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `api_areas` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `api_areas` VALUES ('874', '320801', '市辖区', '320800');
INSERT INTO `api_areas` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `api_areas` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `api_areas` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `api_areas` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `api_areas` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `api_areas` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `api_areas` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `api_areas` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `api_areas` VALUES ('883', '320901', '市辖区', '320900');
INSERT INTO `api_areas` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `api_areas` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `api_areas` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `api_areas` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `api_areas` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `api_areas` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `api_areas` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `api_areas` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `api_areas` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `api_areas` VALUES ('893', '321001', '市辖区', '321000');
INSERT INTO `api_areas` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `api_areas` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `api_areas` VALUES ('896', '321011', '郊　区', '321000');
INSERT INTO `api_areas` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `api_areas` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `api_areas` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `api_areas` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `api_areas` VALUES ('901', '321101', '市辖区', '321100');
INSERT INTO `api_areas` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `api_areas` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `api_areas` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `api_areas` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `api_areas` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `api_areas` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `api_areas` VALUES ('908', '321201', '市辖区', '321200');
INSERT INTO `api_areas` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `api_areas` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `api_areas` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `api_areas` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `api_areas` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `api_areas` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `api_areas` VALUES ('915', '321301', '市辖区', '321300');
INSERT INTO `api_areas` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `api_areas` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `api_areas` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `api_areas` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `api_areas` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `api_areas` VALUES ('921', '330101', '市辖区', '330100');
INSERT INTO `api_areas` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `api_areas` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `api_areas` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `api_areas` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `api_areas` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `api_areas` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `api_areas` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `api_areas` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `api_areas` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `api_areas` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `api_areas` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `api_areas` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `api_areas` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `api_areas` VALUES ('935', '330201', '市辖区', '330200');
INSERT INTO `api_areas` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `api_areas` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `api_areas` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `api_areas` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `api_areas` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `api_areas` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `api_areas` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `api_areas` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `api_areas` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `api_areas` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `api_areas` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `api_areas` VALUES ('947', '330301', '市辖区', '330300');
INSERT INTO `api_areas` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `api_areas` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `api_areas` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `api_areas` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `api_areas` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `api_areas` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `api_areas` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `api_areas` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `api_areas` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `api_areas` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `api_areas` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `api_areas` VALUES ('959', '330401', '市辖区', '330400');
INSERT INTO `api_areas` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `api_areas` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `api_areas` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `api_areas` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `api_areas` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `api_areas` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `api_areas` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `api_areas` VALUES ('967', '330501', '市辖区', '330500');
INSERT INTO `api_areas` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `api_areas` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `api_areas` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `api_areas` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `api_areas` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `api_areas` VALUES ('973', '330601', '市辖区', '330600');
INSERT INTO `api_areas` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `api_areas` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `api_areas` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `api_areas` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `api_areas` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `api_areas` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `api_areas` VALUES ('980', '330701', '市辖区', '330700');
INSERT INTO `api_areas` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `api_areas` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `api_areas` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `api_areas` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `api_areas` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `api_areas` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `api_areas` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `api_areas` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `api_areas` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `api_areas` VALUES ('990', '330801', '市辖区', '330800');
INSERT INTO `api_areas` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `api_areas` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `api_areas` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `api_areas` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `api_areas` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `api_areas` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `api_areas` VALUES ('997', '330901', '市辖区', '330900');
INSERT INTO `api_areas` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `api_areas` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `api_areas` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `api_areas` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `api_areas` VALUES ('1002', '331001', '市辖区', '331000');
INSERT INTO `api_areas` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `api_areas` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `api_areas` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `api_areas` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `api_areas` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `api_areas` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `api_areas` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `api_areas` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `api_areas` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `api_areas` VALUES ('1012', '331101', '市辖区', '331100');
INSERT INTO `api_areas` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `api_areas` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `api_areas` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `api_areas` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `api_areas` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `api_areas` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `api_areas` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `api_areas` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `api_areas` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `api_areas` VALUES ('1022', '340101', '市辖区', '340100');
INSERT INTO `api_areas` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `api_areas` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `api_areas` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `api_areas` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `api_areas` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `api_areas` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `api_areas` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `api_areas` VALUES ('1030', '340201', '市辖区', '340200');
INSERT INTO `api_areas` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `api_areas` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `api_areas` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `api_areas` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `api_areas` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `api_areas` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `api_areas` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `api_areas` VALUES ('1038', '340301', '市辖区', '340300');
INSERT INTO `api_areas` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `api_areas` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `api_areas` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `api_areas` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `api_areas` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `api_areas` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `api_areas` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `api_areas` VALUES ('1046', '340401', '市辖区', '340400');
INSERT INTO `api_areas` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `api_areas` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `api_areas` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `api_areas` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `api_areas` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `api_areas` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `api_areas` VALUES ('1053', '340501', '市辖区', '340500');
INSERT INTO `api_areas` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `api_areas` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `api_areas` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `api_areas` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `api_areas` VALUES ('1058', '340601', '市辖区', '340600');
INSERT INTO `api_areas` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `api_areas` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `api_areas` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `api_areas` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `api_areas` VALUES ('1063', '340701', '市辖区', '340700');
INSERT INTO `api_areas` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `api_areas` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `api_areas` VALUES ('1066', '340711', '郊　区', '340700');
INSERT INTO `api_areas` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `api_areas` VALUES ('1068', '340801', '市辖区', '340800');
INSERT INTO `api_areas` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `api_areas` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `api_areas` VALUES ('1071', '340811', '郊　区', '340800');
INSERT INTO `api_areas` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `api_areas` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `api_areas` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `api_areas` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `api_areas` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `api_areas` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `api_areas` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `api_areas` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `api_areas` VALUES ('1080', '341001', '市辖区', '341000');
INSERT INTO `api_areas` VALUES ('1081', '341002', '屯溪区', '341000');
INSERT INTO `api_areas` VALUES ('1082', '341003', '黄山区', '341000');
INSERT INTO `api_areas` VALUES ('1083', '341004', '徽州区', '341000');
INSERT INTO `api_areas` VALUES ('1084', '341021', '歙　县', '341000');
INSERT INTO `api_areas` VALUES ('1085', '341022', '休宁县', '341000');
INSERT INTO `api_areas` VALUES ('1086', '341023', '黟　县', '341000');
INSERT INTO `api_areas` VALUES ('1087', '341024', '祁门县', '341000');
INSERT INTO `api_areas` VALUES ('1088', '341101', '市辖区', '341100');
INSERT INTO `api_areas` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `api_areas` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `api_areas` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `api_areas` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `api_areas` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `api_areas` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `api_areas` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `api_areas` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `api_areas` VALUES ('1097', '341201', '市辖区', '341200');
INSERT INTO `api_areas` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `api_areas` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `api_areas` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `api_areas` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `api_areas` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `api_areas` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `api_areas` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `api_areas` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `api_areas` VALUES ('1106', '341301', '市辖区', '341300');
INSERT INTO `api_areas` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `api_areas` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `api_areas` VALUES ('1109', '341322', '萧　县', '341300');
INSERT INTO `api_areas` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `api_areas` VALUES ('1111', '341324', '泗　县', '341300');
INSERT INTO `api_areas` VALUES ('1112', '341401', '市辖区', '341400');
INSERT INTO `api_areas` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `api_areas` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `api_areas` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `api_areas` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `api_areas` VALUES ('1117', '341424', '和　县', '341400');
INSERT INTO `api_areas` VALUES ('1118', '341501', '市辖区', '341500');
INSERT INTO `api_areas` VALUES ('1119', '341502', '金安区', '341500');
INSERT INTO `api_areas` VALUES ('1120', '341503', '裕安区', '341500');
INSERT INTO `api_areas` VALUES ('1121', '341521', '寿　县', '341500');
INSERT INTO `api_areas` VALUES ('1122', '341522', '霍邱县', '341500');
INSERT INTO `api_areas` VALUES ('1123', '341523', '舒城县', '341500');
INSERT INTO `api_areas` VALUES ('1124', '341524', '金寨县', '341500');
INSERT INTO `api_areas` VALUES ('1125', '341525', '霍山县', '341500');
INSERT INTO `api_areas` VALUES ('1126', '341601', '市辖区', '341600');
INSERT INTO `api_areas` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `api_areas` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `api_areas` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `api_areas` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `api_areas` VALUES ('1131', '341701', '市辖区', '341700');
INSERT INTO `api_areas` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `api_areas` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `api_areas` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `api_areas` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `api_areas` VALUES ('1136', '341801', '市辖区', '341800');
INSERT INTO `api_areas` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `api_areas` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `api_areas` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `api_areas` VALUES ('1140', '341823', '泾　县', '341800');
INSERT INTO `api_areas` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `api_areas` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `api_areas` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `api_areas` VALUES ('1144', '350101', '市辖区', '350100');
INSERT INTO `api_areas` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `api_areas` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `api_areas` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `api_areas` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `api_areas` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `api_areas` VALUES ('1150', '350121', '闽侯县', '350100');
INSERT INTO `api_areas` VALUES ('1151', '350122', '连江县', '350100');
INSERT INTO `api_areas` VALUES ('1152', '350123', '罗源县', '350100');
INSERT INTO `api_areas` VALUES ('1153', '350124', '闽清县', '350100');
INSERT INTO `api_areas` VALUES ('1154', '350125', '永泰县', '350100');
INSERT INTO `api_areas` VALUES ('1155', '350128', '平潭县', '350100');
INSERT INTO `api_areas` VALUES ('1156', '350181', '福清市', '350100');
INSERT INTO `api_areas` VALUES ('1157', '350182', '长乐市', '350100');
INSERT INTO `api_areas` VALUES ('1158', '350201', '市辖区', '350200');
INSERT INTO `api_areas` VALUES ('1159', '350203', '思明区', '350200');
INSERT INTO `api_areas` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `api_areas` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `api_areas` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `api_areas` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `api_areas` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `api_areas` VALUES ('1165', '350301', '市辖区', '350300');
INSERT INTO `api_areas` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `api_areas` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `api_areas` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `api_areas` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `api_areas` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `api_areas` VALUES ('1171', '350401', '市辖区', '350400');
INSERT INTO `api_areas` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `api_areas` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `api_areas` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `api_areas` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `api_areas` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `api_areas` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `api_areas` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `api_areas` VALUES ('1179', '350427', '沙　县', '350400');
INSERT INTO `api_areas` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `api_areas` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `api_areas` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `api_areas` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `api_areas` VALUES ('1184', '350501', '市辖区', '350500');
INSERT INTO `api_areas` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `api_areas` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `api_areas` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `api_areas` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `api_areas` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `api_areas` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `api_areas` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `api_areas` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `api_areas` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `api_areas` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `api_areas` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `api_areas` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `api_areas` VALUES ('1197', '350601', '市辖区', '350600');
INSERT INTO `api_areas` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `api_areas` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `api_areas` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `api_areas` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `api_areas` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `api_areas` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `api_areas` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `api_areas` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `api_areas` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `api_areas` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `api_areas` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `api_areas` VALUES ('1209', '350701', '市辖区', '350700');
INSERT INTO `api_areas` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `api_areas` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `api_areas` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `api_areas` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `api_areas` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `api_areas` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `api_areas` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `api_areas` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `api_areas` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `api_areas` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `api_areas` VALUES ('1220', '350801', '市辖区', '350800');
INSERT INTO `api_areas` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `api_areas` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `api_areas` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `api_areas` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `api_areas` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `api_areas` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `api_areas` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `api_areas` VALUES ('1228', '350901', '市辖区', '350900');
INSERT INTO `api_areas` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `api_areas` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `api_areas` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `api_areas` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `api_areas` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `api_areas` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `api_areas` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `api_areas` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `api_areas` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `api_areas` VALUES ('1238', '360101', '市辖区', '360100');
INSERT INTO `api_areas` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `api_areas` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `api_areas` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `api_areas` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `api_areas` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `api_areas` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `api_areas` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `api_areas` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `api_areas` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `api_areas` VALUES ('1248', '360201', '市辖区', '360200');
INSERT INTO `api_areas` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `api_areas` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `api_areas` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `api_areas` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `api_areas` VALUES ('1253', '360301', '市辖区', '360300');
INSERT INTO `api_areas` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `api_areas` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `api_areas` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `api_areas` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `api_areas` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `api_areas` VALUES ('1259', '360401', '市辖区', '360400');
INSERT INTO `api_areas` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `api_areas` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `api_areas` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `api_areas` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `api_areas` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `api_areas` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `api_areas` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `api_areas` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `api_areas` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `api_areas` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `api_areas` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `api_areas` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `api_areas` VALUES ('1272', '360501', '市辖区', '360500');
INSERT INTO `api_areas` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `api_areas` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `api_areas` VALUES ('1275', '360601', '市辖区', '360600');
INSERT INTO `api_areas` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `api_areas` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `api_areas` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `api_areas` VALUES ('1279', '360701', '市辖区', '360700');
INSERT INTO `api_areas` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `api_areas` VALUES ('1281', '360721', '赣　县', '360700');
INSERT INTO `api_areas` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `api_areas` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `api_areas` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `api_areas` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `api_areas` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `api_areas` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `api_areas` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `api_areas` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `api_areas` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `api_areas` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `api_areas` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `api_areas` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `api_areas` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `api_areas` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `api_areas` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `api_areas` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `api_areas` VALUES ('1298', '360801', '市辖区', '360800');
INSERT INTO `api_areas` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `api_areas` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `api_areas` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `api_areas` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `api_areas` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `api_areas` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `api_areas` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `api_areas` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `api_areas` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `api_areas` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `api_areas` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `api_areas` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `api_areas` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `api_areas` VALUES ('1312', '360901', '市辖区', '360900');
INSERT INTO `api_areas` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `api_areas` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `api_areas` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `api_areas` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `api_areas` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `api_areas` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `api_areas` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `api_areas` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `api_areas` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `api_areas` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `api_areas` VALUES ('1323', '361001', '市辖区', '361000');
INSERT INTO `api_areas` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `api_areas` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `api_areas` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `api_areas` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `api_areas` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `api_areas` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `api_areas` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `api_areas` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `api_areas` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `api_areas` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `api_areas` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `api_areas` VALUES ('1335', '361101', '市辖区', '361100');
INSERT INTO `api_areas` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `api_areas` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `api_areas` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `api_areas` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `api_areas` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `api_areas` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `api_areas` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `api_areas` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `api_areas` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `api_areas` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `api_areas` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `api_areas` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `api_areas` VALUES ('1348', '370101', '市辖区', '370100');
INSERT INTO `api_areas` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `api_areas` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `api_areas` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `api_areas` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `api_areas` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `api_areas` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `api_areas` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `api_areas` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `api_areas` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `api_areas` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `api_areas` VALUES ('1359', '370201', '市辖区', '370200');
INSERT INTO `api_areas` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `api_areas` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `api_areas` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `api_areas` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `api_areas` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `api_areas` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `api_areas` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `api_areas` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `api_areas` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `api_areas` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `api_areas` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `api_areas` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `api_areas` VALUES ('1372', '370301', '市辖区', '370300');
INSERT INTO `api_areas` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `api_areas` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `api_areas` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `api_areas` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `api_areas` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `api_areas` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `api_areas` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `api_areas` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `api_areas` VALUES ('1381', '370401', '市辖区', '370400');
INSERT INTO `api_areas` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `api_areas` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `api_areas` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `api_areas` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `api_areas` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `api_areas` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `api_areas` VALUES ('1388', '370501', '市辖区', '370500');
INSERT INTO `api_areas` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `api_areas` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `api_areas` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `api_areas` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `api_areas` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `api_areas` VALUES ('1394', '370601', '市辖区', '370600');
INSERT INTO `api_areas` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `api_areas` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `api_areas` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `api_areas` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `api_areas` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `api_areas` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `api_areas` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `api_areas` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `api_areas` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `api_areas` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `api_areas` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `api_areas` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `api_areas` VALUES ('1407', '370701', '市辖区', '370700');
INSERT INTO `api_areas` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `api_areas` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `api_areas` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `api_areas` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `api_areas` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `api_areas` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `api_areas` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `api_areas` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `api_areas` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `api_areas` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `api_areas` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `api_areas` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `api_areas` VALUES ('1420', '370801', '市辖区', '370800');
INSERT INTO `api_areas` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `api_areas` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `api_areas` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `api_areas` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `api_areas` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `api_areas` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `api_areas` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `api_areas` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `api_areas` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `api_areas` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `api_areas` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `api_areas` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `api_areas` VALUES ('1433', '370901', '市辖区', '370900');
INSERT INTO `api_areas` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `api_areas` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `api_areas` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `api_areas` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `api_areas` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `api_areas` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `api_areas` VALUES ('1440', '371001', '市辖区', '371000');
INSERT INTO `api_areas` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `api_areas` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `api_areas` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `api_areas` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `api_areas` VALUES ('1445', '371101', '市辖区', '371100');
INSERT INTO `api_areas` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `api_areas` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `api_areas` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `api_areas` VALUES ('1449', '371122', '莒　县', '371100');
INSERT INTO `api_areas` VALUES ('1450', '371201', '市辖区', '371200');
INSERT INTO `api_areas` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `api_areas` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `api_areas` VALUES ('1453', '371301', '市辖区', '371300');
INSERT INTO `api_areas` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `api_areas` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `api_areas` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `api_areas` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `api_areas` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `api_areas` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `api_areas` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `api_areas` VALUES ('1461', '371325', '费　县', '371300');
INSERT INTO `api_areas` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `api_areas` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `api_areas` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `api_areas` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `api_areas` VALUES ('1466', '371401', '市辖区', '371400');
INSERT INTO `api_areas` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `api_areas` VALUES ('1468', '371421', '陵　县', '371400');
INSERT INTO `api_areas` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `api_areas` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `api_areas` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `api_areas` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `api_areas` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `api_areas` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `api_areas` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `api_areas` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `api_areas` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `api_areas` VALUES ('1478', '371501', '市辖区', '371500');
INSERT INTO `api_areas` VALUES ('1479', '371502', '东昌府区', '371500');
INSERT INTO `api_areas` VALUES ('1480', '371521', '阳谷县', '371500');
INSERT INTO `api_areas` VALUES ('1481', '371522', '莘　县', '371500');
INSERT INTO `api_areas` VALUES ('1482', '371523', '茌平县', '371500');
INSERT INTO `api_areas` VALUES ('1483', '371524', '东阿县', '371500');
INSERT INTO `api_areas` VALUES ('1484', '371525', '冠　县', '371500');
INSERT INTO `api_areas` VALUES ('1485', '371526', '高唐县', '371500');
INSERT INTO `api_areas` VALUES ('1486', '371581', '临清市', '371500');
INSERT INTO `api_areas` VALUES ('1487', '371601', '市辖区', '371600');
INSERT INTO `api_areas` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `api_areas` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `api_areas` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `api_areas` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `api_areas` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `api_areas` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `api_areas` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `api_areas` VALUES ('1495', '371701', '市辖区', '371700');
INSERT INTO `api_areas` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `api_areas` VALUES ('1497', '371721', '曹　县', '371700');
INSERT INTO `api_areas` VALUES ('1498', '371722', '单　县', '371700');
INSERT INTO `api_areas` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `api_areas` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `api_areas` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `api_areas` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `api_areas` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `api_areas` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `api_areas` VALUES ('1505', '410101', '市辖区', '410100');
INSERT INTO `api_areas` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `api_areas` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `api_areas` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `api_areas` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `api_areas` VALUES ('1510', '410106', '上街区', '410100');
INSERT INTO `api_areas` VALUES ('1511', '410108', '邙山区', '410100');
INSERT INTO `api_areas` VALUES ('1512', '410122', '中牟县', '410100');
INSERT INTO `api_areas` VALUES ('1513', '410181', '巩义市', '410100');
INSERT INTO `api_areas` VALUES ('1514', '410182', '荥阳市', '410100');
INSERT INTO `api_areas` VALUES ('1515', '410183', '新密市', '410100');
INSERT INTO `api_areas` VALUES ('1516', '410184', '新郑市', '410100');
INSERT INTO `api_areas` VALUES ('1517', '410185', '登封市', '410100');
INSERT INTO `api_areas` VALUES ('1518', '410201', '市辖区', '410200');
INSERT INTO `api_areas` VALUES ('1519', '410202', '龙亭区', '410200');
INSERT INTO `api_areas` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `api_areas` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `api_areas` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `api_areas` VALUES ('1523', '410211', '郊　区', '410200');
INSERT INTO `api_areas` VALUES ('1524', '410221', '杞　县', '410200');
INSERT INTO `api_areas` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `api_areas` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `api_areas` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `api_areas` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `api_areas` VALUES ('1529', '410301', '市辖区', '410300');
INSERT INTO `api_areas` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `api_areas` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `api_areas` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `api_areas` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `api_areas` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `api_areas` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `api_areas` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `api_areas` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `api_areas` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `api_areas` VALUES ('1539', '410325', '嵩　县', '410300');
INSERT INTO `api_areas` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `api_areas` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `api_areas` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `api_areas` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `api_areas` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `api_areas` VALUES ('1545', '410401', '市辖区', '410400');
INSERT INTO `api_areas` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `api_areas` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `api_areas` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `api_areas` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `api_areas` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `api_areas` VALUES ('1551', '410422', '叶　县', '410400');
INSERT INTO `api_areas` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `api_areas` VALUES ('1553', '410425', '郏　县', '410400');
INSERT INTO `api_areas` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `api_areas` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `api_areas` VALUES ('1556', '410501', '市辖区', '410500');
INSERT INTO `api_areas` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `api_areas` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `api_areas` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `api_areas` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `api_areas` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `api_areas` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `api_areas` VALUES ('1563', '410526', '滑　县', '410500');
INSERT INTO `api_areas` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `api_areas` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `api_areas` VALUES ('1566', '410601', '市辖区', '410600');
INSERT INTO `api_areas` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `api_areas` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `api_areas` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `api_areas` VALUES ('1570', '410621', '浚　县', '410600');
INSERT INTO `api_areas` VALUES ('1571', '410622', '淇　县', '410600');
INSERT INTO `api_areas` VALUES ('1572', '410701', '市辖区', '410700');
INSERT INTO `api_areas` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `api_areas` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `api_areas` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `api_areas` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `api_areas` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `api_areas` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `api_areas` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `api_areas` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `api_areas` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `api_areas` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `api_areas` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `api_areas` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `api_areas` VALUES ('1585', '410801', '市辖区', '410800');
INSERT INTO `api_areas` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `api_areas` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `api_areas` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `api_areas` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `api_areas` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `api_areas` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `api_areas` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `api_areas` VALUES ('1593', '410825', '温　县', '410800');
INSERT INTO `api_areas` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `api_areas` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `api_areas` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `api_areas` VALUES ('1597', '410901', '市辖区', '410900');
INSERT INTO `api_areas` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `api_areas` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `api_areas` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `api_areas` VALUES ('1601', '410926', '范　县', '410900');
INSERT INTO `api_areas` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `api_areas` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `api_areas` VALUES ('1604', '411001', '市辖区', '411000');
INSERT INTO `api_areas` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `api_areas` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `api_areas` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `api_areas` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `api_areas` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `api_areas` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `api_areas` VALUES ('1611', '411101', '市辖区', '411100');
INSERT INTO `api_areas` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `api_areas` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `api_areas` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `api_areas` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `api_areas` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `api_areas` VALUES ('1617', '411201', '市辖区', '411200');
INSERT INTO `api_areas` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `api_areas` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `api_areas` VALUES ('1620', '411222', '陕　县', '411200');
INSERT INTO `api_areas` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `api_areas` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `api_areas` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `api_areas` VALUES ('1624', '411301', '市辖区', '411300');
INSERT INTO `api_areas` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `api_areas` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `api_areas` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `api_areas` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `api_areas` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `api_areas` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `api_areas` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `api_areas` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `api_areas` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `api_areas` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `api_areas` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `api_areas` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `api_areas` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `api_areas` VALUES ('1638', '411401', '市辖区', '411400');
INSERT INTO `api_areas` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `api_areas` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `api_areas` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `api_areas` VALUES ('1642', '411422', '睢　县', '411400');
INSERT INTO `api_areas` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `api_areas` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `api_areas` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `api_areas` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `api_areas` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `api_areas` VALUES ('1648', '411501', '市辖区', '411500');
INSERT INTO `api_areas` VALUES ('1649', '411502', '师河区', '411500');
INSERT INTO `api_areas` VALUES ('1650', '411503', '平桥区', '411500');
INSERT INTO `api_areas` VALUES ('1651', '411521', '罗山县', '411500');
INSERT INTO `api_areas` VALUES ('1652', '411522', '光山县', '411500');
INSERT INTO `api_areas` VALUES ('1653', '411523', '新　县', '411500');
INSERT INTO `api_areas` VALUES ('1654', '411524', '商城县', '411500');
INSERT INTO `api_areas` VALUES ('1655', '411525', '固始县', '411500');
INSERT INTO `api_areas` VALUES ('1656', '411526', '潢川县', '411500');
INSERT INTO `api_areas` VALUES ('1657', '411527', '淮滨县', '411500');
INSERT INTO `api_areas` VALUES ('1658', '411528', '息　县', '411500');
INSERT INTO `api_areas` VALUES ('1659', '411601', '市辖区', '411600');
INSERT INTO `api_areas` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `api_areas` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `api_areas` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `api_areas` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `api_areas` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `api_areas` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `api_areas` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `api_areas` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `api_areas` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `api_areas` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `api_areas` VALUES ('1670', '411701', '市辖区', '411700');
INSERT INTO `api_areas` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `api_areas` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `api_areas` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `api_areas` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `api_areas` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `api_areas` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `api_areas` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `api_areas` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `api_areas` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `api_areas` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `api_areas` VALUES ('1681', '420101', '市辖区', '420100');
INSERT INTO `api_areas` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `api_areas` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `api_areas` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `api_areas` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `api_areas` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `api_areas` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `api_areas` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `api_areas` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `api_areas` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `api_areas` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `api_areas` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `api_areas` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `api_areas` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `api_areas` VALUES ('1695', '420201', '市辖区', '420200');
INSERT INTO `api_areas` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `api_areas` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `api_areas` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `api_areas` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `api_areas` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `api_areas` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `api_areas` VALUES ('1702', '420301', '市辖区', '420300');
INSERT INTO `api_areas` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `api_areas` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `api_areas` VALUES ('1705', '420321', '郧　县', '420300');
INSERT INTO `api_areas` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `api_areas` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `api_areas` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `api_areas` VALUES ('1709', '420325', '房　县', '420300');
INSERT INTO `api_areas` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `api_areas` VALUES ('1711', '420501', '市辖区', '420500');
INSERT INTO `api_areas` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `api_areas` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `api_areas` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `api_areas` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `api_areas` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `api_areas` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `api_areas` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `api_areas` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `api_areas` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `api_areas` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `api_areas` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `api_areas` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `api_areas` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `api_areas` VALUES ('1725', '420601', '市辖区', '420600');
INSERT INTO `api_areas` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `api_areas` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `api_areas` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `api_areas` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `api_areas` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `api_areas` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `api_areas` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `api_areas` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `api_areas` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `api_areas` VALUES ('1735', '420701', '市辖区', '420700');
INSERT INTO `api_areas` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `api_areas` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `api_areas` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `api_areas` VALUES ('1739', '420801', '市辖区', '420800');
INSERT INTO `api_areas` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `api_areas` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `api_areas` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `api_areas` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `api_areas` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `api_areas` VALUES ('1745', '420901', '市辖区', '420900');
INSERT INTO `api_areas` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `api_areas` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `api_areas` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `api_areas` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `api_areas` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `api_areas` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `api_areas` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `api_areas` VALUES ('1753', '421001', '市辖区', '421000');
INSERT INTO `api_areas` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `api_areas` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `api_areas` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `api_areas` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `api_areas` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `api_areas` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `api_areas` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `api_areas` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `api_areas` VALUES ('1762', '421101', '市辖区', '421100');
INSERT INTO `api_areas` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `api_areas` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `api_areas` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `api_areas` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `api_areas` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `api_areas` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `api_areas` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `api_areas` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `api_areas` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `api_areas` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `api_areas` VALUES ('1773', '421201', '市辖区', '421200');
INSERT INTO `api_areas` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `api_areas` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `api_areas` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `api_areas` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `api_areas` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `api_areas` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `api_areas` VALUES ('1780', '421301', '市辖区', '421300');
INSERT INTO `api_areas` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `api_areas` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `api_areas` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `api_areas` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `api_areas` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `api_areas` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `api_areas` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `api_areas` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `api_areas` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `api_areas` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `api_areas` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `api_areas` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `api_areas` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `api_areas` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `api_areas` VALUES ('1795', '430101', '市辖区', '430100');
INSERT INTO `api_areas` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `api_areas` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `api_areas` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `api_areas` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `api_areas` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `api_areas` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `api_areas` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `api_areas` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `api_areas` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `api_areas` VALUES ('1805', '430201', '市辖区', '430200');
INSERT INTO `api_areas` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `api_areas` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `api_areas` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `api_areas` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `api_areas` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `api_areas` VALUES ('1811', '430223', '攸　县', '430200');
INSERT INTO `api_areas` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `api_areas` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `api_areas` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `api_areas` VALUES ('1815', '430301', '市辖区', '430300');
INSERT INTO `api_areas` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `api_areas` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `api_areas` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `api_areas` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `api_areas` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `api_areas` VALUES ('1821', '430401', '市辖区', '430400');
INSERT INTO `api_areas` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `api_areas` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `api_areas` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `api_areas` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `api_areas` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `api_areas` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `api_areas` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `api_areas` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `api_areas` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `api_areas` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `api_areas` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `api_areas` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `api_areas` VALUES ('1834', '430501', '市辖区', '430500');
INSERT INTO `api_areas` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `api_areas` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `api_areas` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `api_areas` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `api_areas` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `api_areas` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `api_areas` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `api_areas` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `api_areas` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `api_areas` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `api_areas` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `api_areas` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `api_areas` VALUES ('1847', '430601', '市辖区', '430600');
INSERT INTO `api_areas` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `api_areas` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `api_areas` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `api_areas` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `api_areas` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `api_areas` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `api_areas` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `api_areas` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `api_areas` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `api_areas` VALUES ('1857', '430701', '市辖区', '430700');
INSERT INTO `api_areas` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `api_areas` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `api_areas` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `api_areas` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `api_areas` VALUES ('1862', '430723', '澧　县', '430700');
INSERT INTO `api_areas` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `api_areas` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `api_areas` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `api_areas` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `api_areas` VALUES ('1867', '430801', '市辖区', '430800');
INSERT INTO `api_areas` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `api_areas` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `api_areas` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `api_areas` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `api_areas` VALUES ('1872', '430901', '市辖区', '430900');
INSERT INTO `api_areas` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `api_areas` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `api_areas` VALUES ('1875', '430921', '南　县', '430900');
INSERT INTO `api_areas` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `api_areas` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `api_areas` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `api_areas` VALUES ('1879', '431001', '市辖区', '431000');
INSERT INTO `api_areas` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `api_areas` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `api_areas` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `api_areas` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `api_areas` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `api_areas` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `api_areas` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `api_areas` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `api_areas` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `api_areas` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `api_areas` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `api_areas` VALUES ('1891', '431101', '市辖区', '431100');
INSERT INTO `api_areas` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `api_areas` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `api_areas` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `api_areas` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `api_areas` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `api_areas` VALUES ('1897', '431124', '道　县', '431100');
INSERT INTO `api_areas` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `api_areas` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `api_areas` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `api_areas` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `api_areas` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `api_areas` VALUES ('1903', '431201', '市辖区', '431200');
INSERT INTO `api_areas` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `api_areas` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `api_areas` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `api_areas` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `api_areas` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `api_areas` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `api_areas` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `api_areas` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `api_areas` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `api_areas` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `api_areas` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `api_areas` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `api_areas` VALUES ('1916', '431301', '市辖区', '431300');
INSERT INTO `api_areas` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `api_areas` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `api_areas` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `api_areas` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `api_areas` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `api_areas` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `api_areas` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `api_areas` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `api_areas` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `api_areas` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `api_areas` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `api_areas` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `api_areas` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `api_areas` VALUES ('1930', '440101', '市辖区', '440100');
INSERT INTO `api_areas` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `api_areas` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `api_areas` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `api_areas` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `api_areas` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `api_areas` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `api_areas` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `api_areas` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `api_areas` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `api_areas` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `api_areas` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `api_areas` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `api_areas` VALUES ('1943', '440201', '市辖区', '440200');
INSERT INTO `api_areas` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `api_areas` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `api_areas` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `api_areas` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `api_areas` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `api_areas` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `api_areas` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `api_areas` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `api_areas` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `api_areas` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `api_areas` VALUES ('1954', '440301', '市辖区', '440300');
INSERT INTO `api_areas` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `api_areas` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `api_areas` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `api_areas` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `api_areas` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `api_areas` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `api_areas` VALUES ('1961', '440401', '市辖区', '440400');
INSERT INTO `api_areas` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `api_areas` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `api_areas` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `api_areas` VALUES ('1965', '440501', '市辖区', '440500');
INSERT INTO `api_areas` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `api_areas` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `api_areas` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `api_areas` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `api_areas` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `api_areas` VALUES ('1971', '440515', '澄海区', '440500');
INSERT INTO `api_areas` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `api_areas` VALUES ('1973', '440601', '市辖区', '440600');
INSERT INTO `api_areas` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `api_areas` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `api_areas` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `api_areas` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `api_areas` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `api_areas` VALUES ('1979', '440701', '市辖区', '440700');
INSERT INTO `api_areas` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `api_areas` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `api_areas` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `api_areas` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `api_areas` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `api_areas` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `api_areas` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `api_areas` VALUES ('1987', '440801', '市辖区', '440800');
INSERT INTO `api_areas` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `api_areas` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `api_areas` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `api_areas` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `api_areas` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `api_areas` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `api_areas` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `api_areas` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `api_areas` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `api_areas` VALUES ('1997', '440901', '市辖区', '440900');
INSERT INTO `api_areas` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `api_areas` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `api_areas` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `api_areas` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `api_areas` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `api_areas` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `api_areas` VALUES ('2004', '441201', '市辖区', '441200');
INSERT INTO `api_areas` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `api_areas` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `api_areas` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `api_areas` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `api_areas` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `api_areas` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `api_areas` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `api_areas` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `api_areas` VALUES ('2013', '441301', '市辖区', '441300');
INSERT INTO `api_areas` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `api_areas` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `api_areas` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `api_areas` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `api_areas` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `api_areas` VALUES ('2019', '441401', '市辖区', '441400');
INSERT INTO `api_areas` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `api_areas` VALUES ('2021', '441421', '梅　县', '441400');
INSERT INTO `api_areas` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `api_areas` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `api_areas` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `api_areas` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `api_areas` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `api_areas` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `api_areas` VALUES ('2028', '441501', '市辖区', '441500');
INSERT INTO `api_areas` VALUES ('2029', '441502', '城　区', '441500');
INSERT INTO `api_areas` VALUES ('2030', '441521', '海丰县', '441500');
INSERT INTO `api_areas` VALUES ('2031', '441523', '陆河县', '441500');
INSERT INTO `api_areas` VALUES ('2032', '441581', '陆丰市', '441500');
INSERT INTO `api_areas` VALUES ('2033', '441601', '市辖区', '441600');
INSERT INTO `api_areas` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `api_areas` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `api_areas` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `api_areas` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `api_areas` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `api_areas` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `api_areas` VALUES ('2040', '441701', '市辖区', '441700');
INSERT INTO `api_areas` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `api_areas` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `api_areas` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `api_areas` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `api_areas` VALUES ('2045', '441801', '市辖区', '441800');
INSERT INTO `api_areas` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `api_areas` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `api_areas` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `api_areas` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `api_areas` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `api_areas` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `api_areas` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `api_areas` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `api_areas` VALUES ('2054', '445101', '市辖区', '445100');
INSERT INTO `api_areas` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `api_areas` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `api_areas` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `api_areas` VALUES ('2058', '445201', '市辖区', '445200');
INSERT INTO `api_areas` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `api_areas` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `api_areas` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `api_areas` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `api_areas` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `api_areas` VALUES ('2064', '445301', '市辖区', '445300');
INSERT INTO `api_areas` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `api_areas` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `api_areas` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `api_areas` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `api_areas` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `api_areas` VALUES ('2070', '450101', '市辖区', '450100');
INSERT INTO `api_areas` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `api_areas` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `api_areas` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `api_areas` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `api_areas` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `api_areas` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `api_areas` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `api_areas` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `api_areas` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `api_areas` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `api_areas` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `api_areas` VALUES ('2082', '450127', '横　县', '450100');
INSERT INTO `api_areas` VALUES ('2083', '450201', '市辖区', '450200');
INSERT INTO `api_areas` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `api_areas` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `api_areas` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `api_areas` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `api_areas` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `api_areas` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `api_areas` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `api_areas` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `api_areas` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `api_areas` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `api_areas` VALUES ('2094', '450301', '市辖区', '450300');
INSERT INTO `api_areas` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `api_areas` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `api_areas` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `api_areas` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `api_areas` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `api_areas` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `api_areas` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `api_areas` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `api_areas` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `api_areas` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `api_areas` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `api_areas` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `api_areas` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `api_areas` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `api_areas` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `api_areas` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `api_areas` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `api_areas` VALUES ('2112', '450401', '市辖区', '450400');
INSERT INTO `api_areas` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `api_areas` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `api_areas` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `api_areas` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `api_areas` VALUES ('2117', '450422', '藤　县', '450400');
INSERT INTO `api_areas` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `api_areas` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `api_areas` VALUES ('2120', '450501', '市辖区', '450500');
INSERT INTO `api_areas` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `api_areas` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `api_areas` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `api_areas` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `api_areas` VALUES ('2125', '450601', '市辖区', '450600');
INSERT INTO `api_areas` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `api_areas` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `api_areas` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `api_areas` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `api_areas` VALUES ('2130', '450701', '市辖区', '450700');
INSERT INTO `api_areas` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `api_areas` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `api_areas` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `api_areas` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `api_areas` VALUES ('2135', '450801', '市辖区', '450800');
INSERT INTO `api_areas` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `api_areas` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `api_areas` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `api_areas` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `api_areas` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `api_areas` VALUES ('2141', '450901', '市辖区', '450900');
INSERT INTO `api_areas` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `api_areas` VALUES ('2143', '450921', '容　县', '450900');
INSERT INTO `api_areas` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `api_areas` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `api_areas` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `api_areas` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `api_areas` VALUES ('2148', '451001', '市辖区', '451000');
INSERT INTO `api_areas` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `api_areas` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `api_areas` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `api_areas` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `api_areas` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `api_areas` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `api_areas` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `api_areas` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `api_areas` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `api_areas` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `api_areas` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `api_areas` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `api_areas` VALUES ('2161', '451101', '市辖区', '451100');
INSERT INTO `api_areas` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `api_areas` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `api_areas` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `api_areas` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `api_areas` VALUES ('2166', '451201', '市辖区', '451200');
INSERT INTO `api_areas` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `api_areas` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `api_areas` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `api_areas` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `api_areas` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `api_areas` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `api_areas` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `api_areas` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `api_areas` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `api_areas` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `api_areas` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `api_areas` VALUES ('2178', '451301', '市辖区', '451300');
INSERT INTO `api_areas` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `api_areas` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `api_areas` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `api_areas` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `api_areas` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `api_areas` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `api_areas` VALUES ('2185', '451401', '市辖区', '451400');
INSERT INTO `api_areas` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `api_areas` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `api_areas` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `api_areas` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `api_areas` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `api_areas` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `api_areas` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `api_areas` VALUES ('2193', '460101', '市辖区', '460100');
INSERT INTO `api_areas` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `api_areas` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `api_areas` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `api_areas` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `api_areas` VALUES ('2198', '460201', '市辖区', '460200');
INSERT INTO `api_areas` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `api_areas` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `api_areas` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `api_areas` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `api_areas` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `api_areas` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `api_areas` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `api_areas` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `api_areas` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `api_areas` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `api_areas` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `api_areas` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `api_areas` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `api_areas` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `api_areas` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `api_areas` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `api_areas` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `api_areas` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `api_areas` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `api_areas` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `api_areas` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `api_areas` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `api_areas` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `api_areas` VALUES ('2227', '500110', '万盛区', '500100');
INSERT INTO `api_areas` VALUES ('2228', '500111', '双桥区', '500100');
INSERT INTO `api_areas` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `api_areas` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `api_areas` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `api_areas` VALUES ('2232', '500115', '长寿区', '500100');
INSERT INTO `api_areas` VALUES ('2233', '500222', '綦江县', '500200');
INSERT INTO `api_areas` VALUES ('2234', '500223', '潼南县', '500200');
INSERT INTO `api_areas` VALUES ('2235', '500224', '铜梁县', '500200');
INSERT INTO `api_areas` VALUES ('2236', '500225', '大足县', '500200');
INSERT INTO `api_areas` VALUES ('2237', '500226', '荣昌县', '500200');
INSERT INTO `api_areas` VALUES ('2238', '500227', '璧山县', '500200');
INSERT INTO `api_areas` VALUES ('2239', '500228', '梁平县', '500200');
INSERT INTO `api_areas` VALUES ('2240', '500229', '城口县', '500200');
INSERT INTO `api_areas` VALUES ('2241', '500230', '丰都县', '500200');
INSERT INTO `api_areas` VALUES ('2242', '500231', '垫江县', '500200');
INSERT INTO `api_areas` VALUES ('2243', '500232', '武隆县', '500200');
INSERT INTO `api_areas` VALUES ('2244', '500233', '忠　县', '500200');
INSERT INTO `api_areas` VALUES ('2245', '500234', '开　县', '500200');
INSERT INTO `api_areas` VALUES ('2246', '500235', '云阳县', '500200');
INSERT INTO `api_areas` VALUES ('2247', '500236', '奉节县', '500200');
INSERT INTO `api_areas` VALUES ('2248', '500237', '巫山县', '500200');
INSERT INTO `api_areas` VALUES ('2249', '500238', '巫溪县', '500200');
INSERT INTO `api_areas` VALUES ('2250', '500240', '石柱土家族自治县', '500200');
INSERT INTO `api_areas` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `api_areas` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `api_areas` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `api_areas` VALUES ('2254', '500381', '江津市', '500300');
INSERT INTO `api_areas` VALUES ('2255', '500382', '合川市', '500300');
INSERT INTO `api_areas` VALUES ('2256', '500383', '永川市', '500300');
INSERT INTO `api_areas` VALUES ('2257', '500384', '南川市', '500300');
INSERT INTO `api_areas` VALUES ('2258', '510101', '市辖区', '510100');
INSERT INTO `api_areas` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `api_areas` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `api_areas` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `api_areas` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `api_areas` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `api_areas` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `api_areas` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `api_areas` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `api_areas` VALUES ('2267', '510115', '温江县', '510100');
INSERT INTO `api_areas` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `api_areas` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `api_areas` VALUES ('2270', '510124', '郫　县', '510100');
INSERT INTO `api_areas` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `api_areas` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `api_areas` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `api_areas` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `api_areas` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `api_areas` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `api_areas` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `api_areas` VALUES ('2278', '510301', '市辖区', '510300');
INSERT INTO `api_areas` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `api_areas` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `api_areas` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `api_areas` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `api_areas` VALUES ('2283', '510321', '荣　县', '510300');
INSERT INTO `api_areas` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `api_areas` VALUES ('2285', '510401', '市辖区', '510400');
INSERT INTO `api_areas` VALUES ('2286', '510402', '东　区', '510400');
INSERT INTO `api_areas` VALUES ('2287', '510403', '西　区', '510400');
INSERT INTO `api_areas` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `api_areas` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `api_areas` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `api_areas` VALUES ('2291', '510501', '市辖区', '510500');
INSERT INTO `api_areas` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `api_areas` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `api_areas` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `api_areas` VALUES ('2295', '510521', '泸　县', '510500');
INSERT INTO `api_areas` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `api_areas` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `api_areas` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `api_areas` VALUES ('2299', '510601', '市辖区', '510600');
INSERT INTO `api_areas` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `api_areas` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `api_areas` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `api_areas` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `api_areas` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `api_areas` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `api_areas` VALUES ('2306', '510701', '市辖区', '510700');
INSERT INTO `api_areas` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `api_areas` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `api_areas` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `api_areas` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `api_areas` VALUES ('2311', '510724', '安　县', '510700');
INSERT INTO `api_areas` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `api_areas` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `api_areas` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `api_areas` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `api_areas` VALUES ('2316', '510801', '市辖区', '510800');
INSERT INTO `api_areas` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `api_areas` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `api_areas` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `api_areas` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `api_areas` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `api_areas` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `api_areas` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `api_areas` VALUES ('2324', '510901', '市辖区', '510900');
INSERT INTO `api_areas` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `api_areas` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `api_areas` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `api_areas` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `api_areas` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `api_areas` VALUES ('2330', '511001', '市辖区', '511000');
INSERT INTO `api_areas` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `api_areas` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `api_areas` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `api_areas` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `api_areas` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `api_areas` VALUES ('2336', '511101', '市辖区', '511100');
INSERT INTO `api_areas` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `api_areas` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `api_areas` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `api_areas` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `api_areas` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `api_areas` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `api_areas` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `api_areas` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `api_areas` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `api_areas` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `api_areas` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `api_areas` VALUES ('2348', '511301', '市辖区', '511300');
INSERT INTO `api_areas` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `api_areas` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `api_areas` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `api_areas` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `api_areas` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `api_areas` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `api_areas` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `api_areas` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `api_areas` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `api_areas` VALUES ('2358', '511401', '市辖区', '511400');
INSERT INTO `api_areas` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `api_areas` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `api_areas` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `api_areas` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `api_areas` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `api_areas` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `api_areas` VALUES ('2365', '511501', '市辖区', '511500');
INSERT INTO `api_areas` VALUES ('2366', '511502', '翠屏区', '511500');
INSERT INTO `api_areas` VALUES ('2367', '511521', '宜宾县', '511500');
INSERT INTO `api_areas` VALUES ('2368', '511522', '南溪县', '511500');
INSERT INTO `api_areas` VALUES ('2369', '511523', '江安县', '511500');
INSERT INTO `api_areas` VALUES ('2370', '511524', '长宁县', '511500');
INSERT INTO `api_areas` VALUES ('2371', '511525', '高　县', '511500');
INSERT INTO `api_areas` VALUES ('2372', '511526', '珙　县', '511500');
INSERT INTO `api_areas` VALUES ('2373', '511527', '筠连县', '511500');
INSERT INTO `api_areas` VALUES ('2374', '511528', '兴文县', '511500');
INSERT INTO `api_areas` VALUES ('2375', '511529', '屏山县', '511500');
INSERT INTO `api_areas` VALUES ('2376', '511601', '市辖区', '511600');
INSERT INTO `api_areas` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `api_areas` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `api_areas` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `api_areas` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `api_areas` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `api_areas` VALUES ('2382', '511701', '市辖区', '511700');
INSERT INTO `api_areas` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `api_areas` VALUES ('2384', '511721', '达　县', '511700');
INSERT INTO `api_areas` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `api_areas` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `api_areas` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `api_areas` VALUES ('2388', '511725', '渠　县', '511700');
INSERT INTO `api_areas` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `api_areas` VALUES ('2390', '511801', '市辖区', '511800');
INSERT INTO `api_areas` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `api_areas` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `api_areas` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `api_areas` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `api_areas` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `api_areas` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `api_areas` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `api_areas` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `api_areas` VALUES ('2399', '511901', '市辖区', '511900');
INSERT INTO `api_areas` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `api_areas` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `api_areas` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `api_areas` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `api_areas` VALUES ('2404', '512001', '市辖区', '512000');
INSERT INTO `api_areas` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `api_areas` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `api_areas` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `api_areas` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `api_areas` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `api_areas` VALUES ('2410', '513222', '理　县', '513200');
INSERT INTO `api_areas` VALUES ('2411', '513223', '茂　县', '513200');
INSERT INTO `api_areas` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `api_areas` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `api_areas` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `api_areas` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `api_areas` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `api_areas` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `api_areas` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `api_areas` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `api_areas` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `api_areas` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `api_areas` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `api_areas` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `api_areas` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `api_areas` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `api_areas` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `api_areas` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `api_areas` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `api_areas` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `api_areas` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `api_areas` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `api_areas` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `api_areas` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `api_areas` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `api_areas` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `api_areas` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `api_areas` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `api_areas` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `api_areas` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `api_areas` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `api_areas` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `api_areas` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `api_areas` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `api_areas` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `api_areas` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `api_areas` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `api_areas` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `api_areas` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `api_areas` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `api_areas` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `api_areas` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `api_areas` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `api_areas` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `api_areas` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `api_areas` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `api_areas` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `api_areas` VALUES ('2457', '520101', '市辖区', '520100');
INSERT INTO `api_areas` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `api_areas` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `api_areas` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `api_areas` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `api_areas` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `api_areas` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `api_areas` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `api_areas` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `api_areas` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `api_areas` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `api_areas` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `api_areas` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `api_areas` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `api_areas` VALUES ('2471', '520222', '盘　县', '520200');
INSERT INTO `api_areas` VALUES ('2472', '520301', '市辖区', '520300');
INSERT INTO `api_areas` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `api_areas` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `api_areas` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `api_areas` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `api_areas` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `api_areas` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `api_areas` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `api_areas` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `api_areas` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `api_areas` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `api_areas` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `api_areas` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `api_areas` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `api_areas` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `api_areas` VALUES ('2487', '520401', '市辖区', '520400');
INSERT INTO `api_areas` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `api_areas` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `api_areas` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `api_areas` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `api_areas` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `api_areas` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `api_areas` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `api_areas` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `api_areas` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `api_areas` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `api_areas` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `api_areas` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `api_areas` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `api_areas` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `api_areas` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `api_areas` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `api_areas` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `api_areas` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `api_areas` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `api_areas` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `api_areas` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `api_areas` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `api_areas` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `api_areas` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `api_areas` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `api_areas` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `api_areas` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `api_areas` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `api_areas` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `api_areas` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `api_areas` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `api_areas` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `api_areas` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `api_areas` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `api_areas` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `api_areas` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `api_areas` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `api_areas` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `api_areas` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `api_areas` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `api_areas` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `api_areas` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `api_areas` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `api_areas` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `api_areas` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `api_areas` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `api_areas` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `api_areas` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `api_areas` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `api_areas` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `api_areas` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `api_areas` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `api_areas` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `api_areas` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `api_areas` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `api_areas` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `api_areas` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `api_areas` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `api_areas` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `api_areas` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `api_areas` VALUES ('2548', '530101', '市辖区', '530100');
INSERT INTO `api_areas` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `api_areas` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `api_areas` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `api_areas` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `api_areas` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `api_areas` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `api_areas` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `api_areas` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `api_areas` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `api_areas` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `api_areas` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `api_areas` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `api_areas` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `api_areas` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `api_areas` VALUES ('2563', '530301', '市辖区', '530300');
INSERT INTO `api_areas` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `api_areas` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `api_areas` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `api_areas` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `api_areas` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `api_areas` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `api_areas` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `api_areas` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `api_areas` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `api_areas` VALUES ('2573', '530401', '市辖区', '530400');
INSERT INTO `api_areas` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `api_areas` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `api_areas` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `api_areas` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `api_areas` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `api_areas` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `api_areas` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `api_areas` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `api_areas` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `api_areas` VALUES ('2583', '530501', '市辖区', '530500');
INSERT INTO `api_areas` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `api_areas` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `api_areas` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `api_areas` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `api_areas` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `api_areas` VALUES ('2589', '530601', '市辖区', '530600');
INSERT INTO `api_areas` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `api_areas` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `api_areas` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `api_areas` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `api_areas` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `api_areas` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `api_areas` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `api_areas` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `api_areas` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `api_areas` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `api_areas` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `api_areas` VALUES ('2601', '530701', '市辖区', '530700');
INSERT INTO `api_areas` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `api_areas` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `api_areas` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `api_areas` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `api_areas` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `api_areas` VALUES ('2607', '530801', '市辖区', '530800');
INSERT INTO `api_areas` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `api_areas` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `api_areas` VALUES ('2618', '530901', '市辖区', '530900');
INSERT INTO `api_areas` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `api_areas` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `api_areas` VALUES ('2621', '530922', '云　县', '530900');
INSERT INTO `api_areas` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `api_areas` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `api_areas` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `api_areas` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `api_areas` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `api_areas` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `api_areas` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `api_areas` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `api_areas` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `api_areas` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `api_areas` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `api_areas` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `api_areas` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `api_areas` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `api_areas` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `api_areas` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `api_areas` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `api_areas` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `api_areas` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `api_areas` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `api_areas` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `api_areas` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `api_areas` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `api_areas` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `api_areas` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `api_areas` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `api_areas` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `api_areas` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `api_areas` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `api_areas` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `api_areas` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `api_areas` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `api_areas` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `api_areas` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `api_areas` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `api_areas` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `api_areas` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `api_areas` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `api_areas` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `api_areas` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `api_areas` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `api_areas` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `api_areas` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `api_areas` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `api_areas` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `api_areas` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `api_areas` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `api_areas` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `api_areas` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `api_areas` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `api_areas` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `api_areas` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `api_areas` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `api_areas` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `api_areas` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `api_areas` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `api_areas` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `api_areas` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `api_areas` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `api_areas` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `api_areas` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `api_areas` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `api_areas` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `api_areas` VALUES ('2685', '540101', '市辖区', '540100');
INSERT INTO `api_areas` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `api_areas` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `api_areas` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `api_areas` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `api_areas` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `api_areas` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `api_areas` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `api_areas` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `api_areas` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `api_areas` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `api_areas` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `api_areas` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `api_areas` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `api_areas` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `api_areas` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `api_areas` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `api_areas` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `api_areas` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `api_areas` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `api_areas` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `api_areas` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `api_areas` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `api_areas` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `api_areas` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `api_areas` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `api_areas` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `api_areas` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `api_areas` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `api_areas` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `api_areas` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `api_areas` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `api_areas` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `api_areas` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `api_areas` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `api_areas` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `api_areas` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `api_areas` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `api_areas` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `api_areas` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `api_areas` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `api_areas` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `api_areas` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `api_areas` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `api_areas` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `api_areas` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `api_areas` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `api_areas` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `api_areas` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `api_areas` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `api_areas` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `api_areas` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `api_areas` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `api_areas` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `api_areas` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `api_areas` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `api_areas` VALUES ('2741', '542427', '索　县', '542400');
INSERT INTO `api_areas` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `api_areas` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `api_areas` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `api_areas` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `api_areas` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `api_areas` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `api_areas` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `api_areas` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `api_areas` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `api_areas` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `api_areas` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `api_areas` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `api_areas` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `api_areas` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `api_areas` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `api_areas` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `api_areas` VALUES ('2758', '542627', '朗　县', '542600');
INSERT INTO `api_areas` VALUES ('2759', '610101', '市辖区', '610100');
INSERT INTO `api_areas` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `api_areas` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `api_areas` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `api_areas` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `api_areas` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `api_areas` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `api_areas` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `api_areas` VALUES ('2767', '610115', '临潼区', '610100');
INSERT INTO `api_areas` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `api_areas` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `api_areas` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `api_areas` VALUES ('2771', '610125', '户　县', '610100');
INSERT INTO `api_areas` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `api_areas` VALUES ('2773', '610201', '市辖区', '610200');
INSERT INTO `api_areas` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `api_areas` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `api_areas` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `api_areas` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `api_areas` VALUES ('2778', '610301', '市辖区', '610300');
INSERT INTO `api_areas` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `api_areas` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `api_areas` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `api_areas` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `api_areas` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `api_areas` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `api_areas` VALUES ('2785', '610326', '眉　县', '610300');
INSERT INTO `api_areas` VALUES ('2786', '610327', '陇　县', '610300');
INSERT INTO `api_areas` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `api_areas` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `api_areas` VALUES ('2789', '610330', '凤　县', '610300');
INSERT INTO `api_areas` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `api_areas` VALUES ('2791', '610401', '市辖区', '610400');
INSERT INTO `api_areas` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `api_areas` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `api_areas` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `api_areas` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `api_areas` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `api_areas` VALUES ('2797', '610424', '乾　县', '610400');
INSERT INTO `api_areas` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `api_areas` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `api_areas` VALUES ('2800', '610427', '彬　县', '610400');
INSERT INTO `api_areas` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `api_areas` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `api_areas` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `api_areas` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `api_areas` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `api_areas` VALUES ('2806', '610501', '市辖区', '610500');
INSERT INTO `api_areas` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `api_areas` VALUES ('2808', '610521', '华　县', '610500');
INSERT INTO `api_areas` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `api_areas` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `api_areas` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `api_areas` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `api_areas` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `api_areas` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `api_areas` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `api_areas` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `api_areas` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `api_areas` VALUES ('2818', '610601', '市辖区', '610600');
INSERT INTO `api_areas` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `api_areas` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `api_areas` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `api_areas` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `api_areas` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `api_areas` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `api_areas` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `api_areas` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `api_areas` VALUES ('2827', '610628', '富　县', '610600');
INSERT INTO `api_areas` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `api_areas` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `api_areas` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `api_areas` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `api_areas` VALUES ('2832', '610701', '市辖区', '610700');
INSERT INTO `api_areas` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `api_areas` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `api_areas` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `api_areas` VALUES ('2836', '610723', '洋　县', '610700');
INSERT INTO `api_areas` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `api_areas` VALUES ('2838', '610725', '勉　县', '610700');
INSERT INTO `api_areas` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `api_areas` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `api_areas` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `api_areas` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `api_areas` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `api_areas` VALUES ('2844', '610801', '市辖区', '610800');
INSERT INTO `api_areas` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `api_areas` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `api_areas` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `api_areas` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `api_areas` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `api_areas` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `api_areas` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `api_areas` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `api_areas` VALUES ('2853', '610828', '佳　县', '610800');
INSERT INTO `api_areas` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `api_areas` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `api_areas` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `api_areas` VALUES ('2857', '610901', '市辖区', '610900');
INSERT INTO `api_areas` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `api_areas` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `api_areas` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `api_areas` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `api_areas` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `api_areas` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `api_areas` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `api_areas` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `api_areas` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `api_areas` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `api_areas` VALUES ('2868', '611001', '市辖区', '611000');
INSERT INTO `api_areas` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `api_areas` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `api_areas` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `api_areas` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `api_areas` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `api_areas` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `api_areas` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `api_areas` VALUES ('2876', '620101', '市辖区', '620100');
INSERT INTO `api_areas` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `api_areas` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `api_areas` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `api_areas` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `api_areas` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `api_areas` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `api_areas` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `api_areas` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `api_areas` VALUES ('2885', '620201', '市辖区', '620200');
INSERT INTO `api_areas` VALUES ('2886', '620301', '市辖区', '620300');
INSERT INTO `api_areas` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `api_areas` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `api_areas` VALUES ('2889', '620401', '市辖区', '620400');
INSERT INTO `api_areas` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `api_areas` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `api_areas` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `api_areas` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `api_areas` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `api_areas` VALUES ('2895', '620501', '市辖区', '620500');
INSERT INTO `api_areas` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `api_areas` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `api_areas` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `api_areas` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `api_areas` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `api_areas` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `api_areas` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `api_areas` VALUES ('2903', '620601', '市辖区', '620600');
INSERT INTO `api_areas` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `api_areas` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `api_areas` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `api_areas` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `api_areas` VALUES ('2908', '620701', '市辖区', '620700');
INSERT INTO `api_areas` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `api_areas` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `api_areas` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `api_areas` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `api_areas` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `api_areas` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `api_areas` VALUES ('2915', '620801', '市辖区', '620800');
INSERT INTO `api_areas` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `api_areas` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `api_areas` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `api_areas` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `api_areas` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `api_areas` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `api_areas` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `api_areas` VALUES ('2923', '620901', '市辖区', '620900');
INSERT INTO `api_areas` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `api_areas` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `api_areas` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `api_areas` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `api_areas` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `api_areas` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `api_areas` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `api_areas` VALUES ('2931', '621001', '市辖区', '621000');
INSERT INTO `api_areas` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `api_areas` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `api_areas` VALUES ('2934', '621022', '环　县', '621000');
INSERT INTO `api_areas` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `api_areas` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `api_areas` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `api_areas` VALUES ('2938', '621026', '宁　县', '621000');
INSERT INTO `api_areas` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `api_areas` VALUES ('2940', '621101', '市辖区', '621100');
INSERT INTO `api_areas` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `api_areas` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `api_areas` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `api_areas` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `api_areas` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `api_areas` VALUES ('2946', '621125', '漳　县', '621100');
INSERT INTO `api_areas` VALUES ('2947', '621126', '岷　县', '621100');
INSERT INTO `api_areas` VALUES ('2948', '621201', '市辖区', '621200');
INSERT INTO `api_areas` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `api_areas` VALUES ('2950', '621221', '成　县', '621200');
INSERT INTO `api_areas` VALUES ('2951', '621222', '文　县', '621200');
INSERT INTO `api_areas` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `api_areas` VALUES ('2953', '621224', '康　县', '621200');
INSERT INTO `api_areas` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `api_areas` VALUES ('2955', '621226', '礼　县', '621200');
INSERT INTO `api_areas` VALUES ('2956', '621227', '徽　县', '621200');
INSERT INTO `api_areas` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `api_areas` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `api_areas` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `api_areas` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `api_areas` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `api_areas` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `api_areas` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `api_areas` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `api_areas` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `api_areas` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `api_areas` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `api_areas` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `api_areas` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `api_areas` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `api_areas` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `api_areas` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `api_areas` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `api_areas` VALUES ('2974', '630101', '市辖区', '630100');
INSERT INTO `api_areas` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `api_areas` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `api_areas` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `api_areas` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `api_areas` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `api_areas` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `api_areas` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `api_areas` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `api_areas` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `api_areas` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `api_areas` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `api_areas` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `api_areas` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `api_areas` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `api_areas` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `api_areas` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `api_areas` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `api_areas` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `api_areas` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `api_areas` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `api_areas` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `api_areas` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `api_areas` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `api_areas` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `api_areas` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `api_areas` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `api_areas` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `api_areas` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `api_areas` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `api_areas` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `api_areas` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `api_areas` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `api_areas` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `api_areas` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `api_areas` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `api_areas` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `api_areas` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `api_areas` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `api_areas` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `api_areas` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `api_areas` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `api_areas` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `api_areas` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `api_areas` VALUES ('3018', '640101', '市辖区', '640100');
INSERT INTO `api_areas` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `api_areas` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `api_areas` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `api_areas` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `api_areas` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `api_areas` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `api_areas` VALUES ('3025', '640201', '市辖区', '640200');
INSERT INTO `api_areas` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `api_areas` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `api_areas` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `api_areas` VALUES ('3029', '640301', '市辖区', '640300');
INSERT INTO `api_areas` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `api_areas` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `api_areas` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `api_areas` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `api_areas` VALUES ('3034', '640401', '市辖区', '640400');
INSERT INTO `api_areas` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `api_areas` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `api_areas` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `api_areas` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `api_areas` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `api_areas` VALUES ('3040', '640501', '市辖区', '640500');
INSERT INTO `api_areas` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `api_areas` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `api_areas` VALUES ('3043', '640522', '海原县', '640400');
INSERT INTO `api_areas` VALUES ('3044', '650101', '市辖区', '650100');
INSERT INTO `api_areas` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `api_areas` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `api_areas` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `api_areas` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `api_areas` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `api_areas` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `api_areas` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `api_areas` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `api_areas` VALUES ('3053', '650201', '市辖区', '650200');
INSERT INTO `api_areas` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `api_areas` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `api_areas` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `api_areas` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `api_areas` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `api_areas` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `api_areas` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `api_areas` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `api_areas` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `api_areas` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `api_areas` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `api_areas` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `api_areas` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `api_areas` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `api_areas` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `api_areas` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `api_areas` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `api_areas` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `api_areas` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `api_areas` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `api_areas` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `api_areas` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `api_areas` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `api_areas` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `api_areas` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `api_areas` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `api_areas` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `api_areas` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `api_areas` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `api_areas` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `api_areas` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `api_areas` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `api_areas` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `api_areas` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `api_areas` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `api_areas` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `api_areas` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `api_areas` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `api_areas` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `api_areas` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `api_areas` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `api_areas` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `api_areas` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `api_areas` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `api_areas` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `api_areas` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `api_areas` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `api_areas` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `api_areas` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `api_areas` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `api_areas` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `api_areas` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `api_areas` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `api_areas` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `api_areas` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `api_areas` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `api_areas` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `api_areas` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `api_areas` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `api_areas` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `api_areas` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `api_areas` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `api_areas` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `api_areas` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `api_areas` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `api_areas` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `api_areas` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `api_areas` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `api_areas` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `api_areas` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `api_areas` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `api_areas` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `api_areas` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `api_areas` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `api_areas` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `api_areas` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `api_areas` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `api_areas` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `api_areas` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `api_areas` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `api_areas` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `api_areas` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `api_areas` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `api_areas` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `api_areas` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `api_areas` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `api_areas` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `api_areas` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `api_areas` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `api_areas` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `api_areas` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for api_article_publish
-- ----------------------------
DROP TABLE IF EXISTS `api_article_publish`;
CREATE TABLE `api_article_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息发布表自增id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `content` text NOT NULL COMMENT '发布内容',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格(单位元)',
  `article_type` varchar(30) NOT NULL COMMENT '内容类型(POINT:知识点;WT:词组;SENTENCE:句子;ARTICLE:文章;)',
  `show_status` int(1) NOT NULL DEFAULT '1' COMMENT '显示状态(1,上线;2,下线)',
  `class_id` int(11) NOT NULL COMMENT '级别(年级)id',
  `versions_id` int(11) NOT NULL COMMENT '版本id',
  `subject_id` int(11) NOT NULL COMMENT '科目id',
  `read_num` int(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `collect_num` int(20) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `share_num` int(20) NOT NULL DEFAULT '0' COMMENT '分享量',
  `pub_userid` int(11) NOT NULL COMMENT '发布人id',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_article_publish
-- ----------------------------
INSERT INTO `api_article_publish` VALUES ('1', '你好', null, '我们是社会主义接班人', null, 'POINT', '2', '1', '1', '1', '1', '1', '1', '1', '1568947854');
INSERT INTO `api_article_publish` VALUES ('2', '我好了', null, '你怎么样啊', null, 'POINT', '1', '1', '1', '1', '1', '1', '1', '1', '1564875654');
INSERT INTO `api_article_publish` VALUES ('3', '第三条', null, '记录', null, 'POINT', '1', '1', '1', '1', '1', '1', '1', '1', '1526345698');
INSERT INTO `api_article_publish` VALUES ('4', '我们是好人', 'http://localhost/education/Public/articlePublish/knowledge//5bc974a34ad23.jpg', '&lt;p&gt;第三方&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539929256');
INSERT INTO `api_article_publish` VALUES ('5', '天涯', 'http://localhost/education/Public/articlePublish/knowledge//5bc97547389a3.jpg', '&lt;p&gt;我的测试啊啊&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539929424');
INSERT INTO `api_article_publish` VALUES ('6', '怎么回事', 'http://localhost/education/Public/articlePublish/knowledge//5bc97579e33b7.jpg', '&lt;p&gt;管不是啊韩国啊&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539929480');
INSERT INTO `api_article_publish` VALUES ('7', '还不管', 'http://localhost/education/Public/articlePublish/knowledge//5bc977cb7ea26.jpg', '&lt;p&gt;打发问问&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539930065');
INSERT INTO `api_article_publish` VALUES ('8', '天涯', 'http://localhost/education/Public/articlePublish/knowledge//5bc9797f9fd2f.jpg', '&lt;p&gt;水电费&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539930521');
INSERT INTO `api_article_publish` VALUES ('9', '丢三落四', 'http://localhost/education/Public/articlePublish/knowledge//5bc97a9f80ee9.jpg', '&lt;p&gt;宽度润肺&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539930789');
INSERT INTO `api_article_publish` VALUES ('10', '我们是好人', 'http://localhost/education/Public/articlePublish/knowledge//5bc97b639f03a.jpg', '&lt;p&gt;色弱水电费&lt;/p&gt;', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539930983');
INSERT INTO `api_article_publish` VALUES ('11', '你', 'http://localhost/education/Public/articlePublish/knowledge//5bc97cc05bdcc.jpg', '&lt;p&gt;我表个人&lt;/p&gt;', null, 'POINT', '2', '1', '1', '1', '0', '0', '0', '1', '1539931335');
INSERT INTO `api_article_publish` VALUES ('12', 'KK ', 'http://localhost/education/Public/articlePublish/knowledge//5bc98cf224791.jpg', '&lt;p&gt;&amp;lt;p&amp;gt;WOKDOFEAKDKFDK&amp;lt;/p&amp;gt;&lt;/p&gt;', null, 'POINT', '2', '1', '1', '1', '0', '0', '0', '1', '1539935060');
INSERT INTO `api_article_publish` VALUES ('13', '我们是好人', 'http://localhost/education/Public/articlePublish/knowledge//5bc9916c756bf.jpg', '&lt;p&gt;w&lt;/p&gt;', null, 'POINT', '2', '1', '1', '1', '0', '0', '0', '1', '1539936632');
INSERT INTO `api_article_publish` VALUES ('14', '我们是好人', 'http://localhost/education/Public/articlePublish/knowledge//5bc99253075c2.jpg', '', null, 'POINT', '1', '1', '1', '1', '0', '0', '0', '1', '1539936870');
INSERT INTO `api_article_publish` VALUES ('15', '还不管', 'http://localhost/education/Public/articlePublish/knowledge//5bc992ad3d5aa.jpg', '', null, 'POINT', '2', '1', '1', '1', '0', '0', '0', '1', '1539936992');
INSERT INTO `api_article_publish` VALUES ('16', '你', null, '&lt;p&gt;DFEW大范围&lt;/p&gt;', null, 'POINT', '2', '1', '1', '1', '0', '0', '0', '1', '1540118533');
INSERT INTO `api_article_publish` VALUES ('17', '句子一', 'http://localhost/education/Public/articlePublish/knowledge//5bcc71c2c97ed.jpg', '&lt;p&gt;我的美女很好看&lt;/p&gt;', null, 'SENTENCE', '2', '1', '1', '1', '0', '0', '0', '1', '1540125137');
INSERT INTO `api_article_publish` VALUES ('18', '句子二', 'http://localhost/education/Public/articlePublish/knowledge//5bcc721c680f9.jpg', '&lt;p&gt;大姐夫IE魏千雅额外&lt;/p&gt;', null, 'SENTENCE', '2', '1', '1', '1', '0', '0', '0', '1', '1540125219');
INSERT INTO `api_article_publish` VALUES ('19', '年后啊啊', 'http://localhost/education/Public/articlePublish/knowledge//5bcc724dd8072.jpg', '&lt;p&gt;殷桃&lt;/p&gt;', null, 'SENTENCE', '2', '1', '1', '1', '0', '0', '0', '1', '1540125268');
INSERT INTO `api_article_publish` VALUES ('20', '你很好', 'http://localhost/education/Public/uplods/articlePublish/Words//5bcc77770b3a0.jpg', '&lt;p&gt;眼泪分解&lt;/p&gt;', null, 'WT', '2', '1', '1', '1', '0', '0', '0', '1', '1540126596');
INSERT INTO `api_article_publish` VALUES ('21', '词组一个', 'http://localhost/education/Public/uplods/articlePublish/Words//5bcc77c7b8b79.jpg', '&lt;p&gt;检查&lt;/p&gt;', null, 'WT', '2', '1', '1', '1', '0', '0', '0', '1', '1540126669');
INSERT INTO `api_article_publish` VALUES ('22', '我的老师', 'http://localhost/education/Public/uploads/articlePublish/article//5bcc7bd2b3e91.jpg', '&lt;p&gt;从前有座山&lt;/p&gt;', null, 'ARTICLE', '2', '1', '1', '1', '0', '0', '0', '1', '1540127716');
INSERT INTO `api_article_publish` VALUES ('23', '上上', 'http://localhost/education/Public/uploads/articlePublish/article//5bcc7bf60fc18.jpg', '&lt;p&gt;山上有个庙,庙里有个老和尚的&lt;/p&gt;', null, 'ARTICLE', '1', '1', '1', '1', '0', '0', '0', '1', '1540127749');

-- ----------------------------
-- Table structure for api_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `api_auth_group`;
CREATE TABLE `api_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '组名称',
  `description` varchar(50) NOT NULL COMMENT '组描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of api_auth_group
-- ----------------------------
INSERT INTO `api_auth_group` VALUES ('1', '学生管理', '管理学生', '1');

-- ----------------------------
-- Table structure for api_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `api_auth_group_access`;
CREATE TABLE `api_auth_group_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `groupId` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户和组的对应关系';

-- ----------------------------
-- Records of api_auth_group_access
-- ----------------------------
INSERT INTO `api_auth_group_access` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for api_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `api_auth_rule`;
CREATE TABLE `api_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `url` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `groupId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限所属组的ID',
  `auth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限数值',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限细节';

-- ----------------------------
-- Records of api_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for api_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `api_bankcard`;
CREATE TABLE `api_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '银行卡信息表自增id',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `bank_name` varchar(50) NOT NULL COMMENT '银行名称',
  `bank_card` varchar(30) NOT NULL COMMENT '卡号',
  `ID_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `Acc_open` varchar(255) NOT NULL COMMENT '开户网点',
  `audit_status` varchar(20) NOT NULL DEFAULT 'W' COMMENT '审核状态(W:待审核;S:审核通过;R:未通过;)',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_bankcard
-- ----------------------------
INSERT INTO `api_bankcard` VALUES ('1', '小王', '1365485468', '华夏', '622546548754698544585', '33', '1', '石家庄', 'S', '1564584965');

-- ----------------------------
-- Table structure for api_browse
-- ----------------------------
DROP TABLE IF EXISTS `api_browse`;
CREATE TABLE `api_browse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '浏览记录表自增id',
  `item_type` varchar(20) NOT NULL COMMENT '收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆',
  `pub_type` varchar(30) NOT NULL COMMENT '发布人的类型(COM:机构;TEA:老师;STU:学生,AD:后台)',
  `item_id` int(11) NOT NULL COMMENT '浏览项目id',
  `user_id` int(11) NOT NULL COMMENT '浏览人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_browse
-- ----------------------------

-- ----------------------------
-- Table structure for api_cities
-- ----------------------------
DROP TABLE IF EXISTS `api_cities`;
CREATE TABLE `api_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `provinceid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of api_cities
-- ----------------------------
INSERT INTO `api_cities` VALUES ('1', '110100', '市辖区', '110000');
INSERT INTO `api_cities` VALUES ('2', '110200', '县', '110000');
INSERT INTO `api_cities` VALUES ('3', '120100', '市辖区', '120000');
INSERT INTO `api_cities` VALUES ('4', '120200', '县', '120000');
INSERT INTO `api_cities` VALUES ('5', '130100', '石家庄市', '130000');
INSERT INTO `api_cities` VALUES ('6', '130200', '唐山市', '130000');
INSERT INTO `api_cities` VALUES ('7', '130300', '秦皇岛市', '130000');
INSERT INTO `api_cities` VALUES ('8', '130400', '邯郸市', '130000');
INSERT INTO `api_cities` VALUES ('9', '130500', '邢台市', '130000');
INSERT INTO `api_cities` VALUES ('10', '130600', '保定市', '130000');
INSERT INTO `api_cities` VALUES ('11', '130700', '张家口市', '130000');
INSERT INTO `api_cities` VALUES ('12', '130800', '承德市', '130000');
INSERT INTO `api_cities` VALUES ('13', '130900', '沧州市', '130000');
INSERT INTO `api_cities` VALUES ('14', '131000', '廊坊市', '130000');
INSERT INTO `api_cities` VALUES ('15', '131100', '衡水市', '130000');
INSERT INTO `api_cities` VALUES ('16', '140100', '太原市', '140000');
INSERT INTO `api_cities` VALUES ('17', '140200', '大同市', '140000');
INSERT INTO `api_cities` VALUES ('18', '140300', '阳泉市', '140000');
INSERT INTO `api_cities` VALUES ('19', '140400', '长治市', '140000');
INSERT INTO `api_cities` VALUES ('20', '140500', '晋城市', '140000');
INSERT INTO `api_cities` VALUES ('21', '140600', '朔州市', '140000');
INSERT INTO `api_cities` VALUES ('22', '140700', '晋中市', '140000');
INSERT INTO `api_cities` VALUES ('23', '140800', '运城市', '140000');
INSERT INTO `api_cities` VALUES ('24', '140900', '忻州市', '140000');
INSERT INTO `api_cities` VALUES ('25', '141000', '临汾市', '140000');
INSERT INTO `api_cities` VALUES ('26', '141100', '吕梁市', '140000');
INSERT INTO `api_cities` VALUES ('27', '150100', '呼和浩特市', '150000');
INSERT INTO `api_cities` VALUES ('28', '150200', '包头市', '150000');
INSERT INTO `api_cities` VALUES ('29', '150300', '乌海市', '150000');
INSERT INTO `api_cities` VALUES ('30', '150400', '赤峰市', '150000');
INSERT INTO `api_cities` VALUES ('31', '150500', '通辽市', '150000');
INSERT INTO `api_cities` VALUES ('32', '150600', '鄂尔多斯市', '150000');
INSERT INTO `api_cities` VALUES ('33', '150700', '呼伦贝尔市', '150000');
INSERT INTO `api_cities` VALUES ('34', '150800', '巴彦淖尔市', '150000');
INSERT INTO `api_cities` VALUES ('35', '150900', '乌兰察布市', '150000');
INSERT INTO `api_cities` VALUES ('36', '152200', '兴安盟', '150000');
INSERT INTO `api_cities` VALUES ('37', '152500', '锡林郭勒盟', '150000');
INSERT INTO `api_cities` VALUES ('38', '152900', '阿拉善盟', '150000');
INSERT INTO `api_cities` VALUES ('39', '210100', '沈阳市', '210000');
INSERT INTO `api_cities` VALUES ('40', '210200', '大连市', '210000');
INSERT INTO `api_cities` VALUES ('41', '210300', '鞍山市', '210000');
INSERT INTO `api_cities` VALUES ('42', '210400', '抚顺市', '210000');
INSERT INTO `api_cities` VALUES ('43', '210500', '本溪市', '210000');
INSERT INTO `api_cities` VALUES ('44', '210600', '丹东市', '210000');
INSERT INTO `api_cities` VALUES ('45', '210700', '锦州市', '210000');
INSERT INTO `api_cities` VALUES ('46', '210800', '营口市', '210000');
INSERT INTO `api_cities` VALUES ('47', '210900', '阜新市', '210000');
INSERT INTO `api_cities` VALUES ('48', '211000', '辽阳市', '210000');
INSERT INTO `api_cities` VALUES ('49', '211100', '盘锦市', '210000');
INSERT INTO `api_cities` VALUES ('50', '211200', '铁岭市', '210000');
INSERT INTO `api_cities` VALUES ('51', '211300', '朝阳市', '210000');
INSERT INTO `api_cities` VALUES ('52', '211400', '葫芦岛市', '210000');
INSERT INTO `api_cities` VALUES ('53', '220100', '长春市', '220000');
INSERT INTO `api_cities` VALUES ('54', '220200', '吉林市', '220000');
INSERT INTO `api_cities` VALUES ('55', '220300', '四平市', '220000');
INSERT INTO `api_cities` VALUES ('56', '220400', '辽源市', '220000');
INSERT INTO `api_cities` VALUES ('57', '220500', '通化市', '220000');
INSERT INTO `api_cities` VALUES ('58', '220600', '白山市', '220000');
INSERT INTO `api_cities` VALUES ('59', '220700', '松原市', '220000');
INSERT INTO `api_cities` VALUES ('60', '220800', '白城市', '220000');
INSERT INTO `api_cities` VALUES ('61', '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `api_cities` VALUES ('62', '230100', '哈尔滨市', '230000');
INSERT INTO `api_cities` VALUES ('63', '230200', '齐齐哈尔市', '230000');
INSERT INTO `api_cities` VALUES ('64', '230300', '鸡西市', '230000');
INSERT INTO `api_cities` VALUES ('65', '230400', '鹤岗市', '230000');
INSERT INTO `api_cities` VALUES ('66', '230500', '双鸭山市', '230000');
INSERT INTO `api_cities` VALUES ('67', '230600', '大庆市', '230000');
INSERT INTO `api_cities` VALUES ('68', '230700', '伊春市', '230000');
INSERT INTO `api_cities` VALUES ('69', '230800', '佳木斯市', '230000');
INSERT INTO `api_cities` VALUES ('70', '230900', '七台河市', '230000');
INSERT INTO `api_cities` VALUES ('71', '231000', '牡丹江市', '230000');
INSERT INTO `api_cities` VALUES ('72', '231100', '黑河市', '230000');
INSERT INTO `api_cities` VALUES ('73', '231200', '绥化市', '230000');
INSERT INTO `api_cities` VALUES ('74', '232700', '大兴安岭地区', '230000');
INSERT INTO `api_cities` VALUES ('75', '310100', '市辖区', '310000');
INSERT INTO `api_cities` VALUES ('76', '310200', '县', '310000');
INSERT INTO `api_cities` VALUES ('77', '320100', '南京市', '320000');
INSERT INTO `api_cities` VALUES ('78', '320200', '无锡市', '320000');
INSERT INTO `api_cities` VALUES ('79', '320300', '徐州市', '320000');
INSERT INTO `api_cities` VALUES ('80', '320400', '常州市', '320000');
INSERT INTO `api_cities` VALUES ('81', '320500', '苏州市', '320000');
INSERT INTO `api_cities` VALUES ('82', '320600', '南通市', '320000');
INSERT INTO `api_cities` VALUES ('83', '320700', '连云港市', '320000');
INSERT INTO `api_cities` VALUES ('84', '320800', '淮安市', '320000');
INSERT INTO `api_cities` VALUES ('85', '320900', '盐城市', '320000');
INSERT INTO `api_cities` VALUES ('86', '321000', '扬州市', '320000');
INSERT INTO `api_cities` VALUES ('87', '321100', '镇江市', '320000');
INSERT INTO `api_cities` VALUES ('88', '321200', '泰州市', '320000');
INSERT INTO `api_cities` VALUES ('89', '321300', '宿迁市', '320000');
INSERT INTO `api_cities` VALUES ('90', '330100', '杭州市', '330000');
INSERT INTO `api_cities` VALUES ('91', '330200', '宁波市', '330000');
INSERT INTO `api_cities` VALUES ('92', '330300', '温州市', '330000');
INSERT INTO `api_cities` VALUES ('93', '330400', '嘉兴市', '330000');
INSERT INTO `api_cities` VALUES ('94', '330500', '湖州市', '330000');
INSERT INTO `api_cities` VALUES ('95', '330600', '绍兴市', '330000');
INSERT INTO `api_cities` VALUES ('96', '330700', '金华市', '330000');
INSERT INTO `api_cities` VALUES ('97', '330800', '衢州市', '330000');
INSERT INTO `api_cities` VALUES ('98', '330900', '舟山市', '330000');
INSERT INTO `api_cities` VALUES ('99', '331000', '台州市', '330000');
INSERT INTO `api_cities` VALUES ('100', '331100', '丽水市', '330000');
INSERT INTO `api_cities` VALUES ('101', '340100', '合肥市', '340000');
INSERT INTO `api_cities` VALUES ('102', '340200', '芜湖市', '340000');
INSERT INTO `api_cities` VALUES ('103', '340300', '蚌埠市', '340000');
INSERT INTO `api_cities` VALUES ('104', '340400', '淮南市', '340000');
INSERT INTO `api_cities` VALUES ('105', '340500', '马鞍山市', '340000');
INSERT INTO `api_cities` VALUES ('106', '340600', '淮北市', '340000');
INSERT INTO `api_cities` VALUES ('107', '340700', '铜陵市', '340000');
INSERT INTO `api_cities` VALUES ('108', '340800', '安庆市', '340000');
INSERT INTO `api_cities` VALUES ('109', '341000', '黄山市', '340000');
INSERT INTO `api_cities` VALUES ('110', '341100', '滁州市', '340000');
INSERT INTO `api_cities` VALUES ('111', '341200', '阜阳市', '340000');
INSERT INTO `api_cities` VALUES ('112', '341300', '宿州市', '340000');
INSERT INTO `api_cities` VALUES ('113', '341400', '巢湖市', '340000');
INSERT INTO `api_cities` VALUES ('114', '341500', '六安市', '340000');
INSERT INTO `api_cities` VALUES ('115', '341600', '亳州市', '340000');
INSERT INTO `api_cities` VALUES ('116', '341700', '池州市', '340000');
INSERT INTO `api_cities` VALUES ('117', '341800', '宣城市', '340000');
INSERT INTO `api_cities` VALUES ('118', '350100', '福州市', '350000');
INSERT INTO `api_cities` VALUES ('119', '350200', '厦门市', '350000');
INSERT INTO `api_cities` VALUES ('120', '350300', '莆田市', '350000');
INSERT INTO `api_cities` VALUES ('121', '350400', '三明市', '350000');
INSERT INTO `api_cities` VALUES ('122', '350500', '泉州市', '350000');
INSERT INTO `api_cities` VALUES ('123', '350600', '漳州市', '350000');
INSERT INTO `api_cities` VALUES ('124', '350700', '南平市', '350000');
INSERT INTO `api_cities` VALUES ('125', '350800', '龙岩市', '350000');
INSERT INTO `api_cities` VALUES ('126', '350900', '宁德市', '350000');
INSERT INTO `api_cities` VALUES ('127', '360100', '南昌市', '360000');
INSERT INTO `api_cities` VALUES ('128', '360200', '景德镇市', '360000');
INSERT INTO `api_cities` VALUES ('129', '360300', '萍乡市', '360000');
INSERT INTO `api_cities` VALUES ('130', '360400', '九江市', '360000');
INSERT INTO `api_cities` VALUES ('131', '360500', '新余市', '360000');
INSERT INTO `api_cities` VALUES ('132', '360600', '鹰潭市', '360000');
INSERT INTO `api_cities` VALUES ('133', '360700', '赣州市', '360000');
INSERT INTO `api_cities` VALUES ('134', '360800', '吉安市', '360000');
INSERT INTO `api_cities` VALUES ('135', '360900', '宜春市', '360000');
INSERT INTO `api_cities` VALUES ('136', '361000', '抚州市', '360000');
INSERT INTO `api_cities` VALUES ('137', '361100', '上饶市', '360000');
INSERT INTO `api_cities` VALUES ('138', '370100', '济南市', '370000');
INSERT INTO `api_cities` VALUES ('139', '370200', '青岛市', '370000');
INSERT INTO `api_cities` VALUES ('140', '370300', '淄博市', '370000');
INSERT INTO `api_cities` VALUES ('141', '370400', '枣庄市', '370000');
INSERT INTO `api_cities` VALUES ('142', '370500', '东营市', '370000');
INSERT INTO `api_cities` VALUES ('143', '370600', '烟台市', '370000');
INSERT INTO `api_cities` VALUES ('144', '370700', '潍坊市', '370000');
INSERT INTO `api_cities` VALUES ('145', '370800', '济宁市', '370000');
INSERT INTO `api_cities` VALUES ('146', '370900', '泰安市', '370000');
INSERT INTO `api_cities` VALUES ('147', '371000', '威海市', '370000');
INSERT INTO `api_cities` VALUES ('148', '371100', '日照市', '370000');
INSERT INTO `api_cities` VALUES ('149', '371200', '莱芜市', '370000');
INSERT INTO `api_cities` VALUES ('150', '371300', '临沂市', '370000');
INSERT INTO `api_cities` VALUES ('151', '371400', '德州市', '370000');
INSERT INTO `api_cities` VALUES ('152', '371500', '聊城市', '370000');
INSERT INTO `api_cities` VALUES ('153', '371600', '滨州市', '370000');
INSERT INTO `api_cities` VALUES ('154', '371700', '荷泽市', '370000');
INSERT INTO `api_cities` VALUES ('155', '410100', '郑州市', '410000');
INSERT INTO `api_cities` VALUES ('156', '410200', '开封市', '410000');
INSERT INTO `api_cities` VALUES ('157', '410300', '洛阳市', '410000');
INSERT INTO `api_cities` VALUES ('158', '410400', '平顶山市', '410000');
INSERT INTO `api_cities` VALUES ('159', '410500', '安阳市', '410000');
INSERT INTO `api_cities` VALUES ('160', '410600', '鹤壁市', '410000');
INSERT INTO `api_cities` VALUES ('161', '410700', '新乡市', '410000');
INSERT INTO `api_cities` VALUES ('162', '410800', '焦作市', '410000');
INSERT INTO `api_cities` VALUES ('163', '410900', '濮阳市', '410000');
INSERT INTO `api_cities` VALUES ('164', '411000', '许昌市', '410000');
INSERT INTO `api_cities` VALUES ('165', '411100', '漯河市', '410000');
INSERT INTO `api_cities` VALUES ('166', '411200', '三门峡市', '410000');
INSERT INTO `api_cities` VALUES ('167', '411300', '南阳市', '410000');
INSERT INTO `api_cities` VALUES ('168', '411400', '商丘市', '410000');
INSERT INTO `api_cities` VALUES ('169', '411500', '信阳市', '410000');
INSERT INTO `api_cities` VALUES ('170', '411600', '周口市', '410000');
INSERT INTO `api_cities` VALUES ('171', '411700', '驻马店市', '410000');
INSERT INTO `api_cities` VALUES ('172', '420100', '武汉市', '420000');
INSERT INTO `api_cities` VALUES ('173', '420200', '黄石市', '420000');
INSERT INTO `api_cities` VALUES ('174', '420300', '十堰市', '420000');
INSERT INTO `api_cities` VALUES ('175', '420500', '宜昌市', '420000');
INSERT INTO `api_cities` VALUES ('176', '420600', '襄樊市', '420000');
INSERT INTO `api_cities` VALUES ('177', '420700', '鄂州市', '420000');
INSERT INTO `api_cities` VALUES ('178', '420800', '荆门市', '420000');
INSERT INTO `api_cities` VALUES ('179', '420900', '孝感市', '420000');
INSERT INTO `api_cities` VALUES ('180', '421000', '荆州市', '420000');
INSERT INTO `api_cities` VALUES ('181', '421100', '黄冈市', '420000');
INSERT INTO `api_cities` VALUES ('182', '421200', '咸宁市', '420000');
INSERT INTO `api_cities` VALUES ('183', '421300', '随州市', '420000');
INSERT INTO `api_cities` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `api_cities` VALUES ('185', '429000', '省直辖行政单位', '420000');
INSERT INTO `api_cities` VALUES ('186', '430100', '长沙市', '430000');
INSERT INTO `api_cities` VALUES ('187', '430200', '株洲市', '430000');
INSERT INTO `api_cities` VALUES ('188', '430300', '湘潭市', '430000');
INSERT INTO `api_cities` VALUES ('189', '430400', '衡阳市', '430000');
INSERT INTO `api_cities` VALUES ('190', '430500', '邵阳市', '430000');
INSERT INTO `api_cities` VALUES ('191', '430600', '岳阳市', '430000');
INSERT INTO `api_cities` VALUES ('192', '430700', '常德市', '430000');
INSERT INTO `api_cities` VALUES ('193', '430800', '张家界市', '430000');
INSERT INTO `api_cities` VALUES ('194', '430900', '益阳市', '430000');
INSERT INTO `api_cities` VALUES ('195', '431000', '郴州市', '430000');
INSERT INTO `api_cities` VALUES ('196', '431100', '永州市', '430000');
INSERT INTO `api_cities` VALUES ('197', '431200', '怀化市', '430000');
INSERT INTO `api_cities` VALUES ('198', '431300', '娄底市', '430000');
INSERT INTO `api_cities` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `api_cities` VALUES ('200', '440100', '广州市', '440000');
INSERT INTO `api_cities` VALUES ('201', '440200', '韶关市', '440000');
INSERT INTO `api_cities` VALUES ('202', '440300', '深圳市', '440000');
INSERT INTO `api_cities` VALUES ('203', '440400', '珠海市', '440000');
INSERT INTO `api_cities` VALUES ('204', '440500', '汕头市', '440000');
INSERT INTO `api_cities` VALUES ('205', '440600', '佛山市', '440000');
INSERT INTO `api_cities` VALUES ('206', '440700', '江门市', '440000');
INSERT INTO `api_cities` VALUES ('207', '440800', '湛江市', '440000');
INSERT INTO `api_cities` VALUES ('208', '440900', '茂名市', '440000');
INSERT INTO `api_cities` VALUES ('209', '441200', '肇庆市', '440000');
INSERT INTO `api_cities` VALUES ('210', '441300', '惠州市', '440000');
INSERT INTO `api_cities` VALUES ('211', '441400', '梅州市', '440000');
INSERT INTO `api_cities` VALUES ('212', '441500', '汕尾市', '440000');
INSERT INTO `api_cities` VALUES ('213', '441600', '河源市', '440000');
INSERT INTO `api_cities` VALUES ('214', '441700', '阳江市', '440000');
INSERT INTO `api_cities` VALUES ('215', '441800', '清远市', '440000');
INSERT INTO `api_cities` VALUES ('216', '441900', '东莞市', '440000');
INSERT INTO `api_cities` VALUES ('217', '442000', '中山市', '440000');
INSERT INTO `api_cities` VALUES ('218', '445100', '潮州市', '440000');
INSERT INTO `api_cities` VALUES ('219', '445200', '揭阳市', '440000');
INSERT INTO `api_cities` VALUES ('220', '445300', '云浮市', '440000');
INSERT INTO `api_cities` VALUES ('221', '450100', '南宁市', '450000');
INSERT INTO `api_cities` VALUES ('222', '450200', '柳州市', '450000');
INSERT INTO `api_cities` VALUES ('223', '450300', '桂林市', '450000');
INSERT INTO `api_cities` VALUES ('224', '450400', '梧州市', '450000');
INSERT INTO `api_cities` VALUES ('225', '450500', '北海市', '450000');
INSERT INTO `api_cities` VALUES ('226', '450600', '防城港市', '450000');
INSERT INTO `api_cities` VALUES ('227', '450700', '钦州市', '450000');
INSERT INTO `api_cities` VALUES ('228', '450800', '贵港市', '450000');
INSERT INTO `api_cities` VALUES ('229', '450900', '玉林市', '450000');
INSERT INTO `api_cities` VALUES ('230', '451000', '百色市', '450000');
INSERT INTO `api_cities` VALUES ('231', '451100', '贺州市', '450000');
INSERT INTO `api_cities` VALUES ('232', '451200', '河池市', '450000');
INSERT INTO `api_cities` VALUES ('233', '451300', '来宾市', '450000');
INSERT INTO `api_cities` VALUES ('234', '451400', '崇左市', '450000');
INSERT INTO `api_cities` VALUES ('235', '460100', '海口市', '460000');
INSERT INTO `api_cities` VALUES ('236', '460200', '三亚市', '460000');
INSERT INTO `api_cities` VALUES ('237', '469000', '省直辖县级行政单位', '460000');
INSERT INTO `api_cities` VALUES ('238', '500100', '市辖区', '500000');
INSERT INTO `api_cities` VALUES ('239', '500200', '县', '500000');
INSERT INTO `api_cities` VALUES ('240', '500300', '市', '500000');
INSERT INTO `api_cities` VALUES ('241', '510100', '成都市', '510000');
INSERT INTO `api_cities` VALUES ('242', '510300', '自贡市', '510000');
INSERT INTO `api_cities` VALUES ('243', '510400', '攀枝花市', '510000');
INSERT INTO `api_cities` VALUES ('244', '510500', '泸州市', '510000');
INSERT INTO `api_cities` VALUES ('245', '510600', '德阳市', '510000');
INSERT INTO `api_cities` VALUES ('246', '510700', '绵阳市', '510000');
INSERT INTO `api_cities` VALUES ('247', '510800', '广元市', '510000');
INSERT INTO `api_cities` VALUES ('248', '510900', '遂宁市', '510000');
INSERT INTO `api_cities` VALUES ('249', '511000', '内江市', '510000');
INSERT INTO `api_cities` VALUES ('250', '511100', '乐山市', '510000');
INSERT INTO `api_cities` VALUES ('251', '511300', '南充市', '510000');
INSERT INTO `api_cities` VALUES ('252', '511400', '眉山市', '510000');
INSERT INTO `api_cities` VALUES ('253', '511500', '宜宾市', '510000');
INSERT INTO `api_cities` VALUES ('254', '511600', '广安市', '510000');
INSERT INTO `api_cities` VALUES ('255', '511700', '达州市', '510000');
INSERT INTO `api_cities` VALUES ('256', '511800', '雅安市', '510000');
INSERT INTO `api_cities` VALUES ('257', '511900', '巴中市', '510000');
INSERT INTO `api_cities` VALUES ('258', '512000', '资阳市', '510000');
INSERT INTO `api_cities` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `api_cities` VALUES ('260', '513300', '甘孜藏族自治州', '510000');
INSERT INTO `api_cities` VALUES ('261', '513400', '凉山彝族自治州', '510000');
INSERT INTO `api_cities` VALUES ('262', '520100', '贵阳市', '520000');
INSERT INTO `api_cities` VALUES ('263', '520200', '六盘水市', '520000');
INSERT INTO `api_cities` VALUES ('264', '520300', '遵义市', '520000');
INSERT INTO `api_cities` VALUES ('265', '520400', '安顺市', '520000');
INSERT INTO `api_cities` VALUES ('266', '522200', '铜仁地区', '520000');
INSERT INTO `api_cities` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `api_cities` VALUES ('268', '522400', '毕节地区', '520000');
INSERT INTO `api_cities` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `api_cities` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `api_cities` VALUES ('271', '530100', '昆明市', '530000');
INSERT INTO `api_cities` VALUES ('272', '530300', '曲靖市', '530000');
INSERT INTO `api_cities` VALUES ('273', '530400', '玉溪市', '530000');
INSERT INTO `api_cities` VALUES ('274', '530500', '保山市', '530000');
INSERT INTO `api_cities` VALUES ('275', '530600', '昭通市', '530000');
INSERT INTO `api_cities` VALUES ('276', '530700', '丽江市', '530000');
INSERT INTO `api_cities` VALUES ('277', '530800', '思茅市', '530000');
INSERT INTO `api_cities` VALUES ('278', '530900', '临沧市', '530000');
INSERT INTO `api_cities` VALUES ('279', '532300', '楚雄彝族自治州', '530000');
INSERT INTO `api_cities` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `api_cities` VALUES ('281', '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `api_cities` VALUES ('282', '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `api_cities` VALUES ('283', '532900', '大理白族自治州', '530000');
INSERT INTO `api_cities` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `api_cities` VALUES ('285', '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `api_cities` VALUES ('286', '533400', '迪庆藏族自治州', '530000');
INSERT INTO `api_cities` VALUES ('287', '540100', '拉萨市', '540000');
INSERT INTO `api_cities` VALUES ('288', '542100', '昌都地区', '540000');
INSERT INTO `api_cities` VALUES ('289', '542200', '山南地区', '540000');
INSERT INTO `api_cities` VALUES ('290', '542300', '日喀则地区', '540000');
INSERT INTO `api_cities` VALUES ('291', '542400', '那曲地区', '540000');
INSERT INTO `api_cities` VALUES ('292', '542500', '阿里地区', '540000');
INSERT INTO `api_cities` VALUES ('293', '542600', '林芝地区', '540000');
INSERT INTO `api_cities` VALUES ('294', '610100', '西安市', '610000');
INSERT INTO `api_cities` VALUES ('295', '610200', '铜川市', '610000');
INSERT INTO `api_cities` VALUES ('296', '610300', '宝鸡市', '610000');
INSERT INTO `api_cities` VALUES ('297', '610400', '咸阳市', '610000');
INSERT INTO `api_cities` VALUES ('298', '610500', '渭南市', '610000');
INSERT INTO `api_cities` VALUES ('299', '610600', '延安市', '610000');
INSERT INTO `api_cities` VALUES ('300', '610700', '汉中市', '610000');
INSERT INTO `api_cities` VALUES ('301', '610800', '榆林市', '610000');
INSERT INTO `api_cities` VALUES ('302', '610900', '安康市', '610000');
INSERT INTO `api_cities` VALUES ('303', '611000', '商洛市', '610000');
INSERT INTO `api_cities` VALUES ('304', '620100', '兰州市', '620000');
INSERT INTO `api_cities` VALUES ('305', '620200', '嘉峪关市', '620000');
INSERT INTO `api_cities` VALUES ('306', '620300', '金昌市', '620000');
INSERT INTO `api_cities` VALUES ('307', '620400', '白银市', '620000');
INSERT INTO `api_cities` VALUES ('308', '620500', '天水市', '620000');
INSERT INTO `api_cities` VALUES ('309', '620600', '武威市', '620000');
INSERT INTO `api_cities` VALUES ('310', '620700', '张掖市', '620000');
INSERT INTO `api_cities` VALUES ('311', '620800', '平凉市', '620000');
INSERT INTO `api_cities` VALUES ('312', '620900', '酒泉市', '620000');
INSERT INTO `api_cities` VALUES ('313', '621000', '庆阳市', '620000');
INSERT INTO `api_cities` VALUES ('314', '621100', '定西市', '620000');
INSERT INTO `api_cities` VALUES ('315', '621200', '陇南市', '620000');
INSERT INTO `api_cities` VALUES ('316', '622900', '临夏回族自治州', '620000');
INSERT INTO `api_cities` VALUES ('317', '623000', '甘南藏族自治州', '620000');
INSERT INTO `api_cities` VALUES ('318', '630100', '西宁市', '630000');
INSERT INTO `api_cities` VALUES ('319', '632100', '海东地区', '630000');
INSERT INTO `api_cities` VALUES ('320', '632200', '海北藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('321', '632300', '黄南藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('322', '632500', '海南藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('323', '632600', '果洛藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('324', '632700', '玉树藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `api_cities` VALUES ('326', '640100', '银川市', '640000');
INSERT INTO `api_cities` VALUES ('327', '640200', '石嘴山市', '640000');
INSERT INTO `api_cities` VALUES ('328', '640300', '吴忠市', '640000');
INSERT INTO `api_cities` VALUES ('329', '640400', '固原市', '640000');
INSERT INTO `api_cities` VALUES ('330', '640500', '中卫市', '640000');
INSERT INTO `api_cities` VALUES ('331', '650100', '乌鲁木齐市', '650000');
INSERT INTO `api_cities` VALUES ('332', '650200', '克拉玛依市', '650000');
INSERT INTO `api_cities` VALUES ('333', '652100', '吐鲁番地区', '650000');
INSERT INTO `api_cities` VALUES ('334', '652200', '哈密地区', '650000');
INSERT INTO `api_cities` VALUES ('335', '652300', '昌吉回族自治州', '650000');
INSERT INTO `api_cities` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `api_cities` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `api_cities` VALUES ('338', '652900', '阿克苏地区', '650000');
INSERT INTO `api_cities` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `api_cities` VALUES ('340', '653100', '喀什地区', '650000');
INSERT INTO `api_cities` VALUES ('341', '653200', '和田地区', '650000');
INSERT INTO `api_cities` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `api_cities` VALUES ('343', '654200', '塔城地区', '650000');
INSERT INTO `api_cities` VALUES ('344', '654300', '阿勒泰地区', '650000');
INSERT INTO `api_cities` VALUES ('345', '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for api_class
-- ----------------------------
DROP TABLE IF EXISTS `api_class`;
CREATE TABLE `api_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '级别(年级)表自增id',
  `class_name` varchar(20) NOT NULL COMMENT '级别名称',
  `add_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_class
-- ----------------------------
INSERT INTO `api_class` VALUES ('1', '八年级', '1', '1565425845');

-- ----------------------------
-- Table structure for api_collect
-- ----------------------------
DROP TABLE IF EXISTS `api_collect`;
CREATE TABLE `api_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表自增id',
  `item_type` varchar(20) NOT NULL COMMENT '收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆',
  `pub_type` varchar(30) NOT NULL COMMENT '发布人的类型(COM:机构;TEA:老师;STU:学生)',
  `item_id` int(11) NOT NULL COMMENT '收藏项目id',
  `user_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_collect
-- ----------------------------

-- ----------------------------
-- Table structure for api_comment
-- ----------------------------
DROP TABLE IF EXISTS `api_comment`;
CREATE TABLE `api_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表自增id',
  `content` text NOT NULL COMMENT '评论内容',
  `item_type` varchar(20) DEFAULT NULL COMMENT '收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆',
  `pub_type` varchar(30) NOT NULL COMMENT '发布人的类型(COM:机构;TEA:老师;STU:学生)',
  `item_id` int(11) NOT NULL COMMENT '评论项目id',
  `audit_status` varchar(10) NOT NULL COMMENT '审核状态(S:通过;W:未审核;R:未通过)',
  `audit_id` int(11) NOT NULL COMMENT '审核人id',
  `audit_time` varchar(11) NOT NULL COMMENT '审核时间',
  `user_id` int(11) NOT NULL COMMENT '评论人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_comment
-- ----------------------------

-- ----------------------------
-- Table structure for api_ct_users
-- ----------------------------
DROP TABLE IF EXISTS `api_ct_users`;
CREATE TABLE `api_ct_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构/老师表自增id',
  `user_name` varchar(100) NOT NULL COMMENT '负责人名称',
  `com_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `password` varchar(40) NOT NULL COMMENT '用户密码',
  `phone` varchar(11) NOT NULL COMMENT '电话',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `user_type` varchar(20) NOT NULL COMMENT '用户类型(C:机构;T:老师)',
  `del_status` int(1) NOT NULL DEFAULT '2' COMMENT '删除状态(1,已删除;2,未删除)',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `province_id` int(11) NOT NULL COMMENT '省份id',
  `city_id` int(11) NOT NULL COMMENT '城市id',
  `area_id` int(11) NOT NULL COMMENT '县区id',
  `icon` varchar(255) DEFAULT NULL COMMENT '头像',
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人id',
  `audit_time` varchar(11) DEFAULT NULL COMMENT '审核时间',
  `audit_status` varchar(10) NOT NULL DEFAULT 'W' COMMENT '审核状态(W:待审核;S:通过;F:未通过)',
  `add_time` varchar(11) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_ct_users
-- ----------------------------
INSERT INTO `api_ct_users` VALUES ('1', '小王啊', '我的机构', '123456', '1564524568', '58.00', 'C', '2', '石家庄', '130000', '130100', '130104', null, null, null, 'W', '15648549');

-- ----------------------------
-- Table structure for api_document
-- ----------------------------
DROP TABLE IF EXISTS `api_document`;
CREATE TABLE `api_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL DEFAULT '' COMMENT '授权秘钥',
  `endTime` int(11) NOT NULL DEFAULT '0' COMMENT '失效时间戳',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '访问次数',
  `lastTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `lastIp` varchar(50) NOT NULL DEFAULT '' COMMENT '最后访问IP',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `info` varchar(50) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1生效，0失效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档访问秘钥';

-- ----------------------------
-- Records of api_document
-- ----------------------------

-- ----------------------------
-- Table structure for api_expense
-- ----------------------------
DROP TABLE IF EXISTS `api_expense`;
CREATE TABLE `api_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费提现表自增id',
  `e_money` decimal(10,2) NOT NULL COMMENT '消费/提现金额',
  `e_status` varchar(10) NOT NULL DEFAULT 'W' COMMENT '消费/提现审核状态(S:成功/通过;F:失败/拒绝;W:等待/未审核)',
  `order` varchar(40) NOT NULL COMMENT '订单号',
  `etype` int(1) NOT NULL COMMENT '类型(1,消费;2,提现)',
  `r_type` varchar(20) NOT NULL COMMENT '角色类型(S:学生;T:老师;C:机构)',
  `user_id` int(11) NOT NULL COMMENT '消费/提现人id',
  `bankcard_id` int(11) NOT NULL COMMENT '提现银行卡id',
  `audit_userid` int(11) DEFAULT NULL COMMENT '审核人id',
  `audit_time` varchar(11) DEFAULT NULL COMMENT '审核时间',
  `add_time` varchar(11) NOT NULL COMMENT '申请/消费时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_expense
-- ----------------------------
INSERT INTO `api_expense` VALUES ('1', '20.00', 'S', '1245654524', '2', 'S', '1', '1', '1', '1540265779', '1524623654');

-- ----------------------------
-- Table structure for api_fields
-- ----------------------------
DROP TABLE IF EXISTS `api_fields`;
CREATE TABLE `api_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名称',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT '对应接口的唯一标识',
  `dataType` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据类型，来源于DataType类库',
  `default` varchar(500) NOT NULL DEFAULT '' COMMENT '默认值',
  `isMust` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否必须 0为不必须，1为必须',
  `range` varchar(500) NOT NULL DEFAULT '' COMMENT '范围，Json字符串，根据数据类型有不一样的含义',
  `info` varchar(500) NOT NULL DEFAULT '' COMMENT '字段说明',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '字段用处：0为request，1为response',
  `showName` varchar(50) NOT NULL DEFAULT '' COMMENT 'wiki显示用字段',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于保存各个API的字段规则';

-- ----------------------------
-- Records of api_fields
-- ----------------------------

-- ----------------------------
-- Table structure for api_list
-- ----------------------------
DROP TABLE IF EXISTS `api_list`;
CREATE TABLE `api_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apiName` varchar(50) NOT NULL DEFAULT '' COMMENT 'api索引，保存了类和方法',
  `hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'api唯一标识',
  `accessToken` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证AccessToken 1：需要，0：不需要',
  `needLogin` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否需要认证用户token  1：需要 0：不需要',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'API状态：0表示禁用，1表示启用',
  `method` tinyint(2) NOT NULL DEFAULT '2' COMMENT '请求方式0：不限1：Post，2：Get',
  `info` varchar(500) NOT NULL DEFAULT '' COMMENT 'api中文说明',
  `isTest` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是测试模式：0:生产模式，1：测试模式',
  `returnStr` text COMMENT '返回数据示例',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于维护接口信息';

-- ----------------------------
-- Records of api_list
-- ----------------------------

-- ----------------------------
-- Table structure for api_menu
-- ----------------------------
DROP TABLE IF EXISTS `api_menu`;
CREATE TABLE `api_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名',
  `fid` int(11) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '链接',
  `auth` tinyint(2) NOT NULL DEFAULT '0' COMMENT '访客权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `hide` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '菜单认证等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='目录信息';

-- ----------------------------
-- Records of api_menu
-- ----------------------------
INSERT INTO `api_menu` VALUES ('1', '欢迎页', '0', 'Index/welcome', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('2', '系统配置', '0', '', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('3', '菜单维护', '2', 'Menu/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('4', '用户管理', '2', 'User/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('5', '权限管理', '2', 'Permission/index', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('6', '操作日志', '2', 'Log/index', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('7', '应用管理', '0', '', '0', '6', '0', '', '0');
INSERT INTO `api_menu` VALUES ('8', '应用列表', '7', 'App/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('9', '接口列表', '7', 'ApiManage/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('10', '字段注解（暂未开放）', '7', 'FieldsInfoManage/index', '0', '2', '1', '', '0');
INSERT INTO `api_menu` VALUES ('11', '首页', '0', 'Index/index', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('12', '新增菜单', '3', 'Menu/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('13', '编辑菜单', '3', 'Menu/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('14', '隐藏菜单', '3', 'Menu/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('15', '显示菜单', '3', 'Menu/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('16', '删除菜单', '3', 'Menu/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('17', '新增用户', '4', 'User/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('18', '账号封停', '4', 'User/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('19', '账号解封', '4', 'User/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('20', '账号删除', '4', 'User/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('21', '编辑应用', '8', 'App/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('22', '新增应用', '8', 'App/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('23', '启用应用', '8', 'App/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('24', '禁用应用', '8', 'App/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('25', '删除应用', '8', 'App/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('26', '新增接口', '9', 'ApiManage/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('27', '启用接口', '9', 'ApiManage/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('28', '禁用接口', '9', 'ApiManage/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('29', '编辑接口', '9', 'ApiManage/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('30', '删除接口', '9', 'ApiManage/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('31', '返回字段编辑', '9', 'FieldsManage/response', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('32', '请求字段编辑', '9', 'FieldsManage/request', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('33', '新增字段', '9', 'FieldsManage/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('34', '字段编辑', '9', 'FieldsManage/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('35', '批量上传返回字段', '9', 'FieldsManage/upload', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('36', 'Ajax查询Log列表', '6', 'Log/ajaxGetIndex', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('37', '日志删除', '6', 'Log/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('38', '日志详情查看', '6', 'Log/showDetail', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('39', '添加权限组', '5', 'Permission/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('40', '禁用权限组', '5', 'Permission/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('41', '启用权限组', '5', 'Permission/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('42', '编辑权限组', '5', 'Permission/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('43', '删除权限组', '5', 'Permission/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('44', '用户入组', '5', 'Permission/group', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('45', '组用户列表', '5', 'Permission/member', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('46', '踢出成员', '5', 'Permission/delMember', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('47', '权限组权限配置', '5', 'Permission/rule', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('48', '三方接口', '0', '', '0', '7', '0', '', '0');
INSERT INTO `api_menu` VALUES ('49', '接口仓库', '48', 'ApiStore/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('50', 'Ajax获取接口列表', '49', 'ApiStore/ajaxGetIndex', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('51', '刷新接口', '49', 'ApiStore/refresh', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('52', '编辑接口', '49', 'ApiStore/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('53', '启用接口', '49', 'ApiStore/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('54', '禁用接口', '49', 'ApiStore/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('55', 'Ajax获取秘钥列表', '61', 'ApiKey/ajaxGetIndex', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('56', '新增秘钥类别', '61', 'ApiKey/add', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('57', '编辑秘钥类别', '61', 'ApiKey/edit', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('58', '删除秘钥分类', '61', 'ApiKey/del', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('59', '启用秘钥分类', '61', 'ApiKey/open', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('60', '禁用秘钥分类', '61', 'ApiKey/close', '0', '0', '1', '', '0');
INSERT INTO `api_menu` VALUES ('61', '秘钥管理', '48', 'ApiKey/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('66', '文档管理', '0', '', '0', '8', '0', '', '0');
INSERT INTO `api_menu` VALUES ('67', '秘钥管理', '66', 'Document/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('68', 'Ajax获取文档记录', '67', 'Document/ajaxGetIndex', '0', '1', '1', '', '0');
INSERT INTO `api_menu` VALUES ('69', '创建访问秘钥', '67', 'Document/add', '0', '2', '1', '', '0');
INSERT INTO `api_menu` VALUES ('70', '延长Key时间', '67', 'Document/addTime', '0', '3', '1', '', '0');
INSERT INTO `api_menu` VALUES ('71', '启用Key', '67', 'Document/open', '0', '4', '1', '', '0');
INSERT INTO `api_menu` VALUES ('72', '禁用Key', '67', 'Document/close', '0', '5', '1', '', '0');
INSERT INTO `api_menu` VALUES ('73', '学生管理', '0', '', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('74', '学生列表', '73', 'Student/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('75', '内容管理', '0', '', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('76', '知识点', '75', 'Knowledge/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('77', '句子', '75', 'Sentence/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('78', '阅读文章', '75', 'Article/index', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('79', '课本列表', '75', 'Textbook/index', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('80', '视频', '75', 'Video/index', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('81', '词组', '75', 'Words/index', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('82', '禁用名单', '73', 'StopList/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('83', '提现审核', '73', 'WithdrawalAudit/index', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('84', '机构管理', '0', '', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('85', '注册审核', '84', 'RegistAudit/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('86', '发布审核', '84', 'PublishAudit/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('87', '评论审核', '84', 'Comment/index', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('88', '基础设置', '0', '', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('89', '级别管理', '88', 'Class/index', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('90', '科目管理', '88', 'Subject/index', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('91', '版本管理', '88', 'Versions/index', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('92', '知识点下线', '76', 'Knowledge/close', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('93', '知识点上线', '76', 'Knowledge/open', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('94', '编辑知识点', '76', 'Knowledge/update', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('95', '知识点添加', '76', 'Knowledge/add', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('96', '查看知识点', '76', 'Knowledge/look', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('97', '知识点图片上传', '76', 'Knowledge/upload', '0', '6', '0', '', '0');
INSERT INTO `api_menu` VALUES ('99', '添加句子', '77', 'Sentence/add', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('100', '编辑句子', '77', 'Sentence/update', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('101', '图片上传', '77', 'Sentence/upload', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('102', '句子上线', '77', 'Sentence/open', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('103', '句子下线', '77', 'Sentence/close', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('104', '查看句子', '77', 'Sentence/look', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('105', '添加词组', '81', 'Words/add', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('106', '编辑词组', '81', 'Words/update', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('107', '词组上线', '81', 'Words/open', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('108', '词组下线', '81', 'Words/close', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('109', '上传图片-词组', '81', 'Words/upload', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('110', '查看词组', '81', 'Words/look', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('111', '添加文章', '78', 'Article/add', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('112', '编辑文章', '78', 'Article/update', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('113', '上传图片-文章', '78', 'Article/upload', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('114', '阅读文章', '78', 'Article/look', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('115', '文章上线', '78', 'Article/open', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('116', '文章下线', '78', 'Article/close', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('117', '课本添加', '79', 'Textbook/add', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('118', '编辑课本', '79', 'Textbook/update', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('119', '课本上线', '79', 'Textbook/open', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('120', '课本下线', '79', 'Textbook/close', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('121', '上传图片-课本', '79', 'Textbook/upload', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('122', '查看课本', '79', 'Textbook/look', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('123', '添加视频', '80', 'Video/add', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('124', '编辑视频', '80', 'Video/update', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('125', '图片上传-视频', '80', 'Video/upload', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('126', '视频上线', '80', 'Video/open', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('127', '视频下线', '80', 'Video/close', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('128', '查看视频', '80', 'Video/look', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('129', '课本目录列表', '79', 'Textbook/catalog', '0', '6', '0', '', '0');
INSERT INTO `api_menu` VALUES ('130', '添加课本目录', '79', 'Textbook/addCatalog', '0', '7', '0', '', '0');
INSERT INTO `api_menu` VALUES ('131', '编辑课本目录', '79', 'Textbook/updateCatalog', '0', '8', '0', '', '0');
INSERT INTO `api_menu` VALUES ('132', '课本目录上线', '79', 'Textbook/openCatalog', '0', '9', '0', '', '0');
INSERT INTO `api_menu` VALUES ('133', '课本目录下线', '79', 'Textbook/closeCatalog', '0', '10', '0', '', '0');
INSERT INTO `api_menu` VALUES ('134', '查看课本目录', '79', 'Textbook/lookCatalog', '0', '11', '0', '', '0');
INSERT INTO `api_menu` VALUES ('135', '视频目录添加', '80', 'Video/addCatalog', '0', '6', '0', '', '0');
INSERT INTO `api_menu` VALUES ('136', '视频目录编辑', '80', 'Video/updateCatalog', '0', '7', '0', '', '0');
INSERT INTO `api_menu` VALUES ('137', '查看视频目录', '80', 'Video/lookCatalog', '0', '8', '0', '', '0');
INSERT INTO `api_menu` VALUES ('138', '视频目录上线', '80', 'Video/openCatalog', '0', '9', '0', '', '0');
INSERT INTO `api_menu` VALUES ('139', '视频目录下线', '80', 'Video/closeCatalog', '0', '10', '0', '', '0');
INSERT INTO `api_menu` VALUES ('140', '上传视频目录', '80', 'Video/uploadc', '0', '11', '0', '', '0');
INSERT INTO `api_menu` VALUES ('141', '视频目录列表', '80', 'Video/catalog', '0', '12', '0', '', '0');
INSERT INTO `api_menu` VALUES ('142', '修改为正常状态', '74', 'Student/open', '0', '0', '0', '', '0');
INSERT INTO `api_menu` VALUES ('143', '修改状态为禁用', '74', 'Student/close', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('144', '发送通知', '74', 'Student/addNotice', '0', '2', '0', '', '0');
INSERT INTO `api_menu` VALUES ('145', '编辑通知', '74', 'Student/updateNotice', '0', '3', '0', '', '0');
INSERT INTO `api_menu` VALUES ('146', '删除通知', '74', 'Student/delete', '0', '4', '0', '', '0');
INSERT INTO `api_menu` VALUES ('147', '通知列表', '74', 'Student/noticeLIst', '0', '5', '0', '', '0');
INSERT INTO `api_menu` VALUES ('148', '解禁学生', '82', 'StopList/open', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('149', '审核通过', '83', 'WithdrawalAudit/open', '0', '1', '0', '', '0');
INSERT INTO `api_menu` VALUES ('150', '拒绝审核', '83', 'WithdrawalAudit/close', '0', '2', '0', '', '0');

-- ----------------------------
-- Table structure for api_new_words
-- ----------------------------
DROP TABLE IF EXISTS `api_new_words`;
CREATE TABLE `api_new_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '生词表自增id',
  `new_words` varchar(100) NOT NULL COMMENT '生词名称',
  `soundmark` varchar(100) NOT NULL COMMENT '音标',
  `translate` varchar(255) NOT NULL COMMENT '翻译',
  `source_id` varchar(255) NOT NULL COMMENT '生词来源',
  `add_userid` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_new_words
-- ----------------------------

-- ----------------------------
-- Table structure for api_notice
-- ----------------------------
DROP TABLE IF EXISTS `api_notice`;
CREATE TABLE `api_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站内通知表自增id',
  `title` varchar(100) NOT NULL COMMENT '题目',
  `content` text NOT NULL COMMENT '内容',
  `del_status` int(1) NOT NULL DEFAULT '2' COMMENT '删除状态(1,已删除;2,未删除)',
  `read_status` varchar(20) NOT NULL DEFAULT 'UNREAD' COMMENT '阅读状态(READ:已读;UNREAD:未读)',
  `notice_type` varchar(50) DEFAULT NULL COMMENT '通知类型',
  `to_userid` int(11) NOT NULL COMMENT '接收人id',
  `read_time` varchar(11) DEFAULT NULL COMMENT '读取时间',
  `send_userid` int(11) NOT NULL COMMENT '发送人id',
  `add_time` varchar(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_notice
-- ----------------------------
INSERT INTO `api_notice` VALUES ('1', '我们是好人', '速度范围', '2', 'UNREAD', null, '1', null, '1', '1540203539');
INSERT INTO `api_notice` VALUES ('2', '我是第二个', '通知好的蝶舞', '2', 'UNREAD', null, '1', null, '1', '1540257243');

-- ----------------------------
-- Table structure for api_provinces
-- ----------------------------
DROP TABLE IF EXISTS `api_provinces`;
CREATE TABLE `api_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of api_provinces
-- ----------------------------
INSERT INTO `api_provinces` VALUES ('1', '110000', '北京市');
INSERT INTO `api_provinces` VALUES ('2', '120000', '天津市');
INSERT INTO `api_provinces` VALUES ('3', '130000', '河北省');
INSERT INTO `api_provinces` VALUES ('4', '140000', '山西省');
INSERT INTO `api_provinces` VALUES ('5', '150000', '内蒙古自治区');
INSERT INTO `api_provinces` VALUES ('6', '210000', '辽宁省');
INSERT INTO `api_provinces` VALUES ('7', '220000', '吉林省');
INSERT INTO `api_provinces` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `api_provinces` VALUES ('9', '310000', '上海市');
INSERT INTO `api_provinces` VALUES ('10', '320000', '江苏省');
INSERT INTO `api_provinces` VALUES ('11', '330000', '浙江省');
INSERT INTO `api_provinces` VALUES ('12', '340000', '安徽省');
INSERT INTO `api_provinces` VALUES ('13', '350000', '福建省');
INSERT INTO `api_provinces` VALUES ('14', '360000', '江西省');
INSERT INTO `api_provinces` VALUES ('15', '370000', '山东省');
INSERT INTO `api_provinces` VALUES ('16', '410000', '河南省');
INSERT INTO `api_provinces` VALUES ('17', '420000', '湖北省');
INSERT INTO `api_provinces` VALUES ('18', '430000', '湖南省');
INSERT INTO `api_provinces` VALUES ('19', '440000', '广东省');
INSERT INTO `api_provinces` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `api_provinces` VALUES ('21', '460000', '海南省');
INSERT INTO `api_provinces` VALUES ('22', '500000', '重庆市');
INSERT INTO `api_provinces` VALUES ('23', '510000', '四川省');
INSERT INTO `api_provinces` VALUES ('24', '520000', '贵州省');
INSERT INTO `api_provinces` VALUES ('25', '530000', '云南省');
INSERT INTO `api_provinces` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `api_provinces` VALUES ('27', '610000', '陕西省');
INSERT INTO `api_provinces` VALUES ('28', '620000', '甘肃省');
INSERT INTO `api_provinces` VALUES ('29', '630000', '青海省');
INSERT INTO `api_provinces` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `api_provinces` VALUES ('31', '650000', '新疆维吾尔自治区');
INSERT INTO `api_provinces` VALUES ('32', '710000', '台湾省');
INSERT INTO `api_provinces` VALUES ('33', '810000', '香港特别行政区');
INSERT INTO `api_provinces` VALUES ('34', '820000', '澳门特别行政区');

-- ----------------------------
-- Table structure for api_publish
-- ----------------------------
DROP TABLE IF EXISTS `api_publish`;
CREATE TABLE `api_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息发布表自增id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `series_name` varchar(100) NOT NULL COMMENT '系列名称',
  `content` text NOT NULL COMMENT '信息发布内容',
  `user_type` varchar(20) NOT NULL DEFAULT 'COM' COMMENT '发布人的类型(COM:机构;TEA:老师;STU:学生)',
  `price` float(8,2) DEFAULT NULL COMMENT '价格(单位元)',
  `item_type` varchar(30) NOT NULL COMMENT '发布内容类型(ART:文章;RAD:视频;SRAD:系列视频;FILE:文件;PIC:图片;)',
  `del_status` int(1) NOT NULL DEFAULT '2' COMMENT '删除状态(1,已删除;2,未删除)',
  `page_view` int(20) NOT NULL COMMENT '阅读量',
  `collect_num` int(20) NOT NULL COMMENT '收藏量',
  `share_num` int(20) NOT NULL COMMENT '分享量',
  `audit_status` varchar(10) NOT NULL COMMENT '审核状态(S:通过;W:未审核;R:未通过)',
  `audit_userid` int(11) NOT NULL COMMENT '审核人id',
  `pub_userid` int(11) NOT NULL COMMENT '发布人id',
  `audit_time` varchar(11) NOT NULL COMMENT '审核时间',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_publish
-- ----------------------------

-- ----------------------------
-- Table structure for api_recharge
-- ----------------------------
DROP TABLE IF EXISTS `api_recharge`;
CREATE TABLE `api_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值/签到记录表自增id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` int(1) NOT NULL DEFAULT '2' COMMENT '状态(1:成功;2:失败)',
  `r_type` varchar(20) NOT NULL COMMENT '角色类型(S:学生;T:老师;C:机构)',
  `money` decimal(10,2) DEFAULT NULL COMMENT '充值金额(单位元)',
  `gold_num` int(12) NOT NULL COMMENT '金币数量',
  `re_type` varchar(20) NOT NULL COMMENT '充值方式(W:微信;A:支付宝;S:签到)',
  `order` varchar(40) NOT NULL COMMENT '订单号',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for api_share
-- ----------------------------
DROP TABLE IF EXISTS `api_share`;
CREATE TABLE `api_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享表自增id',
  `item_type` varchar(20) NOT NULL COMMENT '收藏项目的类型(STORE:商城;GOODS:商品;KAP:知识;EXE:习题;WOR:试题;RADIO:广播;LIB:图书馆',
  `pub_type` varchar(30) NOT NULL COMMENT '分享人的类型(COM:机构;TEA:老师;STU:学生)',
  `item_id` int(1) NOT NULL COMMENT '分享内容id',
  `beshared_id` int(11) NOT NULL COMMENT '被分享用户id',
  `add_user_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_share
-- ----------------------------

-- ----------------------------
-- Table structure for api_store
-- ----------------------------
DROP TABLE IF EXISTS `api_store`;
CREATE TABLE `api_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(50) NOT NULL DEFAULT '' COMMENT '对应的代码路径',
  `auth` int(11) NOT NULL DEFAULT '0' COMMENT '使用的接口秘钥',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '接口状态',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '接口名称（提供辨识使用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方接口仓库';

-- ----------------------------
-- Records of api_store
-- ----------------------------

-- ----------------------------
-- Table structure for api_store_auth
-- ----------------------------
DROP TABLE IF EXISTS `api_store_auth`;
CREATE TABLE `api_store_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '秘钥名称',
  `appId` varchar(50) NOT NULL DEFAULT '' COMMENT '应用ID',
  `appSecret` varchar(255) NOT NULL DEFAULT '' COMMENT '应用秘钥',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '秘钥状态',
  `accessToken` varchar(255) DEFAULT '' COMMENT '授权秘钥（千米）',
  `refreshToken` varchar(255) DEFAULT '' COMMENT '刷新秘钥（千米）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方接口秘钥管理';

-- ----------------------------
-- Records of api_store_auth
-- ----------------------------

-- ----------------------------
-- Table structure for api_subject
-- ----------------------------
DROP TABLE IF EXISTS `api_subject`;
CREATE TABLE `api_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科目表自增id',
  `subject_name` varchar(20) NOT NULL COMMENT '科目名称',
  `add_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_subject
-- ----------------------------
INSERT INTO `api_subject` VALUES ('1', '英语', '1', '1546585456');

-- ----------------------------
-- Table structure for api_textbook
-- ----------------------------
DROP TABLE IF EXISTS `api_textbook`;
CREATE TABLE `api_textbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课本表自增id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `cover` varchar(255) NOT NULL COMMENT '封面图片',
  `intro` text NOT NULL COMMENT '简介',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格(单位元)',
  `show_status` int(1) NOT NULL DEFAULT '2' COMMENT '显示状态(1,上线;2,下线)',
  `copyright` varchar(200) DEFAULT NULL COMMENT '版权',
  `class_id` int(11) NOT NULL COMMENT '级别(年级)id',
  `versions_id` int(11) NOT NULL COMMENT '版本id',
  `subject_id` int(11) NOT NULL COMMENT '科目id',
  `read_num` int(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `collect_num` int(20) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `share_num` int(20) NOT NULL DEFAULT '0' COMMENT '分享量',
  `pub_userid` int(11) NOT NULL COMMENT '发布人id',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_textbook
-- ----------------------------
INSERT INTO `api_textbook` VALUES ('1', '年后', 'http://localhost/education/Public/uploads/articlePublish/textbook//5bcc87253e7b5.jpg', '&lt;p&gt;发VB当然&lt;/p&gt;', null, '1', null, '1', '1', '1', '0', '0', '0', '1', '1540130708');

-- ----------------------------
-- Table structure for api_textbook_content
-- ----------------------------
DROP TABLE IF EXISTS `api_textbook_content`;
CREATE TABLE `api_textbook_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课本内容表自增id',
  `textbook_id` int(11) unsigned NOT NULL COMMENT '课本id',
  `title` varchar(100) NOT NULL COMMENT '目录名称',
  `content` text NOT NULL COMMENT '内容url地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序序号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格(单位元)',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态(1,上线;2,下线)',
  `class_id` int(11) DEFAULT NULL COMMENT '级别(年级)id',
  `versions_id` int(11) DEFAULT NULL COMMENT '版本id',
  `subject_id` int(11) DEFAULT NULL COMMENT '科目id',
  `read_num` int(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `collect_num` int(20) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `share_num` int(20) NOT NULL DEFAULT '0' COMMENT '分享量',
  `pub_userid` int(11) NOT NULL COMMENT '发布人id',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_textbook_content
-- ----------------------------
INSERT INTO `api_textbook_content` VALUES ('1', '1', '第二章', '&lt;p&gt;我的第一章大家覅完全&lt;/p&gt;', '2', null, '2', null, null, null, '0', '0', '0', '1', '1540175854');
INSERT INTO `api_textbook_content` VALUES ('2', '1', '我们是好人一', '&lt;p&gt;的三分王分解&lt;/p&gt;', '1', null, '2', null, null, null, '0', '0', '0', '1', '1540176854');
INSERT INTO `api_textbook_content` VALUES ('3', '1', '意义一', '&lt;p&gt;大家覅舞台撒&lt;/p&gt;', '0', null, '2', null, null, null, '0', '0', '0', '1', '1540178732');

-- ----------------------------
-- Table structure for api_user
-- ----------------------------
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `regTime` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regIp` varchar(11) NOT NULL DEFAULT '' COMMENT '注册IP',
  `updateTime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态 0封号 1正常',
  `openId` varchar(100) DEFAULT NULL COMMENT '微信唯一ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员认证信息';

-- ----------------------------
-- Records of api_user
-- ----------------------------
INSERT INTO `api_user` VALUES ('1', 'root', 'root', '912601e4ad1b308c9ae41877cf6ca754', '1492004246', '3682992231', '1492236545', '1', null);
INSERT INTO `api_user` VALUES ('2', 'admin', '李胜辉', '912601e4ad1b308c9ae41877cf6ca754', '1539765039', '0', '0', '1', null);

-- ----------------------------
-- Table structure for api_users
-- ----------------------------
DROP TABLE IF EXISTS `api_users`;
CREATE TABLE `api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表自增id',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `true_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `password` varchar(40) NOT NULL COMMENT '用户密码',
  `use_status` int(1) NOT NULL DEFAULT '1' COMMENT '使用状态(1,正常;2,禁用)',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `ID_number` varchar(22) DEFAULT NULL COMMENT '身份证号',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `forbidden_id` int(11) DEFAULT NULL COMMENT '禁用操作人id',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `icon` varchar(255) DEFAULT NULL COMMENT '头像',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_users
-- ----------------------------
INSERT INTO `api_users` VALUES ('1', '我是第一个', null, 'e10adc3949ba59abbe56e057f20f883e', '2', '13315944082', null, '0.00', null, null, null, '1564854876');
INSERT INTO `api_users` VALUES ('2', '我是第二个', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '1325465486', null, '0.00', null, null, null, '1546254876');

-- ----------------------------
-- Table structure for api_users_login
-- ----------------------------
DROP TABLE IF EXISTS `api_users_login`;
CREATE TABLE `api_users_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录记录表自增id',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip地址',
  `user_type` varchar(30) NOT NULL COMMENT '类型(COM:机构;TEA:老师;STU:学生)',
  `user_id` int(11) NOT NULL COMMENT '登录人id',
  `add_time` varchar(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_users_login
-- ----------------------------

-- ----------------------------
-- Table structure for api_user_action
-- ----------------------------
DROP TABLE IF EXISTS `api_user_action`;
CREATE TABLE `api_user_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actionName` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `data` text COMMENT '用户提交的数据',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '操作URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2706 DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- ----------------------------
-- Records of api_user_action
-- ----------------------------
INSERT INTO `api_user_action` VALUES ('1', '首页', '1', 'root', '1539764879', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2', '欢迎页', '1', 'root', '1539764880', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('3', '菜单维护', '1', 'root', '1539764894', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('4', '操作日志', '1', 'root', '1539764922', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Log/index');
INSERT INTO `api_user_action` VALUES ('5', 'Ajax查询Log列表', '1', 'root', '1539764922', '{\"draw\":\"1\",\"columns\":[{\"data\":\"actionName\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"uid\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"nickname\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"url\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"addTime\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}}],\"start\":\"0\",\"length\":\"20\",\"search\":{\"value\":\"\",\"regex\":\"false\"},\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Log/ajaxGetIndex');
INSERT INTO `api_user_action` VALUES ('6', '用户管理', '1', 'root', '1539764925', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/index');
INSERT INTO `api_user_action` VALUES ('7', '权限管理', '1', 'root', '1539764931', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/index');
INSERT INTO `api_user_action` VALUES ('8', '用户入组', '1', 'root', '1539764938', '{\"uid\":\"1\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/group');
INSERT INTO `api_user_action` VALUES ('9', '添加权限组', '1', 'root', '1539764951', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/add');
INSERT INTO `api_user_action` VALUES ('10', '添加权限组', '1', 'root', '1539764978', '{\"name\":\"\\u5b66\\u751f\\u7ba1\\u7406\",\"description\":\"\\u7ba1\\u7406\\u5b66\\u751f\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/add');
INSERT INTO `api_user_action` VALUES ('11', '权限管理', '1', 'root', '1539764978', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/index');
INSERT INTO `api_user_action` VALUES ('12', '权限组权限配置', '1', 'root', '1539764983', '{\"group_id\":\"1\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/rule');
INSERT INTO `api_user_action` VALUES ('13', '组用户列表', '1', 'root', '1539764996', '{\"group_id\":\"1\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/member');
INSERT INTO `api_user_action` VALUES ('14', '新增用户', '1', 'root', '1539765003', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/add');
INSERT INTO `api_user_action` VALUES ('15', '新增用户', '1', 'root', '1539765022', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/add');
INSERT INTO `api_user_action` VALUES ('16', '新增用户', '1', 'root', '1539765039', '{\"username\":\"admin\",\"nickname\":\"\\u674e\\u80dc\\u8f89\",\"password\":\"123456\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/add');
INSERT INTO `api_user_action` VALUES ('17', '用户管理', '1', 'root', '1539765039', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/index');
INSERT INTO `api_user_action` VALUES ('18', '编辑权限组', '1', 'root', '1539765064', '{\"id\":\"1\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/edit');
INSERT INTO `api_user_action` VALUES ('19', '用户入组', '1', 'root', '1539765070', '{\"uid\":\"2\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/group');
INSERT INTO `api_user_action` VALUES ('20', '用户入组', '1', 'root', '1539765074', '{\"uid\":\"2\",\"groupAccess\":{\"1\":\"1\"},\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Permission/group');
INSERT INTO `api_user_action` VALUES ('21', '用户管理', '1', 'root', '1539765074', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/index');
INSERT INTO `api_user_action` VALUES ('22', '菜单维护', '1', 'root', '1539765117', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('23', '秘钥管理', '1', 'root', '1539765267', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'ApiKey/index');
INSERT INTO `api_user_action` VALUES ('24', 'Ajax获取秘钥列表', '1', 'root', '1539765268', '{\"draw\":\"1\",\"columns\":[{\"data\":\"name\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"appId\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"appSecret\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"status\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}}],\"start\":\"0\",\"length\":\"20\",\"search\":{\"value\":\"\",\"regex\":\"false\"},\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'ApiKey/ajaxGetIndex');
INSERT INTO `api_user_action` VALUES ('25', '秘钥管理', '1', 'root', '1539765270', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Document/index');
INSERT INTO `api_user_action` VALUES ('26', 'Ajax获取文档记录', '1', 'root', '1539765270', '{\"draw\":\"1\",\"columns\":[{\"data\":\"info\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"key\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"endTime\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"times\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"lastTime\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"status\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}}],\"start\":\"0\",\"length\":\"20\",\"search\":{\"value\":\"\",\"regex\":\"false\"},\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Document/ajaxGetIndex');
INSERT INTO `api_user_action` VALUES ('27', '新增菜单', '1', 'root', '1539765277', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('28', '用户管理', '1', 'root', '1539765497', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'User/index');
INSERT INTO `api_user_action` VALUES ('29', '首页', '1', 'root', '1539765975', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('30', '欢迎页', '1', 'root', '1539765975', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('31', '菜单维护', '1', 'root', '1539772840', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('32', '新增菜单', '1', 'root', '1539772843', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('33', '编辑菜单', '1', 'root', '1539772954', '{\"id\":\"66\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('34', '编辑菜单', '1', 'root', '1539772959', '{\"id\":\"66\",\"name\":\"\\u6587\\u6863\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"9\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('35', '菜单维护', '1', 'root', '1539772959', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('36', '编辑菜单', '1', 'root', '1539772971', '{\"id\":\"48\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('37', '编辑菜单', '1', 'root', '1539772975', '{\"id\":\"48\",\"name\":\"\\u4e09\\u65b9\\u63a5\\u53e3\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"8\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('38', '菜单维护', '1', 'root', '1539772975', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('39', '编辑菜单', '1', 'root', '1539773002', '{\"id\":\"7\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('40', '编辑菜单', '1', 'root', '1539773006', '{\"id\":\"7\",\"name\":\"\\u5e94\\u7528\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"7\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('41', '菜单维护', '1', 'root', '1539773006', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('42', '新增菜单', '1', 'root', '1539773050', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('43', '新增菜单', '1', 'root', '1539773096', '{\"name\":\"\\u5b66\\u751f\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"2\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('44', '菜单维护', '1', 'root', '1539773096', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('45', '首页', '1', 'root', '1539773102', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('46', '欢迎页', '1', 'root', '1539773102', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('47', '菜单维护', '1', 'root', '1539773116', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('48', '编辑菜单', '1', 'root', '1539773119', '{\"id\":\"2\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('49', '首页', '1', 'root', '1539773168', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('50', '欢迎页', '1', 'root', '1539773169', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('51', '菜单维护', '1', 'root', '1539773178', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('52', '编辑菜单', '1', 'root', '1539773218', '{\"id\":\"73\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('53', '编辑菜单', '1', 'root', '1539773232', '{\"id\":\"73\",\"name\":\"\\u5b66\\u751f\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"3\",\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('54', '菜单维护', '1', 'root', '1539773232', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('55', '首页', '1', 'root', '1539773244', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('56', '欢迎页', '1', 'root', '1539773244', '{\"PHPSESSID\":\"pvk62tps0422259gu25jeqbvm3\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('57', '首页', '1', 'root', '1539821900', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('58', '欢迎页', '1', 'root', '1539821900', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('59', '菜单维护', '1', 'root', '1539822347', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('60', '编辑菜单', '1', 'root', '1539822743', '{\"id\":\"73\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('61', '编辑菜单', '1', 'root', '1539822754', '{\"id\":\"73\",\"name\":\"\\u5b66\\u751f\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"31\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('62', '菜单维护', '1', 'root', '1539822754', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('63', '首页', '1', 'root', '1539822758', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('64', '欢迎页', '1', 'root', '1539822758', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('65', '菜单维护', '1', 'root', '1539822764', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('66', '隐藏菜单', '1', 'root', '1539822810', '{\"id\":\"73\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/close');
INSERT INTO `api_user_action` VALUES ('67', '菜单维护', '1', 'root', '1539822810', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('68', '显示菜单', '1', 'root', '1539822814', '{\"id\":\"73\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/open');
INSERT INTO `api_user_action` VALUES ('69', '菜单维护', '1', 'root', '1539822814', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('70', '首页', '1', 'root', '1539823495', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('71', '欢迎页', '1', 'root', '1539823495', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('72', '首页', '1', 'root', '1539823497', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('73', '欢迎页', '1', 'root', '1539823498', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('74', '菜单维护', '1', 'root', '1539823514', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('75', '编辑菜单', '1', 'root', '1539823527', '{\"id\":\"16\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('76', '新增菜单', '1', 'root', '1539823808', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('77', '新增菜单', '1', 'root', '1539823851', '{\"name\":\"\\u5b66\\u751f\\u5217\\u8868\",\"fid\":\"73\",\"url\":\"Student\\/index\",\"sort\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('78', '菜单维护', '1', 'root', '1539823851', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('79', '编辑菜单', '1', 'root', '1539823869', '{\"id\":\"74\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('80', '编辑菜单', '1', 'root', '1539823873', '{\"id\":\"74\",\"name\":\"\\u5b66\\u751f\\u5217\\u8868\",\"fid\":\"73\",\"url\":\"Student\\/index\",\"sort\":\"0\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('81', '菜单维护', '1', 'root', '1539823873', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('82', '首页', '1', 'root', '1539823876', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('83', '欢迎页', '1', 'root', '1539823876', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('84', '菜单维护', '1', 'root', '1539823946', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('85', '新增菜单', '1', 'root', '1539823957', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('86', '新增菜单', '1', 'root', '1539823975', '{\"name\":\"\\u5185\\u5bb9\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"6\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('87', '菜单维护', '1', 'root', '1539823975', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('88', '新增菜单', '1', 'root', '1539824129', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('89', '新增菜单', '1', 'root', '1539824187', '{\"name\":\"\\u77e5\\u8bc6\\u70b9\",\"fid\":\"75\",\"url\":\"Knowledge\\/index\",\"sort\":\"0\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('90', '菜单维护', '1', 'root', '1539824187', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('91', '新增菜单', '1', 'root', '1539824191', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('92', '新增菜单', '1', 'root', '1539824448', '{\"name\":\"\\u53e5\\u5b50\",\"fid\":\"75\",\"url\":\"Sentence\\/index\",\"sort\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('93', '菜单维护', '1', 'root', '1539824448', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('94', '新增菜单', '1', 'root', '1539824450', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('95', '新增菜单', '1', 'root', '1539824496', '{\"name\":\"\\u9605\\u8bfb\\u6587\\u7ae0\",\"fid\":\"75\",\"url\":\"Article\\/index\",\"sort\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('96', '菜单维护', '1', 'root', '1539824496', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('97', '新增菜单', '1', 'root', '1539824498', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('98', '新增菜单', '1', 'root', '1539824530', '{\"name\":\"\\u8bfe\\u672c\",\"fid\":\"75\",\"url\":\"Textbook\",\"sort\":\"3\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('99', '菜单维护', '1', 'root', '1539824530', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('100', '新增菜单', '1', 'root', '1539824531', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('101', '新增菜单', '1', 'root', '1539824592', '{\"name\":\"\\u89c6\\u9891\",\"fid\":\"75\",\"url\":\"Video\\/index\",\"sort\":\"4\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('102', '菜单维护', '1', 'root', '1539824592', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('103', '新增菜单', '1', 'root', '1539824594', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('104', '新增菜单', '1', 'root', '1539824632', '{\"name\":\"\\u8bcd\\u7ec4\",\"fid\":\"75\",\"url\":\"Words\\/index\",\"sort\":\"5\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('105', '菜单维护', '1', 'root', '1539824632', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('106', '新增菜单', '1', 'root', '1539824654', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('107', '新增菜单', '1', 'root', '1539824690', '{\"name\":\"\\u7981\\u7528\\u540d\\u5355\",\"fid\":\"73\",\"url\":\"StopList\\/index\",\"sort\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('108', '菜单维护', '1', 'root', '1539824690', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('109', '新增菜单', '1', 'root', '1539824693', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('110', '新增菜单', '1', 'root', '1539824769', '{\"name\":\"\\u63d0\\u73b0\\u5ba1\\u6838\",\"fid\":\"73\",\"url\":\"WithDrawalAudit\\/index\",\"sort\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('111', '菜单维护', '1', 'root', '1539824769', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('112', '新增菜单', '1', 'root', '1539824777', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('113', '新增菜单', '1', 'root', '1539824819', '{\"name\":\"\\u673a\\u6784\\u7ba1\\u7406\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"8\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('114', '菜单维护', '1', 'root', '1539824819', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('115', '首页', '1', 'root', '1539824821', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('116', '欢迎页', '1', 'root', '1539824821', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('117', '菜单维护', '1', 'root', '1539824828', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('118', '新增菜单', '1', 'root', '1539824830', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('119', '新增菜单', '1', 'root', '1539824866', '{\"name\":\"\\u6ce8\\u518c\\u5ba1\\u6838\",\"fid\":\"84\",\"url\":\"RegistAudit\\/index\",\"sort\":\"0\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('120', '菜单维护', '1', 'root', '1539824866', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('121', '新增菜单', '1', 'root', '1539824868', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('122', '新增菜单', '1', 'root', '1539824912', '{\"name\":\"\\u53d1\\u5e03\\u5ba1\\u6838\",\"fid\":\"84\",\"url\":\"PublishAudit\\/index\",\"sort\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('123', '菜单维护', '1', 'root', '1539824912', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('124', '新增菜单', '1', 'root', '1539824921', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('125', '新增菜单', '1', 'root', '1539824989', '{\"name\":\"\\u8bc4\\u8bba\\u5ba1\\u6838\",\"fid\":\"84\",\"url\":\"Comment\\/index\",\"sort\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('126', '菜单维护', '1', 'root', '1539824989', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('127', '首页', '1', 'root', '1539824993', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('128', '欢迎页', '1', 'root', '1539824993', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('129', '菜单维护', '1', 'root', '1539825007', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('130', '新增菜单', '1', 'root', '1539825813', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('131', '新增菜单', '1', 'root', '1539825858', '{\"name\":\"\\u57fa\\u7840\\u8bbe\\u7f6e\",\"fid\":\"0\",\"url\":\"\",\"sort\":\"9\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('132', '菜单维护', '1', 'root', '1539825859', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('133', '新增菜单', '1', 'root', '1539825860', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('134', '新增菜单', '1', 'root', '1539825910', '{\"name\":\"\\u7ea7\\u522b\\u7ba1\\u7406\",\"fid\":\"88\",\"url\":\"Class\\/index\",\"sort\":\"0\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('135', '菜单维护', '1', 'root', '1539825910', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('136', '新增菜单', '1', 'root', '1539825940', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('137', '新增菜单', '1', 'root', '1539825968', '{\"name\":\"\\u79d1\\u76ee\\u7ba1\\u7406\",\"fid\":\"88\",\"url\":\"Subject\\/index\",\"sort\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('138', '菜单维护', '1', 'root', '1539825968', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('139', '新增菜单', '1', 'root', '1539825990', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('140', '新增菜单', '1', 'root', '1539826023', '{\"name\":\"\\u7248\\u672c\\u7ba1\\u7406\",\"fid\":\"88\",\"url\":\"Versions\\/index\",\"sort\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('141', '菜单维护', '1', 'root', '1539826023', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('142', '首页', '1', 'root', '1539826127', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('143', '欢迎页', '1', 'root', '1539826127', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('144', '菜单维护', '1', 'root', '1539826136', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('145', '首页', '1', 'root', '1539826268', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('146', '欢迎页', '1', 'root', '1539826268', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('147', '知识点', '1', 'root', '1539826292', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('148', '句子', '1', 'root', '1539826294', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('149', '阅读文章', '1', 'root', '1539826295', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('150', '知识点', '1', 'root', '1539826683', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('151', '首页', '1', 'root', '1539831174', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('152', '欢迎页', '1', 'root', '1539831174', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('153', '知识点', '1', 'root', '1539831183', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('154', '首页', '1', 'root', '1539831283', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('155', '欢迎页', '1', 'root', '1539831283', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('156', '知识点', '1', 'root', '1539831286', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('157', '首页', '1', 'root', '1539831677', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('158', '欢迎页', '1', 'root', '1539831677', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('159', '知识点', '1', 'root', '1539831680', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('160', '级别管理', '1', 'root', '1539831745', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Class/index');
INSERT INTO `api_user_action` VALUES ('161', '首页', '1', 'root', '1539832201', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('162', '欢迎页', '1', 'root', '1539832201', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('163', '知识点', '1', 'root', '1539832204', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('164', '首页', '1', 'root', '1539832443', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('165', '欢迎页', '1', 'root', '1539832443', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('166', '知识点', '1', 'root', '1539832445', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('167', '首页', '1', 'root', '1539832568', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('168', '欢迎页', '1', 'root', '1539832568', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('169', '知识点', '1', 'root', '1539832572', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('170', '首页', '1', 'root', '1539832607', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('171', '欢迎页', '1', 'root', '1539832607', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('172', '知识点', '1', 'root', '1539832610', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('173', '首页', '1', 'root', '1539832683', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('174', '欢迎页', '1', 'root', '1539832683', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('175', '知识点', '1', 'root', '1539832686', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('176', '知识点', '1', 'root', '1539832689', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('177', '首页', '1', 'root', '1539832954', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('178', '欢迎页', '1', 'root', '1539832955', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('179', '知识点', '1', 'root', '1539832958', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('180', '首页', '1', 'root', '1539832960', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('181', '欢迎页', '1', 'root', '1539832961', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('182', '首页', '1', 'root', '1539833194', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('183', '欢迎页', '1', 'root', '1539833194', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('184', '学生列表', '1', 'root', '1539833196', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('185', '知识点', '1', 'root', '1539833198', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('186', '首页', '1', 'root', '1539833201', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('187', '欢迎页', '1', 'root', '1539833201', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('188', '首页', '1', 'root', '1539833203', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('189', '欢迎页', '1', 'root', '1539833204', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('190', '知识点', '1', 'root', '1539833205', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('191', '知识点', '1', 'root', '1539833207', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('192', '首页', '1', 'root', '1539833523', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('193', '欢迎页', '1', 'root', '1539833524', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('194', '知识点', '1', 'root', '1539833526', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('195', '首页', '1', 'root', '1539833605', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('196', '欢迎页', '1', 'root', '1539833605', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('197', '知识点', '1', 'root', '1539833607', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('198', '知识点', '1', 'root', '1539833612', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('199', '首页', '1', 'root', '1539833696', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('200', '欢迎页', '1', 'root', '1539833696', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('201', '知识点', '1', 'root', '1539833699', '{\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('202', '知识点', '1', 'root', '1539834129', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('203', '知识点', '1', 'root', '1539834134', '{\"p\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('204', '知识点', '1', 'root', '1539834136', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('205', '知识点', '1', 'root', '1539834148', '{\"p\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('206', '知识点', '1', 'root', '1539834150', '{\"p\":\"2\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('207', '知识点', '1', 'root', '1539834198', '{\"p\":\"1\",\"PHPSESSID\":\"2ss53tua2georhel7qjhhhn394\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('208', '首页', '1', 'root', '1539844910', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('209', '欢迎页', '1', 'root', '1539844911', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('210', '首页', '1', 'root', '1539847517', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('211', '欢迎页', '1', 'root', '1539847517', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('212', '知识点', '1', 'root', '1539847519', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('213', '知识点', '1', 'root', '1539847522', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('214', '知识点', '1', 'root', '1539847524', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('215', '首页', '1', 'root', '1539847556', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('216', '欢迎页', '1', 'root', '1539847556', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('217', '知识点', '1', 'root', '1539847558', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('218', '首页', '1', 'root', '1539847561', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('219', '首页', '1', 'root', '1539847565', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('220', '欢迎页', '1', 'root', '1539847672', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('221', '首页', '1', 'root', '1539847844', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('222', '欢迎页', '1', 'root', '1539847845', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('223', '知识点', '1', 'root', '1539847847', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('224', '首页', '1', 'root', '1539848111', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('225', '欢迎页', '1', 'root', '1539848111', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('226', '知识点', '1', 'root', '1539848113', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('227', '首页', '1', 'root', '1539848116', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('228', '欢迎页', '1', 'root', '1539848117', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('229', '知识点', '1', 'root', '1539848142', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('230', '知识点', '1', 'root', '1539848146', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('231', '知识点', '1', 'root', '1539848149', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('232', '首页', '1', 'root', '1539848215', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('233', '欢迎页', '1', 'root', '1539848215', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('234', '知识点', '1', 'root', '1539848217', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('235', '首页', '1', 'root', '1539848369', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('236', '欢迎页', '1', 'root', '1539848369', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('237', '知识点', '1', 'root', '1539848371', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('238', '知识点', '1', 'root', '1539848373', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('239', '首页', '1', 'root', '1539848412', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('240', '欢迎页', '1', 'root', '1539848412', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('241', '学生列表', '1', 'root', '1539848415', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('242', '知识点', '1', 'root', '1539848418', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('243', '知识点', '1', 'root', '1539848425', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('244', '知识点', '1', 'root', '1539848436', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('245', '知识点', '1', 'root', '1539848439', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('246', '知识点', '1', 'root', '1539848443', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('247', '首页', '1', 'root', '1539848654', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('248', '欢迎页', '1', 'root', '1539848654', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('249', '知识点', '1', 'root', '1539848657', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('250', '知识点', '1', 'root', '1539848665', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('251', '首页', '1', 'root', '1539848714', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('252', '欢迎页', '1', 'root', '1539848714', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('253', '知识点', '1', 'root', '1539848715', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('254', '知识点', '1', 'root', '1539848732', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('255', '首页', '1', 'root', '1539849136', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('256', '欢迎页', '1', 'root', '1539849136', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('257', '知识点', '1', 'root', '1539849138', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('258', '知识点', '1', 'root', '1539849140', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('259', '知识点', '1', 'root', '1539849141', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('260', '知识点', '1', 'root', '1539849142', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('261', '知识点', '1', 'root', '1539849143', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('262', '首页', '1', 'root', '1539849511', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('263', '欢迎页', '1', 'root', '1539849511', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('264', '知识点', '1', 'root', '1539849514', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('265', '知识点', '1', 'root', '1539849515', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('266', '知识点', '1', 'root', '1539849517', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('267', '知识点', '1', 'root', '1539849523', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('268', '知识点', '1', 'root', '1539849526', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('269', '首页', '1', 'root', '1539850009', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('270', '欢迎页', '1', 'root', '1539850009', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('271', '知识点', '1', 'root', '1539850011', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('272', '知识点', '1', 'root', '1539850021', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('273', '首页', '1', 'root', '1539850169', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('274', '欢迎页', '1', 'root', '1539850169', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('275', '知识点', '1', 'root', '1539850171', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('276', '知识点', '1', 'root', '1539850173', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('277', '知识点', '1', 'root', '1539850175', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('278', '知识点', '1', 'root', '1539850182', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('279', '首页', '1', 'root', '1539850741', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('280', '欢迎页', '1', 'root', '1539850741', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('281', '知识点', '1', 'root', '1539850743', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('282', '首页', '1', 'root', '1539850800', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('283', '欢迎页', '1', 'root', '1539850800', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('284', '知识点', '1', 'root', '1539850803', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('285', '首页', '1', 'root', '1539850825', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('286', '欢迎页', '1', 'root', '1539850825', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('287', '知识点', '1', 'root', '1539850827', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('288', '首页', '1', 'root', '1539850900', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('289', '欢迎页', '1', 'root', '1539850901', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('290', '知识点', '1', 'root', '1539850903', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('291', '首页', '1', 'root', '1539851350', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('292', '欢迎页', '1', 'root', '1539851351', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('293', '知识点', '1', 'root', '1539851352', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('294', '句子', '1', 'root', '1539851470', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('295', '首页', '1', 'root', '1539851484', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('296', '欢迎页', '1', 'root', '1539851484', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('297', '知识点', '1', 'root', '1539851487', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('298', '首页', '1', 'root', '1539851990', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('299', '欢迎页', '1', 'root', '1539851990', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('300', '知识点', '1', 'root', '1539851992', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('301', '知识点', '1', 'root', '1539852004', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('302', '知识点', '1', 'root', '1539852007', '{\"p\":\"3\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('303', '知识点', '1', 'root', '1539852009', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('304', '首页', '1', 'root', '1539852037', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('305', '欢迎页', '1', 'root', '1539852037', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('306', '知识点', '1', 'root', '1539852039', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('307', '首页', '1', 'root', '1539852103', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('308', '欢迎页', '1', 'root', '1539852103', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('309', '知识点', '1', 'root', '1539852106', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('310', '首页', '1', 'root', '1539852173', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('311', '欢迎页', '1', 'root', '1539852173', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('312', '知识点', '1', 'root', '1539852175', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('313', '首页', '1', 'root', '1539852203', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('314', '欢迎页', '1', 'root', '1539852203', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('315', '知识点', '1', 'root', '1539852207', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('316', '首页', '1', 'root', '1539852412', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('317', '欢迎页', '1', 'root', '1539852412', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('318', '知识点', '1', 'root', '1539852414', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('319', '首页', '1', 'root', '1539852478', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('320', '欢迎页', '1', 'root', '1539852478', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('321', '知识点', '1', 'root', '1539852480', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('322', '首页', '1', 'root', '1539852614', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('323', '欢迎页', '1', 'root', '1539852614', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('324', '知识点', '1', 'root', '1539852618', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('325', '首页', '1', 'root', '1539852668', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('326', '欢迎页', '1', 'root', '1539852668', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('327', '知识点', '1', 'root', '1539852671', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('328', '首页', '1', 'root', '1539852690', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('329', '欢迎页', '1', 'root', '1539852690', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('330', '知识点', '1', 'root', '1539852692', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('331', '首页', '1', 'root', '1539852733', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('332', '欢迎页', '1', 'root', '1539852733', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('333', '知识点', '1', 'root', '1539852735', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('334', '首页', '1', 'root', '1539852769', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('335', '欢迎页', '1', 'root', '1539852769', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('336', '知识点', '1', 'root', '1539852771', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('337', '首页', '1', 'root', '1539852794', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('338', '欢迎页', '1', 'root', '1539852795', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('339', '知识点', '1', 'root', '1539852796', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('340', '首页', '1', 'root', '1539852846', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('341', '欢迎页', '1', 'root', '1539852847', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('342', '知识点', '1', 'root', '1539852849', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('343', '首页', '1', 'root', '1539852854', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('344', '欢迎页', '1', 'root', '1539852854', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('345', '知识点', '1', 'root', '1539852856', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('346', '首页', '1', 'root', '1539852872', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('347', '欢迎页', '1', 'root', '1539852872', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('348', '知识点', '1', 'root', '1539852876', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('349', '首页', '1', 'root', '1539852887', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('350', '欢迎页', '1', 'root', '1539852887', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('351', '知识点', '1', 'root', '1539852889', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('352', '首页', '1', 'root', '1539852917', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('353', '欢迎页', '1', 'root', '1539852917', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('354', '知识点', '1', 'root', '1539852920', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('355', '首页', '1', 'root', '1539852937', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('356', '欢迎页', '1', 'root', '1539852937', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('357', '知识点', '1', 'root', '1539852939', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('358', '首页', '1', 'root', '1539853040', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('359', '欢迎页', '1', 'root', '1539853040', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('360', '知识点', '1', 'root', '1539853042', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('361', '首页', '1', 'root', '1539853086', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('362', '欢迎页', '1', 'root', '1539853088', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('363', '知识点', '1', 'root', '1539853090', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('364', '首页', '1', 'root', '1539853157', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('365', '欢迎页', '1', 'root', '1539853157', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('366', '知识点', '1', 'root', '1539853159', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('367', '首页', '1', 'root', '1539853247', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('368', '欢迎页', '1', 'root', '1539853247', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('369', '知识点', '1', 'root', '1539853249', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('370', '首页', '1', 'root', '1539853349', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('371', '欢迎页', '1', 'root', '1539853349', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('372', '知识点', '1', 'root', '1539853351', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('373', '首页', '1', 'root', '1539853464', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('374', '欢迎页', '1', 'root', '1539853464', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('375', '知识点', '1', 'root', '1539853467', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('376', '首页', '1', 'root', '1539853624', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('377', '欢迎页', '1', 'root', '1539853624', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('378', '知识点', '1', 'root', '1539853626', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('379', '首页', '1', 'root', '1539853765', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('380', '欢迎页', '1', 'root', '1539853765', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('381', '知识点', '1', 'root', '1539853767', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('382', '知识点', '1', 'root', '1539853787', '{\"p\":\"2\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('383', '知识点', '1', 'root', '1539853788', '{\"p\":\"3\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('384', '知识点', '1', 'root', '1539853791', '{\"p\":\"1\",\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('385', '首页', '1', 'root', '1539857582', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('386', '欢迎页', '1', 'root', '1539857583', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('387', '知识点', '1', 'root', '1539857585', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('388', '首页', '1', 'root', '1539857701', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('389', '欢迎页', '1', 'root', '1539857701', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('390', '知识点', '1', 'root', '1539857703', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('391', '首页', '1', 'root', '1539857761', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('392', '欢迎页', '1', 'root', '1539857762', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('393', '知识点', '1', 'root', '1539857763', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('394', '首页', '1', 'root', '1539857914', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('395', '欢迎页', '1', 'root', '1539857914', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('396', '知识点', '1', 'root', '1539857916', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('397', '首页', '1', 'root', '1539858048', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('398', '欢迎页', '1', 'root', '1539858048', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('399', '知识点', '1', 'root', '1539858051', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('400', '首页', '1', 'root', '1539858113', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('401', '欢迎页', '1', 'root', '1539858113', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('402', '知识点', '1', 'root', '1539858115', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('403', '首页', '1', 'root', '1539858181', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('404', '欢迎页', '1', 'root', '1539858181', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('405', '知识点', '1', 'root', '1539858183', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('406', '首页', '1', 'root', '1539858214', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('407', '欢迎页', '1', 'root', '1539858214', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('408', '知识点', '1', 'root', '1539858216', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('409', '首页', '1', 'root', '1539858574', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('410', '欢迎页', '1', 'root', '1539858574', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('411', '知识点', '1', 'root', '1539858576', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('412', '首页', '1', 'root', '1539858645', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('413', '欢迎页', '1', 'root', '1539858645', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('414', '知识点', '1', 'root', '1539858649', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('415', '首页', '1', 'root', '1539858653', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('416', '欢迎页', '1', 'root', '1539858653', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('417', '知识点', '1', 'root', '1539858655', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('418', '首页', '1', 'root', '1539858914', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('419', '欢迎页', '1', 'root', '1539858915', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('420', '知识点', '1', 'root', '1539858917', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('421', '首页', '1', 'root', '1539858971', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('422', '欢迎页', '1', 'root', '1539858972', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('423', '知识点', '1', 'root', '1539858973', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('424', '首页', '1', 'root', '1539859576', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('425', '欢迎页', '1', 'root', '1539859576', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('426', '知识点', '1', 'root', '1539859578', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('427', '首页', '1', 'root', '1539859952', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('428', '欢迎页', '1', 'root', '1539859952', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('429', '首页', '1', 'root', '1539860200', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('430', '欢迎页', '1', 'root', '1539860200', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('431', '知识点', '1', 'root', '1539860201', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('432', '知识点', '1', 'root', '1539860213', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('433', '知识点', '1', 'root', '1539860221', '{\"PHPSESSID\":\"q27hcpmct3e14tnq4mso87l1l2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('434', '首页', '1', 'root', '1539909360', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('435', '欢迎页', '1', 'root', '1539909360', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('436', '知识点', '1', 'root', '1539909364', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('437', '首页', '1', 'root', '1539909643', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('438', '欢迎页', '1', 'root', '1539909643', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('439', '知识点', '1', 'root', '1539909648', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('440', '首页', '1', 'root', '1539909730', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('441', '欢迎页', '1', 'root', '1539909730', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('442', '知识点', '1', 'root', '1539909732', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('443', '首页', '1', 'root', '1539910644', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('444', '欢迎页', '1', 'root', '1539910644', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('445', '知识点', '1', 'root', '1539910648', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('446', '首页', '1', 'root', '1539910659', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('447', '欢迎页', '1', 'root', '1539910659', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('448', '知识点', '1', 'root', '1539910660', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('449', '首页', '1', 'root', '1539910722', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('450', '欢迎页', '1', 'root', '1539910723', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('451', '知识点', '1', 'root', '1539910724', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('452', '句子', '1', 'root', '1539910793', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('453', '首页', '1', 'root', '1539910797', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('454', '欢迎页', '1', 'root', '1539910797', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('455', '知识点', '1', 'root', '1539910799', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('456', '首页', '1', 'root', '1539910853', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('457', '欢迎页', '1', 'root', '1539910853', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('458', '知识点', '1', 'root', '1539910855', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('459', '首页', '1', 'root', '1539911292', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('460', '欢迎页', '1', 'root', '1539911292', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('461', '知识点', '1', 'root', '1539911293', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('462', '首页', '1', 'root', '1539911340', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('463', '欢迎页', '1', 'root', '1539911340', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('464', '知识点', '1', 'root', '1539911343', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('465', '首页', '1', 'root', '1539911408', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('466', '欢迎页', '1', 'root', '1539911408', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('467', '知识点', '1', 'root', '1539911410', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('468', '知识点', '1', 'root', '1539911415', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('469', '知识点', '1', 'root', '1539911437', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('470', '知识点', '1', 'root', '1539911510', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('471', '知识点', '1', 'root', '1539911535', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('472', '首页', '1', 'root', '1539911594', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('473', '欢迎页', '1', 'root', '1539911594', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('474', '知识点', '1', 'root', '1539911596', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('475', '知识点', '1', 'root', '1539911601', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('476', '知识点', '1', 'root', '1539911614', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('477', '知识点', '1', 'root', '1539911635', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('478', '首页', '1', 'root', '1539911749', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('479', '欢迎页', '1', 'root', '1539911749', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('480', '知识点', '1', 'root', '1539911751', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('481', '知识点', '1', 'root', '1539911756', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('482', '句子', '1', 'root', '1539912421', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('483', '首页', '1', 'root', '1539912424', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('484', '欢迎页', '1', 'root', '1539912424', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('485', '知识点', '1', 'root', '1539912427', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('486', '知识点', '1', 'root', '1539912438', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('487', '知识点', '1', 'root', '1539912440', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('488', '知识点', '1', 'root', '1539912441', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('489', '知识点', '1', 'root', '1539912447', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('490', '知识点', '1', 'root', '1539912452', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('491', '首页', '1', 'root', '1539912496', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('492', '欢迎页', '1', 'root', '1539912496', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('493', '知识点', '1', 'root', '1539912498', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('494', '知识点', '1', 'root', '1539912502', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('495', '知识点', '1', 'root', '1539912508', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('496', '知识点', '1', 'root', '1539912529', '{\"p\":\"2\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('497', '知识点', '1', 'root', '1539912531', '{\"p\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('498', '操作日志', '1', 'root', '1539913040', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Log/index');
INSERT INTO `api_user_action` VALUES ('499', 'Ajax查询Log列表', '1', 'root', '1539913041', '{\"draw\":\"1\",\"columns\":[{\"data\":\"actionName\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"uid\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"nickname\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"url\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"addTime\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}},{\"data\":\"\",\"name\":\"\",\"searchable\":\"true\",\"orderable\":\"false\",\"search\":{\"value\":\"\",\"regex\":\"false\"}}],\"start\":\"0\",\"length\":\"20\",\"search\":{\"value\":\"\",\"regex\":\"false\"},\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Log/ajaxGetIndex');
INSERT INTO `api_user_action` VALUES ('500', '日志详情查看', '1', 'root', '1539913046', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Log/showDetail');
INSERT INTO `api_user_action` VALUES ('501', '首页', '1', 'root', '1539913461', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('502', '欢迎页', '1', 'root', '1539913461', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('503', '知识点', '1', 'root', '1539913463', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('504', '首页', '1', 'root', '1539913600', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('505', '欢迎页', '1', 'root', '1539913600', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('506', '菜单维护', '1', 'root', '1539913609', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('507', '新增菜单', '1', 'root', '1539913611', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('508', '新增菜单', '1', 'root', '1539913685', '{\"name\":\"\\u77e5\\u8bc6\\u70b9\\u4e0b\\u7ebf\",\"fid\":\"76\",\"url\":\"Knowledge\\/close\",\"sort\":\"5\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('509', '菜单维护', '1', 'root', '1539913685', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('510', '新增菜单', '1', 'root', '1539913688', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('511', '新增菜单', '1', 'root', '1539913728', '{\"name\":\"\\u77e5\\u8bc6\\u70b9\\u4e0a\\u7ebf\",\"fid\":\"76\",\"url\":\"Knowledge\\/open\",\"sort\":\"4\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('512', '菜单维护', '1', 'root', '1539913728', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('513', '首页', '1', 'root', '1539913764', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('514', '欢迎页', '1', 'root', '1539913764', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('515', '知识点', '1', 'root', '1539913765', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('516', '知识点下线', '1', 'root', '1539913769', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('517', '知识点', '1', 'root', '1539913769', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('518', '首页', '1', 'root', '1539913775', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('519', '欢迎页', '1', 'root', '1539913775', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('520', '知识点', '1', 'root', '1539913778', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('521', '知识点上线', '1', 'root', '1539913782', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('522', '知识点', '1', 'root', '1539913782', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('523', '首页', '1', 'root', '1539913784', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('524', '欢迎页', '1', 'root', '1539913785', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('525', '知识点', '1', 'root', '1539913787', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('526', '首页', '1', 'root', '1539913795', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('527', '欢迎页', '1', 'root', '1539913795', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('528', '知识点', '1', 'root', '1539913797', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('529', '首页', '1', 'root', '1539913954', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('530', '欢迎页', '1', 'root', '1539913954', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('531', '知识点', '1', 'root', '1539913956', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('532', '知识点', '1', 'root', '1539914510', '{\"p\":\"2\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('533', '知识点', '1', 'root', '1539914512', '{\"p\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('534', '首页', '1', 'root', '1539914636', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('535', '欢迎页', '1', 'root', '1539914636', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('536', '知识点', '1', 'root', '1539914638', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('537', '首页', '1', 'root', '1539915965', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('538', '欢迎页', '1', 'root', '1539915965', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('539', '知识点', '1', 'root', '1539915970', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('540', '新增菜单', '1', 'root', '1539916073', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('541', '新增菜单', '1', 'root', '1539916124', '{\"name\":\"\\u7f16\\u8f91\\u77e5\\u8bc6\\u70b9\",\"fid\":\"76\",\"url\":\"Knowledge\\/update\",\"sort\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('542', '菜单维护', '1', 'root', '1539916124', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('543', '新增菜单', '1', 'root', '1539916131', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('544', '新增菜单', '1', 'root', '1539916163', '{\"name\":\"\\u77e5\\u8bc6\\u70b9\\u6dfb\\u52a0\",\"fid\":\"76\",\"url\":\"Knowledge\\/add\",\"sort\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('545', '菜单维护', '1', 'root', '1539916163', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('546', '首页', '1', 'root', '1539916178', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('547', '欢迎页', '1', 'root', '1539916178', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('548', '知识点', '1', 'root', '1539916180', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('549', '编辑知识点', '1', 'root', '1539916182', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('550', '知识点添加', '1', 'root', '1539916191', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('551', '新增菜单', '1', 'root', '1539916908', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('552', '新增菜单', '1', 'root', '1539916943', '{\"name\":\"\\u67e5\\u770b\\u77e5\\u8bc6\\u70b9\",\"fid\":\"76\",\"url\":\"Knowledge\\/look\",\"sort\":\"2\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('553', '菜单维护', '1', 'root', '1539916943', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('554', '首页', '1', 'root', '1539917004', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('555', '欢迎页', '1', 'root', '1539917004', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('556', '知识点', '1', 'root', '1539917007', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('557', '首页', '1', 'root', '1539917111', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('558', '欢迎页', '1', 'root', '1539917111', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('559', '知识点', '1', 'root', '1539917114', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('560', '编辑知识点', '1', 'root', '1539917118', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('561', '知识点下线', '1', 'root', '1539917123', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('562', '知识点', '1', 'root', '1539917123', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('563', '知识点上线', '1', 'root', '1539917132', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('564', '知识点', '1', 'root', '1539917132', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('565', '首页', '1', 'root', '1539917230', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('566', '欢迎页', '1', 'root', '1539917230', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('567', '知识点', '1', 'root', '1539917231', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('568', '查看知识点', '1', 'root', '1539917232', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('569', '编辑知识点', '1', 'root', '1539917242', '{\"id\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('570', '首页', '1', 'root', '1539917295', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('571', '欢迎页', '1', 'root', '1539917295', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('572', '知识点', '1', 'root', '1539917297', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('573', '查看知识点', '1', 'root', '1539917298', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('574', '首页', '1', 'root', '1539917517', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('575', '欢迎页', '1', 'root', '1539917517', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('576', '知识点', '1', 'root', '1539917518', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('577', '知识点添加', '1', 'root', '1539917521', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('578', '新增菜单', '1', 'root', '1539919916', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('579', '新增菜单', '1', 'root', '1539919960', '{\"name\":\"\\u77e5\\u8bc6\\u70b9\\u56fe\\u7247\\u4e0a\\u4f20\",\"fid\":\"76\",\"url\":\"Knowledge\\/upload\",\"sort\":\"6\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('580', '菜单维护', '1', 'root', '1539919960', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('581', '首页', '1', 'root', '1539920319', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('582', '欢迎页', '1', 'root', '1539920319', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('583', '知识点', '1', 'root', '1539920321', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('584', '知识点添加', '1', 'root', '1539920323', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('585', '知识点图片上传', '1', 'root', '1539920471', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('586', '首页', '1', 'root', '1539920492', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('587', '欢迎页', '1', 'root', '1539920492', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('588', '知识点', '1', 'root', '1539920494', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('589', '知识点添加', '1', 'root', '1539920497', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('590', '知识点图片上传', '1', 'root', '1539920501', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('591', '首页', '1', 'root', '1539920673', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('592', '欢迎页', '1', 'root', '1539920674', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('593', '知识点', '1', 'root', '1539920675', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('594', '知识点添加', '1', 'root', '1539920678', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('595', '知识点图片上传', '1', 'root', '1539920682', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('596', '知识点图片上传', '1', 'root', '1539920704', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('597', '首页', '1', 'root', '1539921084', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('598', '欢迎页', '1', 'root', '1539921085', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('599', '知识点', '1', 'root', '1539921088', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('600', '知识点添加', '1', 'root', '1539921091', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('601', '知识点图片上传', '1', 'root', '1539921102', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('602', '首页', '1', 'root', '1539925535', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('603', '欢迎页', '1', 'root', '1539925535', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('604', '知识点', '1', 'root', '1539925537', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('605', '知识点添加', '1', 'root', '1539925539', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('606', '知识点图片上传', '1', 'root', '1539925547', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('607', '首页', '1', 'root', '1539925854', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('608', '欢迎页', '1', 'root', '1539925854', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('609', '知识点', '1', 'root', '1539925857', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('610', '知识点添加', '1', 'root', '1539925861', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('611', '知识点图片上传', '1', 'root', '1539925869', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('612', '编辑菜单', '1', 'root', '1539925944', '{\"id\":\"97\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('613', '编辑菜单', '1', 'root', '1539925960', '{\"id\":\"97\",\"name\":\"\\u77e5\\u8bc6\\u70b9\\u56fe\\u7247\\u4e0a\\u4f20\",\"fid\":\"76\",\"url\":\"Knowledge\\/upload\",\"sort\":\"6\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('614', '菜单维护', '1', 'root', '1539925960', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('615', '首页', '1', 'root', '1539927229', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('616', '欢迎页', '1', 'root', '1539927229', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('617', '知识点', '1', 'root', '1539927232', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('618', '知识点添加', '1', 'root', '1539927234', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('619', '知识点图片上传', '1', 'root', '1539927241', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('620', '首页', '1', 'root', '1539927364', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('621', '欢迎页', '1', 'root', '1539927364', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('622', '知识点', '1', 'root', '1539927367', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('623', '知识点添加', '1', 'root', '1539927369', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('624', '知识点图片上传', '1', 'root', '1539927372', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('625', '首页', '1', 'root', '1539927593', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('626', '欢迎页', '1', 'root', '1539927593', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('627', '知识点', '1', 'root', '1539927595', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('628', '知识点添加', '1', 'root', '1539927597', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('629', '知识点图片上传', '1', 'root', '1539927602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('630', '首页', '1', 'root', '1539927640', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('631', '欢迎页', '1', 'root', '1539927640', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('632', '知识点', '1', 'root', '1539927643', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('633', '知识点添加', '1', 'root', '1539927645', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('634', '知识点图片上传', '1', 'root', '1539927664', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('635', '知识点添加', '1', 'root', '1539927687', '{\"title\":\"\\u6211\\u4eec\\u90fd\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"file\":{\"616\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc96e70634ad.jpg\"},\"cover\":\"\",\"price\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6d4b\\u8bd5\\u4f9d\\u7a00\\u6492<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('636', '知识点添加', '1', 'root', '1539927693', '{\"title\":\"\\u6211\\u4eec\\u90fd\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"file\":{\"616\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc96e70634ad.jpg\"},\"cover\":\"\",\"price\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6d4b\\u8bd5\\u4f9d\\u7a00\\u6492<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('637', '知识点添加', '1', 'root', '1539927696', '{\"title\":\"\\u6211\\u4eec\\u90fd\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"file\":{\"616\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc96e70634ad.jpg\"},\"cover\":\"\",\"price\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6d4b\\u8bd5\\u4f9d\\u7a00\\u6492<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('638', '首页', '1', 'root', '1539927807', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('639', '欢迎页', '1', 'root', '1539927807', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('640', '知识点', '1', 'root', '1539927809', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('641', '知识点添加', '1', 'root', '1539927810', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('642', '知识点图片上传', '1', 'root', '1539927829', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('643', '知识点添加', '1', 'root', '1539927859', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('644', '首页', '1', 'root', '1539928238', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('645', '欢迎页', '1', 'root', '1539928238', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('646', '知识点', '1', 'root', '1539928240', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('647', '知识点添加', '1', 'root', '1539928242', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('648', '知识点图片上传', '1', 'root', '1539928251', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('649', '知识点添加', '1', 'root', '1539928303', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"cover\":\"\",\"file\":{\"367\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc970bbcd655.jpg\"},\"price\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>12dad\\u4ffa\\u7684\\u6c99\\u53d1<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('650', '首页', '1', 'root', '1539928505', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('651', '欢迎页', '1', 'root', '1539928505', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('652', '知识点', '1', 'root', '1539928510', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('653', '知识点添加', '1', 'root', '1539928512', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('654', '知识点图片上传', '1', 'root', '1539928528', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('655', '知识点添加', '1', 'root', '1539928537', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"cover\":\"\",\"file\":{\"92\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc971d0b7623.jpg\"},\"article_type\":\"POINT\",\"content\":\"<p>\\u79ef\\u5206ID\\u8bf7\\u989d\\u5916\\u70ed<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('656', '首页', '1', 'root', '1539928602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('657', '欢迎页', '1', 'root', '1539928602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('658', '知识点', '1', 'root', '1539928605', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('659', '知识点添加', '1', 'root', '1539928606', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('660', '知识点图片上传', '1', 'root', '1539928618', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('661', '知识点添加', '1', 'root', '1539928624', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"cover\":\"\",\"file\":{\"140\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc9722ad8de6.jpg\"},\"article_type\":\"POINT\",\"content\":\"<p>kj8<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('662', '首页', '1', 'root', '1539928693', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('663', '欢迎页', '1', 'root', '1539928693', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('664', '知识点', '1', 'root', '1539928695', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('665', '知识点添加', '1', 'root', '1539928697', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('666', '知识点图片上传', '1', 'root', '1539928706', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('667', '知识点添加', '1', 'root', '1539928720', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions\":\"1\",\"cover\":\"\",\"file\":{\"249\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97282cf5ae.jpg\"},\"article_type\":\"POINT\",\"content\":\"<p>\\u68b5\\u8482\\u5188<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('668', '首页', '1', 'root', '1539929012', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('669', '欢迎页', '1', 'root', '1539929012', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('670', '知识点', '1', 'root', '1539929014', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('671', '知识点添加', '1', 'root', '1539929016', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('672', '知识点图片上传', '1', 'root', '1539929025', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('673', '知识点添加', '1', 'root', '1539929041', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc973c1b970e.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u4e8c\\u624b<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('674', '首页', '1', 'root', '1539929164', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('675', '欢迎页', '1', 'root', '1539929164', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('676', '知识点', '1', 'root', '1539929166', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('677', '知识点添加', '1', 'root', '1539929168', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('678', '知识点图片上传', '1', 'root', '1539929177', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('679', '知识点添加', '1', 'root', '1539929190', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97459271e2.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u97e9\\u56fd\\u6cd5\\u9662<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('680', '首页', '1', 'root', '1539929225', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('681', '欢迎页', '1', 'root', '1539929226', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('682', '知识点', '1', 'root', '1539929238', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('683', '知识点添加', '1', 'root', '1539929239', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('684', '知识点图片上传', '1', 'root', '1539929251', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('685', '知识点添加', '1', 'root', '1539929256', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc974a34ad23.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u7b2c\\u4e09\\u65b9<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('686', '首页', '1', 'root', '1539929395', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('687', '欢迎页', '1', 'root', '1539929395', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('688', '知识点', '1', 'root', '1539929398', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('689', '知识点添加', '1', 'root', '1539929399', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('690', '知识点图片上传', '1', 'root', '1539929415', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('691', '知识点添加', '1', 'root', '1539929424', '{\"title\":\"\\u5929\\u6daf\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97547389a3.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6211\\u7684\\u6d4b\\u8bd5\\u554a\\u554a<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('692', '首页', '1', 'root', '1539929450', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('693', '欢迎页', '1', 'root', '1539929450', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('694', '知识点', '1', 'root', '1539929452', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('695', '知识点添加', '1', 'root', '1539929453', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('696', '知识点图片上传', '1', 'root', '1539929465', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('697', '知识点添加', '1', 'root', '1539929480', '{\"title\":\"\\u600e\\u4e48\\u56de\\u4e8b\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97579e33b7.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u7ba1\\u4e0d\\u662f\\u554a\\u97e9\\u56fd\\u554a<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('698', '首页', '1', 'root', '1539930015', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('699', '欢迎页', '1', 'root', '1539930015', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('700', '知识点', '1', 'root', '1539930017', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('701', '知识点添加', '1', 'root', '1539930018', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('702', '知识点图片上传', '1', 'root', '1539930041', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('703', '知识点添加', '1', 'root', '1539930049', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('704', '知识点图片上传', '1', 'root', '1539930059', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('705', '知识点添加', '1', 'root', '1539930065', '{\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc977cb7ea26.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6253\\u53d1\\u95ee\\u95ee<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('706', '首页', '1', 'root', '1539930416', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('707', '欢迎页', '1', 'root', '1539930417', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('708', '知识点', '1', 'root', '1539930419', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('709', '首页', '1', 'root', '1539930453', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('710', '欢迎页', '1', 'root', '1539930453', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('711', '知识点', '1', 'root', '1539930455', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('712', '知识点添加', '1', 'root', '1539930486', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('713', '知识点图片上传', '1', 'root', '1539930495', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('714', '知识点添加', '1', 'root', '1539930521', '{\"title\":\"\\u5929\\u6daf\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc9797f9fd2f.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6c34\\u7535\\u8d39<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('715', '首页', '1', 'root', '1539930763', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('716', '欢迎页', '1', 'root', '1539930763', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('717', '知识点', '1', 'root', '1539930767', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('718', '知识点添加', '1', 'root', '1539930768', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('719', '知识点图片上传', '1', 'root', '1539930783', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('720', '知识点添加', '1', 'root', '1539930789', '{\"title\":\"\\u4e22\\u4e09\\u843d\\u56db\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97a9f80ee9.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u5bbd\\u5ea6\\u6da6\\u80ba<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('721', '首页', '1', 'root', '1539930967', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('722', '欢迎页', '1', 'root', '1539930967', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('723', '知识点', '1', 'root', '1539930969', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('724', '知识点添加', '1', 'root', '1539930971', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('725', '知识点图片上传', '1', 'root', '1539930979', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('726', '知识点添加', '1', 'root', '1539930983', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97b639f03a.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u8272\\u5f31<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('727', '首页', '1', 'root', '1539931312', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('728', '欢迎页', '1', 'root', '1539931312', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('729', '知识点', '1', 'root', '1539931314', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('730', '知识点添加', '1', 'root', '1539931315', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('731', '知识点图片上传', '1', 'root', '1539931328', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('732', '知识点添加', '1', 'root', '1539931335', '{\"title\":\"\\u4f60\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc97cc05bdcc.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>\\u6211\\u8868\\u4e2a\\u4eba<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('733', '编辑知识点', '1', 'root', '1539931402', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('734', '编辑知识点', '1', 'root', '1539931415', '{\"id\":\"10\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>\\u8272\\u5f31<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('735', '编辑知识点', '1', 'root', '1539931422', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('736', '编辑知识点', '1', 'root', '1539931430', '{\"id\":\"10\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>\\u8272\\u5f31\\u6c34\\u7535\\u8d39<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('737', '首页', '1', 'root', '1539931434', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('738', '欢迎页', '1', 'root', '1539931434', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('739', '知识点', '1', 'root', '1539931436', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('740', '知识点下线', '1', 'root', '1539931458', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('741', '知识点', '1', 'root', '1539931458', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('742', '知识点', '1', 'root', '1539931467', '{\"p\":\"2\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('743', '知识点', '1', 'root', '1539931469', '{\"p\":\"3\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('744', '编辑知识点', '1', 'root', '1539931477', '{\"id\":\"4\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('745', '编辑知识点', '1', 'root', '1539931606', '{\"id\":\"4\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('746', '编辑知识点', '1', 'root', '1539931617', '{\"id\":\"4\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>\\u7b2c\\u4e09\\u65b9<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('747', '首页', '1', 'root', '1539931621', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('748', '欢迎页', '1', 'root', '1539931621', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('749', '知识点', '1', 'root', '1539931624', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('750', '知识点上线', '1', 'root', '1539931671', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('751', '知识点', '1', 'root', '1539931672', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('752', '首页', '1', 'root', '1539931675', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('753', '欢迎页', '1', 'root', '1539931675', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('754', '知识点', '1', 'root', '1539931678', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('755', '知识点下线', '1', 'root', '1539931687', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('756', '知识点', '1', 'root', '1539931687', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('757', '首页', '1', 'root', '1539931690', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('758', '欢迎页', '1', 'root', '1539931690', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('759', '知识点', '1', 'root', '1539931693', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('760', '编辑知识点', '1', 'root', '1539931697', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('761', '首页', '1', 'root', '1539931804', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('762', '欢迎页', '1', 'root', '1539931804', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('763', '知识点', '1', 'root', '1539931805', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('764', '编辑知识点', '1', 'root', '1539931808', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('765', '编辑知识点', '1', 'root', '1539931816', '{\"id\":\"10\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>\\u8272\\u5f31\\u6c34\\u7535\\u8d39<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('766', '首页', '1', 'root', '1539931819', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('767', '欢迎页', '1', 'root', '1539931820', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('768', '知识点', '1', 'root', '1539931821', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('769', '编辑知识点', '1', 'root', '1539931830', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('770', '编辑知识点', '1', 'root', '1539931849', '{\"id\":\"10\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>\\u8272\\u5f31\\u6c34\\u7535\\u8d39<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('771', '首页', '1', 'root', '1539931853', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('772', '欢迎页', '1', 'root', '1539931854', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('773', '知识点', '1', 'root', '1539931856', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('774', '查看知识点', '1', 'root', '1539932055', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('775', '查看知识点', '1', 'root', '1539932061', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('776', '首页', '1', 'root', '1539932820', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('777', '欢迎页', '1', 'root', '1539932821', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('778', '知识点', '1', 'root', '1539932823', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('779', '查看知识点', '1', 'root', '1539932824', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('780', '首页', '1', 'root', '1539933008', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('781', '欢迎页', '1', 'root', '1539933008', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('782', '知识点', '1', 'root', '1539933010', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('783', '查看知识点', '1', 'root', '1539933011', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('784', '首页', '1', 'root', '1539933145', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('785', '欢迎页', '1', 'root', '1539933146', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('786', '知识点', '1', 'root', '1539933147', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('787', '查看知识点', '1', 'root', '1539933148', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('788', '首页', '1', 'root', '1539933211', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('789', '欢迎页', '1', 'root', '1539933211', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('790', '知识点', '1', 'root', '1539933212', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('791', '查看知识点', '1', 'root', '1539933213', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('792', '首页', '1', 'root', '1539933519', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('793', '欢迎页', '1', 'root', '1539933519', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('794', '知识点', '1', 'root', '1539933521', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('795', '查看知识点', '1', 'root', '1539933524', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('796', '首页', '1', 'root', '1539933555', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('797', '欢迎页', '1', 'root', '1539933555', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('798', '知识点', '1', 'root', '1539933557', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('799', '查看知识点', '1', 'root', '1539933559', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('800', '首页', '1', 'root', '1539933758', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('801', '欢迎页', '1', 'root', '1539933759', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('802', '知识点', '1', 'root', '1539933761', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('803', '查看知识点', '1', 'root', '1539933763', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('804', '首页', '1', 'root', '1539933845', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('805', '欢迎页', '1', 'root', '1539933846', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('806', '知识点', '1', 'root', '1539933847', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('807', '查看知识点', '1', 'root', '1539933849', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('808', '首页', '1', 'root', '1539934209', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('809', '欢迎页', '1', 'root', '1539934209', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('810', '知识点', '1', 'root', '1539934211', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('811', '查看知识点', '1', 'root', '1539934213', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('812', '首页', '1', 'root', '1539934314', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('813', '欢迎页', '1', 'root', '1539934314', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('814', '知识点', '1', 'root', '1539934316', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('815', '查看知识点', '1', 'root', '1539934318', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('816', '首页', '1', 'root', '1539934448', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('817', '欢迎页', '1', 'root', '1539934448', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('818', '知识点', '1', 'root', '1539934450', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('819', '知识点下线', '1', 'root', '1539934454', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('820', '知识点', '1', 'root', '1539934454', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('821', '知识点上线', '1', 'root', '1539934458', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('822', '知识点', '1', 'root', '1539934458', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('823', '查看知识点', '1', 'root', '1539934461', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('824', '首页', '1', 'root', '1539934567', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('825', '欢迎页', '1', 'root', '1539934567', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('826', '知识点', '1', 'root', '1539934569', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('827', '查看知识点', '1', 'root', '1539934570', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('828', '首页', '1', 'root', '1539934589', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('829', '欢迎页', '1', 'root', '1539934589', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('830', '知识点', '1', 'root', '1539934590', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('831', '查看知识点', '1', 'root', '1539934592', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('832', '查看知识点', '1', 'root', '1539934600', '{\"id\":\"10\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('833', '首页', '1', 'root', '1539934664', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('834', '欢迎页', '1', 'root', '1539934664', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('835', '知识点', '1', 'root', '1539934666', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('836', '查看知识点', '1', 'root', '1539934667', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('837', '首页', '1', 'root', '1539934872', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('838', '欢迎页', '1', 'root', '1539934872', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('839', '知识点', '1', 'root', '1539934875', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('840', '查看知识点', '1', 'root', '1539934876', '{\"id\":\"11\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('841', '句子', '1', 'root', '1539935022', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('842', '首页', '1', 'root', '1539935024', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('843', '欢迎页', '1', 'root', '1539935024', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('844', '知识点', '1', 'root', '1539935026', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('845', '知识点添加', '1', 'root', '1539935033', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('846', '知识点图片上传', '1', 'root', '1539935055', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('847', '知识点添加', '1', 'root', '1539935060', '{\"title\":\"KK \",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc98b4f8336a.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>f<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('848', '首页', '1', 'root', '1539935065', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('849', '欢迎页', '1', 'root', '1539935065', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('850', '知识点', '1', 'root', '1539935067', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('851', '查看知识点', '1', 'root', '1539935091', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('852', '首页', '1', 'root', '1539935175', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('853', '欢迎页', '1', 'root', '1539935175', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('854', '首页', '1', 'root', '1539935178', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('855', '欢迎页', '1', 'root', '1539935178', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('856', '知识点', '1', 'root', '1539935179', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('857', '首页', '1', 'root', '1539935411', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('858', '欢迎页', '1', 'root', '1539935411', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('859', '知识点', '1', 'root', '1539935413', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('860', '首页', '1', 'root', '1539935454', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('861', '欢迎页', '1', 'root', '1539935454', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('862', '知识点', '1', 'root', '1539935456', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('863', '查看知识点', '1', 'root', '1539935458', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('864', '编辑知识点', '1', 'root', '1539935468', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('865', '知识点图片上传', '1', 'root', '1539935474', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('866', '编辑知识点', '1', 'root', '1539935511', '{\"id\":\"12\",\"title\":\"KK \",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc98cf224791.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>WOKDOFEAKDKFDK<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('867', '首页', '1', 'root', '1539935515', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('868', '欢迎页', '1', 'root', '1539935515', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('869', '知识点', '1', 'root', '1539935517', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('870', '查看知识点', '1', 'root', '1539935520', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('871', '首页', '1', 'root', '1539935708', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('872', '欢迎页', '1', 'root', '1539935708', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('873', '知识点', '1', 'root', '1539935709', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('874', '知识点添加', '1', 'root', '1539935710', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('875', '知识点图片上传', '1', 'root', '1539935720', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('876', '编辑知识点', '1', 'root', '1539935766', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('877', '首页', '1', 'root', '1539935819', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('878', '欢迎页', '1', 'root', '1539935820', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('879', '知识点', '1', 'root', '1539935821', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('880', '知识点添加', '1', 'root', '1539935822', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('881', '知识点图片上传', '1', 'root', '1539935827', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('882', '知识点图片上传', '1', 'root', '1539935834', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('883', '首页', '1', 'root', '1539936020', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('884', '欢迎页', '1', 'root', '1539936021', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('885', '知识点', '1', 'root', '1539936022', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('886', '编辑知识点', '1', 'root', '1539936026', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('887', '知识点添加', '1', 'root', '1539936404', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('888', '首页', '1', 'root', '1539936536', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('889', '欢迎页', '1', 'root', '1539936536', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('890', '知识点', '1', 'root', '1539936538', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('891', '知识点添加', '1', 'root', '1539936539', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('892', '知识点图片上传', '1', 'root', '1539936553', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('893', '首页', '1', 'root', '1539936602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('894', '欢迎页', '1', 'root', '1539936602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('895', '知识点', '1', 'root', '1539936603', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('896', '知识点添加', '1', 'root', '1539936605', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('897', '知识点图片上传', '1', 'root', '1539936620', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('898', '知识点添加', '1', 'root', '1539936632', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc9916c756bf.jpg\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>w<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('899', '首页', '1', 'root', '1539936635', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('900', '欢迎页', '1', 'root', '1539936636', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('901', '知识点', '1', 'root', '1539936638', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('902', '编辑知识点', '1', 'root', '1539936643', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('903', '知识点上线', '1', 'root', '1539936663', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('904', '知识点', '1', 'root', '1539936663', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('905', '编辑知识点', '1', 'root', '1539936664', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('906', '编辑知识点', '1', 'root', '1539936690', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('907', '首页', '1', 'root', '1539936694', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('908', '欢迎页', '1', 'root', '1539936694', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('909', '知识点', '1', 'root', '1539936696', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('910', '编辑知识点', '1', 'root', '1539936700', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('911', '编辑知识点', '1', 'root', '1539936735', '{\"id\":\"13\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>w<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('912', '首页', '1', 'root', '1539936740', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('913', '欢迎页', '1', 'root', '1539936740', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('914', '知识点', '1', 'root', '1539936742', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('915', '编辑知识点', '1', 'root', '1539936753', '{\"id\":\"13\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('916', '编辑知识点', '1', 'root', '1539936767', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('917', '编辑知识点', '1', 'root', '1539936783', '{\"id\":\"12\",\"title\":\"KK \",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>&lt;p&gt;WOKDOFEAKDKFDK&lt;\\/p&gt;<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('918', '首页', '1', 'root', '1539936790', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('919', '欢迎页', '1', 'root', '1539936790', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('920', '知识点', '1', 'root', '1539936792', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('921', '编辑知识点', '1', 'root', '1539936802', '{\"id\":\"12\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('922', '知识点添加', '1', 'root', '1539936842', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('923', '知识点图片上传', '1', 'root', '1539936851', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('924', '知识点添加', '1', 'root', '1539936870', '{\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc99253075c2.jpg\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>p<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('925', '首页', '1', 'root', '1539936875', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('926', '欢迎页', '1', 'root', '1539936875', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('927', '知识点', '1', 'root', '1539936877', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('928', '编辑知识点', '1', 'root', '1539936903', '{\"id\":\"14\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('929', '编辑知识点', '1', 'root', '1539936915', '{\"id\":\"14\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>&lt;p&gt;p&lt;\\/p&gt;\\u536b\\u751f<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('930', '编辑知识点', '1', 'root', '1539936919', '{\"id\":\"14\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('931', '首页', '1', 'root', '1539936929', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('932', '欢迎页', '1', 'root', '1539936929', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('933', '知识点', '1', 'root', '1539936931', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('934', '知识点添加', '1', 'root', '1539936936', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('935', '知识点图片上传', '1', 'root', '1539936941', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/upload');
INSERT INTO `api_user_action` VALUES ('936', '知识点添加', '1', 'root', '1539936992', '{\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bc992ad3d5aa.jpg\",\"article_type\":\"POINT\",\"content\":\"<p>h<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('937', '首页', '1', 'root', '1539936996', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('938', '欢迎页', '1', 'root', '1539936996', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('939', '知识点', '1', 'root', '1539936998', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('940', '编辑知识点', '1', 'root', '1539937005', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('941', '编辑知识点', '1', 'root', '1539937017', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>&lt;p&gt;h&lt;\\/p&gt;\\u4f60\\u597d<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('942', '首页', '1', 'root', '1539937024', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('943', '欢迎页', '1', 'root', '1539937024', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('944', '知识点', '1', 'root', '1539937026', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('945', '编辑知识点', '1', 'root', '1539937032', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('946', '编辑知识点', '1', 'root', '1539937039', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"<p>&lt;p&gt;&amp;lt;p&amp;gt;h&amp;lt;\\/p&amp;gt;\\u4f60\\u597d&lt;\\/p&gt;<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('947', '首页', '1', 'root', '1539937045', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('948', '欢迎页', '1', 'root', '1539937045', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('949', '知识点', '1', 'root', '1539937048', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('950', '编辑知识点', '1', 'root', '1539937063', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('951', '编辑知识点', '1', 'root', '1539937077', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"<p>&lt;p&gt;&amp;lt;p&amp;gt;&amp;amp;lt;p&amp;amp;gt;h&amp;amp;lt;\\/p&amp;amp;gt;\\u4f60\\u597d&amp;lt;\\/p&amp;gt;&lt;\\/p&gt;<\\/p>\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('952', '首页', '1', 'root', '1539937082', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('953', '欢迎页', '1', 'root', '1539937082', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('954', '知识点', '1', 'root', '1539937084', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('955', '首页', '1', 'root', '1539937182', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('956', '欢迎页', '1', 'root', '1539937182', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('957', '知识点', '1', 'root', '1539937184', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('958', '编辑知识点', '1', 'root', '1539937186', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('959', '编辑知识点', '1', 'root', '1539937198', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('960', '首页', '1', 'root', '1539937201', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('961', '欢迎页', '1', 'root', '1539937201', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('962', '知识点', '1', 'root', '1539937203', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('963', '编辑知识点', '1', 'root', '1539937208', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('964', '编辑知识点', '1', 'root', '1539937227', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('965', '首页', '1', 'root', '1539937230', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('966', '欢迎页', '1', 'root', '1539937230', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('967', '知识点', '1', 'root', '1539937234', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('968', '编辑知识点', '1', 'root', '1539937242', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('969', '编辑知识点', '1', 'root', '1539937249', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('970', '首页', '1', 'root', '1539937253', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('971', '欢迎页', '1', 'root', '1539937253', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('972', '知识点', '1', 'root', '1539937255', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('973', '首页', '1', 'root', '1539937318', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('974', '欢迎页', '1', 'root', '1539937318', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('975', '知识点', '1', 'root', '1539937320', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('976', '编辑知识点', '1', 'root', '1539937321', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('977', '编辑知识点', '1', 'root', '1539937328', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('978', '编辑知识点', '1', 'root', '1539937371', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('979', '编辑知识点', '1', 'root', '1539937376', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('980', '首页', '1', 'root', '1539937544', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('981', '欢迎页', '1', 'root', '1539937544', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('982', '知识点', '1', 'root', '1539937546', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('983', '编辑知识点', '1', 'root', '1539937547', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('984', '编辑知识点', '1', 'root', '1539937552', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('985', '编辑知识点', '1', 'root', '1539937580', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('986', '编辑知识点', '1', 'root', '1539937583', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('987', '首页', '1', 'root', '1539937677', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('988', '欢迎页', '1', 'root', '1539937677', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('989', '知识点', '1', 'root', '1539937679', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('990', '编辑知识点', '1', 'root', '1539937683', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('991', '编辑知识点', '1', 'root', '1539937689', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"show_status\":\"on\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('992', '首页', '1', 'root', '1539937693', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('993', '欢迎页', '1', 'root', '1539937693', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('994', '知识点', '1', 'root', '1539937695', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('995', '编辑知识点', '1', 'root', '1539937697', '{\"id\":\"15\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('996', '编辑知识点', '1', 'root', '1539937702', '{\"id\":\"15\",\"title\":\"\\u8fd8\\u4e0d\\u7ba1\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('997', '首页', '1', 'root', '1539937705', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('998', '欢迎页', '1', 'root', '1539937705', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('999', '知识点', '1', 'root', '1539937709', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1000', '编辑知识点', '1', 'root', '1539937719', '{\"id\":\"14\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1001', '编辑知识点', '1', 'root', '1539937726', '{\"id\":\"14\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"article_type\":\"POINT\",\"content\":\"\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1002', '首页', '1', 'root', '1539937730', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1003', '欢迎页', '1', 'root', '1539937731', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1004', '知识点', '1', 'root', '1539937737', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1005', '知识点', '1', 'root', '1539937761', '{\"p\":\"2\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1006', '知识点', '1', 'root', '1539937765', '{\"p\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1007', '知识点', '1', 'root', '1539937798', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1008', '首页', '1', 'root', '1539937976', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1009', '欢迎页', '1', 'root', '1539937976', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1010', '知识点', '1', 'root', '1539937978', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1011', '首页', '1', 'root', '1539938666', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1012', '欢迎页', '1', 'root', '1539938666', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1013', '知识点', '1', 'root', '1539938667', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1014', '首页', '1', 'root', '1539939952', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1015', '欢迎页', '1', 'root', '1539939952', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1016', '知识点', '1', 'root', '1539939953', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1017', '首页', '1', 'root', '1539940210', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1018', '欢迎页', '1', 'root', '1539940210', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1019', '知识点', '1', 'root', '1539940213', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1020', '知识点', '1', 'root', '1539940230', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1021', '首页', '1', 'root', '1539940396', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1022', '欢迎页', '1', 'root', '1539940396', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1023', '知识点', '1', 'root', '1539940398', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1024', '首页', '1', 'root', '1539940416', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1025', '欢迎页', '1', 'root', '1539940416', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1026', '知识点', '1', 'root', '1539940418', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1027', '首页', '1', 'root', '1539940821', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1028', '欢迎页', '1', 'root', '1539940821', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1029', '知识点', '1', 'root', '1539940823', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1030', '知识点', '1', 'root', '1539940831', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1031', '首页', '1', 'root', '1539941067', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1032', '欢迎页', '1', 'root', '1539941068', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1033', '知识点', '1', 'root', '1539941070', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1034', '知识点', '1', 'root', '1539941072', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1035', '知识点', '1', 'root', '1539941099', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1036', '知识点', '1', 'root', '1539941140', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1037', '知识点', '1', 'root', '1539941180', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1038', '知识点', '1', 'root', '1539941255', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1039', '知识点', '1', 'root', '1539941260', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1040', '首页', '1', 'root', '1539941266', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1041', '欢迎页', '1', 'root', '1539941266', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1042', '知识点', '1', 'root', '1539941268', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1043', '首页', '1', 'root', '1539941307', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1044', '欢迎页', '1', 'root', '1539941307', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1045', '知识点', '1', 'root', '1539941310', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1046', '欢迎页', '1', 'root', '1539941311', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1047', '欢迎页', '1', 'root', '1539941312', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1048', '欢迎页', '1', 'root', '1539941312', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1049', '欢迎页', '1', 'root', '1539941313', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1050', '欢迎页', '1', 'root', '1539941313', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1051', '欢迎页', '1', 'root', '1539941314', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1052', '欢迎页', '1', 'root', '1539941314', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1053', '知识点', '1', 'root', '1539941316', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1054', '句子', '1', 'root', '1539941327', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1055', '首页', '1', 'root', '1539941329', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1056', '欢迎页', '1', 'root', '1539941329', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1057', '知识点', '1', 'root', '1539941330', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1058', '首页', '1', 'root', '1539941389', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1059', '欢迎页', '1', 'root', '1539941389', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1060', '知识点', '1', 'root', '1539941391', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1061', '首页', '1', 'root', '1539941461', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1062', '欢迎页', '1', 'root', '1539941461', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1063', '知识点', '1', 'root', '1539941463', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1064', '知识点', '1', 'root', '1539941488', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1065', '知识点', '1', 'root', '1539941490', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1066', '知识点', '1', 'root', '1539941491', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1067', '知识点', '1', 'root', '1539941492', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1068', '知识点', '1', 'root', '1539941492', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1069', '知识点', '1', 'root', '1539941493', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1070', '知识点', '1', 'root', '1539941494', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1071', '知识点', '1', 'root', '1539941495', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1072', '知识点', '1', 'root', '1539941495', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1073', '知识点', '1', 'root', '1539941496', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1074', '知识点', '1', 'root', '1539941497', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1075', '知识点', '1', 'root', '1539941497', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1076', '知识点', '1', 'root', '1539941498', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1077', '知识点', '1', 'root', '1539941498', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1078', '知识点', '1', 'root', '1539941499', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1079', '知识点', '1', 'root', '1539941500', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1080', '首页', '1', 'root', '1539941588', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1081', '欢迎页', '1', 'root', '1539941589', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1082', '知识点', '1', 'root', '1539941591', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1083', '知识点', '1', 'root', '1539941594', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1084', '首页', '1', 'root', '1539941602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1085', '欢迎页', '1', 'root', '1539941602', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1086', '知识点', '1', 'root', '1539941606', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1087', '知识点', '1', 'root', '1539941609', '{\"id\":\"1\",\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1088', '首页', '1', 'root', '1539941708', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1089', '欢迎页', '1', 'root', '1539941708', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1090', '知识点', '1', 'root', '1539941710', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1091', '知识点', '1', 'root', '1539941713', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1092', '知识点', '1', 'root', '1539941716', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1093', '知识点', '1', 'root', '1539941722', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1094', '知识点', '1', 'root', '1539941725', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1095', '知识点', '1', 'root', '1539941728', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1096', '首页', '1', 'root', '1539941750', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1097', '欢迎页', '1', 'root', '1539941750', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1098', '知识点', '1', 'root', '1539941752', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1099', '知识点', '1', 'root', '1539941755', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1100', '知识点', '1', 'root', '1539941760', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1101', '知识点', '1', 'root', '1539941776', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1102', '首页', '1', 'root', '1539941868', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1103', '欢迎页', '1', 'root', '1539941868', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1104', '知识点', '1', 'root', '1539941870', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1105', '知识点', '1', 'root', '1539941881', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1106', '首页', '1', 'root', '1539942154', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1107', '欢迎页', '1', 'root', '1539942154', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1108', '知识点', '1', 'root', '1539942158', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1109', '知识点', '1', 'root', '1539942164', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1110', '知识点', '1', 'root', '1539942170', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1111', '知识点', '1', 'root', '1539942203', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1112', '知识点', '1', 'root', '1539942206', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1113', '知识点', '1', 'root', '1539942209', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1114', '知识点', '1', 'root', '1539942218', '{\"PHPSESSID\":\"g62ki9eq2de3sefad6hbna41q0\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1115', '首页', '1', 'root', '1540086207', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1116', '欢迎页', '1', 'root', '1540086208', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1117', '首页', '1', 'root', '1540086242', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1118', '欢迎页', '1', 'root', '1540086242', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1119', '科目管理', '1', 'root', '1540086246', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Subject/index');
INSERT INTO `api_user_action` VALUES ('1120', '知识点', '1', 'root', '1540086248', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1121', '首页', '1', 'root', '1540086348', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1122', '欢迎页', '1', 'root', '1540086348', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1123', '知识点', '1', 'root', '1540086350', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1124', '首页', '1', 'root', '1540086570', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1125', '欢迎页', '1', 'root', '1540086570', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1126', '知识点', '1', 'root', '1540086572', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1127', '知识点', '1', 'root', '1540086581', '{\"class_id\":\"\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1128', '首页', '1', 'root', '1540086641', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1129', '欢迎页', '1', 'root', '1540086642', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1130', '知识点', '1', 'root', '1540086644', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1131', '首页', '1', 'root', '1540086797', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1132', '欢迎页', '1', 'root', '1540086798', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1133', '知识点', '1', 'root', '1540086800', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1134', '首页', '1', 'root', '1540086849', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1135', '欢迎页', '1', 'root', '1540086849', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1136', '知识点', '1', 'root', '1540086860', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1137', '首页', '1', 'root', '1540086921', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1138', '欢迎页', '1', 'root', '1540086921', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1139', '知识点', '1', 'root', '1540086923', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1140', '知识点上线', '1', 'root', '1540086933', '{\"id\":\"15\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('1141', '知识点', '1', 'root', '1540086933', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1142', '知识点上线', '1', 'root', '1540086943', '{\"id\":\"14\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('1143', '知识点', '1', 'root', '1540086944', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1144', '首页', '1', 'root', '1540087556', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1145', '欢迎页', '1', 'root', '1540087556', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1146', '知识点', '1', 'root', '1540087561', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1147', '首页', '1', 'root', '1540087628', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1148', '欢迎页', '1', 'root', '1540087628', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1149', '知识点', '1', 'root', '1540087631', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1150', '首页', '1', 'root', '1540087672', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1151', '欢迎页', '1', 'root', '1540087672', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1152', '知识点', '1', 'root', '1540087674', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1153', '首页', '1', 'root', '1540087719', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1154', '欢迎页', '1', 'root', '1540087719', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1155', '知识点', '1', 'root', '1540087721', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1156', '首页', '1', 'root', '1540088112', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1157', '欢迎页', '1', 'root', '1540088112', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1158', '知识点', '1', 'root', '1540088114', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1159', '首页', '1', 'root', '1540088172', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1160', '欢迎页', '1', 'root', '1540088172', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1161', '知识点', '1', 'root', '1540088174', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1162', '首页', '1', 'root', '1540088203', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1163', '欢迎页', '1', 'root', '1540088204', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1164', '知识点', '1', 'root', '1540088205', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1165', '首页', '1', 'root', '1540088383', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1166', '欢迎页', '1', 'root', '1540088383', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1167', '知识点', '1', 'root', '1540088385', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1168', '首页', '1', 'root', '1540088415', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1169', '欢迎页', '1', 'root', '1540088416', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1170', '知识点', '1', 'root', '1540088417', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1171', '首页', '1', 'root', '1540088539', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1172', '欢迎页', '1', 'root', '1540088539', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1173', '知识点', '1', 'root', '1540088542', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1174', '首页', '1', 'root', '1540088679', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1175', '欢迎页', '1', 'root', '1540088679', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1176', '知识点', '1', 'root', '1540088681', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1177', '首页', '1', 'root', '1540088727', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1178', '欢迎页', '1', 'root', '1540088727', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1179', '知识点', '1', 'root', '1540088728', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1180', '首页', '1', 'root', '1540088874', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1181', '欢迎页', '1', 'root', '1540088875', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1182', '知识点', '1', 'root', '1540088878', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1183', '知识点下线', '1', 'root', '1540088882', '{\"id\":\"15\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('1184', '知识点', '1', 'root', '1540088882', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1185', '编辑知识点', '1', 'root', '1540088889', '{\"id\":\"15\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1186', '知识点添加', '1', 'root', '1540088911', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('1187', '首页', '1', 'root', '1540089204', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1188', '欢迎页', '1', 'root', '1540089204', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1189', '知识点', '1', 'root', '1540089206', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1190', '编辑知识点', '1', 'root', '1540089211', '{\"id\":\"15\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1191', '查看知识点', '1', 'root', '1540089219', '{\"id\":\"14\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('1192', '首页', '1', 'root', '1540089850', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1193', '首页', '1', 'root', '1540089923', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1194', '首页', '1', 'root', '1540089931', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1195', '首页', '1', 'root', '1540090010', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1196', '欢迎页', '1', 'root', '1540090011', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1197', '知识点', '1', 'root', '1540090013', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1198', '首页', '1', 'root', '1540090666', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1199', '欢迎页', '1', 'root', '1540090666', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1200', '知识点', '1', 'root', '1540090668', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1201', '首页', '1', 'root', '1540090969', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1202', '欢迎页', '1', 'root', '1540090969', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1203', '知识点', '1', 'root', '1540090971', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1204', '首页', '1', 'root', '1540090998', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1205', '欢迎页', '1', 'root', '1540090998', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1206', '知识点', '1', 'root', '1540091000', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1207', '首页', '1', 'root', '1540091254', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1208', '欢迎页', '1', 'root', '1540091254', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1209', '知识点', '1', 'root', '1540091256', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1210', '首页', '1', 'root', '1540091561', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1211', '欢迎页', '1', 'root', '1540091561', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1212', '知识点', '1', 'root', '1540091563', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1213', '首页', '1', 'root', '1540091671', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1214', '欢迎页', '1', 'root', '1540091671', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1215', '知识点', '1', 'root', '1540091676', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1216', '首页', '1', 'root', '1540091817', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1217', '欢迎页', '1', 'root', '1540091818', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1218', '知识点', '1', 'root', '1540091820', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1219', '首页', '1', 'root', '1540092405', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1220', '欢迎页', '1', 'root', '1540092405', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1221', '知识点', '1', 'root', '1540092409', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1222', '首页', '1', 'root', '1540092611', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1223', '欢迎页', '1', 'root', '1540092612', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1224', '知识点', '1', 'root', '1540092614', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1225', '首页', '1', 'root', '1540092632', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1226', '欢迎页', '1', 'root', '1540092632', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1227', '知识点', '1', 'root', '1540092634', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1228', '首页', '1', 'root', '1540092678', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1229', '欢迎页', '1', 'root', '1540092678', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1230', '知识点', '1', 'root', '1540092681', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1231', '首页', '1', 'root', '1540092700', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1232', '欢迎页', '1', 'root', '1540092700', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1233', '知识点', '1', 'root', '1540092703', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1234', '首页', '1', 'root', '1540092783', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1235', '欢迎页', '1', 'root', '1540092783', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1236', '知识点', '1', 'root', '1540092785', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1237', '首页', '1', 'root', '1540092814', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1238', '欢迎页', '1', 'root', '1540092814', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1239', '知识点', '1', 'root', '1540092817', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1240', '首页', '1', 'root', '1540092832', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1241', '欢迎页', '1', 'root', '1540092832', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1242', '知识点', '1', 'root', '1540092833', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1243', '首页', '1', 'root', '1540103643', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1244', '欢迎页', '1', 'root', '1540103643', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1245', '知识点', '1', 'root', '1540103645', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1246', '首页', '1', 'root', '1540103752', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1247', '欢迎页', '1', 'root', '1540103752', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1248', '知识点', '1', 'root', '1540103754', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1249', '首页', '1', 'root', '1540107217', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1250', '欢迎页', '1', 'root', '1540107217', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1251', '知识点', '1', 'root', '1540107219', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1252', '首页', '1', 'root', '1540107380', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1253', '欢迎页', '1', 'root', '1540107381', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1254', '知识点', '1', 'root', '1540107383', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1255', '首页', '1', 'root', '1540107421', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1256', '欢迎页', '1', 'root', '1540107421', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1257', '知识点', '1', 'root', '1540107423', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1258', '首页', '1', 'root', '1540107472', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1259', '欢迎页', '1', 'root', '1540107472', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1260', '知识点', '1', 'root', '1540107474', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1261', '首页', '1', 'root', '1540109149', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1262', '欢迎页', '1', 'root', '1540109149', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1263', '知识点', '1', 'root', '1540109151', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1264', '首页', '1', 'root', '1540109175', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1265', '欢迎页', '1', 'root', '1540109176', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1266', '菜单维护', '1', 'root', '1540109184', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1267', '新增菜单', '1', 'root', '1540109188', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1268', '新增菜单', '1', 'root', '1540109274', '{\"name\":\"\\u5206\\u9875\\u6837\\u5f0f\",\"fid\":\"76\",\"url\":\"Knowledge\\/bootstrap_page_style\",\"sort\":\"8\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1269', '菜单维护', '1', 'root', '1540109274', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1270', '编辑菜单', '1', 'root', '1540109282', '{\"id\":\"98\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1271', '编辑菜单', '1', 'root', '1540109286', '{\"id\":\"98\",\"name\":\"\\u5206\\u9875\\u6837\\u5f0f\",\"fid\":\"76\",\"url\":\"Knowledge\\/bootstrap_page_style\",\"sort\":\"7\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1272', '菜单维护', '1', 'root', '1540109287', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1273', '首页', '1', 'root', '1540109296', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1274', '欢迎页', '1', 'root', '1540109296', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1275', '知识点', '1', 'root', '1540109298', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1276', '首页', '1', 'root', '1540109311', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1277', '欢迎页', '1', 'root', '1540109311', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1278', '知识点', '1', 'root', '1540109313', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1279', '编辑菜单', '1', 'root', '1540109482', '{\"id\":\"98\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1280', '编辑菜单', '1', 'root', '1540109490', '{\"id\":\"98\",\"name\":\"\\u5206\\u9875\\u6837\\u5f0f\",\"fid\":\"76\",\"url\":\"Knowledge\\/bootstrapPageStyle\",\"sort\":\"7\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1281', '菜单维护', '1', 'root', '1540109490', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1282', '首页', '1', 'root', '1540109497', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1283', '欢迎页', '1', 'root', '1540109497', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1284', '知识点', '1', 'root', '1540109499', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1285', '首页', '1', 'root', '1540109546', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1286', '欢迎页', '1', 'root', '1540109546', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1287', '知识点', '1', 'root', '1540109547', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1288', '知识点', '1', 'root', '1540109552', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1289', '知识点', '1', 'root', '1540109559', '{\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1290', '知识点', '1', 'root', '1540109595', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1291', '首页', '1', 'root', '1540109722', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1292', '欢迎页', '1', 'root', '1540109722', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1293', '知识点', '1', 'root', '1540109726', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1294', '知识点', '1', 'root', '1540109739', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1295', '首页', '1', 'root', '1540109805', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1296', '欢迎页', '1', 'root', '1540109805', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1297', '知识点', '1', 'root', '1540109806', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1298', '知识点', '1', 'root', '1540109809', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1299', '知识点', '1', 'root', '1540109826', '{\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1300', '首页', '1', 'root', '1540109829', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1301', '欢迎页', '1', 'root', '1540109829', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1302', '知识点', '1', 'root', '1540109831', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1303', '首页', '1', 'root', '1540109889', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1304', '欢迎页', '1', 'root', '1540109889', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1305', '知识点', '1', 'root', '1540109891', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1306', '知识点', '1', 'root', '1540109898', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1307', '首页', '1', 'root', '1540110017', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1308', '欢迎页', '1', 'root', '1540110017', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1309', '知识点', '1', 'root', '1540110020', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1310', '首页', '1', 'root', '1540110031', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1311', '欢迎页', '1', 'root', '1540110032', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1312', '知识点', '1', 'root', '1540110037', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1313', '首页', '1', 'root', '1540110154', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1314', '欢迎页', '1', 'root', '1540110155', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1315', '知识点', '1', 'root', '1540110157', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1316', '知识点', '1', 'root', '1540110173', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1317', '知识点', '1', 'root', '1540110179', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1318', '知识点', '1', 'root', '1540110201', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1319', '首页', '1', 'root', '1540110852', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1320', '欢迎页', '1', 'root', '1540110852', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1321', '知识点', '1', 'root', '1540110854', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1322', '知识点', '1', 'root', '1540110860', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1323', '首页', '1', 'root', '1540110936', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1324', '欢迎页', '1', 'root', '1540110937', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1325', '知识点', '1', 'root', '1540110939', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1326', '知识点', '1', 'root', '1540110944', '{\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1327', '知识点', '1', 'root', '1540110950', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1328', '知识点', '1', 'root', '1540110952', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1329', '首页', '1', 'root', '1540110954', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1330', '欢迎页', '1', 'root', '1540110954', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1331', '知识点', '1', 'root', '1540110956', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1332', '知识点', '1', 'root', '1540110961', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1333', '首页', '1', 'root', '1540111202', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1334', '欢迎页', '1', 'root', '1540111202', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1335', '知识点', '1', 'root', '1540111204', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1336', '首页', '1', 'root', '1540111269', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1337', '欢迎页', '1', 'root', '1540111270', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1338', '知识点', '1', 'root', '1540111271', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1339', '首页', '1', 'root', '1540111275', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1340', '欢迎页', '1', 'root', '1540111275', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1341', '知识点', '1', 'root', '1540111277', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1342', '首页', '1', 'root', '1540111308', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1343', '欢迎页', '1', 'root', '1540111308', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1344', '知识点', '1', 'root', '1540111310', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1345', '知识点', '1', 'root', '1540111335', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1346', '首页', '1', 'root', '1540111379', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1347', '欢迎页', '1', 'root', '1540111379', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1348', '知识点', '1', 'root', '1540111382', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1349', '首页', '1', 'root', '1540111463', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1350', '欢迎页', '1', 'root', '1540111463', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1351', '知识点', '1', 'root', '1540111466', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1352', '首页', '1', 'root', '1540111574', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1353', '欢迎页', '1', 'root', '1540111575', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1354', '知识点', '1', 'root', '1540111577', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1355', '首页', '1', 'root', '1540112051', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1356', '欢迎页', '1', 'root', '1540112052', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1357', '知识点', '1', 'root', '1540112056', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1358', '首页', '1', 'root', '1540112113', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1359', '欢迎页', '1', 'root', '1540112113', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1360', '知识点', '1', 'root', '1540112115', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1361', '首页', '1', 'root', '1540112280', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1362', '欢迎页', '1', 'root', '1540112280', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1363', '知识点', '1', 'root', '1540112282', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1364', '首页', '1', 'root', '1540112352', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1365', '欢迎页', '1', 'root', '1540112352', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1366', '知识点', '1', 'root', '1540112354', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1367', '首页', '1', 'root', '1540112406', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1368', '欢迎页', '1', 'root', '1540112406', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1369', '首页', '1', 'root', '1540112407', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1370', '欢迎页', '1', 'root', '1540112407', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1371', '知识点', '1', 'root', '1540112409', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1372', '首页', '1', 'root', '1540112606', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1373', '欢迎页', '1', 'root', '1540112606', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1374', '知识点', '1', 'root', '1540112608', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1375', '知识点', '1', 'root', '1540112617', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1376', '首页', '1', 'root', '1540112667', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1377', '欢迎页', '1', 'root', '1540112668', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1378', '首页', '1', 'root', '1540112675', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1379', '欢迎页', '1', 'root', '1540112676', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1380', '知识点', '1', 'root', '1540112679', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1381', '知识点', '1', 'root', '1540112691', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1382', '知识点', '1', 'root', '1540112702', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1383', '知识点下线', '1', 'root', '1540112709', '{\"id\":\"11\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('1384', '知识点', '1', 'root', '1540112709', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1385', '知识点下线', '1', 'root', '1540112712', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('1386', '知识点', '1', 'root', '1540112713', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1387', '知识点', '1', 'root', '1540112727', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1388', '知识点', '1', 'root', '1540112731', '{\"article_type\":\"POINT\",\"id\":\"1\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1389', '首页', '1', 'root', '1540112839', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1390', '欢迎页', '1', 'root', '1540112839', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1391', '知识点', '1', 'root', '1540112841', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1392', '知识点', '1', 'root', '1540112847', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1393', '首页', '1', 'root', '1540113061', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1394', '欢迎页', '1', 'root', '1540113061', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1395', '知识点', '1', 'root', '1540113063', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1396', '首页', '1', 'root', '1540113107', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1397', '欢迎页', '1', 'root', '1540113107', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1398', '知识点', '1', 'root', '1540113110', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1399', '知识点', '1', 'root', '1540113156', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1400', '知识点', '1', 'root', '1540113189', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1401', '知识点', '1', 'root', '1540113192', '{\"article_type\":\"POINT\",\"id\":\"1\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1402', '知识点', '1', 'root', '1540113223', '{\"class_id\":\"1\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\",\"article_type\":\"POINT\",\"id\":\"1\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1403', '知识点', '1', 'root', '1540113337', '{\"class_id\":\"1\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"article_type\":\"POINT\",\"id\":\"1\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1404', '首页', '1', 'root', '1540114658', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1405', '欢迎页', '1', 'root', '1540114659', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1406', '知识点', '1', 'root', '1540114660', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1407', '首页', '1', 'root', '1540114761', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1408', '欢迎页', '1', 'root', '1540114761', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1409', '知识点', '1', 'root', '1540114763', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1410', '首页', '1', 'root', '1540114795', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1411', '欢迎页', '1', 'root', '1540114795', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1412', '知识点', '1', 'root', '1540114796', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1413', '首页', '1', 'root', '1540114828', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1414', '欢迎页', '1', 'root', '1540114828', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1415', '知识点', '1', 'root', '1540114830', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1416', '知识点', '1', 'root', '1540114838', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1417', '首页', '1', 'root', '1540115182', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1418', '欢迎页', '1', 'root', '1540115182', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1419', '知识点', '1', 'root', '1540115184', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1420', '首页', '1', 'root', '1540115202', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1421', '欢迎页', '1', 'root', '1540115202', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1422', '知识点', '1', 'root', '1540115204', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1423', '知识点', '1', 'root', '1540115211', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1424', '首页', '1', 'root', '1540115239', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1425', '欢迎页', '1', 'root', '1540115239', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1426', '知识点', '1', 'root', '1540115240', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1427', '知识点', '1', 'root', '1540115247', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1428', '知识点', '1', 'root', '1540115252', '{\"article_type\":\"POINT\",\"id\":\"1\",\"title\":\"%\\u4f60%\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1429', '知识点', '1', 'root', '1540115286', '{\"article_type\":\"POINT\",\"id\":\"1\",\"title\":\"%\\u4f60%\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1430', '知识点', '1', 'root', '1540115430', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"%\\u4f60%\",\"article_type\":\"POINT\",\"id\":\"1\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1431', '知识点', '1', 'root', '1540115436', '{\"article_type\":\"POINT\",\"id\":\"1\",\"title\":\"%\\u4f60%\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1432', '首页', '1', 'root', '1540115469', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1433', '欢迎页', '1', 'root', '1540115469', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1434', '知识点', '1', 'root', '1540115471', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1435', '知识点', '1', 'root', '1540115473', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1436', '知识点', '1', 'root', '1540115476', '{\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1437', '首页', '1', 'root', '1540115513', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1438', '欢迎页', '1', 'root', '1540115513', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1439', '知识点', '1', 'root', '1540115518', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1440', '知识点', '1', 'root', '1540115522', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1441', '知识点', '1', 'root', '1540115523', '{\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1442', '知识点', '1', 'root', '1540115641', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1443', '首页', '1', 'root', '1540115790', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1444', '欢迎页', '1', 'root', '1540115790', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1445', '知识点', '1', 'root', '1540115792', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1446', '知识点', '1', 'root', '1540115797', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1447', '知识点', '1', 'root', '1540115823', '{\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1448', '知识点', '1', 'root', '1540116155', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1449', '知识点', '1', 'root', '1540116161', '{\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"1\",\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1450', '知识点', '1', 'root', '1540116213', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"1\",\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1451', '知识点', '1', 'root', '1540116235', '{\"article_type\":\"POINT\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1452', '阅读文章', '1', 'root', '1540116420', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1453', '首页', '1', 'root', '1540116423', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1454', '欢迎页', '1', 'root', '1540116423', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1455', '知识点', '1', 'root', '1540116425', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1456', '知识点', '1', 'root', '1540116435', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1457', '知识点', '1', 'root', '1540116450', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1458', '知识点', '1', 'root', '1540116455', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1459', '首页', '1', 'root', '1540116506', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1460', '欢迎页', '1', 'root', '1540116507', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1461', '知识点', '1', 'root', '1540116509', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1462', '知识点', '1', 'root', '1540116532', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1463', '知识点', '1', 'root', '1540116540', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1464', '首页', '1', 'root', '1540116581', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1465', '欢迎页', '1', 'root', '1540116581', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1466', '知识点', '1', 'root', '1540116587', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1467', '知识点', '1', 'root', '1540116594', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1468', '知识点', '1', 'root', '1540116606', '{\"article_type\":\"POINT\",\"id\":\"1\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1469', '句子', '1', 'root', '1540116893', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1470', '首页', '1', 'root', '1540116896', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1471', '欢迎页', '1', 'root', '1540116896', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1472', '知识点', '1', 'root', '1540116898', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1473', '知识点', '1', 'root', '1540116904', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1474', '知识点', '1', 'root', '1540116934', '{\"article_type\":\"POINT\",\"id\":\"1\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1475', '首页', '1', 'root', '1540117299', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1476', '欢迎页', '1', 'root', '1540117300', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1477', '知识点', '1', 'root', '1540117302', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1478', '知识点', '1', 'root', '1540117311', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1479', '首页', '1', 'root', '1540117401', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1480', '欢迎页', '1', 'root', '1540117401', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1481', '知识点', '1', 'root', '1540117403', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1482', '知识点', '1', 'root', '1540117411', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1483', '知识点', '1', 'root', '1540117415', '{\"article_type\":\"POINT\",\"id\":\"1\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1484', '首页', '1', 'root', '1540117629', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1485', '欢迎页', '1', 'root', '1540117629', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1486', '知识点', '1', 'root', '1540117631', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1487', '知识点', '1', 'root', '1540117640', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1488', '知识点', '1', 'root', '1540117650', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"_string\":\"a.title like \\\"%\\u4f60%\\\"\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1489', '首页', '1', 'root', '1540117716', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1490', '欢迎页', '1', 'root', '1540117716', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1491', '知识点', '1', 'root', '1540117718', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1492', '知识点', '1', 'root', '1540117724', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1493', '知识点', '1', 'root', '1540117727', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"title\":\"%\\u4f60%\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1494', '首页', '1', 'root', '1540117782', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1495', '欢迎页', '1', 'root', '1540117782', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1496', '知识点', '1', 'root', '1540117784', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1497', '知识点', '1', 'root', '1540117787', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1498', '知识点', '1', 'root', '1540117789', '{\"article_type\":\"POINT\",\"title\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1499', '首页', '1', 'root', '1540118246', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1500', '欢迎页', '1', 'root', '1540118246', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1501', '知识点', '1', 'root', '1540118255', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1502', '知识点', '1', 'root', '1540118266', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1503', '知识点', '1', 'root', '1540118296', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1504', '首页', '1', 'root', '1540118343', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1505', '欢迎页', '1', 'root', '1540118343', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1506', '知识点', '1', 'root', '1540118344', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1507', '知识点', '1', 'root', '1540118352', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1508', '知识点', '1', 'root', '1540118356', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1509', '知识点', '1', 'root', '1540118362', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1510', '知识点', '1', 'root', '1540118371', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1511', '首页', '1', 'root', '1540118422', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1512', '欢迎页', '1', 'root', '1540118423', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1513', '知识点', '1', 'root', '1540118424', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1514', '知识点', '1', 'root', '1540118432', '{\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1515', '知识点', '1', 'root', '1540118433', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1516', '知识点', '1', 'root', '1540118435', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1517', '知识点', '1', 'root', '1540118436', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1518', '知识点', '1', 'root', '1540118437', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1519', '知识点上线', '1', 'root', '1540118445', '{\"id\":\"11\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('1520', '知识点', '1', 'root', '1540118445', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1521', '知识点下线', '1', 'root', '1540118448', '{\"id\":\"11\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('1522', '知识点', '1', 'root', '1540118448', '{\"article_type\":\"POINT\",\"cid\":\"1\",\"sid\":\"1\",\"vid\":\"1\",\"atitle\":\"\\u4f60\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1523', '编辑知识点', '1', 'root', '1540118450', '{\"id\":\"11\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1524', '首页', '1', 'root', '1540118504', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1525', '欢迎页', '1', 'root', '1540118504', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1526', '知识点', '1', 'root', '1540118511', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1527', '知识点添加', '1', 'root', '1540118512', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('1528', '知识点添加', '1', 'root', '1540118533', '{\"title\":\"\\u4f60\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>DFEW<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('1529', '知识点', '1', 'root', '1540118533', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1530', '首页', '1', 'root', '1540118539', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1531', '欢迎页', '1', 'root', '1540118539', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1532', '知识点', '1', 'root', '1540118542', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1533', '知识点', '1', 'root', '1540118546', '{\"article_type\":\"POINT\",\"p\":\"11\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1534', '知识点', '1', 'root', '1540118549', '{\"article_type\":\"POINT\",\"p\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1535', '知识点', '1', 'root', '1540118554', '{\"article_type\":\"POINT\",\"p\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1536', '编辑知识点', '1', 'root', '1540118558', '{\"id\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1537', '首页', '1', 'root', '1540118649', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1538', '欢迎页', '1', 'root', '1540118649', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1539', '知识点', '1', 'root', '1540118651', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1540', '编辑知识点', '1', 'root', '1540118652', '{\"id\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1541', '编辑知识点', '1', 'root', '1540118660', '{\"id\":\"16\",\"title\":\"\\u4f60\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"article_type\":\"POINT\",\"content\":\"<p>DFEW\\u5927\\u8303\\u56f4<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/update');
INSERT INTO `api_user_action` VALUES ('1542', '知识点', '1', 'root', '1540118660', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1543', '知识点添加', '1', 'root', '1540118680', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/add');
INSERT INTO `api_user_action` VALUES ('1544', '查看知识点', '1', 'root', '1540120935', '{\"id\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/look');
INSERT INTO `api_user_action` VALUES ('1545', '句子', '1', 'root', '1540124447', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1546', '首页', '1', 'root', '1540124468', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1547', '欢迎页', '1', 'root', '1540124469', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1548', '菜单维护', '1', 'root', '1540124477', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1549', '新增菜单', '1', 'root', '1540124481', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1550', '新增菜单', '1', 'root', '1540124526', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1551', '新增菜单', '1', 'root', '1540124564', '{\"name\":\"\\u6dfb\\u52a0\\u53e5\\u5b50\",\"fid\":\"77\",\"url\":\"Sentence\\/add\",\"sort\":\"0\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1552', '菜单维护', '1', 'root', '1540124564', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1553', '新增菜单', '1', 'root', '1540124566', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1554', '新增菜单', '1', 'root', '1540124601', '{\"name\":\"\\u7f16\\u8f91\\u53e5\\u5b50\",\"fid\":\"77\",\"url\":\"Centence\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1555', '菜单维护', '1', 'root', '1540124601', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1556', '编辑菜单', '1', 'root', '1540124611', '{\"id\":\"100\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1557', '编辑菜单', '1', 'root', '1540124620', '{\"id\":\"100\",\"name\":\"\\u7f16\\u8f91\\u53e5\\u5b50\",\"fid\":\"77\",\"url\":\"Sentence\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1558', '菜单维护', '1', 'root', '1540124620', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1559', '新增菜单', '1', 'root', '1540124629', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1560', '新增菜单', '1', 'root', '1540124743', '{\"name\":\"\\u56fe\\u7247\\u4e0a\\u4f20\",\"fid\":\"77\",\"url\":\"Sentence\\/upload\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1561', '菜单维护', '1', 'root', '1540124743', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1562', '编辑菜单', '1', 'root', '1540124750', '{\"id\":\"101\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1563', '编辑菜单', '1', 'root', '1540124755', '{\"id\":\"101\",\"name\":\"\\u56fe\\u7247\\u4e0a\\u4f20\",\"fid\":\"77\",\"url\":\"Sentence\\/upload\",\"sort\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1564', '菜单维护', '1', 'root', '1540124755', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1565', '新增菜单', '1', 'root', '1540124785', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1566', '新增菜单', '1', 'root', '1540124857', '{\"name\":\"\\u53e5\\u5b50\\u4e0a\\u7ebf\",\"fid\":\"77\",\"url\":\"Sentence\\/open\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1567', '菜单维护', '1', 'root', '1540124857', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1568', '新增菜单', '1', 'root', '1540124859', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1569', '新增菜单', '1', 'root', '1540124885', '{\"name\":\"\\u53e5\\u5b50\\u4e0b\\u7ebf\",\"fid\":\"77\",\"url\":\"Sentence\\/close\",\"sort\":\"4\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1570', '菜单维护', '1', 'root', '1540124885', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1571', '新增菜单', '1', 'root', '1540124893', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1572', '新增菜单', '1', 'root', '1540124919', '{\"name\":\"\\u67e5\\u770b\\u53e5\\u5b50\",\"fid\":\"77\",\"url\":\"Sentence\\/look\",\"sort\":\"5\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1573', '菜单维护', '1', 'root', '1540124920', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1574', '首页', '1', 'root', '1540124926', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1575', '欢迎页', '1', 'root', '1540124927', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1576', '句子', '1', 'root', '1540124929', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1577', '添加句子', '1', 'root', '1540124930', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1578', '首页', '1', 'root', '1540125104', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1579', '欢迎页', '1', 'root', '1540125104', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1580', '图片上传', '1', 'root', '1540125122', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/upload');
INSERT INTO `api_user_action` VALUES ('1581', '添加句子', '1', 'root', '1540125137', '{\"title\":\"\\u53e5\\u5b50\\u4e00\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bcc71c2c97ed.jpg\",\"article_type\":\"SENTENCE\",\"content\":\"<p>\\u6211\\u7684\\u7f8e\\u5973<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1582', '句子', '1', 'root', '1540125137', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1583', '句子上线', '1', 'root', '1540125152', '{\"id\":\"17\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/open');
INSERT INTO `api_user_action` VALUES ('1584', '句子', '1', 'root', '1540125152', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1585', '句子下线', '1', 'root', '1540125155', '{\"id\":\"17\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/close');
INSERT INTO `api_user_action` VALUES ('1586', '句子', '1', 'root', '1540125155', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1587', '编辑句子', '1', 'root', '1540125157', '{\"id\":\"17\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/update');
INSERT INTO `api_user_action` VALUES ('1588', '编辑句子', '1', 'root', '1540125167', '{\"id\":\"17\",\"title\":\"\\u53e5\\u5b50\\u4e00\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"article_type\":\"SENTENCE\",\"content\":\"<p>\\u6211\\u7684\\u7f8e\\u5973\\u5f88\\u597d\\u770b<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/update');
INSERT INTO `api_user_action` VALUES ('1589', '句子', '1', 'root', '1540125167', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1590', '查看句子', '1', 'root', '1540125170', '{\"id\":\"17\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/look');
INSERT INTO `api_user_action` VALUES ('1591', '句子', '1', 'root', '1540125186', '{\"class_id\":\"1\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1592', '句子', '1', 'root', '1540125193', '{\"class_id\":\"1\",\"subject_id\":\"\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1593', '添加句子', '1', 'root', '1540125197', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1594', '图片上传', '1', 'root', '1540125212', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/upload');
INSERT INTO `api_user_action` VALUES ('1595', '添加句子', '1', 'root', '1540125219', '{\"title\":\"\\u53e5\\u5b50\\u4e8c\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bcc721c680f9.jpg\",\"article_type\":\"SENTENCE\",\"content\":\"<p>\\u5927\\u59d0\\u592bIE\\u9b4f\\u5343\\u96c5\\u989d\\u5916<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1596', '句子', '1', 'root', '1540125219', '{\"class_id\":\"1\",\"subject_id\":\"\",\"versions_id\":\"1\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1597', '首页', '1', 'root', '1540125229', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1598', '欢迎页', '1', 'root', '1540125229', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1599', '句子', '1', 'root', '1540125232', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1600', '句子', '1', 'root', '1540125237', '{\"article_type\":\"SENTENCE\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1601', '添加句子', '1', 'root', '1540125248', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1602', '图片上传', '1', 'root', '1540125261', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/upload');
INSERT INTO `api_user_action` VALUES ('1603', '添加句子', '1', 'root', '1540125268', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/articlePublish\\/knowledge\\/\\/5bcc724dd8072.jpg\",\"article_type\":\"SENTENCE\",\"content\":\"<p>\\u6bb7\\u6843<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/add');
INSERT INTO `api_user_action` VALUES ('1604', '句子', '1', 'root', '1540125268', '{\"article_type\":\"SENTENCE\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1605', '句子', '1', 'root', '1540125328', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u53e5\\u5b50\",\"article_type\":\"SENTENCE\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1606', '句子', '1', 'root', '1540125332', '{\"article_type\":\"SENTENCE\",\"p\":\"1\",\"atitle\":\"\\u53e5\\u5b50\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1607', '句子', '1', 'root', '1540125335', '{\"article_type\":\"SENTENCE\",\"p\":\"2\",\"atitle\":\"\\u53e5\\u5b50\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('1608', '阅读文章', '1', 'root', '1540125390', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1609', '首页', '1', 'root', '1540125923', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1610', '欢迎页', '1', 'root', '1540125923', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1611', '词组', '1', 'root', '1540125928', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1612', '欢迎页', '1', 'root', '1540125935', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1613', '菜单维护', '1', 'root', '1540125942', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1614', '新增菜单', '1', 'root', '1540125953', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1615', '新增菜单', '1', 'root', '1540125992', '{\"name\":\"\\u6dfb\\u52a0\\u8bcd\\u7ec4\",\"fid\":\"81\",\"url\":\"Words\\/add\",\"sort\":\"0\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1616', '菜单维护', '1', 'root', '1540125992', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1617', '新增菜单', '1', 'root', '1540125995', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1618', '新增菜单', '1', 'root', '1540126048', '{\"name\":\"\\u7f16\\u8f91\\u8bcd\\u7ec4\",\"fid\":\"81\",\"url\":\"Words\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1619', '菜单维护', '1', 'root', '1540126048', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1620', '新增菜单', '1', 'root', '1540126050', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1621', '新增菜单', '1', 'root', '1540126087', '{\"name\":\"\\u8bcd\\u7ec4\\u4e0a\\u7ebf\",\"fid\":\"81\",\"url\":\"Words\\/open\",\"sort\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1622', '菜单维护', '1', 'root', '1540126087', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1623', '新增菜单', '1', 'root', '1540126089', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1624', '新增菜单', '1', 'root', '1540126123', '{\"name\":\"\\u8bcd\\u7ec4\\u4e0b\\u7ebf\",\"fid\":\"81\",\"url\":\"Words\\/close\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1625', '菜单维护', '1', 'root', '1540126123', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1626', '新增菜单', '1', 'root', '1540126124', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1627', '新增菜单', '1', 'root', '1540126188', '{\"name\":\"\\u4e0a\\u4f20\\u56fe\\u7247-\\u8bcd\\u7ec4\",\"fid\":\"81\",\"url\":\"Words\\/upload\",\"sort\":\"4\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1628', '菜单维护', '1', 'root', '1540126188', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1629', '新增菜单', '1', 'root', '1540126198', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1630', '新增菜单', '1', 'root', '1540126240', '{\"name\":\"\\u67e5\\u770b\\u8bcd\\u7ec4\",\"fid\":\"81\",\"url\":\"Words\\/look\",\"sort\":\"5\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1631', '菜单维护', '1', 'root', '1540126240', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1632', '词组', '1', 'root', '1540126256', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1633', '添加词组', '1', 'root', '1540126257', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/add');
INSERT INTO `api_user_action` VALUES ('1634', '首页', '1', 'root', '1540126561', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1635', '欢迎页', '1', 'root', '1540126561', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1636', '词组', '1', 'root', '1540126565', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1637', '添加词组', '1', 'root', '1540126568', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/add');
INSERT INTO `api_user_action` VALUES ('1638', '上传图片-词组', '1', 'root', '1540126583', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/upload');
INSERT INTO `api_user_action` VALUES ('1639', '添加词组', '1', 'root', '1540126596', '{\"title\":\"\\u4f60\\u5f88\\u597d\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uplods\\/articlePublish\\/Words\\/\\/5bcc77770b3a0.jpg\",\"article_type\":\"WT\",\"content\":\"<p>\\u773c\\u6cea<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/add');
INSERT INTO `api_user_action` VALUES ('1640', '词组', '1', 'root', '1540126596', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1641', '词组上线', '1', 'root', '1540126604', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/open');
INSERT INTO `api_user_action` VALUES ('1642', '词组', '1', 'root', '1540126605', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1643', '首页', '1', 'root', '1540126612', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1644', '欢迎页', '1', 'root', '1540126612', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1645', '知识点', '1', 'root', '1540126615', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1646', '知识点上线', '1', 'root', '1540126619', '{\"id\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/open');
INSERT INTO `api_user_action` VALUES ('1647', '知识点', '1', 'root', '1540126619', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1648', '知识点下线', '1', 'root', '1540126624', '{\"id\":\"16\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/close');
INSERT INTO `api_user_action` VALUES ('1649', '知识点', '1', 'root', '1540126624', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1650', '词组', '1', 'root', '1540126628', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1651', '词组下线', '1', 'root', '1540126634', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/close');
INSERT INTO `api_user_action` VALUES ('1652', '词组', '1', 'root', '1540126634', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1653', '词组上线', '1', 'root', '1540126638', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/open');
INSERT INTO `api_user_action` VALUES ('1654', '词组', '1', 'root', '1540126638', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1655', '添加词组', '1', 'root', '1540126649', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/add');
INSERT INTO `api_user_action` VALUES ('1656', '上传图片-词组', '1', 'root', '1540126663', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/upload');
INSERT INTO `api_user_action` VALUES ('1657', '添加词组', '1', 'root', '1540126669', '{\"title\":\"\\u8bcd\\u7ec4\\u4e00\\u4e2a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uplods\\/articlePublish\\/Words\\/\\/5bcc77c7b8b79.jpg\",\"article_type\":\"WT\",\"content\":\"<p>\\u68c0\\u67e5<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/add');
INSERT INTO `api_user_action` VALUES ('1658', '词组', '1', 'root', '1540126669', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1659', '词组', '1', 'root', '1540126671', '{\"article_type\":\"WT\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1660', '词组', '1', 'root', '1540126678', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"article_type\":\"WT\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1661', '词组', '1', 'root', '1540126686', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u597d\",\"article_type\":\"WT\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1662', '词组', '1', 'root', '1540126691', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\",\"article_type\":\"WT\",\"p\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1663', '首页', '1', 'root', '1540126801', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1664', '欢迎页', '1', 'root', '1540126801', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1665', '词组', '1', 'root', '1540126807', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1666', '词组', '1', 'root', '1540126813', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1667', '词组', '1', 'root', '1540126830', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1668', '词组', '1', 'root', '1540126840', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1669', '词组下线', '1', 'root', '1540126848', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/close');
INSERT INTO `api_user_action` VALUES ('1670', '词组', '1', 'root', '1540126848', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1671', '编辑词组', '1', 'root', '1540126850', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/update');
INSERT INTO `api_user_action` VALUES ('1672', '编辑词组', '1', 'root', '1540126857', '{\"id\":\"20\",\"title\":\"\\u4f60\\u5f88\\u597d\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"article_type\":\"WT\",\"content\":\"<p>\\u773c\\u6cea\\u5206\\u89e3<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/update');
INSERT INTO `api_user_action` VALUES ('1673', '词组', '1', 'root', '1540126857', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4f60\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1674', '查看词组', '1', 'root', '1540126859', '{\"id\":\"20\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Words/look');
INSERT INTO `api_user_action` VALUES ('1675', '新增菜单', '1', 'root', '1540127445', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1676', '新增菜单', '1', 'root', '1540127494', '{\"name\":\"\\u6dfb\\u52a0\\u6587\\u7ae0\",\"fid\":\"78\",\"url\":\"Article\\/add\",\"sort\":\"0\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1677', '菜单维护', '1', 'root', '1540127494', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1678', '新增菜单', '1', 'root', '1540127497', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1679', '新增菜单', '1', 'root', '1540127526', '{\"name\":\"\\u7f16\\u8f91\\u6587\\u7ae0\",\"fid\":\"78\",\"url\":\"Article\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1680', '菜单维护', '1', 'root', '1540127526', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1681', '新增菜单', '1', 'root', '1540127528', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1682', '新增菜单', '1', 'root', '1540127571', '{\"name\":\"\\u4e0a\\u4f20\\u56fe\\u7247-\\u6587\\u7ae0\",\"fid\":\"78\",\"url\":\"Article\\/upload\",\"sort\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1683', '菜单维护', '1', 'root', '1540127571', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1684', '新增菜单', '1', 'root', '1540127575', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1685', '新增菜单', '1', 'root', '1540127608', '{\"name\":\"\\u9605\\u8bfb\\u6587\\u7ae0\",\"fid\":\"78\",\"url\":\"Article\\/look\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1686', '菜单维护', '1', 'root', '1540127608', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1687', '新增菜单', '1', 'root', '1540127609', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1688', '新增菜单', '1', 'root', '1540127645', '{\"name\":\"\\u6587\\u7ae0\\u4e0a\\u7ebf\",\"fid\":\"78\",\"url\":\"Article\\/open\",\"sort\":\"4\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1689', '菜单维护', '1', 'root', '1540127645', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1690', '新增菜单', '1', 'root', '1540127646', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1691', '新增菜单', '1', 'root', '1540127668', '{\"name\":\"\\u6587\\u7ae0\\u4e0b\\u7ebf\",\"fid\":\"78\",\"url\":\"Article\\/close\",\"sort\":\"5\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1692', '菜单维护', '1', 'root', '1540127669', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1693', '首页', '1', 'root', '1540127673', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1694', '欢迎页', '1', 'root', '1540127673', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1695', '首页', '1', 'root', '1540127674', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1696', '欢迎页', '1', 'root', '1540127675', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1697', '阅读文章', '1', 'root', '1540127679', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1698', '添加文章', '1', 'root', '1540127681', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/add');
INSERT INTO `api_user_action` VALUES ('1699', '上传图片-文章', '1', 'root', '1540127698', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/upload');
INSERT INTO `api_user_action` VALUES ('1700', '添加文章', '1', 'root', '1540127716', '{\"title\":\"\\u6211\\u7684\\u8001\\u5e08\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/article\\/\\/5bcc7bd2b3e91.jpg\",\"article_type\":\"ARTICLE\",\"content\":\"<p>\\u4ece\\u524d\\u6709\\u5ea7\\u5c71<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/add');
INSERT INTO `api_user_action` VALUES ('1701', '阅读文章', '1', 'root', '1540127716', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1702', '添加文章', '1', 'root', '1540127719', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/add');
INSERT INTO `api_user_action` VALUES ('1703', '上传图片-文章', '1', 'root', '1540127734', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/upload');
INSERT INTO `api_user_action` VALUES ('1704', '添加文章', '1', 'root', '1540127749', '{\"title\":\"\\u4e0a\\u4e0a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/article\\/\\/5bcc7bf60fc18.jpg\",\"article_type\":\"ARTICLE\",\"content\":\"<p>\\u5c71\\u4e0a\\u6709\\u4e2a\\u5e99,\\u5e99\\u91cc\\u6709\\u4e2a\\u8001\\u548c\\u5c1a<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/add');
INSERT INTO `api_user_action` VALUES ('1705', '阅读文章', '1', 'root', '1540127749', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1706', '阅读文章', '1', 'root', '1540127755', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4e0a\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1707', '文章上线', '1', 'root', '1540127761', '{\"id\":\"23\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/open');
INSERT INTO `api_user_action` VALUES ('1708', '阅读文章', '1', 'root', '1540127762', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4e0a\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1709', '编辑文章', '1', 'root', '1540127764', '{\"id\":\"23\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/update');
INSERT INTO `api_user_action` VALUES ('1710', '编辑文章', '1', 'root', '1540127768', '{\"id\":\"23\",\"title\":\"\\u4e0a\\u4e0a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"show_status\":\"on\",\"article_type\":\"ARTICLE\",\"content\":\"<p>\\u5c71\\u4e0a\\u6709\\u4e2a\\u5e99,\\u5e99\\u91cc\\u6709\\u4e2a\\u8001\\u548c\\u5c1a\\u7684<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/update');
INSERT INTO `api_user_action` VALUES ('1711', '阅读文章', '1', 'root', '1540127768', '{\"class_id\":\"\",\"subject_id\":\"\",\"versions_id\":\"\",\"title\":\"\\u4e0a\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1712', '阅读文章', '1', 'root', '1540127771', '{\"id\":\"23\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Article/look');
INSERT INTO `api_user_action` VALUES ('1713', '新增菜单', '1', 'root', '1540129966', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1714', '新增菜单', '1', 'root', '1540130002', '{\"name\":\"\\u8bfe\\u672c\\u6dfb\\u52a0\",\"fid\":\"79\",\"url\":\"Textbook\\/add\",\"sort\":\"0\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1715', '菜单维护', '1', 'root', '1540130002', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1716', '新增菜单', '1', 'root', '1540130004', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1717', '新增菜单', '1', 'root', '1540130032', '{\"name\":\"\\u7f16\\u8f91\\u8bfe\\u672c\",\"fid\":\"79\",\"url\":\"Textbook\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1718', '菜单维护', '1', 'root', '1540130032', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1719', '新增菜单', '1', 'root', '1540130033', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1720', '新增菜单', '1', 'root', '1540130064', '{\"name\":\"\\u8bfe\\u672c\\u4e0a\\u7ebf\",\"fid\":\"79\",\"url\":\"Textbook\\/open\",\"sort\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1721', '菜单维护', '1', 'root', '1540130065', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1722', '新增菜单', '1', 'root', '1540130066', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1723', '新增菜单', '1', 'root', '1540130091', '{\"name\":\"\\u8bfe\\u672c\\u4e0b\\u7ebf\",\"fid\":\"79\",\"url\":\"Textbook\\/close\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1724', '菜单维护', '1', 'root', '1540130091', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1725', '新增菜单', '1', 'root', '1540130093', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1726', '新增菜单', '1', 'root', '1540130143', '{\"name\":\"\\u4e0a\\u4f20\\u56fe\\u7247-\\u8bfe\\u672c\",\"fid\":\"79\",\"url\":\"Textbook\\/upload\",\"sort\":\"4\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1727', '菜单维护', '1', 'root', '1540130144', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1728', '新增菜单', '1', 'root', '1540130146', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1729', '新增菜单', '1', 'root', '1540130172', '{\"name\":\"\\u67e5\\u770b\\u8bfe\\u672c\",\"fid\":\"79\",\"url\":\"Textbook\\/look\",\"sort\":\"5\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1730', '菜单维护', '1', 'root', '1540130172', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1731', '首页', '1', 'root', '1540130199', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1732', '欢迎页', '1', 'root', '1540130199', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1733', '欢迎页', '1', 'root', '1540130206', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1734', '编辑菜单', '1', 'root', '1540130225', '{\"id\":\"79\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1735', '编辑菜单', '1', 'root', '1540130248', '{\"id\":\"79\",\"name\":\"\\u8bfe\\u672c\\u5217\\u8868\",\"fid\":\"75\",\"url\":\"Textbook\\/index\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('1736', '菜单维护', '1', 'root', '1540130248', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1737', '首页', '1', 'root', '1540130253', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1738', '欢迎页', '1', 'root', '1540130253', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1739', '知识点', '1', 'root', '1540130255', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1740', '课本列表', '1', 'root', '1540130257', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1741', '首页', '1', 'root', '1540130314', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1742', '欢迎页', '1', 'root', '1540130315', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1743', '课本列表', '1', 'root', '1540130319', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1744', '课本添加', '1', 'root', '1540130325', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1745', '上传图片-课本', '1', 'root', '1540130350', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/upload');
INSERT INTO `api_user_action` VALUES ('1746', '课本添加', '1', 'root', '1540130359', '{\"title\":\"\\u7b2c\\u4e00\\u672c\\u4e66\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc862e498b2.jpg\",\"article_type\":\"POINT\",\"intro\":\"<p>\\u624d\\u662f\\u4e66<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1747', '课本添加', '1', 'root', '1540130366', '{\"title\":\"\\u7b2c\\u4e00\\u672c\\u4e66\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc862e498b2.jpg\",\"article_type\":\"POINT\",\"intro\":\"<p>\\u624d\\u662f\\u4e66<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1748', '课本添加', '1', 'root', '1540130375', '{\"title\":\"\\u7b2c\\u4e00\\u672c\\u4e66\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc862e498b2.jpg\",\"article_type\":\"POINT\",\"intro\":\"<p>\\u624d\\u662f\\u4e66<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1749', '课本添加', '1', 'root', '1540130398', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1750', '上传图片-课本', '1', 'root', '1540130412', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/upload');
INSERT INTO `api_user_action` VALUES ('1751', '课本添加', '1', 'root', '1540130424', '{\"title\":\"\\u53e5\\u5b50\\u4e8c\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc866cb07ef.jpg\",\"article_type\":\"POINT\",\"intro\":\"<p>\\u4f60\\u597d\\u554a\\u5b89\\u5bbd\\u5e26\\u7f34\\u8d39ID<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1752', '首页', '1', 'root', '1540130582', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1753', '欢迎页', '1', 'root', '1540130582', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1754', '课本列表', '1', 'root', '1540130586', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1755', '课本添加', '1', 'root', '1540130588', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1756', '上传图片-课本', '1', 'root', '1540130597', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/upload');
INSERT INTO `api_user_action` VALUES ('1757', '课本添加', '1', 'root', '1540130601', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc87253e7b5.jpg\",\"intro\":\"<p>\\u53d1VB\\u5f53\\u7136<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1758', '课本添加', '1', 'root', '1540130622', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc87253e7b5.jpg\",\"intro\":\"<p>\\u53d1VB\\u5f53\\u7136<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1759', '课本添加', '1', 'root', '1540130708', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/textbook\\/\\/5bcc87253e7b5.jpg\",\"intro\":\"<p>\\u53d1VB\\u5f53\\u7136<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1760', '课本列表', '1', 'root', '1540130708', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1761', '首页', '1', 'root', '1540130768', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1762', '欢迎页', '1', 'root', '1540130768', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1763', '课本列表', '1', 'root', '1540130772', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1764', '编辑课本', '1', 'root', '1540130777', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/update');
INSERT INTO `api_user_action` VALUES ('1765', '编辑课本', '1', 'root', '1540130788', '{\"id\":\"1\",\"title\":\"\\u5e74\\u540e\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"intro\":\"<p>\\u53d1VB\\u5f53\\u7136<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/update');
INSERT INTO `api_user_action` VALUES ('1766', '课本列表', '1', 'root', '1540130789', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1767', '课本上线', '1', 'root', '1540130795', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/open');
INSERT INTO `api_user_action` VALUES ('1768', '课本列表', '1', 'root', '1540130796', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1769', '课本下线', '1', 'root', '1540130798', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/close');
INSERT INTO `api_user_action` VALUES ('1770', '课本列表', '1', 'root', '1540130798', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1771', '查看课本', '1', 'root', '1540130800', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/look');
INSERT INTO `api_user_action` VALUES ('1772', '视频', '1', 'root', '1540130903', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1773', '新增菜单', '1', 'root', '1540132052', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1774', '新增菜单', '1', 'root', '1540132080', '{\"name\":\"\\u6dfb\\u52a0\\u89c6\\u9891\",\"fid\":\"80\",\"url\":\"Video\\/add\",\"sort\":\"0\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1775', '菜单维护', '1', 'root', '1540132080', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1776', '新增菜单', '1', 'root', '1540132082', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1777', '新增菜单', '1', 'root', '1540132111', '{\"name\":\"\\u7f16\\u8f91\\u89c6\\u9891\",\"fid\":\"80\",\"url\":\"Video\\/update\",\"sort\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1778', '菜单维护', '1', 'root', '1540132111', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1779', '新增菜单', '1', 'root', '1540132112', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1780', '新增菜单', '1', 'root', '1540132159', '{\"name\":\"\\u56fe\\u7247\\u4e0a\\u4f20-\\u89c6\\u9891\",\"fid\":\"80\",\"url\":\"Video\\/upload\",\"sort\":\"2\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1781', '菜单维护', '1', 'root', '1540132159', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1782', '新增菜单', '1', 'root', '1540132161', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1783', '新增菜单', '1', 'root', '1540132187', '{\"name\":\"\\u89c6\\u9891\\u4e0a\\u7ebf\",\"fid\":\"80\",\"url\":\"Video\\/open\",\"sort\":\"3\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1784', '菜单维护', '1', 'root', '1540132187', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1785', '新增菜单', '1', 'root', '1540132190', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1786', '新增菜单', '1', 'root', '1540132211', '{\"name\":\"\\u89c6\\u9891\\u4e0b\\u7ebf\",\"fid\":\"80\",\"url\":\"Video\\/close\",\"sort\":\"4\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1787', '菜单维护', '1', 'root', '1540132211', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1788', '新增菜单', '1', 'root', '1540132212', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1789', '删除菜单', '1', 'root', '1540132239', '{\"id\":\"98\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/del');
INSERT INTO `api_user_action` VALUES ('1790', '菜单维护', '1', 'root', '1540132239', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1791', '新增菜单', '1', 'root', '1540132249', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1792', '新增菜单', '1', 'root', '1540132268', '{\"name\":\"\\u67e5\\u770b\\u89c6\\u9891\",\"fid\":\"80\",\"url\":\"Video\\/look\",\"sort\":\"5\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1793', '菜单维护', '1', 'root', '1540132268', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1794', '视频', '1', 'root', '1540132274', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1795', '添加视频', '1', 'root', '1540132278', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1796', '图片上传-视频', '1', 'root', '1540132298', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/upload');
INSERT INTO `api_user_action` VALUES ('1797', '添加视频', '1', 'root', '1540132305', '{\"title\":\"\\u7b2c\\u4e00\\u4e2a\\u89c6\\u9891\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/video\\/\\/5bcc8dcb099ba.jpg\",\"intro\":\"<p>\\u4f60\\u731c<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1798', '添加视频', '1', 'root', '1540132316', '{\"title\":\"\\u7b2c\\u4e00\\u4e2a\\u89c6\\u9891\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"cover\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/video\\/\\/5bcc8dcb099ba.jpg\",\"intro\":\"<p>\\u4f60\\u731c<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1799', '首页', '1', 'root', '1540132542', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1800', '欢迎页', '1', 'root', '1540132542', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1801', '视频', '1', 'root', '1540132546', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1802', '添加视频', '1', 'root', '1540132547', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1803', '图片上传-视频', '1', 'root', '1540132556', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/upload');
INSERT INTO `api_user_action` VALUES ('1804', '添加视频', '1', 'root', '1540132561', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/video\\/\\/5bcc8ecccf22d.jpg\",\"intro\":\"<p>\\u7684\\u4e09\\u5206<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1805', '添加视频', '1', 'root', '1540132569', '{\"title\":\"\\u5e74\\u540e\\u554a\\u554a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/video\\/\\/5bcc8ecccf22d.jpg\",\"intro\":\"<p>\\u7684\\u4e09\\u5206<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1806', '视频', '1', 'root', '1540132709', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1807', '首页', '1', 'root', '1540132713', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1808', '欢迎页', '1', 'root', '1540132714', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1809', '视频', '1', 'root', '1540132719', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1810', '添加视频', '1', 'root', '1540132720', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1811', '图片上传-视频', '1', 'root', '1540132731', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/upload');
INSERT INTO `api_user_action` VALUES ('1812', '添加视频', '1', 'root', '1540132744', '{\"title\":\"\\u4f60\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/articlePublish\\/video\\/\\/5bcc8f7bbd15d.jpg\",\"intro\":\"<p>\\u5ba3\\u4f20\\u6587\\u6848\\u70ed\\u98ce<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/add');
INSERT INTO `api_user_action` VALUES ('1813', '视频', '1', 'root', '1540132744', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1814', '视频上线', '1', 'root', '1540132771', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/open');
INSERT INTO `api_user_action` VALUES ('1815', '视频', '1', 'root', '1540132771', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1816', '编辑视频', '1', 'root', '1540132773', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/update');
INSERT INTO `api_user_action` VALUES ('1817', '编辑视频', '1', 'root', '1540132780', '{\"id\":\"1\",\"title\":\"\\u4f60\\u5e45\\u5ea6\\u4e3a\",\"class_id\":\"1\",\"subject_id\":\"1\",\"versions_id\":\"1\",\"file\":\"\",\"show_status\":\"on\",\"intro\":\"<p>\\u5ba3\\u4f20\\u6587\\u6848\\u70ed\\u98ce<\\/p>\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/update');
INSERT INTO `api_user_action` VALUES ('1818', '视频', '1', 'root', '1540132780', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1819', '查看视频', '1', 'root', '1540132783', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/look');
INSERT INTO `api_user_action` VALUES ('1820', '首页', '1', 'root', '1540132843', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1821', '欢迎页', '1', 'root', '1540132843', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1822', '视频', '1', 'root', '1540132848', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1823', '查看视频', '1', 'root', '1540132850', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/look');
INSERT INTO `api_user_action` VALUES ('1824', '首页', '1', 'root', '1540132909', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1825', '欢迎页', '1', 'root', '1540132909', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1826', '课本列表', '1', 'root', '1540132913', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1827', '视频', '1', 'root', '1540132914', '{\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('1828', '查看视频', '1', 'root', '1540132918', '{\"id\":\"1\",\"PHPSESSID\":\"renafi84jvhugj5ikqe9876irm\"}', 'Video/look');
INSERT INTO `api_user_action` VALUES ('1829', '首页', '1', 'root', '1540168338', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1830', '欢迎页', '1', 'root', '1540168339', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1831', '首页', '1', 'root', '1540168353', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1832', '欢迎页', '1', 'root', '1540168353', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1833', '知识点', '1', 'root', '1540168357', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1834', '阅读文章', '1', 'root', '1540168362', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1835', '课本列表', '1', 'root', '1540168364', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1836', '词组', '1', 'root', '1540168366', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Words/index');
INSERT INTO `api_user_action` VALUES ('1837', '课本上线', '1', 'root', '1540168410', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/open');
INSERT INTO `api_user_action` VALUES ('1838', '课本列表', '1', 'root', '1540168410', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1839', '菜单维护', '1', 'root', '1540169096', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1840', '新增菜单', '1', 'root', '1540169098', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1841', '新增菜单', '1', 'root', '1540169202', '{\"name\":\"\\u8bfe\\u672c\\u76ee\\u5f55\\u5217\\u8868\",\"fid\":\"79\",\"url\":\"Textbook\\/catalog\",\"sort\":\"6\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1842', '菜单维护', '1', 'root', '1540169202', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1843', '首页', '1', 'root', '1540169213', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1844', '欢迎页', '1', 'root', '1540169213', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1845', '课本列表', '1', 'root', '1540169493', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1846', '课本目录列表', '1', 'root', '1540169495', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1847', '首页', '1', 'root', '1540169592', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1848', '欢迎页', '1', 'root', '1540169592', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1849', '课本列表', '1', 'root', '1540169595', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1850', '首页', '1', 'root', '1540169724', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1851', '欢迎页', '1', 'root', '1540169724', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1852', '知识点', '1', 'root', '1540169726', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1853', '课本列表', '1', 'root', '1540169728', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1854', '课本目录列表', '1', 'root', '1540169734', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1855', '首页', '1', 'root', '1540169768', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1856', '欢迎页', '1', 'root', '1540169769', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1857', '知识点', '1', 'root', '1540169773', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1858', '课本列表', '1', 'root', '1540169775', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1859', '课本目录列表', '1', 'root', '1540169776', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1860', '课本列表', '1', 'root', '1540169784', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1861', '课本目录列表', '1', 'root', '1540169786', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1862', '首页', '1', 'root', '1540169823', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1863', '欢迎页', '1', 'root', '1540169823', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1864', '课本列表', '1', 'root', '1540169828', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1865', '课本目录列表', '1', 'root', '1540169830', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1866', '阅读文章', '1', 'root', '1540169930', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('1867', '首页', '1', 'root', '1540170628', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1868', '欢迎页', '1', 'root', '1540170628', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1869', '知识点', '1', 'root', '1540170630', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1870', '课本列表', '1', 'root', '1540170631', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1871', '课本目录列表', '1', 'root', '1540170633', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1872', '首页', '1', 'root', '1540171241', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1873', '欢迎页', '1', 'root', '1540171241', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1874', '课本列表', '1', 'root', '1540171244', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1875', '课本目录列表', '1', 'root', '1540171249', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1876', '新增菜单', '1', 'root', '1540171581', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1877', '新增菜单', '1', 'root', '1540171651', '{\"name\":\"\\u6dfb\\u52a0\\u8bfe\\u672c\\u76ee\\u5f55\",\"fid\":\"79\",\"url\":\"Textbook\\/addCatalog\",\"sort\":\"7\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1878', '菜单维护', '1', 'root', '1540171651', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1879', '新增菜单', '1', 'root', '1540171653', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1880', '新增菜单', '1', 'root', '1540171703', '{\"name\":\"\\u7f16\\u8f91\\u8bfe\\u672c\\u76ee\\u5f55\",\"fid\":\"79\",\"url\":\"Textbook\\/updateCatalog\",\"sort\":\"8\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1881', '菜单维护', '1', 'root', '1540171703', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1882', '新增菜单', '1', 'root', '1540171705', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1883', '新增菜单', '1', 'root', '1540171746', '{\"name\":\"\\u8bfe\\u672c\\u76ee\\u5f55\\u4e0a\\u7ebf\",\"fid\":\"79\",\"url\":\"Textbook\\/openCatalog\",\"sort\":\"9\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1884', '菜单维护', '1', 'root', '1540171746', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1885', '新增菜单', '1', 'root', '1540171747', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1886', '新增菜单', '1', 'root', '1540171778', '{\"name\":\"\\u8bfe\\u672c\\u76ee\\u5f55\\u4e0b\\u7ebf\",\"fid\":\"79\",\"url\":\"Textbook\\/closeCatalog\",\"sort\":\"10\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1887', '菜单维护', '1', 'root', '1540171778', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1888', '新增菜单', '1', 'root', '1540171780', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1889', '新增菜单', '1', 'root', '1540171826', '{\"name\":\"\\u67e5\\u770b\\u8bfe\\u672c\\u76ee\\u5f55\",\"fid\":\"79\",\"url\":\"Textbook\\/lookCatalog\",\"sort\":\"11\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('1890', '菜单维护', '1', 'root', '1540171827', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('1891', '首页', '1', 'root', '1540172978', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1892', '欢迎页', '1', 'root', '1540172978', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1893', '课本列表', '1', 'root', '1540172981', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1894', '课本目录列表', '1', 'root', '1540172983', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1895', '添加课本目录', '1', 'root', '1540172985', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1896', '添加课本目录', '1', 'root', '1540173013', '{\"title\":\"\\u7b2c\\u4e00\\u7ae0\",\"sort\":\"1\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0<\\/p>\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1897', '添加课本目录', '1', 'root', '1540173021', '{\"title\":\"\\u7b2c\\u4e00\\u7ae0\",\"sort\":\"1\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0<\\/p>\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1898', '添加课本目录', '1', 'root', '1540173129', '{\"title\":\"\\u7b2c\\u4e00\\u7ae0\",\"sort\":\"1\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0<\\/p>\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1899', '首页', '1', 'root', '1540173155', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1900', '欢迎页', '1', 'root', '1540173155', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1901', '课本列表', '1', 'root', '1540173158', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1902', '课本目录列表', '1', 'root', '1540173160', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1903', '添加课本目录', '1', 'root', '1540173163', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1904', '首页', '1', 'root', '1540173218', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1905', '欢迎页', '1', 'root', '1540173218', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1906', '课本列表', '1', 'root', '1540173221', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1907', '课本添加', '1', 'root', '1540173224', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1908', '课本目录列表', '1', 'root', '1540173236', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1909', '添加课本目录', '1', 'root', '1540173238', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1910', '首页', '1', 'root', '1540174246', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1911', '欢迎页', '1', 'root', '1540174246', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1912', '课本列表', '1', 'root', '1540174251', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1913', '课本目录列表', '1', 'root', '1540174257', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1914', '首页', '1', 'root', '1540174895', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1915', '欢迎页', '1', 'root', '1540174895', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1916', '课本列表', '1', 'root', '1540174898', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1917', '课本目录列表', '1', 'root', '1540174900', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1918', '首页', '1', 'root', '1540174912', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1919', '欢迎页', '1', 'root', '1540174912', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1920', '课本列表', '1', 'root', '1540174915', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1921', '课本目录列表', '1', 'root', '1540174918', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1922', '首页', '1', 'root', '1540175774', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1923', '欢迎页', '1', 'root', '1540175774', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1924', '首页', '1', 'root', '1540175775', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1925', '欢迎页', '1', 'root', '1540175776', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1926', '课本列表', '1', 'root', '1540175779', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1927', '课本目录列表', '1', 'root', '1540175781', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1928', '查看课本目录', '1', 'root', '1540175783', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/lookCatalog');
INSERT INTO `api_user_action` VALUES ('1929', '首页', '1', 'root', '1540175822', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1930', '欢迎页', '1', 'root', '1540175822', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1931', '课本列表', '1', 'root', '1540175824', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1932', '课本添加', '1', 'root', '1540175825', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/add');
INSERT INTO `api_user_action` VALUES ('1933', '课本目录列表', '1', 'root', '1540175829', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1934', '添加课本目录', '1', 'root', '1540175830', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1935', '添加课本目录', '1', 'root', '1540175854', '{\"textbook_id\":\"\",\"title\":\"\\u7b2c\\u4e00\\u7ae0\",\"sort\":\"1\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1936', '课本目录列表', '1', 'root', '1540175855', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1937', '首页', '1', 'root', '1540175881', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1938', '欢迎页', '1', 'root', '1540175881', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1939', '课本列表', '1', 'root', '1540175889', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1940', '课本目录列表', '1', 'root', '1540175892', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1941', '首页', '1', 'root', '1540176028', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1942', '欢迎页', '1', 'root', '1540176029', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1943', '课本列表', '1', 'root', '1540176031', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1944', '课本目录列表', '1', 'root', '1540176033', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1945', '添加课本目录', '1', 'root', '1540176034', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1946', '添加课本目录', '1', 'root', '1540176048', '{\"textbook_id\":\"\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"1\",\"content\":\"<p>\\u5927\\u989d<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1947', '首页', '1', 'root', '1540176195', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1948', '欢迎页', '1', 'root', '1540176195', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1949', '课本列表', '1', 'root', '1540176199', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1950', '课本目录列表', '1', 'root', '1540176204', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1951', '课本目录列表', '1', 'root', '1540176229', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1952', '首页', '1', 'root', '1540176530', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1953', '欢迎页', '1', 'root', '1540176530', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1954', '课本列表', '1', 'root', '1540176534', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1955', '课本目录列表', '1', 'root', '1540176536', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1956', '添加课本目录', '1', 'root', '1540176540', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1957', '首页', '1', 'root', '1540176589', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1958', '欢迎页', '1', 'root', '1540176589', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1959', '知识点', '1', 'root', '1540176591', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('1960', '课本列表', '1', 'root', '1540176592', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1961', '课本目录列表', '1', 'root', '1540176594', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1962', '添加课本目录', '1', 'root', '1540176596', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1963', '首页', '1', 'root', '1540176718', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1964', '欢迎页', '1', 'root', '1540176718', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1965', '首页', '1', 'root', '1540176721', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1966', '欢迎页', '1', 'root', '1540176721', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1967', '课本列表', '1', 'root', '1540176725', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1968', '课本目录列表', '1', 'root', '1540176727', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1969', '首页', '1', 'root', '1540176774', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1970', '欢迎页', '1', 'root', '1540176774', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1971', '课本列表', '1', 'root', '1540176778', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1972', '课本目录列表', '1', 'root', '1540176779', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1973', '添加课本目录', '1', 'root', '1540176786', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1974', '首页', '1', 'root', '1540176815', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1975', '欢迎页', '1', 'root', '1540176815', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1976', '课本列表', '1', 'root', '1540176817', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1977', '课本目录列表', '1', 'root', '1540176819', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1978', '添加课本目录', '1', 'root', '1540176820', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1979', '添加课本目录', '1', 'root', '1540176836', '{\"textbook_id\":\"1\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"1\",\"content\":\"<p>\\u7684\\u4e09\\u5206\\u738b<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1980', '添加课本目录', '1', 'root', '1540176854', '{\"textbook_id\":\"1\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"1\",\"content\":\"<p>\\u7684\\u4e09\\u5206\\u738b<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('1981', '课本目录列表', '1', 'root', '1540176854', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1982', '编辑课本目录', '1', 'root', '1540176860', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('1983', '首页', '1', 'root', '1540176975', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1984', '欢迎页', '1', 'root', '1540176975', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('1985', '课本列表', '1', 'root', '1540176981', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('1986', '课本目录列表', '1', 'root', '1540176983', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1987', '课本目录上线', '1', 'root', '1540176993', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/openCatalog');
INSERT INTO `api_user_action` VALUES ('1988', '课本目录列表', '1', 'root', '1540176993', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1989', '课本目录下线', '1', 'root', '1540176995', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/closeCatalog');
INSERT INTO `api_user_action` VALUES ('1990', '课本目录下线', '1', 'root', '1540176997', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/closeCatalog');
INSERT INTO `api_user_action` VALUES ('1991', '课本目录下线', '1', 'root', '1540176998', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/closeCatalog');
INSERT INTO `api_user_action` VALUES ('1992', '课本目录下线', '1', 'root', '1540177005', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/closeCatalog');
INSERT INTO `api_user_action` VALUES ('1993', '课本目录下线', '1', 'root', '1540177081', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/closeCatalog');
INSERT INTO `api_user_action` VALUES ('1994', '课本目录列表', '1', 'root', '1540177081', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1995', '编辑课本目录', '1', 'root', '1540177084', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('1996', '编辑课本目录', '1', 'root', '1540177100', '{\"id\":\"2\",\"textbook_id\":\"\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"1\",\"content\":\"<p>\\u7684\\u4e09\\u5206\\u738b<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('1997', '课本目录列表', '1', 'root', '1540177100', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('1998', '首页', '1', 'root', '1540177106', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('1999', '欢迎页', '1', 'root', '1540177106', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2000', '课本列表', '1', 'root', '1540177110', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2001', '课本目录列表', '1', 'root', '1540177112', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2002', '首页', '1', 'root', '1540177385', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2003', '欢迎页', '1', 'root', '1540177385', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2004', '课本列表', '1', 'root', '1540177388', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2005', '课本目录列表', '1', 'root', '1540177395', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2006', '编辑课本目录', '1', 'root', '1540177398', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2007', '编辑课本目录', '1', 'root', '1540177419', '{\"id\":\"1\",\"textbook_id\":\"\",\"title\":\"\\u7b2c\\u4e00\\u7ae0\",\"sort\":\"2\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0\\u5927\\u5bb6\\u8985\\u5b8c\\u5168<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2008', '课本目录列表', '1', 'root', '1540177419', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2009', '首页', '1', 'root', '1540177439', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2010', '欢迎页', '1', 'root', '1540177439', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2011', '课本列表', '1', 'root', '1540177443', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2012', '课本目录列表', '1', 'root', '1540177444', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2013', '首页', '1', 'root', '1540177686', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2014', '欢迎页', '1', 'root', '1540177686', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2015', '课本列表', '1', 'root', '1540177689', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2016', '课本目录列表', '1', 'root', '1540177690', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2017', '查看课本目录', '1', 'root', '1540177695', '{\"id\":\"2\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/lookCatalog');
INSERT INTO `api_user_action` VALUES ('2018', '编辑课本目录', '1', 'root', '1540177711', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2019', '编辑课本目录', '1', 'root', '1540177717', '{\"id\":\"2\",\"textbook_id\":\"1\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"1\",\"content\":\"<p>\\u7684\\u4e09\\u5206\\u738b\\u5206\\u89e3<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2020', '课本目录列表', '1', 'root', '1540177717', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2021', '课本目录列表', '1', 'root', '1540177726', '{\"title\":\"\\u6211\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2022', '首页', '1', 'root', '1540177735', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2023', '欢迎页', '1', 'root', '1540177735', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2024', '课本列表', '1', 'root', '1540177738', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2025', '课本目录列表', '1', 'root', '1540177739', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2026', '课本目录列表', '1', 'root', '1540177744', '{\"title\":\"\\u6211\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2027', '添加课本目录', '1', 'root', '1540177756', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('2028', '首页', '1', 'root', '1540177976', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2029', '欢迎页', '1', 'root', '1540177976', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2030', '课本列表', '1', 'root', '1540177979', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2031', '课本目录列表', '1', 'root', '1540177981', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2032', '课本目录列表', '1', 'root', '1540177986', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2033', '课本目录列表', '1', 'root', '1540177989', '{\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2034', '课本目录列表', '1', 'root', '1540178003', '{\"title\":\"\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2035', '课本目录列表', '1', 'root', '1540178005', '{\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2036', '课本目录列表', '1', 'root', '1540178023', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2037', '课本目录列表', '1', 'root', '1540178028', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2038', '课本目录列表', '1', 'root', '1540178039', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2039', '首页', '1', 'root', '1540178046', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2040', '欢迎页', '1', 'root', '1540178046', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2041', '课本列表', '1', 'root', '1540178050', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2042', '课本目录列表', '1', 'root', '1540178053', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2043', '课本目录列表', '1', 'root', '1540178062', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2044', '首页', '1', 'root', '1540178201', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2045', '欢迎页', '1', 'root', '1540178201', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2046', '课本列表', '1', 'root', '1540178204', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2047', '课本目录列表', '1', 'root', '1540178206', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2048', '课本目录列表', '1', 'root', '1540178210', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2049', '课本目录列表', '1', 'root', '1540178217', '{\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2050', '首页', '1', 'root', '1540178270', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2051', '欢迎页', '1', 'root', '1540178270', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2052', '课本列表', '1', 'root', '1540178273', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2053', '课本目录列表', '1', 'root', '1540178274', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2054', '课本目录列表', '1', 'root', '1540178281', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2055', '首页', '1', 'root', '1540178358', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2056', '欢迎页', '1', 'root', '1540178358', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2057', '课本列表', '1', 'root', '1540178360', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2058', '课本目录列表', '1', 'root', '1540178362', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2059', '课本目录列表', '1', 'root', '1540178365', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2060', '编辑课本目录', '1', 'root', '1540178374', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2061', '编辑课本目录', '1', 'root', '1540178380', '{\"id\":\"2\",\"textbook_id\":\"1\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\\u4e00\",\"sort\":\"1\",\"content\":\"<p>\\u7684\\u4e09\\u5206\\u738b\\u5206\\u89e3<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2062', '课本目录列表', '1', 'root', '1540178380', '{\"title\":\"\\u6211\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2063', '课本目录列表', '1', 'root', '1540178389', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2064', '课本目录列表', '1', 'root', '1540178394', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2065', '课本目录列表', '1', 'root', '1540178405', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2066', '课本目录列表', '1', 'root', '1540178411', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2067', '课本目录列表', '1', 'root', '1540178421', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2068', '课本目录列表', '1', 'root', '1540178497', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2069', '课本目录列表', '1', 'root', '1540178528', '', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2070', '首页', '1', 'root', '1540178676', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2071', '欢迎页', '1', 'root', '1540178676', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2072', '阅读文章', '1', 'root', '1540178679', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Article/index');
INSERT INTO `api_user_action` VALUES ('2073', '课本列表', '1', 'root', '1540178681', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2074', '课本目录列表', '1', 'root', '1540178685', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2075', '课本目录列表', '1', 'root', '1540178692', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2076', '课本目录列表', '1', 'root', '1540178694', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2077', '课本目录列表', '1', 'root', '1540178700', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2078', '课本目录列表', '1', 'root', '1540178702', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2079', '添加课本目录', '1', 'root', '1540178712', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('2080', '添加课本目录', '1', 'root', '1540178732', '{\"textbook_id\":\"1\",\"title\":\"\\u610f\\u4e49\\u4e00\",\"sort\":\"0\",\"content\":\"<p>\\u5927\\u5bb6\\u8985\\u821e\\u53f0\\u6492<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/addCatalog');
INSERT INTO `api_user_action` VALUES ('2081', '课本目录列表', '1', 'root', '1540178732', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2082', '课本目录列表', '1', 'root', '1540178735', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2083', '课本目录列表', '1', 'root', '1540178738', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2084', '课本目录列表', '1', 'root', '1540178758', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2085', '编辑课本目录', '1', 'root', '1540178762', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2086', '编辑课本目录', '1', 'root', '1540178768', '{\"id\":\"1\",\"textbook_id\":\"1\",\"title\":\"\\u7b2c\\u4e8c\\u7ae0\",\"sort\":\"2\",\"content\":\"<p>\\u6211\\u7684\\u7b2c\\u4e00\\u7ae0\\u5927\\u5bb6\\u8985\\u5b8c\\u5168<\\/p>\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2087', '课本目录列表', '1', 'root', '1540178768', '{\"textbook_id\":\"1\",\"ctitle\":\"\\u4e00\",\"p\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2088', '视频', '1', 'root', '1540178805', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2089', '首页', '1', 'root', '1540178808', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2090', '欢迎页', '1', 'root', '1540178808', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2091', '课本列表', '1', 'root', '1540178814', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2092', '课本目录列表', '1', 'root', '1540178816', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2093', '课本目录列表', '1', 'root', '1540178821', '{\"textbook_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2094', '课本目录列表', '1', 'root', '1540178823', '{\"textbook_id\":\"1\",\"p\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2095', '课本目录列表', '1', 'root', '1540178827', '{\"title\":\"\\u4e00\",\"textbook_id\":\"1\",\"p\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Textbook/catalog');
INSERT INTO `api_user_action` VALUES ('2096', '视频', '1', 'root', '1540178855', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"urruht1l28fdg78oqhbg06dg90\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2097', '首页', '1', 'root', '1540183508', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"81k9b1t4q5nf5hrn8bl74nm5b6\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2098', '欢迎页', '1', 'root', '1540183508', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"81k9b1t4q5nf5hrn8bl74nm5b6\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2099', '首页', '1', 'root', '1540186643', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2100', '欢迎页', '1', 'root', '1540186645', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2101', '首页', '1', 'root', '1540186645', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2102', '欢迎页', '1', 'root', '1540186645', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2103', '课本列表', '1', 'root', '1540186649', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Textbook/index');
INSERT INTO `api_user_action` VALUES ('2104', '视频', '1', 'root', '1540186652', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2105', '菜单维护', '1', 'root', '1540188281', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2106', '新增菜单', '1', 'root', '1540188302', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2107', '新增菜单', '1', 'root', '1540188356', '{\"name\":\"\\u89c6\\u9891\\u76ee\\u5f55\\u6dfb\\u52a0\",\"fid\":\"80\",\"url\":\"Video\\/addCatalog\",\"sort\":\"6\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2108', '菜单维护', '1', 'root', '1540188356', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2109', '新增菜单', '1', 'root', '1540188358', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2110', '新增菜单', '1', 'root', '1540188400', '{\"name\":\"\\u89c6\\u9891\\u76ee\\u5f55\\u7f16\\u8f91\",\"fid\":\"80\",\"url\":\"Video\\/updateCatalog\",\"sort\":\"7\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2111', '菜单维护', '1', 'root', '1540188400', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2112', '新增菜单', '1', 'root', '1540188402', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2113', '新增菜单', '1', 'root', '1540188439', '{\"name\":\"\\u67e5\\u770b\\u89c6\\u9891\\u76ee\\u5f55\",\"fid\":\"80\",\"url\":\"Video\\/lookCatalog\",\"sort\":\"8\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2114', '菜单维护', '1', 'root', '1540188439', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2115', '新增菜单', '1', 'root', '1540188441', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2116', '新增菜单', '1', 'root', '1540188485', '{\"name\":\"\\u89c6\\u9891\\u76ee\\u5f55\\u4e0a\\u7ebf\",\"fid\":\"80\",\"url\":\"Video\\/openCatalog\",\"sort\":\"9\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2117', '菜单维护', '1', 'root', '1540188485', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2118', '新增菜单', '1', 'root', '1540188487', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2119', '新增菜单', '1', 'root', '1540188531', '{\"name\":\"\\u89c6\\u9891\\u76ee\\u5f55\\u4e0b\\u7ebf\",\"fid\":\"80\",\"url\":\"Video\\/closeCatalog\",\"sort\":\"10\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2120', '菜单维护', '1', 'root', '1540188531', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2121', '新增菜单', '1', 'root', '1540188533', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2122', '新增菜单', '1', 'root', '1540188572', '{\"name\":\"\\u4e0a\\u4f20\\u89c6\\u9891\\u76ee\\u5f55\",\"fid\":\"80\",\"url\":\"Video\\/uploadc\",\"sort\":\"11\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2123', '菜单维护', '1', 'root', '1540188572', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2124', '新增菜单', '1', 'root', '1540188603', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2125', '新增菜单', '1', 'root', '1540188632', '{\"name\":\"\\u89c6\\u9891\\u76ee\\u5f55\\u5217\\u8868\",\"fid\":\"80\",\"url\":\"Video\\/catalog\",\"sort\":\"12\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2126', '菜单维护', '1', 'root', '1540188632', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2127', '首页', '1', 'root', '1540188650', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2128', '欢迎页', '1', 'root', '1540188650', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2129', '视频', '1', 'root', '1540188653', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2130', '视频目录列表', '1', 'root', '1540188656', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2131', '首页', '1', 'root', '1540188776', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2132', '欢迎页', '1', 'root', '1540188777', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2133', '视频', '1', 'root', '1540188779', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2134', '视频目录列表', '1', 'root', '1540188780', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2135', '首页', '1', 'root', '1540188981', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2136', '欢迎页', '1', 'root', '1540188981', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2137', '视频', '1', 'root', '1540188984', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2138', '视频目录列表', '1', 'root', '1540188986', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2139', '视频目录添加', '1', 'root', '1540188992', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2140', '首页', '1', 'root', '1540189579', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2141', '欢迎页', '1', 'root', '1540189579', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2142', '视频', '1', 'root', '1540189581', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2143', '视频目录列表', '1', 'root', '1540189583', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2144', '视频目录添加', '1', 'root', '1540189584', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2145', '首页', '1', 'root', '1540189931', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2146', '欢迎页', '1', 'root', '1540189931', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2147', '视频', '1', 'root', '1540189934', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2148', '视频目录列表', '1', 'root', '1540189936', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2149', '视频目录添加', '1', 'root', '1540189939', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2150', '首页', '1', 'root', '1540190199', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2151', '欢迎页', '1', 'root', '1540190199', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2152', '视频', '1', 'root', '1540190202', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2153', '视频目录列表', '1', 'root', '1540190204', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2154', '视频目录添加', '1', 'root', '1540190205', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2155', '上传视频目录', '1', 'root', '1540190209', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2156', '上传视频目录', '1', 'root', '1540190215', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2157', '首页', '1', 'root', '1540190812', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2158', '欢迎页', '1', 'root', '1540190812', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2159', '视频', '1', 'root', '1540190816', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2160', '视频目录列表', '1', 'root', '1540190817', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2161', '视频目录添加', '1', 'root', '1540190818', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2162', '上传视频目录', '1', 'root', '1540190825', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2163', '视频目录添加', '1', 'root', '1540190962', '{\"video_id\":\"\",\"title\":\"\\u7b2c\\u4e00\\u8bfe\",\"sort\":\"0\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/\\/5bcd7269045b4.MP4\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2164', '视频目录添加', '1', 'root', '1540190980', '{\"video_id\":\"\",\"title\":\"\\u7b2c\\u4e00\\u8bfe\",\"sort\":\"0\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/\\/5bcd7269045b4.MP4\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2165', '视频目录添加', '1', 'root', '1540191104', '{\"video_id\":\"\",\"title\":\"\\u7b2c\\u4e00\\u8bfe\",\"sort\":\"0\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/\\/5bcd7269045b4.MP4\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2166', '首页', '1', 'root', '1540191114', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2167', '欢迎页', '1', 'root', '1540191114', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2168', '首页', '1', 'root', '1540191118', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2169', '欢迎页', '1', 'root', '1540191118', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2170', '视频', '1', 'root', '1540191120', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2171', '视频目录列表', '1', 'root', '1540191122', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2172', '视频目录添加', '1', 'root', '1540191123', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2173', '上传视频目录', '1', 'root', '1540191132', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2174', '上传视频目录', '1', 'root', '1540191144', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2175', '首页', '1', 'root', '1540191736', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2176', '欢迎页', '1', 'root', '1540191736', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2177', '首页', '1', 'root', '1540191746', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2178', '欢迎页', '1', 'root', '1540191747', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2179', '视频', '1', 'root', '1540191749', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2180', '视频目录列表', '1', 'root', '1540191751', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2181', '视频目录添加', '1', 'root', '1540191752', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2182', '上传视频目录', '1', 'root', '1540191760', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2183', '视频目录添加', '1', 'root', '1540191771', '{\"video_id\":\"\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"0\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/\\/5bcd76102dfad.MP4\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2184', '视频目录列表', '1', 'root', '1540191771', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2185', '视频目录编辑', '1', 'root', '1540191776', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2186', '首页', '1', 'root', '1540191862', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2187', '欢迎页', '1', 'root', '1540191862', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2188', '视频', '1', 'root', '1540191865', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2189', '视频目录列表', '1', 'root', '1540191867', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2190', '视频目录编辑', '1', 'root', '1540191872', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2191', '首页', '1', 'root', '1540192396', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2192', '欢迎页', '1', 'root', '1540192396', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2193', '视频', '1', 'root', '1540192399', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2194', '视频目录列表', '1', 'root', '1540192400', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2195', '视频目录编辑', '1', 'root', '1540192405', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2196', '首页', '1', 'root', '1540192714', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2197', '欢迎页', '1', 'root', '1540192714', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2198', '视频', '1', 'root', '1540192717', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2199', '视频目录列表', '1', 'root', '1540192718', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2200', '视频目录编辑', '1', 'root', '1540192719', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2201', '首页', '1', 'root', '1540192724', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2202', '欢迎页', '1', 'root', '1540192724', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2203', '首页', '1', 'root', '1540192908', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2204', '欢迎页', '1', 'root', '1540192908', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2205', '视频', '1', 'root', '1540192911', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2206', '视频目录列表', '1', 'root', '1540192912', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2207', '视频目录编辑', '1', 'root', '1540192914', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2208', '视频目录编辑', '1', 'root', '1540192914', '{\"id\":\"movie.mp4\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2209', '视频目录编辑', '1', 'root', '1540192914', '{\"id\":\"movie.ogg\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2210', '视频目录编辑', '1', 'root', '1540192914', '{\"id\":\"movie.webm\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2211', '首页', '1', 'root', '1540192942', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2212', '欢迎页', '1', 'root', '1540192942', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2213', '视频', '1', 'root', '1540192944', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2214', '视频目录列表', '1', 'root', '1540192946', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2215', '视频目录编辑', '1', 'root', '1540192947', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2216', '视频目录编辑', '1', 'root', '1540192948', '{\"id\":\"movie.ogg\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2217', '视频目录编辑', '1', 'root', '1540192948', '{\"id\":\"movie.webm\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2218', '查看视频目录', '1', 'root', '1540192952', '{\"id\":\"1\",\"video_id\":\"0\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/lookCatalog');
INSERT INTO `api_user_action` VALUES ('2219', '首页', '1', 'root', '1540192984', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2220', '欢迎页', '1', 'root', '1540192984', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2221', '视频', '1', 'root', '1540192989', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2222', '视频目录列表', '1', 'root', '1540192990', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2223', '视频目录编辑', '1', 'root', '1540192992', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2224', '视频目录编辑', '1', 'root', '1540192992', '{\"id\":\"movie.webm\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2225', '首页', '1', 'root', '1540193040', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2226', '欢迎页', '1', 'root', '1540193040', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2227', '视频', '1', 'root', '1540193043', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2228', '视频目录列表', '1', 'root', '1540193044', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2229', '视频目录编辑', '1', 'root', '1540193048', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2230', '首页', '1', 'root', '1540193818', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2231', '欢迎页', '1', 'root', '1540193818', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2232', '视频', '1', 'root', '1540193822', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2233', '视频目录列表', '1', 'root', '1540193824', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2234', '视频目录添加', '1', 'root', '1540193826', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2235', '视频目录编辑', '1', 'root', '1540193834', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2236', '首页', '1', 'root', '1540193884', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2237', '欢迎页', '1', 'root', '1540193884', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2238', '视频', '1', 'root', '1540193886', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2239', '视频目录列表', '1', 'root', '1540193888', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2240', '视频目录编辑', '1', 'root', '1540193889', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2241', '视频目录添加', '1', 'root', '1540194087', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2242', '上传视频目录', '1', 'root', '1540194098', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2243', '视频目录添加', '1', 'root', '1540194124', '{\"video_id\":\"\",\"title\":\"\\u6211\",\"sort\":\"1\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/5bcd7f323d89f.mp4\",\"show_status\":\"on\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2244', '视频目录列表', '1', 'root', '1540194124', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2245', '视频目录列表', '1', 'root', '1540194126', '{\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2246', '视频目录编辑', '1', 'root', '1540194128', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2247', '视频目录添加', '1', 'root', '1540194140', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2248', '上传视频目录', '1', 'root', '1540194144', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2249', '首页', '1', 'root', '1540194343', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2250', '欢迎页', '1', 'root', '1540194343', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2251', '视频', '1', 'root', '1540194346', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2252', '视频目录列表', '1', 'root', '1540194347', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2253', '视频目录添加', '1', 'root', '1540194349', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/addCatalog');
INSERT INTO `api_user_action` VALUES ('2254', '上传视频目录', '1', 'root', '1540194354', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2255', '视频目录编辑', '1', 'root', '1540194381', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2256', '上传视频目录', '1', 'root', '1540194387', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/uploadc');
INSERT INTO `api_user_action` VALUES ('2257', '视频目录编辑', '1', 'root', '1540194389', '{\"id\":\"1\",\"video_id\":\"0\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"sort\":\"0\",\"file\":\"\",\"video_url\":\"http:\\/\\/localhost\\/education\\/Public\\/uploads\\/video\\/content\\/5bcd805322912.mp4\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2258', '视频目录列表', '1', 'root', '1540194389', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2259', '视频目录编辑', '1', 'root', '1540194392', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/updateCatalog');
INSERT INTO `api_user_action` VALUES ('2260', '视频目录上线', '1', 'root', '1540194413', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/openCatalog');
INSERT INTO `api_user_action` VALUES ('2261', '视频目录列表', '1', 'root', '1540194413', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2262', '视频目录下线', '1', 'root', '1540194416', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/closeCatalog');
INSERT INTO `api_user_action` VALUES ('2263', '视频目录列表', '1', 'root', '1540194416', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2264', '查看视频目录', '1', 'root', '1540194417', '{\"id\":\"1\",\"video_id\":\"0\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/lookCatalog');
INSERT INTO `api_user_action` VALUES ('2265', '首页', '1', 'root', '1540194529', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2266', '欢迎页', '1', 'root', '1540194529', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2267', '视频', '1', 'root', '1540194532', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/index');
INSERT INTO `api_user_action` VALUES ('2268', '视频目录列表', '1', 'root', '1540194537', '{\"textbook_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2269', '查看视频目录', '1', 'root', '1540194541', '{\"id\":\"1\",\"video_id\":\"0\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/lookCatalog');
INSERT INTO `api_user_action` VALUES ('2270', '视频目录列表', '1', 'root', '1540194820', '{\"title\":\"\\u6211\",\"video_id\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2271', '视频目录列表', '1', 'root', '1540194824', '{\"ctitle\":\"\\u6211\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2272', '视频目录列表', '1', 'root', '1540194826', '{\"ctitle\":\"\\u6211\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2273', '视频目录列表', '1', 'root', '1540194833', '{\"title\":\"\\u4eba\",\"video_id\":\"\",\"ctitle\":\"\\u6211\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Video/catalog');
INSERT INTO `api_user_action` VALUES ('2274', '首页', '1', 'root', '1540195138', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2275', '欢迎页', '1', 'root', '1540195138', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2276', '新增菜单', '1', 'root', '1540199279', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2277', '新增菜单', '1', 'root', '1540199388', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2278', '新增菜单', '1', 'root', '1540199444', '{\"name\":\"\\u4fee\\u6539\\u4e3a\\u6b63\\u5e38\\u72b6\\u6001\",\"fid\":\"74\",\"url\":\"Student\\/open\",\"sort\":\"0\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2279', '菜单维护', '1', 'root', '1540199444', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2280', '新增菜单', '1', 'root', '1540199446', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2281', '新增菜单', '1', 'root', '1540199478', '{\"name\":\"\\u4fee\\u6539\\u72b6\\u6001\\u4e3a\\u7981\\u7528\",\"fid\":\"74\",\"url\":\"Student\\/close\",\"sort\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2282', '菜单维护', '1', 'root', '1540199478', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2283', '新增菜单', '1', 'root', '1540199480', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2284', '新增菜单', '1', 'root', '1540199520', '{\"name\":\"\\u53d1\\u9001\\u901a\\u77e5\",\"fid\":\"74\",\"url\":\"Student\\/addNotice\",\"sort\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2285', '菜单维护', '1', 'root', '1540199520', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2286', '新增菜单', '1', 'root', '1540199525', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2287', '新增菜单', '1', 'root', '1540199564', '{\"name\":\"\\u7f16\\u8f91\\u901a\\u77e5\",\"fid\":\"74\",\"url\":\"Student\\/updateNotice\",\"sort\":\"3\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2288', '菜单维护', '1', 'root', '1540199564', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2289', '新增菜单', '1', 'root', '1540199572', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2290', '新增菜单', '1', 'root', '1540199601', '{\"name\":\"\\u5220\\u9664\\u901a\\u77e5\",\"fid\":\"74\",\"url\":\"Student\\/delete\",\"sort\":\"4\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2291', '菜单维护', '1', 'root', '1540199601', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2292', '编辑菜单', '1', 'root', '1540199618', '{\"id\":\"144\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2293', '编辑菜单', '1', 'root', '1540199621', '{\"id\":\"144\",\"name\":\"\\u53d1\\u9001\\u901a\\u77e5\",\"fid\":\"74\",\"url\":\"Student\\/addNotice\",\"sort\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2294', '菜单维护', '1', 'root', '1540199621', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2295', '新增菜单', '1', 'root', '1540201428', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2296', '新增菜单', '1', 'root', '1540201463', '{\"name\":\"\\u901a\\u77e5\\u5217\\u8868\",\"fid\":\"74\",\"url\":\"Student\\/noticeLIst\",\"sort\":\"5\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2297', '菜单维护', '1', 'root', '1540201463', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2298', '学生列表', '1', 'root', '1540201684', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2299', '发送通知', '1', 'root', '1540201686', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2300', '首页', '1', 'root', '1540201827', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2301', '欢迎页', '1', 'root', '1540201827', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2302', '学生列表', '1', 'root', '1540202253', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2303', '修改状态为禁用', '1', 'root', '1540202260', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/close');
INSERT INTO `api_user_action` VALUES ('2304', '学生列表', '1', 'root', '1540202260', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2305', '修改为正常状态', '1', 'root', '1540202265', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/open');
INSERT INTO `api_user_action` VALUES ('2306', '学生列表', '1', 'root', '1540202265', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2307', '首页', '1', 'root', '1540202306', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2308', '欢迎页', '1', 'root', '1540202306', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2309', '学生列表', '1', 'root', '1540202308', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2310', '首页', '1', 'root', '1540202312', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2311', '欢迎页', '1', 'root', '1540202312', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2312', '学生列表', '1', 'root', '1540202382', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2313', '首页', '1', 'root', '1540202385', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2314', '欢迎页', '1', 'root', '1540202385', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2315', '学生列表', '1', 'root', '1540202387', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2316', '首页', '1', 'root', '1540202427', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2317', '欢迎页', '1', 'root', '1540202427', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2318', '学生列表', '1', 'root', '1540202429', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2319', '首页', '1', 'root', '1540202457', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2320', '欢迎页', '1', 'root', '1540202457', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2321', '学生列表', '1', 'root', '1540202458', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2322', '首页', '1', 'root', '1540202526', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2323', '欢迎页', '1', 'root', '1540202526', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2324', '学生列表', '1', 'root', '1540202528', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2325', '首页', '1', 'root', '1540202567', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2326', '欢迎页', '1', 'root', '1540202567', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2327', '学生列表', '1', 'root', '1540202569', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2328', '学生列表', '1', 'root', '1540202585', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\\u4e00\\u4e2a\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2329', '学生列表', '1', 'root', '1540202591', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\\u4e00\\u4e2a\\u662f\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2330', '首页', '1', 'root', '1540202622', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2331', '欢迎页', '1', 'root', '1540202623', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2332', '学生列表', '1', 'root', '1540202626', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2333', '首页', '1', 'root', '1540202764', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2334', '欢迎页', '1', 'root', '1540202765', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2335', '学生列表', '1', 'root', '1540202766', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2336', '发送通知', '1', 'root', '1540202767', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2337', '首页', '1', 'root', '1540203152', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2338', '欢迎页', '1', 'root', '1540203152', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2339', '学生列表', '1', 'root', '1540203158', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2340', '发送通知', '1', 'root', '1540203161', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2341', '首页', '1', 'root', '1540203413', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2342', '欢迎页', '1', 'root', '1540203413', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2343', '学生列表', '1', 'root', '1540203416', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2344', '发送通知', '1', 'root', '1540203418', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2345', '首页', '1', 'root', '1540203529', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2346', '欢迎页', '1', 'root', '1540203529', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2347', '学生列表', '1', 'root', '1540203531', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2348', '发送通知', '1', 'root', '1540203533', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2349', '发送通知', '1', 'root', '1540203539', '{\"to_userid\":\"1\",\"title\":\"\\u6211\\u4eec\\u662f\\u597d\\u4eba\",\"content\":\"\\u901f\\u5ea6\\u8303\\u56f4\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2350', '学生列表', '1', 'root', '1540203539', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2351', '首页', '1', 'root', '1540203829', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2352', '欢迎页', '1', 'root', '1540203829', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2353', '学生列表', '1', 'root', '1540203831', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2354', '通知列表', '1', 'root', '1540203833', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2355', '首页', '1', 'root', '1540204328', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2356', '欢迎页', '1', 'root', '1540204328', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2357', '学生列表', '1', 'root', '1540204331', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2358', '通知列表', '1', 'root', '1540204334', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2359', '首页', '1', 'root', '1540205291', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2360', '欢迎页', '1', 'root', '1540205291', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2361', '学生列表', '1', 'root', '1540205293', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2362', '通知列表', '1', 'root', '1540205296', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2363', '首页', '1', 'root', '1540205349', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2364', '欢迎页', '1', 'root', '1540205350', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2365', '学生列表', '1', 'root', '1540205354', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2366', '通知列表', '1', 'root', '1540205355', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"85b4ghmf48koaua1qifi0pbb56\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2367', '首页', '1', 'root', '1540252671', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2368', '欢迎页', '1', 'root', '1540252673', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2369', '首页', '1', 'root', '1540252674', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2370', '欢迎页', '1', 'root', '1540252674', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2371', '首页', '1', 'root', '1540252862', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2372', '欢迎页', '1', 'root', '1540252862', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2373', '菜单维护', '1', 'root', '1540255784', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2374', '学生列表', '1', 'root', '1540255789', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2375', '修改状态为禁用', '1', 'root', '1540255793', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/close');
INSERT INTO `api_user_action` VALUES ('2376', '学生列表', '1', 'root', '1540255793', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2377', '修改为正常状态', '1', 'root', '1540255797', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/open');
INSERT INTO `api_user_action` VALUES ('2378', '学生列表', '1', 'root', '1540255797', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2379', '学生列表', '1', 'root', '1540255804', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\\u4e00\\u4e2a\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2380', '学生列表', '1', 'root', '1540255813', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2381', '学生列表', '1', 'root', '1540255817', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\\u4e00\\u4e2a\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2382', '发送通知', '1', 'root', '1540255821', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2383', '首页', '1', 'root', '1540257048', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2384', '欢迎页', '1', 'root', '1540257048', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2385', '首页', '1', 'root', '1540257061', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2386', '欢迎页', '1', 'root', '1540257061', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2387', '菜单维护', '1', 'root', '1540257065', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2388', '学生列表', '1', 'root', '1540257075', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2389', '发送通知', '1', 'root', '1540257078', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2390', '首页', '1', 'root', '1540257218', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2391', '欢迎页', '1', 'root', '1540257218', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2392', '学生列表', '1', 'root', '1540257220', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2393', '发送通知', '1', 'root', '1540257222', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2394', '发送通知', '1', 'root', '1540257243', '{\"to_userid\":\"1\",\"title\":\"\\u6211\\u662f\\u7b2c\\u4e8c\\u4e2a\",\"content\":\"\\u901a\\u77e5\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/addNotice');
INSERT INTO `api_user_action` VALUES ('2395', '学生列表', '1', 'root', '1540257243', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2396', '首页', '1', 'root', '1540257248', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2397', '欢迎页', '1', 'root', '1540257248', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2398', '学生列表', '1', 'root', '1540257250', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2399', '通知列表', '1', 'root', '1540257255', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2400', '首页', '1', 'root', '1540257258', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2401', '欢迎页', '1', 'root', '1540257258', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2402', '学生列表', '1', 'root', '1540257261', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2403', '通知列表', '1', 'root', '1540257379', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2404', '首页', '1', 'root', '1540257464', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2405', '欢迎页', '1', 'root', '1540257464', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2406', '学生列表', '1', 'root', '1540257466', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2407', '通知列表', '1', 'root', '1540257469', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2408', '首页', '1', 'root', '1540257486', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2409', '欢迎页', '1', 'root', '1540257486', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2410', '学生列表', '1', 'root', '1540257488', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2411', '通知列表', '1', 'root', '1540257489', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2412', '首页', '1', 'root', '1540257509', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2413', '欢迎页', '1', 'root', '1540257509', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2414', '学生列表', '1', 'root', '1540257510', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2415', '通知列表', '1', 'root', '1540257512', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2416', '通知列表', '1', 'root', '1540257514', '{\"user_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2417', '首页', '1', 'root', '1540257583', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2418', '欢迎页', '1', 'root', '1540257583', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2419', '学生列表', '1', 'root', '1540257585', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2420', '通知列表', '1', 'root', '1540257591', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2421', '编辑通知', '1', 'root', '1540257606', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/updateNotice');
INSERT INTO `api_user_action` VALUES ('2422', '首页', '1', 'root', '1540258182', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2423', '欢迎页', '1', 'root', '1540258182', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2424', '学生列表', '1', 'root', '1540258184', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2425', '通知列表', '1', 'root', '1540258185', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2426', '编辑通知', '1', 'root', '1540258187', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/updateNotice');
INSERT INTO `api_user_action` VALUES ('2427', '编辑通知', '1', 'root', '1540258204', '{\"id\":\"2\",\"to_userid\":\"\",\"title\":\"\\u6211\\u662f\\u7b2c\\u4e8c\\u4e2a\",\"content\":\"\\u901a\\u77e5\\u597d\\u7684\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/updateNotice');
INSERT INTO `api_user_action` VALUES ('2428', '通知列表', '1', 'root', '1540258204', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2429', '禁用名单', '1', 'root', '1540258213', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2430', '首页', '1', 'root', '1540258215', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2431', '欢迎页', '1', 'root', '1540258215', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2432', '学生列表', '1', 'root', '1540258217', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2433', '通知列表', '1', 'root', '1540258218', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2434', '首页', '1', 'root', '1540258368', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2435', '欢迎页', '1', 'root', '1540258368', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2436', '学生列表', '1', 'root', '1540258370', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2437', '通知列表', '1', 'root', '1540258371', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2438', '编辑通知', '1', 'root', '1540258373', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/updateNotice');
INSERT INTO `api_user_action` VALUES ('2439', '编辑通知', '1', 'root', '1540258378', '{\"id\":\"2\",\"title\":\"\\u6211\\u662f\\u7b2c\\u4e8c\\u4e2a\",\"content\":\"\\u901a\\u77e5\\u597d\\u7684\\u8776\\u821e\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/updateNotice');
INSERT INTO `api_user_action` VALUES ('2440', '通知列表', '1', 'root', '1540258378', '{\"user_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2441', '通知列表', '1', 'root', '1540258380', '{\"user_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2442', '通知列表', '1', 'root', '1540258383', '{\"user_id\":\"1\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2443', '通知列表', '1', 'root', '1540258385', '{\"user_id\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2444', '通知列表', '1', 'root', '1540258388', '{\"user_id\":\"1\",\"p\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2445', '禁用名单', '1', 'root', '1540258402', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2446', '学生列表', '1', 'root', '1540258406', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2447', '新增菜单', '1', 'root', '1540259030', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2448', '新增菜单', '1', 'root', '1540259093', '{\"name\":\"\\u89e3\\u7981\\u5b66\\u751f\",\"fid\":\"82\",\"url\":\"StopList\\/open\",\"sort\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2449', '菜单维护', '1', 'root', '1540259093', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2450', '首页', '1', 'root', '1540259161', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2451', '欢迎页', '1', 'root', '1540259161', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2452', '禁用名单', '1', 'root', '1540259165', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2453', '学生列表', '1', 'root', '1540259167', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2454', '首页', '1', 'root', '1540259303', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2455', '欢迎页', '1', 'root', '1540259303', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2456', '学生列表', '1', 'root', '1540259305', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2457', '学生列表', '1', 'root', '1540259307', '{\"use_status\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2458', '修改状态为禁用', '1', 'root', '1540259310', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/close');
INSERT INTO `api_user_action` VALUES ('2459', '学生列表', '1', 'root', '1540259311', '{\"use_status\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2460', '禁用名单', '1', 'root', '1540259312', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2461', '首页', '1', 'root', '1540259322', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2462', '欢迎页', '1', 'root', '1540259322', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2463', '学生列表', '1', 'root', '1540259324', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2464', '禁用名单', '1', 'root', '1540259340', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2465', '解禁学生', '1', 'root', '1540259343', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/open');
INSERT INTO `api_user_action` VALUES ('2466', '禁用名单', '1', 'root', '1540259343', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2467', '首页', '1', 'root', '1540259349', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2468', '欢迎页', '1', 'root', '1540259349', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2469', '学生列表', '1', 'root', '1540259351', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2470', '学生列表', '1', 'root', '1540259353', '{\"use_status\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2471', '修改状态为禁用', '1', 'root', '1540259356', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/close');
INSERT INTO `api_user_action` VALUES ('2472', '学生列表', '1', 'root', '1540259356', '{\"use_status\":\"1\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2473', '学生列表', '1', 'root', '1540259361', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2474', '修改状态为禁用', '1', 'root', '1540259364', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/close');
INSERT INTO `api_user_action` VALUES ('2475', '学生列表', '1', 'root', '1540259364', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2476', '禁用名单', '1', 'root', '1540259366', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2477', '禁用名单', '1', 'root', '1540259369', '{\"use_status\":\"2\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2478', '解禁学生', '1', 'root', '1540259372', '{\"id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/open');
INSERT INTO `api_user_action` VALUES ('2479', '禁用名单', '1', 'root', '1540259372', '{\"use_status\":\"2\",\"p\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2480', '学生列表', '1', 'root', '1540259373', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2481', '禁用名单', '1', 'root', '1540259381', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2482', '禁用名单', '1', 'root', '1540259398', '{\"user_name\":\"\\u4e00\\u4e2a\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2483', '禁用名单', '1', 'root', '1540259401', '{\"user_name\":\"\\u6211\\u662f\\u7b2c\\u4e00\\u4e2a\",\"phone\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2484', '禁用名单', '1', 'root', '1540259409', '{\"user_name\":\"\",\"phone\":\"13315944082\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2485', '新增菜单', '1', 'root', '1540264540', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2486', '新增菜单', '1', 'root', '1540264589', '{\"name\":\"\\u5ba1\\u6838\\u901a\\u8fc7\",\"fid\":\"83\",\"url\":\"WithDrawalAudit\\/open\",\"sort\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2487', '菜单维护', '1', 'root', '1540264589', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2488', '新增菜单', '1', 'root', '1540264591', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2489', '新增菜单', '1', 'root', '1540264626', '{\"name\":\"\\u62d2\\u7edd\\u5ba1\\u6838\",\"fid\":\"83\",\"url\":\"WithDrawalAudit\\/close\",\"sort\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/add');
INSERT INTO `api_user_action` VALUES ('2490', '菜单维护', '1', 'root', '1540264626', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2491', '首页', '1', 'root', '1540264634', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2492', '欢迎页', '1', 'root', '1540264635', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2493', '编辑菜单', '1', 'root', '1540264718', '{\"id\":\"83\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2494', '首页', '1', 'root', '1540264742', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2495', '欢迎页', '1', 'root', '1540264742', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2496', '学生列表', '1', 'root', '1540264745', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2497', '禁用名单', '1', 'root', '1540264745', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2498', '首页', '1', 'root', '1540264828', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2499', '欢迎页', '1', 'root', '1540264828', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2500', '编辑菜单', '1', 'root', '1540264911', '{\"id\":\"83\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2501', '编辑菜单', '1', 'root', '1540264919', '{\"id\":\"83\",\"name\":\"\\u63d0\\u73b0\\u5ba1\\u6838\",\"fid\":\"73\",\"url\":\"WithdrawalAudit\\/index\",\"sort\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2502', '菜单维护', '1', 'root', '1540264919', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2503', '编辑菜单', '1', 'root', '1540264922', '{\"id\":\"149\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2504', '编辑菜单', '1', 'root', '1540264926', '{\"id\":\"149\",\"name\":\"\\u5ba1\\u6838\\u901a\\u8fc7\",\"fid\":\"83\",\"url\":\"WithdrawalAudit\\/open\",\"sort\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2505', '菜单维护', '1', 'root', '1540264927', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2506', '编辑菜单', '1', 'root', '1540264929', '{\"id\":\"150\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2507', '编辑菜单', '1', 'root', '1540264954', '{\"id\":\"150\",\"name\":\"\\u62d2\\u7edd\\u5ba1\\u6838\",\"fid\":\"83\",\"url\":\"WithdrawalAudit\\/close\",\"sort\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/edit');
INSERT INTO `api_user_action` VALUES ('2508', '菜单维护', '1', 'root', '1540264954', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Menu/index');
INSERT INTO `api_user_action` VALUES ('2509', '首页', '1', 'root', '1540264958', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2510', '欢迎页', '1', 'root', '1540264958', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2511', '提现审核', '1', 'root', '1540264963', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2512', '首页', '1', 'root', '1540265011', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2513', '欢迎页', '1', 'root', '1540265011', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2514', '提现审核', '1', 'root', '1540265014', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2515', '首页', '1', 'root', '1540265054', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2516', '欢迎页', '1', 'root', '1540265054', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2517', '提现审核', '1', 'root', '1540265056', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2518', '首页', '1', 'root', '1540265361', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2519', '欢迎页', '1', 'root', '1540265361', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2520', '提现审核', '1', 'root', '1540265363', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2521', '首页', '1', 'root', '1540265381', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2522', '欢迎页', '1', 'root', '1540265381', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2523', '提现审核', '1', 'root', '1540265384', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2524', '首页', '1', 'root', '1540265503', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2525', '欢迎页', '1', 'root', '1540265503', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2526', '提现审核', '1', 'root', '1540265510', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2527', '审核通过', '1', 'root', '1540265521', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2528', '提现审核', '1', 'root', '1540265521', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2529', '首页', '1', 'root', '1540265527', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2530', '欢迎页', '1', 'root', '1540265527', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2531', '提现审核', '1', 'root', '1540265532', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2532', '首页', '1', 'root', '1540265705', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2533', '欢迎页', '1', 'root', '1540265705', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2534', '提现审核', '1', 'root', '1540265708', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2535', '审核通过', '1', 'root', '1540265712', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2536', '审核通过', '1', 'root', '1540265713', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2537', '审核通过', '1', 'root', '1540265714', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2538', '审核通过', '1', 'root', '1540265716', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2539', '审核通过', '1', 'root', '1540265729', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2540', '首页', '1', 'root', '1540265752', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2541', '欢迎页', '1', 'root', '1540265752', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2542', '提现审核', '1', 'root', '1540265754', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2543', '审核通过', '1', 'root', '1540265760', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2544', '提现审核', '1', 'root', '1540265760', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2545', '拒绝审核', '1', 'root', '1540265774', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/close');
INSERT INTO `api_user_action` VALUES ('2546', '提现审核', '1', 'root', '1540265775', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2547', '审核通过', '1', 'root', '1540265779', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/open');
INSERT INTO `api_user_action` VALUES ('2548', '提现审核', '1', 'root', '1540265779', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2549', '提现审核', '1', 'root', '1540265795', '{\"user_name\":\"\\u5c0f\\u738b\",\"phone\":\"\",\"e_status\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2550', '提现审核', '1', 'root', '1540265799', '{\"user_name\":\"\\u5c0f\\u738b\\u554a\",\"phone\":\"\",\"e_status\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2551', '提现审核', '1', 'root', '1540265804', '{\"user_name\":\"\",\"phone\":\"\",\"e_status\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2552', '提现审核', '1', 'root', '1540265810', '{\"user_name\":\"\",\"phone\":\"1365485468\",\"e_status\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2553', '提现审核', '1', 'root', '1540265815', '{\"user_name\":\"\",\"phone\":\"136548546\",\"e_status\":\"\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2554', '提现审核', '1', 'root', '1540265821', '{\"user_name\":\"\",\"phone\":\"\",\"e_status\":\"W\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2555', '提现审核', '1', 'root', '1540265823', '{\"user_name\":\"\",\"phone\":\"\",\"e_status\":\"S\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2556', '提现审核', '1', 'root', '1540265827', '{\"user_name\":\"\",\"phone\":\"\",\"e_status\":\"F\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2557', '首页', '1', 'root', '1540266060', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2558', '欢迎页', '1', 'root', '1540266061', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2559', '应用列表', '1', 'root', '1540266308', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'App/index');
INSERT INTO `api_user_action` VALUES ('2560', '权限管理', '1', 'root', '1540266314', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Permission/index');
INSERT INTO `api_user_action` VALUES ('2561', '权限组权限配置', '1', 'root', '1540266329', '{\"group_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Permission/rule');
INSERT INTO `api_user_action` VALUES ('2562', '组用户列表', '1', 'root', '1540266350', '{\"group_id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Permission/member');
INSERT INTO `api_user_action` VALUES ('2563', '编辑权限组', '1', 'root', '1540266364', '{\"id\":\"1\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Permission/edit');
INSERT INTO `api_user_action` VALUES ('2564', '用户管理', '1', 'root', '1540266374', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'User/index');
INSERT INTO `api_user_action` VALUES ('2565', '新增用户', '1', 'root', '1540266380', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'User/add');
INSERT INTO `api_user_action` VALUES ('2566', '用户入组', '1', 'root', '1540266393', '{\"uid\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Permission/group');
INSERT INTO `api_user_action` VALUES ('2567', '首页', '1', 'root', '1540269885', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2568', '欢迎页', '1', 'root', '1540269886', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2569', '首页', '1', 'root', '1540269894', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2570', '欢迎页', '1', 'root', '1540269894', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2571', '知识点', '1', 'root', '1540274927', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2572', '首页', '1', 'root', '1540275003', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2573', '欢迎页', '1', 'root', '1540275003', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2574', '知识点', '1', 'root', '1540275008', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2575', '首页', '1', 'root', '1540275010', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2576', '欢迎页', '1', 'root', '1540275010', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2577', '首页', '1', 'root', '1540275012', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2578', '欢迎页', '1', 'root', '1540275012', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2579', '知识点', '1', 'root', '1540275016', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2580', '首页', '1', 'root', '1540275157', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2581', '欢迎页', '1', 'root', '1540275157', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2582', '知识点', '1', 'root', '1540275159', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2583', '首页', '1', 'root', '1540275432', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2584', '欢迎页', '1', 'root', '1540275432', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2585', '知识点', '1', 'root', '1540275435', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2586', '句子', '1', 'root', '1540275442', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('2587', '首页', '1', 'root', '1540275446', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2588', '欢迎页', '1', 'root', '1540275446', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2589', '知识点', '1', 'root', '1540275453', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2590', '首页', '1', 'root', '1540275700', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2591', '欢迎页', '1', 'root', '1540275700', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2592', '知识点', '1', 'root', '1540275703', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2593', '首页', '1', 'root', '1540275780', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2594', '欢迎页', '1', 'root', '1540275780', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2595', '知识点', '1', 'root', '1540275783', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2596', '首页', '1', 'root', '1540275825', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2597', '欢迎页', '1', 'root', '1540275825', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2598', '知识点', '1', 'root', '1540275831', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2599', '首页', '1', 'root', '1540276185', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2600', '欢迎页', '1', 'root', '1540276185', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2601', '知识点', '1', 'root', '1540276187', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2602', '首页', '1', 'root', '1540276206', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2603', '欢迎页', '1', 'root', '1540276206', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2604', '知识点', '1', 'root', '1540276208', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2605', '句子', '1', 'root', '1540276218', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Sentence/index');
INSERT INTO `api_user_action` VALUES ('2606', '首页', '1', 'root', '1540276275', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2607', '欢迎页', '1', 'root', '1540276275', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2608', '知识点', '1', 'root', '1540276277', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2609', '首页', '1', 'root', '1540276290', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2610', '欢迎页', '1', 'root', '1540276290', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2611', '知识点', '1', 'root', '1540276292', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2612', '首页', '1', 'root', '1540276350', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2613', '欢迎页', '1', 'root', '1540276350', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2614', '知识点', '1', 'root', '1540276352', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2615', '首页', '1', 'root', '1540276445', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2616', '欢迎页', '1', 'root', '1540276445', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2617', '首页', '1', 'root', '1540276447', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2618', '欢迎页', '1', 'root', '1540276447', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2619', '知识点', '1', 'root', '1540276450', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2620', '首页', '1', 'root', '1540276544', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2621', '欢迎页', '1', 'root', '1540276545', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2622', '知识点', '1', 'root', '1540276547', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2623', '首页', '1', 'root', '1540276571', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2624', '欢迎页', '1', 'root', '1540276571', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2625', '知识点', '1', 'root', '1540276572', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2626', '首页', '1', 'root', '1540276575', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2627', '欢迎页', '1', 'root', '1540276576', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2628', '知识点', '1', 'root', '1540276578', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2629', '首页', '1', 'root', '1540276710', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2630', '欢迎页', '1', 'root', '1540276710', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2631', '知识点', '1', 'root', '1540276716', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2632', '首页', '1', 'root', '1540276762', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2633', '欢迎页', '1', 'root', '1540276762', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2634', '知识点', '1', 'root', '1540276764', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2635', '首页', '1', 'root', '1540276900', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2636', '欢迎页', '1', 'root', '1540276901', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2637', '知识点', '1', 'root', '1540276902', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2638', '首页', '1', 'root', '1540276934', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2639', '欢迎页', '1', 'root', '1540276934', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2640', '知识点', '1', 'root', '1540276936', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2641', '首页', '1', 'root', '1540277058', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2642', '欢迎页', '1', 'root', '1540277058', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2643', '知识点', '1', 'root', '1540277060', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2644', '首页', '1', 'root', '1540277085', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2645', '欢迎页', '1', 'root', '1540277085', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2646', '知识点', '1', 'root', '1540277087', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Knowledge/index');
INSERT INTO `api_user_action` VALUES ('2647', '首页', '1', 'root', '1540277433', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2648', '欢迎页', '1', 'root', '1540277433', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2649', '首页', '1', 'root', '1540277446', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2650', '欢迎页', '1', 'root', '1540277446', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2651', '提现审核', '1', 'root', '1540279577', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2652', '禁用名单', '1', 'root', '1540279579', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'StopList/index');
INSERT INTO `api_user_action` VALUES ('2653', '学生列表', '1', 'root', '1540279580', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/index');
INSERT INTO `api_user_action` VALUES ('2654', '通知列表', '1', 'root', '1540279592', '{\"user_id\":\"2\",\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Student/noticeLIst');
INSERT INTO `api_user_action` VALUES ('2655', '注册审核', '1', 'root', '1540280073', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2656', '提现审核', '1', 'root', '1540280134', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'WithdrawalAudit/index');
INSERT INTO `api_user_action` VALUES ('2657', '首页', '1', 'root', '1540282018', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2658', '欢迎页', '1', 'root', '1540282019', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2659', '注册审核', '1', 'root', '1540282021', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2660', '首页', '1', 'root', '1540282338', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2661', '欢迎页', '1', 'root', '1540282338', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2662', '注册审核', '1', 'root', '1540282341', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2663', '首页', '1', 'root', '1540282402', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2664', '欢迎页', '1', 'root', '1540282402', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2665', '注册审核', '1', 'root', '1540282404', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2666', '首页', '1', 'root', '1540282434', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2667', '欢迎页', '1', 'root', '1540282434', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2668', '注册审核', '1', 'root', '1540282436', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2669', '首页', '1', 'root', '1540282457', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2670', '欢迎页', '1', 'root', '1540282458', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2671', '注册审核', '1', 'root', '1540282461', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2672', '首页', '1', 'root', '1540282541', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2673', '欢迎页', '1', 'root', '1540282541', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2674', '注册审核', '1', 'root', '1540282546', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2675', '首页', '1', 'root', '1540282631', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2676', '欢迎页', '1', 'root', '1540282631', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2677', '注册审核', '1', 'root', '1540282633', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2678', '首页', '1', 'root', '1540282736', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2679', '欢迎页', '1', 'root', '1540282736', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2680', '注册审核', '1', 'root', '1540282741', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2681', '首页', '1', 'root', '1540282796', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2682', '欢迎页', '1', 'root', '1540282796', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2683', '注册审核', '1', 'root', '1540282799', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2684', '首页', '1', 'root', '1540282902', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2685', '欢迎页', '1', 'root', '1540282902', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2686', '注册审核', '1', 'root', '1540282908', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2687', '首页', '1', 'root', '1540282941', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2688', '欢迎页', '1', 'root', '1540282941', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2689', '注册审核', '1', 'root', '1540282943', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2690', '首页', '1', 'root', '1540285114', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2691', '欢迎页', '1', 'root', '1540285114', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2692', '注册审核', '1', 'root', '1540285118', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2693', '首页', '1', 'root', '1540285230', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2694', '欢迎页', '1', 'root', '1540285230', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2695', '注册审核', '1', 'root', '1540285232', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2696', '首页', '1', 'root', '1540285318', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2697', '欢迎页', '1', 'root', '1540285318', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2698', '注册审核', '1', 'root', '1540285321', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2699', '首页', '1', 'root', '1540289377', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2700', '欢迎页', '1', 'root', '1540289377', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2701', '注册审核', '1', 'root', '1540289379', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"5d706avnlhu1lbnmj1rbkf72u2\"}', 'RegistAudit/index');
INSERT INTO `api_user_action` VALUES ('2702', '首页', '1', 'root', '1540339602', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"qg1spfkm2me8s8gi24c172tef7\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2703', '欢迎页', '1', 'root', '1540339603', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"qg1spfkm2me8s8gi24c172tef7\"}', 'Index/welcome');
INSERT INTO `api_user_action` VALUES ('2704', '首页', '1', 'root', '1540339604', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"qg1spfkm2me8s8gi24c172tef7\"}', 'Index/index');
INSERT INTO `api_user_action` VALUES ('2705', '欢迎页', '1', 'root', '1540339604', '{\"Phpstorm-dea4537f\":\"70dd0cd0-cafc-48e3-9a4a-cd5ab8f76c58\",\"PHPSESSID\":\"qg1spfkm2me8s8gi24c172tef7\"}', 'Index/welcome');

-- ----------------------------
-- Table structure for api_user_data
-- ----------------------------
DROP TABLE IF EXISTS `api_user_data`;
CREATE TABLE `api_user_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loginTimes` int(11) NOT NULL COMMENT '账号登录次数',
  `lastLoginIp` varchar(11) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `lastLoginTime` int(11) NOT NULL COMMENT '最后登录时间',
  `uid` varchar(11) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员数据表';

-- ----------------------------
-- Records of api_user_data
-- ----------------------------
INSERT INTO `api_user_data` VALUES ('1', '24', '0', '1540339600', '1');

-- ----------------------------
-- Table structure for api_versions
-- ----------------------------
DROP TABLE IF EXISTS `api_versions`;
CREATE TABLE `api_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版本表自增id',
  `versions_name` varchar(50) NOT NULL COMMENT '版本名称',
  `add_id` int(11) NOT NULL COMMENT '添加人id',
  `add_time` varchar(20) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_versions
-- ----------------------------
INSERT INTO `api_versions` VALUES ('1', '08版', '1', '154625465');

-- ----------------------------
-- Table structure for api_video
-- ----------------------------
DROP TABLE IF EXISTS `api_video`;
CREATE TABLE `api_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频表自增id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `intro` varchar(255) NOT NULL COMMENT '内容简要',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url地址',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格(单位元)',
  `show_status` int(1) NOT NULL DEFAULT '2' COMMENT '显示状态(1,上线;2,下线)',
  `class_id` int(11) NOT NULL COMMENT '级别(年级)id',
  `versions_id` int(11) NOT NULL COMMENT '版本id',
  `subject_id` int(11) NOT NULL COMMENT '科目id',
  `video_type` varchar(20) NOT NULL DEFAULT 'ONE' COMMENT '视频类型(ONE:单个视频;SET:视频系列);',
  `read_num` int(20) DEFAULT '0' COMMENT '阅读量',
  `collect_num` int(20) DEFAULT '0' COMMENT '收藏量',
  `share_num` int(20) DEFAULT '0' COMMENT '分享量',
  `pub_userid` int(11) DEFAULT NULL COMMENT '发布人id',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_video
-- ----------------------------
INSERT INTO `api_video` VALUES ('1', '你幅度为', '&lt;p&gt;宣传文案热风&lt;/p&gt;', 'http://localhost/education/Public/uploads/articlePublish/video//5bcc8f7bbd15d.jpg', '0.00', '1', '1', '1', '1', 'ONE', '0', '0', '0', '1', '1540132744');

-- ----------------------------
-- Table structure for api_video_content
-- ----------------------------
DROP TABLE IF EXISTS `api_video_content`;
CREATE TABLE `api_video_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频内容表自增id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `video_id` int(11) NOT NULL COMMENT '视频id',
  `video_url` varchar(255) NOT NULL COMMENT '视频url地址',
  `sort` int(11) NOT NULL COMMENT '序号',
  `show_status` int(1) NOT NULL DEFAULT '2' COMMENT '显示状态(1,上线;2,下线)',
  `duration` varchar(30) DEFAULT NULL COMMENT '视频时长',
  `class_id` int(11) DEFAULT NULL COMMENT '级别(年级)id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格(单位元)',
  `versions_id` int(11) DEFAULT NULL COMMENT '版本id',
  `subject_id` int(11) DEFAULT NULL COMMENT '科目id',
  `read_num` int(20) DEFAULT NULL COMMENT '阅读量',
  `collect_num` int(20) DEFAULT NULL COMMENT '收藏量',
  `share_num` int(20) DEFAULT NULL COMMENT '分享量',
  `pub_userid` int(11) NOT NULL COMMENT '发布人id',
  `pub_time` varchar(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_video_content
-- ----------------------------
INSERT INTO `api_video_content` VALUES ('1', '我们是好人', '0', 'http://localhost/education/Public/uploads/video/content/5bcd805322912.mp4', '0', '2', null, null, null, null, null, null, null, null, '1', '1540191771');
INSERT INTO `api_video_content` VALUES ('2', '我', '0', 'http://localhost/education/Public/uploads/video/content/5bcd7f323d89f.mp4', '1', '2', null, null, null, null, null, null, null, null, '1', '1540194124');
