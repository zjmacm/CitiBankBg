 /*
Navicat MySQL Data Transfer

Source Server         : lr
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : citibank

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-07-23 18:31:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` varchar(32) NOT NULL,
  `appointmentName` varchar(50) NOT NULL COMMENT '预约方',
  `contractWay` int(11) NOT NULL COMMENT '联系方式',
  `appointmentTime` date NOT NULL COMMENT '预约时间',
  `submitTime` date NOT NULL COMMENT '预约提交时间',
  `finishedTime` date DEFAULT NULL COMMENT '预约完成时间',
  `flag` int(11) NOT NULL COMMENT '标记预约是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `id` varchar(32) NOT NULL,
  `investorId` varchar(32) NOT NULL,
  `companyId` varchar(32) NOT NULL,
  `attentionState` int(1) NOT NULL COMMENT '关注状态，0为互相不关注，1为一方关注，2为互相关注',
  `stockCreditorId` varchar(32) NOT NULL,
  `productType` int(1) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记是企业还是投资者,0为企业1为投资者',
  `userId` varchar(32) NOT NULL COMMENT '关联的用户ID',
  `attStockCreditorId` VARCHAR(32) NOT NULL COMMENT '指向股债券的ID',
  `attCompanyId` VARCHAR(32) NOT NULL COMMENT '指向公司的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` varchar(32) NOT NULL COMMENT '公司id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyCode` varchar(50) NOT NULL COMMENT'公司代码',
  `companyName` varchar(50) NOT NULL COMMENT '公司名称',
  `companyType` int(1) NOT NULL COMMENT '公司类型,0为有限责任公司，1为股份有限公司，2为个人合伙企业，3为个人独资企业，4为其它',
  `registerCapital` int(11) NOT NULL COMMENT '注册资本',
  `businessLisence` varchar(50) NOT NULL COMMENT '营业执照注册号',
  `legalPresentative` varchar(50) NOT NULL COMMENT '法定代表人',
  `formedTime` VARCHAR(50) NOT NULL COMMENT '成立时间',
  `officialWeb` varchar(50) DEFAULT NULL COMMENT '官网地址',
  `baseAddress` varchar(50) NOT NULL COMMENT '总部地址',
  `registerAddress` varchar(50) NOT NULL COMMENT '注册地址',
  `consultPhone` varchar(20) NOT NULL COMMENT '咨询电话',
  `workingFiled` varchar(50) NOT NULL COMMENT '所属行业',
  `majorAffair` varchar(50) NOT NULL COMMENT '主营业务',
  `revenueModels` int(50) NOT NULL COMMENT '盈利模式，0为关系服务，1为产业标准，2为客户解决方案，3为个性挖掘，4为速度领先，5为数据处理，6为成本占优，7为中转站模式，8为其它',
  `teamDescription` varchar(50) DEFAULT NULL COMMENT '团队描述',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo路径',
  `companyPicture` varchar(255) DEFAULT NULL COMMENT '公司图片路径',
  `bussinessConcept` varchar(100) DEFAULT NULL COMMENT '公司经营理念',
  `scale` varchar(50) DEFAULT NULL COMMENT '规模',
  `occupiedArea` double(20,0) DEFAULT NULL COMMENT '占地面积',
  `guarantor` varchar(20) DEFAULT NULL COMMENT '担保方',
  `patentsHonors` varchar(100) DEFAULT NULL COMMENT '专利与荣誉',
  `subdividedIndustry` varchar(100) DEFAULT NULL COMMENT '细分行业',
  `productService` varchar(100) DEFAULT NULL COMMENT '产品服务',
  `relatedOrganization` varchar(100) DEFAULT NULL COMMENT '相关机构',
  `technologicalAdvantage` varchar(100) DEFAULT NULL COMMENT '技术优势',
  `productAdvantage` varchar(100) DEFAULT NULL COMMENT '产品优势',
  `marketAdvantage` varchar(100) DEFAULT NULL COMMENT '市场优势',
  `industryOverview` varchar(100) DEFAULT NULL COMMENT '行业概况',
  `developmentStrategy` varchar(100) DEFAULT NULL COMMENT '发展战略',
  `financingDemand` varchar(10) DEFAULT NULL COMMENT '融资需求',
  `companyInTroduct` varchar(255) DEFAULT NULL COMMENT '公司简介',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` varchar(32) NOT NULL,
  `signTime` datetime NOT NULL COMMENT '签约时间',
  `firstId` varchar(32) NOT NULL COMMENT '甲方id',
  `secondId` varchar(32) NOT NULL COMMENT '乙方id',
  `firstName` varchar(50) NOT NULL COMMENT '甲方名称',
  `secondName` varchar(50) NOT NULL COMMENT '乙方名称',
  `path` varchar(50) NOT NULL COMMENT '合同路径',
  `stockCreditorId` varchar(32) NOT NULL COMMENT '指向股债权的外键',
  `state` int(11) NOT NULL COMMENT '状态，编辑是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for financedata
-- ----------------------------
DROP TABLE IF EXISTS `financedata`;
CREATE TABLE `financedata` (
  `id` varchar(32) NOT NULL,
  `companyId` varchar(32) NOT NULL COMMENT '指向公司id的外键',
  `totalAsset` int(11) NOT NULL COMMENT '资产总额',
  `averTotalAsset` int(11) NOT NULL COMMENT '平均资产总额',
  `flowAsset` int(11) NOT NULL COMMENT '流动资产',
  `sellIncome` int(11) NOT NULL COMMENT '销售收入',
  `bussinessCost` int(11) NOT NULL COMMENT '营业成本',
  `majorBussinessIncome` int(11) NOT NULL COMMENT '主营业务收入净额',
  `finalReceivables` int(11) NOT NULL COMMENT '期末应收账款',
  `totalDebt` int(11) NOT NULL COMMENT '负债总额',
  `ownerEquity` int(11) NOT NULL COMMENT '所有者权益总额',
  `flowDebt` int(11) NOT NULL COMMENT '流动负债',
  `currentSaleIncome` int(11) NOT NULL COMMENT '当期销售净收入',
  `currentRevenue` int(11) NOT NULL COMMENT '当期现销收入',
  `preReceivables` int(11) NOT NULL COMMENT '期初应收账款余额',
  `profit` int(11) NOT NULL COMMENT '利润额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` varchar(32) NOT NULL,
  `flag` int(1) NOT NULL COMMENT '标记文件类型0是政策资讯，1是市场资讯，2是中心公告，3是信用监管报告，4是备案发信公告，5是转让交易报告，6是定期报告，7是临时报告，8是信用报告',
  `fileName` varchar(50) NOT NULL COMMENT '文件名称，用来搜索',
  `path` varchar(255) NOT NULL COMMENT '文件路径',
  `investorId` varchar(32) DEFAULT NULL COMMENT '指向投资者的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for investor
-- ----------------------------
DROP TABLE IF EXISTS `investor`;
CREATE TABLE `investor` (
  `investorId` varchar(32) NOT NULL COMMENT '投资人id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `investorName` varchar(20) NOT NULL COMMENT '投资人名称',
  `fundBody` int(10) NOT NULL COMMENT '资金主体，0为个人资金，1为企业资金，2为天使投资，3为VC投资，4为PE投资，5为小额贷款，6为典当公司，7为担保公司，8为金融租赁，9为投资公司，10为商业银行，11为基金公司，12为证券公司，13为信托公司，14为资产管理，15为其它资金',
  `companyName` varchar(50) NOT NULL COMMENT '公司名称',
  `address` varchar(50) NOT NULL COMMENT '公司地址',
  `registeredCapital` int(11) NOT NULL COMMENT '注册资本',
  `legalRepresentative` varchar(50) NOT NULL COMMENT '法定代表人信息',
  `legalRepresentativeMandator` varchar(50) NOT NULL COMMENT '法定代表人委托人信息',
  `companyScale` varchar(50) NOT NULL COMMENT '公司规模',
  `totalMoney` int(11) NOT NULL COMMENT '拥有资金额',
  `contactWay` varchar(50) NOT NULL COMMENT '联系方式',
  `companyArea` varchar(50) NOT NULL COMMENT '公司所在地区',
  `investArea` varchar(50) NOT NULL COMMENT '投资地区',
  `investField` varchar(50) NOT NULL COMMENT '投资领域',
  `investStage` int(1) NOT NULL COMMENT '投资阶段,0为种子阶段，1为初创阶段，2为拓展前阶段，3为拓展后阶段，4为Pre-IPO',
  `investPeriod` varchar(50) NOT NULL COMMENT '投资周期',
  `investIndustry` varchar(50) DEFAULT NULL COMMENT '投资行业',
  `investMoney` int(11) DEFAULT NULL COMMENT '投资意向金额',
  `investType` varchar(50) DEFAULT NULL COMMENT '投资类型',
  `material` varchar(50) DEFAULT NULL COMMENT '所需材料',
  `investHistory` varchar(50) DEFAULT NULL COMMENT '投资历史',
  `successCase` varchar(50) DEFAULT NULL COMMENT '达成案例',
  `investPreference` int(1) DEFAULT NULL COMMENT '投资偏好，0为传统型，1为前瞻型，2为稳健型，3为新兴型，4为热点型，5为其它',
  `shareholderBackground` varchar(50) DEFAULT NULL COMMENT '股东背景',
  `managedFund` varchar(50) DEFAULT NULL COMMENT '管理基金',
  `logoPath` varchar(255) DEFAULT NULL COMMENT 'logo路径',
  PRIMARY KEY (`investorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(32) NOT NULL,
  `time` date NOT NULL COMMENT '时间',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `investorId` varchar(32) DEFAULT NULL,
  `companyId` varchar(32) DEFAULT NULL,
  `flag` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0是未读，1是已读',
  PRIMARY KEY (`id`),
  KEY `mesInvestorId` (`investorId`),
  KEY `mesCompanyId` (`companyId`),
  CONSTRAINT `mesCompanyId` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`),
  CONSTRAINT `mesInvestorId` FOREIGN KEY (`investorId`) REFERENCES `investor` (`investorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stockcreditor
-- ----------------------------
DROP TABLE IF EXISTS `stockcreditor`;
CREATE TABLE `stockcreditor` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '股债权名字',
  `investArea` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '投资区域',
  `investIndustry` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '投资行业',
  `createTime` date NOT NULL COMMENT '股债权创建时间',
  `investMoney` int(11) NOT NULL COMMENT '投资金额',
  `investTime` int(11) NOT NULL COMMENT '投资年限',
  `productType` int(1) NOT NULL COMMENT '产品类型，0为股权，1为债权',
  `stockRate` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '参股比例',
  `investStage` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '投资阶段,0为种子阶段，1为初创阶段，2为拓展前阶段，3为拓展后阶段，4为Pre-IPO',
  `leastReturnDemand` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '最低要求回报',
  `riskControlDemand` int(1) DEFAULT NULL COMMENT '风险控制要求，0为抵押，1为担保，2为协议，3为质押，4为留置',
  `demandFile` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '要求文件',
  `demandSummarize` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '投资要求概述',
  `creditRank` int(1) DEFAULT NULL COMMENT '信用等级，0为AAA，1为AA，2为A，3为BBB，4为BB，5为B，6为CCC，7为CC，8为C',
  `flag` int(1) NOT NULL COMMENT '标记，0为企业模式，1为投资者模式',
  `userId` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '关联用户外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
