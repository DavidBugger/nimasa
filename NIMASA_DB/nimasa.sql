/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : nimasa

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 23/10/2024 10:04:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dbAction` bigint NOT NULL DEFAULT 0,
  `timestamp` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_audit_log_table`(`dbAction`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_log
-- ----------------------------
INSERT INTO `audit_log` VALUES (1, 8, '2024-10-11 12:50:24');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaintId` bigint NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for customer_feedback
-- ----------------------------
DROP TABLE IF EXISTS `customer_feedback`;
CREATE TABLE `customer_feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_feedback_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for font_awsome
-- ----------------------------
DROP TABLE IF EXISTS `font_awsome`;
CREATE TABLE `font_awsome`  (
  `font_id` int NOT NULL,
  `code` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`font_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of font_awsome
-- ----------------------------
INSERT INTO `font_awsome` VALUES (1, 'bi-pencil-square');
INSERT INTO `font_awsome` VALUES (2, 'bi-trash-fill');
INSERT INTO `font_awsome` VALUES (3, 'bi-list toggle-sidebar-btn');
INSERT INTO `font_awsome` VALUES (4, 'bi-search');
INSERT INTO `font_awsome` VALUES (5, ' bi-person');
INSERT INTO `font_awsome` VALUES (6, 'bi-box-arrow-right');
INSERT INTO `font_awsome` VALUES (7, 'bi-grid');
INSERT INTO `font_awsome` VALUES (8, 'bi-menu-button-wide');
INSERT INTO `font_awsome` VALUES (9, 'bi-circle');
INSERT INTO `font_awsome` VALUES (10, 'bi-chevron-down');
INSERT INTO `font_awsome` VALUES (11, 'bi-briefcase-fill');
INSERT INTO `font_awsome` VALUES (12, 'bi-border-width');
INSERT INTO `font_awsome` VALUES (13, 'bi-display');
INSERT INTO `font_awsome` VALUES (14, 'bi-gear-fill');
INSERT INTO `font_awsome` VALUES (15, 'bi-people-fill');
INSERT INTO `font_awsome` VALUES (16, 'bi-person-plus');
INSERT INTO `font_awsome` VALUES (17, 'bi-view-list');
INSERT INTO `font_awsome` VALUES (18, 'bi-house');

-- ----------------------------
-- Table structure for gendata
-- ----------------------------
DROP TABLE IF EXISTS `gendata`;
CREATE TABLE `gendata`  (
  `table_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `table_id` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gendata
-- ----------------------------
INSERT INTO `gendata` VALUES ('menu', 144);
INSERT INTO `gendata` VALUES ('transaction_table', 1);
INSERT INTO `gendata` VALUES ('users', 22);
INSERT INTO `gendata` VALUES ('staff', 95);
INSERT INTO `gendata` VALUES ('loans', 13);
INSERT INTO `gendata` VALUES ('allowance', 12);
INSERT INTO `gendata` VALUES ('designation', 4);
INSERT INTO `gendata` VALUES ('deduction', 22);
INSERT INTO `gendata` VALUES ('loan_setup', 148);
INSERT INTO `gendata` VALUES ('payroll', 26);
INSERT INTO `gendata` VALUES ('leave', 1);
INSERT INTO `gendata` VALUES ('staff_leave', 4);
INSERT INTO `gendata` VALUES ('role', 15);
INSERT INTO `gendata` VALUES ('menu', 144);
INSERT INTO `gendata` VALUES ('transaction_table', 1);
INSERT INTO `gendata` VALUES ('users', 22);
INSERT INTO `gendata` VALUES ('staff', 95);
INSERT INTO `gendata` VALUES ('loans', 13);
INSERT INTO `gendata` VALUES ('allowance', 12);
INSERT INTO `gendata` VALUES ('designation', 4);
INSERT INTO `gendata` VALUES ('deduction', 22);
INSERT INTO `gendata` VALUES ('loan_setup', 148);
INSERT INTO `gendata` VALUES ('payroll', 26);
INSERT INTO `gendata` VALUES ('leave', 1);
INSERT INTO `gendata` VALUES ('staff_leave', 4);
INSERT INTO `gendata` VALUES ('role', 15);

-- ----------------------------
-- Table structure for kiosk_complaint
-- ----------------------------
DROP TABLE IF EXISTS `kiosk_complaint`;
CREATE TABLE `kiosk_complaint`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `complaintId` bigint NOT NULL DEFAULT 0,
  `question` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `answer` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`, `complaintId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kiosk_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for kiosk_feedback
-- ----------------------------
DROP TABLE IF EXISTS `kiosk_feedback`;
CREATE TABLE `kiosk_feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `feedbackId` bigint NOT NULL DEFAULT 0,
  `question` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `answer` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kiosk_feedback
-- ----------------------------
INSERT INTO `kiosk_feedback` VALUES (3, 12345, 2, 'Your feedback is important to us! Please share your thoughts and suggestions on how we can \nenhance your experience. Whether it\'s something we did well or an area where we can improve, we want to hear from \nyou. All feedback is valuable in helping us deliver the best possible service. Thank you for taking the \ntime to share your insights! ', 'Hello feedback 2', '2024-10-18 10:39:00');

-- ----------------------------
-- Table structure for kiosk_question_answer
-- ----------------------------
DROP TABLE IF EXISTS `kiosk_question_answer`;
CREATE TABLE `kiosk_question_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pollId` bigint NOT NULL DEFAULT 0,
  `questionId` bigint NOT NULL DEFAULT 0,
  `answerId` bigint NOT NULL DEFAULT 0,
  `userId` bigint NOT NULL DEFAULT 0,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kiosk_question_answer
-- ----------------------------

-- ----------------------------
-- Table structure for lga
-- ----------------------------
DROP TABLE IF EXISTS `lga`;
CREATE TABLE `lga`  (
  `stateid` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `State` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Lga` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Lgaid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Lgaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 827 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lga
-- ----------------------------
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Asaritoru', 2);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Aboh mbaise', 3);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Oluyole', 5);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Bekwara', 6);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Abeokuta east', 7);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Yemoji', 8);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Etsakor', 9);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ethiope west', 10);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Idemili', 11);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ijumu iyara', 12);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Mopa-muro', 13);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Aba north', 14);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Aba south', 15);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Arochukwu', 16);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Bende', 17);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ikwuano', 18);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Isiala-ngwa north', 19);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Isiala-ngwa south', 20);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Isukwuato', 21);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Obiomangwa', 22);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ohafia', 23);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Osisioma ngwa', 24);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ugwunagbo', 25);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ukwa east', 26);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ukwa west', 27);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Umuahia north', 28);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Umuahia south', 29);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Umu-nneochi', 30);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Demsa', 31);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Fufore', 32);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Ganye', 33);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Girei', 34);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Gombi', 35);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Guyuk', 36);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Hong', 37);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Jada', 38);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Lamurde', 39);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Madagali', 40);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Maiha', 41);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Mayo-belwa', 42);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Michika', 43);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Mubi north', 44);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Mubi south', 45);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Numan', 46);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Shelleng', 47);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Song', 48);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Toungo', 49);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Yola north', 50);
INSERT INTO `lga` VALUES ('002', 'ADAMAWA', 'Yola south', 51);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Abak', 52);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Eastern obolo', 53);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Eket', 54);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Esit eket', 55);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Essien udim', 56);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Etim ekpo', 57);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Etinan', 58);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ibeno', 59);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ibesikpo asutan', 60);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ibiono ibom', 61);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ika', 62);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ikono', 63);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ikot abasi', 64);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ikot ekpene', 65);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Ini', 66);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Itu', 67);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Mbo', 68);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Mkpat enin', 69);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Nsit atai', 70);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Nsit ibom', 71);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Nsit ubium', 72);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Uruan', 73);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Urue-offong/oruko', 74);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Uyo', 75);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Aguata', 76);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Anambra east', 77);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Anambra west', 78);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Anaocha', 79);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Awka north', 80);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Awka south', 81);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Ayamelum', 82);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Dunukofia', 83);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Ekwusigo', 84);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Idemili north', 85);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Idemili south', 86);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Ihiala', 87);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Njikoka', 88);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Nnewi north', 89);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Obanliku', 90);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Obubra', 91);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Obudu', 92);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Odukpani', 93);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Ogoja', 94);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Yakurr', 95);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Yala', 96);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Aniocha north', 97);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Aniocha south', 98);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Bomadi', 99);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Burutu', 100);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ethiope east', 101);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ethiope west', 102);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ika north', 103);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ika south', 104);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Isoko north', 105);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Isoko south', 106);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ndokwa east', 107);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ndokwa west', 108);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Okpe', 109);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Oshimili north', 110);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Oshimili south', 111);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Patani', 112);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Sapele', 113);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Udu', 114);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ughelli north', 115);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ughelli south', 116);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Ukwuani', 117);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Uvwie', 118);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Warri north', 119);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Warri south', 120);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Warri south west', 121);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Abakaliki', 122);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Afikpo north', 123);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Afikpo south', 124);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ebonyi', 125);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ezza north', 126);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ezza south', 127);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ikwo', 128);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ishielu', 129);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ivo', 130);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Izzi', 131);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ohaozara', 132);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Ohaukwu', 133);
INSERT INTO `lga` VALUES ('011', 'EBONYI', 'Onicha', 134);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Akoko-edo', 135);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Egor', 136);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Esan central', 137);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Esan north east', 138);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Esan south east', 139);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Esan west', 140);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Etsako central', 141);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Etsako east', 142);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Etsako west', 143);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Igueben', 144);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Ikpoba-okha', 145);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Oredo', 146);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Orhionmwon', 147);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Ovia north east', 148);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Ovia south west', 149);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Owan east', 150);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Owan west', 151);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Uhunmwonde', 152);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'ADK', 153);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'DEA', 154);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'EFY', 155);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'MUE', 156);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'LAW', 157);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'AMK', 158);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'EMR', 159);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'DEK', 160);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'JER', 161);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'KER', 162);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'KLE', 163);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'YEK', 164);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'GED', 165);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'SSE', 166);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'TUN', 167);
INSERT INTO `lga` VALUES ('013', 'EKITI', 'YEE', 168);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Aninri', 169);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Awgu', 170);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Enugu east', 171);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Enugu north', 172);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Enugu south', 173);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Ezeagu', 174);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Enugu', 175);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Igbo-etit', 176);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Igbo-eze north', 177);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Igho-eze south', 178);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Isi-uzo', 179);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Nkanu east', 180);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Nkanu west', 181);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Nnewi south', 182);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Ogbaru', 183);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Onitsha north', 184);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Onitsha south', 185);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Orumba north', 186);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Orumba south', 187);
INSERT INTO `lga` VALUES ('004', 'ANAMBRA', 'Oyi', 188);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Alkaleri', 189);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Bauchi', 190);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Bogoro', 191);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Damban', 192);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Darazo', 193);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Dass', 194);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Gamawa', 195);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Ganjuwa', 196);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Giade', 197);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Itas/gadau', 198);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Jama\'are', 199);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Katagun', 200);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Gusau', 201);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Kirfi', 202);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Misau', 203);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Ningi', 204);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Shira', 205);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Tafawa-balewa', 206);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Toro', 207);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Warji', 208);
INSERT INTO `lga` VALUES ('005', 'BAUCHI', 'Zaki', 209);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Brass', 210);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Ekeremor', 211);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Kolokuma/opokuma', 212);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Nembe', 213);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Ogbia', 214);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Sagbama', 215);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Southern ijaw', 216);
INSERT INTO `lga` VALUES ('006', 'BAYELSA', 'Yenegoa', 217);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ado', 218);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Agatu', 219);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Apa', 220);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Buruku', 221);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Gboko', 222);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Guma', 223);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Gwer east', 224);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Gwer west', 225);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Katsina-ala', 226);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Konshisha', 227);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Kwande', 228);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Logo', 229);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Makurdi', 230);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Obi', 231);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ogbadibo', 232);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Oju', 233);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Okpokwu', 234);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ohimini', 235);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Oturkpo', 236);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Tarka', 237);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ukum', 238);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ushongo', 239);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Vandeikya', 240);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Abadam', 241);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Askira/uba', 242);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Bama', 243);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Bayo', 244);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Biu', 245);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Chibok', 246);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Damboa', 247);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Dikwa', 248);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Gubio', 249);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Guzamala', 250);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Gwoza', 251);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Hawul', 252);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Jere', 253);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Kaga', 254);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Kala/balge', 255);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Konduga', 256);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Kukawa', 257);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Kwaya kusar', 258);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Mafa', 259);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Magumeri', 260);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Maiduguri', 261);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Marte', 262);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Mobbar', 263);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Monguno', 264);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Ngala', 265);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Nganzai', 266);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Shani', 267);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Abi', 268);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Akamkpa', 269);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Akpabuyo', 270);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Bakassi', 271);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Bekwara', 272);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Biase', 273);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Boki', 274);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Calabar-municipal', 275);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Calabar south', 276);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Etung', 277);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Ikom', 278);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Nsukka', 279);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Oji-river', 280);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Udenu', 281);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Udi', 282);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Uzo-uwani', 283);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Akko', 284);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Balanga', 285);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Billiri', 286);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Dukku', 287);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Funakaye', 288);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Gombe', 289);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Kaltungo', 290);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Kwami', 291);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Nafada', 292);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Shomgom', 293);
INSERT INTO `lga` VALUES ('016', 'GOMBE', 'Yamaltu/deba', 294);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ahiazu-mbaise', 295);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ehime-mbano', 296);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ezinihitte', 297);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ideato north', 298);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ideato south', 299);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ihitte-uboma', 300);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ikeduru', 301);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Isiala mbano', 302);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Isu', 303);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Mbaitoli', 304);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ngor-okpala', 305);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Njaba', 306);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Nwangele', 307);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Nkwerre', 308);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Obowo', 309);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Oguta', 310);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ohaji/egbema', 311);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Okigwe', 312);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Orlu', 313);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Orsu', 314);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Oru east', 315);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Oru west', 316);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Owerri muni.', 317);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Owerri north', 318);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Owerri west', 319);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Onuimo', 320);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Auyo', 321);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Babura', 322);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Birnin kudu', 323);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Biriniwa', 324);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Buji', 325);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Dutse', 326);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Gagarawa', 327);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Garki', 328);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Gumel', 329);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Guri', 330);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Gwaram', 331);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Gwiwa', 332);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Hadejia', 333);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Jahun', 334);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Kafin', 335);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Hausa', 336);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Kaugama', 337);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Kazaure', 338);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Kiri kasamma', 339);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Kiyawa', 340);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Maigatari', 341);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Malam madori', 342);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Miga', 343);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Ringim', 344);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Roni', 345);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Sule-tankarkar', 346);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Taura', 347);
INSERT INTO `lga` VALUES ('018', 'JIGAWA', 'Yankwashi', 348);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Birnin-gwari', 349);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Chikun', 350);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Giwa', 351);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Igabi', 352);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Ikara', 353);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Jaba', 354);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Jema\'a', 355);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kachia', 356);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kaduna north', 357);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kaduna south', 358);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kagarko', 359);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kajuru', 360);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kaura', 361);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kubau', 362);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Kudan', 363);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Lere', 364);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Makarfi', 365);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Sabon-gari', 366);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Sanga', 367);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Soba', 368);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Zangon-kataf', 369);
INSERT INTO `lga` VALUES ('019', 'KADUNA', 'Zaria', 370);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Ajingi', 371);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Albasu', 372);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Bagwai', 373);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Bebeji', 374);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Bichi', 375);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Bunkure', 376);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Dala', 377);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Dambatta', 378);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Dawakin kudu', 379);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Dawakin tofa', 380);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Doguwa', 381);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Fagge', 382);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Gabasawa', 383);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Garko', 384);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Garum mallarn', 385);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Gaya', 386);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Gezawa', 387);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Gwale', 388);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Gwarzo', 389);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kabo', 390);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kano municipal', 391);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Karaye', 392);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kibiya', 393);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kiru', 394);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kumbotso', 395);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kunchi', 396);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Kura', 397);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Madobi', 398);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Makoda', 399);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Minjibir', 400);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Nasarawa', 401);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Rano', 402);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Rimin gado', 403);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Rogo', 404);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Shanono', 405);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Sumaila', 406);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Takai', 407);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Tarauni', 408);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Tofa', 409);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Tsanyawa', 410);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Tudun wada', 411);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Ungogo', 412);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Warawa', 413);
INSERT INTO `lga` VALUES ('020', 'KANO', 'Wudil', 414);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Bakori', 415);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Batagarawa', 416);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Batsari', 417);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Baure', 418);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Bindawa', 419);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Charanchi', 420);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Dandume', 421);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Danja', 422);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Dan musa', 423);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Daura', 424);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Dutsi', 425);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Dutsin-ma', 426);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Faskari', 427);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Funtua', 428);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Ingawa', 429);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Jibia', 430);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kafur', 431);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kaita', 432);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kankara', 433);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kankia', 434);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Katsina', 435);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kurfi', 436);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Kusada', 437);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Mai\'adua', 438);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Malumfashi', 439);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Mani', 440);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Mashi', 441);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Matazu', 442);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Musawa', 443);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Rimi', 444);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Sabuwa', 445);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Safana', 446);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Sandamu', 447);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Zongo', 448);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Aleiro', 449);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Arewa-dandi', 450);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Argungu', 451);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Augie', 452);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Bagudo', 453);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Birnin kebbi', 454);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Bunza', 455);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Dandi', 456);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Fakai', 457);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Gwandu', 458);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Jega', 459);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Kalgo', 460);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Koko/besse', 461);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Maiyama', 462);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Ngaski', 463);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Sakaba', 464);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Shanga', 465);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Suru', 466);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Wasagu/danko', 467);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Yauri', 468);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Zuru', 469);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Adavi', 470);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ajaojuta', 471);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ankpa', 472);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Bassa', 473);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Dekina', 474);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ibaji', 475);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Igalamela-odolu', 476);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ijumu', 477);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ijumu', 478);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Kabba/bunu', 479);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Kogi', 480);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Lokoja', 481);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Mopa-muro', 482);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ofu', 483);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Ogori/megongo', 484);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Okehi', 485);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Olamabolo', 486);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Omala', 487);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Yagba east', 488);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Yagba west', 489);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Asa', 490);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Baruten', 491);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Edu', 492);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Ekiti', 493);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Ifelodun', 494);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Ilorin south', 495);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Ilorin west', 496);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Irepodun', 497);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Isin', 498);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Kaiama', 499);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Moro', 500);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Offa', 501);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Oke-ero', 502);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Oyun', 503);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Pategi', 504);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Agege', 505);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ajeromi-ifelodun', 506);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Alimosho', 507);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Amuwo-odofin', 508);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Apapa', 509);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Badagry', 510);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Epe', 511);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Eti-osa', 512);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ibeju/lekki', 513);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ifako-ijaye', 514);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ikeja', 515);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ikorodu', 516);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Kosofe', 517);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Lagos island', 518);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Lagos mainland', 519);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Mushin', 520);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Ojo', 521);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Oshodi-isolo', 522);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Shomolu', 523);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Surulere', 524);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Akwanga', 525);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Awe', 526);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Doma', 527);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Karu', 528);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Keana', 529);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Keffi', 530);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Kokona', 531);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Lafia', 532);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Nasarawa', 533);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Nasarawa-eggon', 534);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Obi', 535);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Toto', 536);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Wamba', 537);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Agaie', 538);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Agwara', 539);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Bida', 540);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Borgu', 541);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Bosso', 542);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Chanchaga', 543);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Edati', 544);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Gbako', 545);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Gurara', 546);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Katcha', 547);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Kontagora', 548);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Lapai', 549);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Lavun', 550);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Magama', 551);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Mariga', 552);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Mashegu', 553);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Mokwa', 554);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Muya', 555);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Paikoro', 556);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Rafi', 557);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Rajau', 558);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Shiroro', 559);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Suleja', 560);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Tafa', 561);
INSERT INTO `lga` VALUES ('027', 'NIGER', 'Wushishi', 562);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Abeokuta north', 563);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Abeokuta south', 564);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ado-odo/ota', 565);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Egbado north', 566);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Egbado south', 567);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ekwekoro', 568);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ifo', 569);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ijebu east', 570);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ijebu north', 571);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ijebu north east', 572);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ijebu-ode', 573);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ikenne', 574);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Imeko-afon', 575);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ipokia', 576);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Obafemi-owode', 577);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ogun waterside', 578);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Odeda', 579);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Odogbolu', 580);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Remo north', 581);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Shagamu', 582);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akoko north east', 583);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akoko north west', 584);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akoko south east', 585);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akoko south west', 586);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akure north', 587);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akuresouth', 588);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ese-odo', 589);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Idanre', 590);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ifedore', 591);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ilaje', 592);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ile-oluji-okeigbo', 593);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Irele', 594);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Odigbo', 595);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Okitipupa', 596);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ondo east', 597);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ondo west', 598);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ose-owo', 599);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Aiyedade', 600);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Aiyedire', 601);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Atakumosa east', 602);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Atakumose-west', 603);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Boluwaduro', 604);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Boripe', 605);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ede north', 606);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ede south', 607);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Egbedore', 608);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ejigbo', 609);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ife central', 610);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ife east', 611);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ife north', 612);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ife south', 613);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ifedayo', 614);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ifelodun', 615);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ila', 616);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ilasha east', 617);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ilesha west', 618);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Irepodun', 619);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Irewole', 620);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Isokan', 621);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Iwo', 622);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Obokun', 623);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Odo-otin', 624);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Ola-oluwa', 625);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Olorunda', 626);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Oriade', 627);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Orolu', 628);
INSERT INTO `lga` VALUES ('030', 'OSUN', 'Osogbo', 629);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Afijio', 630);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Akinyele', 631);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Atiba', 632);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Atigbo', 633);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Egbeda', 634);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibadan central', 635);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibadan north', 636);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibadan north west', 637);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibadan south west', 638);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibadan south east', 639);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibarapa central', 640);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibarapa east', 641);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ibarapa north', 642);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ido', 643);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Irepo', 644);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Iseyin', 645);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Itesiwaju', 646);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Iwajowa', 647);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Kajola', 648);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Lagelu', 649);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ogbomoso north', 650);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ogbomoso south', 651);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ogo oluwa', 652);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Olorunsogo', 653);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Oluyole', 654);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ona-ara', 655);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Orelope', 656);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ori ire', 657);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Oyo east', 658);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Oyo west', 659);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Saki east', 660);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Saki west', 661);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Surelere', 662);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Barikin ladi', 663);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Bassa', 664);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Bokkos', 665);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Jos east', 666);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Jos north', 667);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Jos south', 668);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Kanam', 669);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Kanke', 670);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Langtang north', 671);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Langtang south', 672);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Mangu', 673);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Mikang', 674);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Pankshin', 675);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Qua\'an pan', 676);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Riyom', 677);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Shendam', 678);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Wase', 679);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Abua/odual', 680);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ahoada east', 681);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ahoada west', 682);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Akuku toru', 683);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Andoni', 684);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Asari-toru', 685);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Bonny', 686);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Degema', 687);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Emohua', 688);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Eleme', 689);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Etche', 690);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Gokana', 691);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ikwerre', 692);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Khana', 693);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Obia/akpor', 694);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ogba/egbema/ndoni', 695);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ogu/bolo', 696);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Okrika', 697);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Omumma', 698);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Opobo/nkoro', 699);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Oyigbo', 700);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Port harcourt', 701);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Tai', 702);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Binji', 703);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Bodinga', 704);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Dange-shuni', 705);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Gada', 706);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Goronyo', 707);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Gudu', 708);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Gwadabawa', 709);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Illela', 710);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Isa', 711);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Kware', 712);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Kebbe', 713);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Rabah', 714);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Sabon birni', 715);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Shagari', 716);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Silame', 717);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Sokoto north', 718);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Sokoto south', 719);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Tambuwal', 720);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Tangaza', 721);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Tureta', 722);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Wamakko', 723);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Wurno', 724);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Yabo', 725);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Ardo-kola', 726);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Bali', 727);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Donga', 728);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Gashaka', 729);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Gassol', 730);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Ibi', 731);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Jalingo', 732);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Karim-lamido', 733);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Kurmi', 734);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Lau', 735);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Sarduana', 736);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Takum', 737);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Ussa', 738);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Wukari', 739);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Yorro', 740);
INSERT INTO `lga` VALUES ('035', 'TARABA', 'Zing', 741);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Bade', 742);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Bursari', 743);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Damaturu', 744);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Fika', 745);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Fune', 746);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Geidam', 747);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Gujba', 748);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Gulani', 749);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Jakusko', 750);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Karasuwa', 751);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Machina', 752);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Nangere', 753);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Nguru', 754);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Potiskum', 755);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Tarmua', 756);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Yunusari', 757);
INSERT INTO `lga` VALUES ('036', 'YOBE', 'Yusufari', 758);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Anka', 759);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Bakurna', 760);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Birnin magaji', 761);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Bukkuyum', 762);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Bungudu', 763);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Gummi', 764);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Kaura namoda', 765);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Maradun', 766);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Maru', 767);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Shinkafi', 768);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Talata', 769);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Mafara', 770);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Tsafe', 771);
INSERT INTO `lga` VALUES ('037', 'ZAMFARA', 'Zumi', 772);
INSERT INTO `lga` VALUES ('026', 'NASARAWA', 'Eggon', 773);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ile oluji', 774);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Sagamu', 775);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Opeji', 776);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ijebu ode', 777);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Ishan', 778);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ondo central', 779);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Otukpo', 780);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Abaji', 781);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Abuja Municipal', 782);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Bwari', 783);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Gwagwalada', 784);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Kuje', 785);
INSERT INTO `lga` VALUES ('015', 'FCT', 'Kwali', 786);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ehime mbano', 787);
INSERT INTO `lga` VALUES ('014', 'ENUGU', 'Oji river', 788);
INSERT INTO `lga` VALUES ('031', 'OYO', 'Ogbomosho', 789);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akure south', 790);
INSERT INTO `lga` VALUES ('009', 'CROSS RIVERS', 'Odupani', 791);
INSERT INTO `lga` VALUES ('017', 'IMO', 'Ngor okpala', 792);
INSERT INTO `lga` VALUES ('007', 'BENUE', 'Ador', 793);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Okobo', 794);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Idah', 795);
INSERT INTO `lga` VALUES ('001', 'ABIA', 'Ugwunagbor', 796);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Ogba/Egbem/Noom', 797);
INSERT INTO `lga` VALUES ('023', 'KOGI', 'Okene', 798);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Akoko', 799);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Owo', 800);
INSERT INTO `lga` VALUES ('022', 'KEBBI', 'Kamba', 801);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Water side', 802);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Egado South', 803);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Imeko Afon', 804);
INSERT INTO `lga` VALUES ('032', 'PLATEAU', 'Panilshin', 805);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ikalo', 806);
INSERT INTO `lga` VALUES ('025', 'LAGOS', 'Eredo', 807);
INSERT INTO `lga` VALUES ('021', 'KATSINA', 'Manufanoti', 808);
INSERT INTO `lga` VALUES ('034', 'SOKOTO', 'Kofa atiku', 809);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Onna', 811);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Udium', 812);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Ake', 813);
INSERT INTO `lga` VALUES ('012', 'EDO', 'Uromi', 814);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Oron', 815);
INSERT INTO `lga` VALUES ('003', 'AKWA IBOM', 'Oruk', 816);
INSERT INTO `lga` VALUES ('010', 'DELTA', 'Aniocha', 817);
INSERT INTO `lga` VALUES ('029', 'ONDO', 'Ose', 818);
INSERT INTO `lga` VALUES ('024', 'KWARA', 'Oro', 819);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Yewa', 820);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Yewa South', 821);
INSERT INTO `lga` VALUES ('028', 'OGUN', 'Yewa North', 822);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Opobo/Nkoro', 823);
INSERT INTO `lga` VALUES ('033', 'RIVERS', 'Onelga', 824);
INSERT INTO `lga` VALUES ('008', 'BORNO', 'Maiduguri .M.C', 826);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_url` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `parent_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#',
  `parent_id2` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ',
  `menu_level` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `menu_order` int NOT NULL DEFAULT 0,
  `status` int NULL DEFAULT 0,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('004', 'Settings', '#', '#', ' ', '0', '0000-00-00 00:00:00', 0, 0, '');
INSERT INTO `menu` VALUES ('006', 'Role', 'role_list.php', '004', ' ', '1', '2018-02-15 14:55:23', 0, 0, '');
INSERT INTO `menu` VALUES ('007', 'Menu', 'menu_list.php', '004', ' ', '1', '2018-02-22 14:56:12', 0, 0, '');
INSERT INTO `menu` VALUES ('008', 'Setups', '#', '#', ' ', '0', '2018-01-27 15:31:54', 1, 1, 'fa fa-cogs');
INSERT INTO `menu` VALUES ('017', 'Change Password', 'change_password.php', '004', ' ', '1', '2018-04-10 14:34:40', 0, 0, '');
INSERT INTO `menu` VALUES ('051', 'Staff', 'staff_list.php', '139', '', '1', '2018-12-11 11:50:18', 0, 0, NULL);
INSERT INTO `menu` VALUES ('112', 'Loan Item', 'loan_item_list.php', '140', '', '1', '2018-12-13 21:41:44', 0, 0, NULL);
INSERT INTO `menu` VALUES ('130', 'Deduction List', 'deduction_list.php', '140', '', '1', '2018-12-14 11:48:27', 0, 0, NULL);
INSERT INTO `menu` VALUES ('131', 'Deduction Rate List', 'deduction_rate_list.php', '140', '', '1', '2018-12-14 11:49:31', 0, 0, NULL);
INSERT INTO `menu` VALUES ('132', 'Designation List', 'designation_list.php', '140', '', '1', '2018-12-14 11:50:03', 0, 0, NULL);
INSERT INTO `menu` VALUES ('133', 'Allowance List', 'allowance_list.php', '140', '', '1', '2018-12-14 11:50:50', 0, 0, NULL);
INSERT INTO `menu` VALUES ('134', 'Allowance Rate Setup', 'allowance_rate_list.php', '140', '', '1', '2018-12-14 11:51:32', 0, 0, NULL);
INSERT INTO `menu` VALUES ('139', 'Payroll', '#', '#', '', '0', '2018-12-14 13:09:59', 0, 0, NULL);
INSERT INTO `menu` VALUES ('140', 'Payroll Setup', '#', '#', '', '0', '2018-12-14 13:12:52', 0, 0, NULL);
INSERT INTO `menu` VALUES ('141', 'Payroll List', 'payroll_list.php', '139', '', '1', '2018-12-15 07:37:21', 0, 0, NULL);
INSERT INTO `menu` VALUES ('142', 'State Payroll', 'payroll_state.php', '143', '', '1', '2018-12-17 10:54:51', 0, 0, NULL);
INSERT INTO `menu` VALUES ('144', 'Employee Payroll', 'payroll_employee.php', '143', '', '1', '2018-12-17 10:56:31', 0, 0, NULL);
INSERT INTO `menu` VALUES ('145', 'Staff Movement', 'staff_movement_national.php', '008', ' ', '1', '2019-01-22 13:56:09', 0, 0, NULL);
INSERT INTO `menu` VALUES ('146', 'Staff Leave', 'leave_item_list.php', '140', ' ', '1', '2019-01-23 14:54:48', 0, 0, NULL);
INSERT INTO `menu` VALUES ('147', 'Manage Permissions', 'permissions_list.php', '004', '', '1', '2022-08-01 16:22:24', 0, 0, '');
INSERT INTO `menu` VALUES ('149', 'Operator License Lists', 'license_operator_list.php', '185', '', '1', '2023-03-15 11:35:32', 0, 0, '');
INSERT INTO `menu` VALUES ('150', 'Operator License List', 'operator_license_list.php', '008', '', '1', '2023-03-15 11:38:12', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('154', 'Register License Operator List', 'road_marshal_list.php', '004', '', '1', '2023-03-17 17:01:08', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('157', 'Make Payment', 'make_payment_setup.php', '004', '', '1', '2023-03-28 12:01:33', 0, 0, '');
INSERT INTO `menu` VALUES ('158', 'Invite Road Operator ', 'operator_license_email.php', '185', '', '1', '2023-03-29 10:01:14', 0, 0, '');
INSERT INTO `menu` VALUES ('161', 'Road Marshals', 'road_marshal_list.php', '205', '', '1', '2023-04-03 17:19:38', 0, 0, '');
INSERT INTO `menu` VALUES ('163', 'Vehicle Park', 'vehicle_park.php', '004', '', '1', '2023-04-04 09:52:06', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('164', 'Reprint Receipt', 'reprint_receipt.php', '004', '', '1', '2023-04-04 09:52:28', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('165', 'View Total Transaction', 'total_transaction.php', '004', '', '1', '2023-04-04 09:52:49', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('166', 'License Operators ', 'license_operator_list.php', '185', '', '1', '2023-04-17 08:08:50', 0, 0, '');
INSERT INTO `menu` VALUES ('167', 'Areas', 'area_list.php', '203', '', '1', '2023-04-17 09:30:52', 0, 0, '');
INSERT INTO `menu` VALUES ('168', 'Street List', 'street_list.php', '213', '', '1', '2023-04-17 09:31:03', 0, 0, '');
INSERT INTO `menu` VALUES ('169', 'Transactions', 'transaction_list.php', '228', '', '1', '2023-04-17 12:40:29', 0, 0, '');
INSERT INTO `menu` VALUES ('171', 'License Operators', 'license_operators_areas.php', '004', '', '1', '2023-04-20 10:19:34', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('172', 'License Operators', 'allocate_areas.php', '004', '', '1', '2023-04-20 10:24:17', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('173', 'License Operators List', 'license_operator_list.php', '185', '', '1', '2023-04-20 10:25:21', 0, 0, '');
INSERT INTO `menu` VALUES ('174', 'Areas Allocated', 'area_allocated_list.php', '205', '', '1', '2023-04-20 16:18:09', 0, 0, '');
INSERT INTO `menu` VALUES ('175', 'Contact List ', 'contact_list.php', '004', '', '1', '2023-04-27 12:32:20', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('176', 'Register Devices', 'device_list.php', '004', '', '1', '2023-04-28 15:55:12', 0, 0, '');
INSERT INTO `menu` VALUES ('177', 'Set Wallet Balance', 'wallet_balance_list.php', '205', '', '1', '2023-05-03 10:10:07', 0, 0, '');
INSERT INTO `menu` VALUES ('178', 'Users', 'user_list.php', '234', '', '1', '2023-05-25 14:34:42', 0, 0, '');
INSERT INTO `menu` VALUES ('179', 'Streets', 'Streets_list.php', '004', '', '1', '2023-05-31 12:27:18', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('180', 'Parking Rates', 'parking_rate_list.php', '185', '', '1', '2023-06-02 12:17:34', 0, 0, '');
INSERT INTO `menu` VALUES ('181', 'Personnel Management ', 'personnel_list.php', '004', '', '1', '2023-06-22 08:36:58', 0, 0, '');
INSERT INTO `menu` VALUES ('182', 'De-allocate Areas', 'de_allocate_areas.php', '004', '', '1', '2023-08-01 12:08:33', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('183', 'Allocated Marshal Streets', 'marshal_street_list.php', '205', '', '1', '2023-08-03 12:27:36', 0, 0, '');
INSERT INTO `menu` VALUES ('184', 'Map', 'map.php', '185', '', '1', '2023-08-09 10:01:43', 0, 0, '');
INSERT INTO `menu` VALUES ('185', 'Operator Menu', '#', '#', '', '0', '2023-08-21 13:16:59', 0, 0, '');
INSERT INTO `menu` VALUES ('186', 'Childs', 'child.php', '185', '', '1', '2023-08-21 13:17:36', 0, 0, '');
INSERT INTO `menu` VALUES ('187', 'Map Test', 'map/map_2.php', '185', '', '1', '2023-08-28 08:47:34', 0, 0, '');
INSERT INTO `menu` VALUES ('188', 'Interested Operators', 'interest_list.php', '216', '', '1', '2023-08-29 17:48:48', 0, 0, '');
INSERT INTO `menu` VALUES ('189', 'Registration Report', 'license_operator_dashboard.php', '185', '', '1', '2023-08-30 14:38:28', 0, 0, '');
INSERT INTO `menu` VALUES ('190', 'View Company', 'view_company.php', '185', '', '1', '2023-08-30 14:49:30', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('191', 'Operator Awaiting Approval', 'operator_awaiting_approval_list.php', '185', '', '1', '2023-08-31 12:02:19', 0, 0, '');
INSERT INTO `menu` VALUES ('192', 'Subject Statistics', 'result.php', '198', '', '1', '2023-09-01 12:56:23', 0, 0, '');
INSERT INTO `menu` VALUES ('193', 'Complete Registration', 'register-lc.php', '004', '', '1', '2023-09-04 12:03:35', 0, 0, '');
INSERT INTO `menu` VALUES ('195', 'Complete Registrations', 'register-lc.php', '196', '', '1', '2023-09-08 09:15:35', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('197', 'Registration Dashboard', 'license_operator_dashboard.php', '196', '', '1', '2023-09-08 09:32:05', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('198', 'Registrations', '#', '#', '', '0', '2023-09-08 09:43:34', 0, 0, 'bi-box-arrow-right');
INSERT INTO `menu` VALUES ('199', 'Grade Boundaries', 'grade_boundaries.php', '198', '', '1', '2023-09-08 09:45:45', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('200', 'Operator Registrations', '#', '#', '', '0', '2023-09-08 09:49:04', 0, 0, '');
INSERT INTO `menu` VALUES ('201', 'Registrations Completion', 'register-lc.php', '200', '', '1', '2023-09-08 09:50:10', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('202', 'Resend Email', 'resend_emails.php', '216', '', '1', '2023-09-25 10:16:50', 0, 0, '');
INSERT INTO `menu` VALUES ('203', 'Area Setup', '#', '#', '', '0', '2023-09-26 14:18:58', 0, 0, '');
INSERT INTO `menu` VALUES ('204', 'Area List', 'view_area_details.php', '203', '', '1', '2023-09-26 14:55:03', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('205', 'Marshal Mgt', '#', '#', '', '0', '2023-09-28 12:35:53', 0, 0, '');
INSERT INTO `menu` VALUES ('206', 'Mapped Areas', 'mapped_area_list.php', '208', '', '1', '2023-09-28 16:33:36', 0, 0, '');
INSERT INTO `menu` VALUES ('207', 'Upload Areas', 'uploadAreas.php', '203', '', '1', '2023-10-03 10:22:26', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('208', 'Mapping', '#', '#', '', '0', '2023-10-03 15:06:26', 0, 0, '');
INSERT INTO `menu` VALUES ('209', 'Area to Operator', 'license_operator_list.php', '208', '', '1', '2023-10-03 15:49:20', 0, 0, '');
INSERT INTO `menu` VALUES ('210', 'Tracking', '#', '#', '', '0', '2023-10-03 15:51:29', 0, 0, '');
INSERT INTO `menu` VALUES ('211', 'Track Marshal', 'track_road_marshal.php', '210', '', '1', '2023-10-03 15:52:40', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('212', 'Map Test', 'map_test.php', '185', '', '1', '2023-10-04 09:30:02', 0, 0, '');
INSERT INTO `menu` VALUES ('213', 'Street Setup', '#', '#', '', '0', '2023-10-04 12:38:21', 0, 0, '');
INSERT INTO `menu` VALUES ('214', 'Upload Street', 'upload_streets.php', '213', '', '1', '2023-10-04 12:44:28', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('215', 'Test map', 'test_map.php', '203', '', '1', '2023-10-04 16:31:03', 0, 0, '');
INSERT INTO `menu` VALUES ('216', 'Registration Setup', '#', '#', '', '0', '2023-10-10 12:51:30', 0, 0, '');
INSERT INTO `menu` VALUES ('217', 'Marshal Setup', '#', '#', '', '0', '2023-11-01 14:10:15', 0, 0, '');
INSERT INTO `menu` VALUES ('218', 'Marshal List', 'adminMarshalList.php', '217', '', '1', '2023-11-01 14:11:40', 0, 0, '');
INSERT INTO `menu` VALUES ('223', 'School', '#', '#', '', '0', '2023-11-06 12:00:46', 0, 0, '');
INSERT INTO `menu` VALUES ('224', 'Upload School', 'upload_schools.php', '008', '', '1', '2023-11-06 12:01:44', 0, 0, '');
INSERT INTO `menu` VALUES ('225', 'Category', 'category_list.php', '223', '', '1', '2023-11-06 12:17:21', 0, 0, '');
INSERT INTO `menu` VALUES ('227', 'Trasaction Setup', '#', '#', '', '0', '2023-11-13 21:39:52', 0, 0, '');
INSERT INTO `menu` VALUES ('228', 'Reports', '#', '#', '', '0', '2023-11-13 21:40:19', 0, 0, '');
INSERT INTO `menu` VALUES ('229', 'Teacher Setup ', '#', '#', '', '0', '2023-11-14 11:32:21', 0, 0, '');
INSERT INTO `menu` VALUES ('230', 'Student Setup', '#', '#', '', '0', '2023-11-14 11:32:59', 0, 0, '');
INSERT INTO `menu` VALUES ('231', 'Transaction List', 'transaction_list.php', '227', '', '1', '2023-11-14 11:34:00', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('232', 'Teachers', 'teacher_list.php', '229', '', '1', '2023-11-14 11:34:24', 0, 0, '');
INSERT INTO `menu` VALUES ('233', 'Students', 'student_list.php', '230', '', '1', '2023-11-14 11:34:45', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('234', 'User Management', '#', '#', '', '0', '2023-11-14 11:50:28', 0, 0, '');
INSERT INTO `menu` VALUES ('235', 'Onboarding', '#', '#', '', '0', '2023-11-14 11:52:00', 0, 0, '');
INSERT INTO `menu` VALUES ('237', 'Payment list', 'transaction_list.php', '240', '', '1', '2023-11-14 12:05:37', 0, 0, '');
INSERT INTO `menu` VALUES ('238', 'Schools', 'schools.php', '235', '', '1', '2023-11-14 16:34:44', 0, 0, '');
INSERT INTO `menu` VALUES ('239', 'Teachers', 'teacher_list.php', '229', '', '1', '2023-11-15 11:40:38', 0, 0, '');
INSERT INTO `menu` VALUES ('240', 'Payment', '#', '#', '', '0', '2023-11-15 12:02:47', 0, 0, '');
INSERT INTO `menu` VALUES ('241', 'Payments', 'payment.php', '240', '', '1', '2023-11-15 12:05:56', 0, 0, '');
INSERT INTO `menu` VALUES ('242', 'School List', 'school_list.php', '223', '', '1', '2023-11-16 13:19:34', 0, 0, '');
INSERT INTO `menu` VALUES ('243', 'User Profile', 'profile.php', '234', '', '1', '2023-11-28 15:51:41', 0, 0, '');
INSERT INTO `menu` VALUES ('244', 'Reset Password', 'change_password.php', '234', '', '1', '2023-11-28 15:52:20', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('245', 'Teacher Menu', '#', '#', '', '0', '2023-12-20 15:02:17', 0, 0, '');
INSERT INTO `menu` VALUES ('246', 'Training', 'training_list.php', '245', '', '1', '2023-12-20 15:02:56', 0, 0, '');
INSERT INTO `menu` VALUES ('247', 'Workshop', 'workshop_list.php', '245', '', '1', '2023-12-20 15:03:17', 0, 0, '');
INSERT INTO `menu` VALUES ('248', 'Payment History', 'transaction_list.php', '245', '', '1', '2023-12-20 15:03:35', 0, 0, '');
INSERT INTO `menu` VALUES ('249', 'Certificate', 'certificates.php', '245', '', '1', '2023-12-20 15:03:51', 0, 0, '');
INSERT INTO `menu` VALUES ('250', 'Workshops', 'workshop.php', '245', '', '1', '2023-12-21 09:24:42', 0, 0, '');
INSERT INTO `menu` VALUES ('251', '', '', '004', '', '1', '2024-05-23 09:16:45', 0, 0, '');
INSERT INTO `menu` VALUES ('252', 'ERC Dashboard', 'new_dashboard.php', '#', '', '0', '2024-05-23 09:22:15', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('253', 'Dashboard', 'new_dashboard.php', '252', '', '1', '2024-05-23 09:23:02', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('254', '', '', '', '', '1', '2024-05-23 15:08:26', 0, 0, '');
INSERT INTO `menu` VALUES ('255', '', '', '', '', '1', '2024-05-23 15:30:03', 0, 0, '');
INSERT INTO `menu` VALUES ('256', 'Subject Analysis', '#', '#', '', '0', '2024-07-22 09:03:05', 0, 0, '');
INSERT INTO `menu` VALUES ('257', 'Upload Excel', '', '', '', '1', '2024-10-14 11:35:46', 0, 0, '');
INSERT INTO `menu` VALUES ('258', 'Survey', '#', '#', '', '0', '2024-10-21 12:23:44', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('259', 'Feebacks', 'feedback_list.php', '258', '', '1', '2024-10-21 12:24:33', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('260', 'Complaints', 'complaints.php', '258', '', '1', '2024-10-21 12:25:22', 0, 0, ' bi-person');
INSERT INTO `menu` VALUES ('261', 'Create Survey', 'create_survey.php', '258', '', '1', '2024-10-22 12:50:40', 0, 0, '');
INSERT INTO `menu` VALUES ('262', 'Survey List', 'survey_list.php', '258', '', '1', '2024-10-22 12:55:06', 0, 0, ' bi-person');

-- ----------------------------
-- Table structure for menugroup
-- ----------------------------
DROP TABLE IF EXISTS `menugroup`;
CREATE TABLE `menugroup`  (
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 6144 kB; InnoDB free: 6144 kB; InnoDB free: 614' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menugroup
-- ----------------------------
INSERT INTO `menugroup` VALUES ('001', '004');
INSERT INTO `menugroup` VALUES ('001', '006');
INSERT INTO `menugroup` VALUES ('001', '007');
INSERT INTO `menugroup` VALUES ('001', '017');
INSERT INTO `menugroup` VALUES ('001', '147');
INSERT INTO `menugroup` VALUES ('001', '178');
INSERT INTO `menugroup` VALUES ('001', '192');
INSERT INTO `menugroup` VALUES ('001', '231');
INSERT INTO `menugroup` VALUES ('001', '234');
INSERT INTO `menugroup` VALUES ('001', '244');
INSERT INTO `menugroup` VALUES ('001', '253');
INSERT INTO `menugroup` VALUES ('001', '258');
INSERT INTO `menugroup` VALUES ('001', '259');
INSERT INTO `menugroup` VALUES ('001', '260');
INSERT INTO `menugroup` VALUES ('001', '261');
INSERT INTO `menugroup` VALUES ('001', '262');
INSERT INTO `menugroup` VALUES ('0011', '004');
INSERT INTO `menugroup` VALUES ('00112', '028');
INSERT INTO `menugroup` VALUES ('002', '004');
INSERT INTO `menugroup` VALUES ('002', '149');
INSERT INTO `menugroup` VALUES ('003', '004');
INSERT INTO `menugroup` VALUES ('003', '017');
INSERT INTO `menugroup` VALUES ('003', '131');
INSERT INTO `menugroup` VALUES ('003', '134');
INSERT INTO `menugroup` VALUES ('011', '051');
INSERT INTO `menugroup` VALUES ('011', '133');
INSERT INTO `menugroup` VALUES ('011', '146');
INSERT INTO `menugroup` VALUES ('012', '004');
INSERT INTO `menugroup` VALUES ('012', '017');
INSERT INTO `menugroup` VALUES ('012', '169');
INSERT INTO `menugroup` VALUES ('012', '245');
INSERT INTO `menugroup` VALUES ('012', '247');
INSERT INTO `menugroup` VALUES ('012', '249');
INSERT INTO `menugroup` VALUES ('013', '004');
INSERT INTO `menugroup` VALUES ('013', '157');
INSERT INTO `menugroup` VALUES ('013', '163');
INSERT INTO `menugroup` VALUES ('013', '164');
INSERT INTO `menugroup` VALUES ('013', '165');
INSERT INTO `menugroup` VALUES ('014', '004');
INSERT INTO `menugroup` VALUES ('014', '017');
INSERT INTO `menugroup` VALUES ('014', '169');
INSERT INTO `menugroup` VALUES ('014', '245');
INSERT INTO `menugroup` VALUES ('014', '246');
INSERT INTO `menugroup` VALUES ('014', '247');
INSERT INTO `menugroup` VALUES ('015', '004');

-- ----------------------------
-- Table structure for nimasa_dept
-- ----------------------------
DROP TABLE IF EXISTS `nimasa_dept`;
CREATE TABLE `nimasa_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `debtName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nimasa_dept
-- ----------------------------
INSERT INTO `nimasa_dept` VALUES (1, 'ADMINISTRATION & HUMAN RESOURCES DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (2, 'CABOTAGE SERVICES DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (3, 'DEEP BLUE PROJECT UNIT');
INSERT INTO `nimasa_dept` VALUES (4, 'EXTERNAL RELATIONS AND TECHNICAL COOPERATION UNIT');
INSERT INTO `nimasa_dept` VALUES (5, 'FINANCIAL SERVICES DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (6, 'HEALTH, SAFETY & ENVIRONMENT UNIT');
INSERT INTO `nimasa_dept` VALUES (7, 'INTERNAL AUDIT UNIT');
INSERT INTO `nimasa_dept` VALUES (8, 'ISPS UNIT');
INSERT INTO `nimasa_dept` VALUES (9, 'LEGAL SERVICES UNIT');
INSERT INTO `nimasa_dept` VALUES (10, 'MARINE ACCIDENT INVESTIGATION UNIT');
INSERT INTO `nimasa_dept` VALUES (11, 'MARINE ENVIRONMENT MANAGEMENT DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (12, 'MARITIME GUARD COMMAND');
INSERT INTO `nimasa_dept` VALUES (13, 'MARITIME LABOUR DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (14, 'MARITIME SAFETY & SEAFARERS STANDARDS DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (15, 'NIGERIAN SHIP REGISTRY UNIT');
INSERT INTO `nimasa_dept` VALUES (16, 'PLANNING, RESEARCH AND DATA MANAGEMENT SERVICES DIVISION');
INSERT INTO `nimasa_dept` VALUES (17, 'PR/CORPORATE COMMUNICATIONS UNIT');
INSERT INTO `nimasa_dept` VALUES (18, 'PROCUREMENT DEPARTMENT');
INSERT INTO `nimasa_dept` VALUES (19, 'PROTOCOL UNIT');
INSERT INTO `nimasa_dept` VALUES (20, 'PUBLIC-PRIVATE PARTNERSHIP UNIT');
INSERT INTO `nimasa_dept` VALUES (21, 'REFORM COORDINATION AND STRATEGIC MANAGEMENT / BLUE ECONOMY');
INSERT INTO `nimasa_dept` VALUES (22, 'SERVICOM UNIT');
INSERT INTO `nimasa_dept` VALUES (23, 'SHIPPING DEVELOPMENT DEPARTMENT');

-- ----------------------------
-- Table structure for nimasa_dept_survey
-- ----------------------------
DROP TABLE IF EXISTS `nimasa_dept_survey`;
CREATE TABLE `nimasa_dept_survey`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nimasaId` bigint NOT NULL DEFAULT 0,
  `debtName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nimasa_dept_survey
-- ----------------------------
INSERT INTO `nimasa_dept_survey` VALUES (2, 2, 'CABOTAGE SERVICES DEPARTMENT', '2024-10-18 09:40:01');
INSERT INTO `nimasa_dept_survey` VALUES (3, 2, 'CABOTAGE SERVICES DEPARTMENT', '2024-10-22 15:15:21');
INSERT INTO `nimasa_dept_survey` VALUES (4, 2, 'CABOTAGE SERVICES DEPARTMENT', '2024-10-22 15:16:01');
INSERT INTO `nimasa_dept_survey` VALUES (5, 2, 'CABOTAGE SERVICES DEPARTMENT', '2024-10-22 15:16:19');
INSERT INTO `nimasa_dept_survey` VALUES (6, 2, 'CABOTAGE SERVICES DEPARTMENT', '2024-10-22 15:16:31');
INSERT INTO `nimasa_dept_survey` VALUES (7, 1, 'ADMINISTRATION & HUMAN RESOURCES DEPARTMENT', '2024-10-22 15:17:24');
INSERT INTO `nimasa_dept_survey` VALUES (8, 1, 'ADMINISTRATION & HUMAN RESOURCES DEPARTMENT', '2024-10-22 15:17:34');
INSERT INTO `nimasa_dept_survey` VALUES (9, 1, 'ADMINISTRATION & HUMAN RESOURCES DEPARTMENT', '2024-10-22 15:17:46');
INSERT INTO `nimasa_dept_survey` VALUES (10, 15, 'NIGERIAN SHIP REGISTRY UNIT', '2024-10-22 15:29:49');
INSERT INTO `nimasa_dept_survey` VALUES (11, 15, 'NIGERIAN SHIP REGISTRY UNIT', '2024-10-22 15:30:29');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter`  (
  `parameter_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `privilege_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('working_hours', '00:00-23:59', '0', 'Allotted working hours of the day', '2009-10-31 00:00:00');
INSERT INTO `parameter` VALUES ('no_of_pin_misses', '5', '1', 'Available number of pin misses allowed', '2009-11-16 12:44:27');
INSERT INTO `parameter` VALUES ('password_expiry_days', '360', '1', 'Number of days for password expiry', '2009-12-04 13:05:30');
INSERT INTO `parameter` VALUES ('Convient Fee Setup', '500', '0', 'Convient Fee Setup', '2016-10-26 18:38:44');
INSERT INTO `parameter` VALUES ('ticket_reservation_holding_max_time', '5', '1', 'Minutes the a Ticket is to be left reserved for payment to be done otherwise opened for purchase', '2018-07-23 12:04:24');
INSERT INTO `parameter` VALUES ('teasypay_api_buygoods_soapaction', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA/buyGoods', '1', 'Teasy Pay Api URL', '2018-07-30 16:35:52');
INSERT INTO `parameter` VALUES ('teasypay_api_apipass', 'qQgGbv6Hj684p0', '1', 'Hash Key', '2018-07-30 18:15:41');
INSERT INTO `parameter` VALUES ('teasypay_api_apiuser', 'gWtIgw29tks1kz', '1', 'Api User', '2018-07-30 18:46:52');
INSERT INTO `parameter` VALUES ('teasypay_api_soapurl', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA?wsdl', NULL, NULL, NULL);
INSERT INTO `parameter` VALUES ('teasypay_api_balance_soapaction', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA/queryBalanceCustomer', NULL, NULL, NULL);
INSERT INTO `parameter` VALUES ('boarding_time_before_departure_time', '2000', NULL, 'Minutes to Allow For Booking before a schedule departure time', '2018-08-04 16:49:30');
INSERT INTO `parameter` VALUES ('login_keep_alive', '300', '1', 'Expiration time for a keep alive of user session', '2018-08-06 18:17:28');
INSERT INTO `parameter` VALUES ('softcom_api_push_ticket', 'https://abuja-metro.appspot.com/api/v1/tickets/new', NULL, 'Send New Tickets to the Validation System', '2018-08-14 16:56:35');
INSERT INTO `parameter` VALUES ('site_local_url', 'http://localhost/desdl/', '0', 'Page Live Url', '2022-08-15 22:11:11');
INSERT INTO `parameter` VALUES ('site_live_url', 'https://techhost7x.accessng.com/DESDL/', '0', 'Page Local URL', '2022-08-15 22:12:54');
INSERT INTO `parameter` VALUES ('working_hours', '00:00-23:59', '0', 'Allotted working hours of the day', '2009-10-31 00:00:00');
INSERT INTO `parameter` VALUES ('no_of_pin_misses', '5', '1', 'Available number of pin misses allowed', '2009-11-16 12:44:27');
INSERT INTO `parameter` VALUES ('password_expiry_days', '360', '1', 'Number of days for password expiry', '2009-12-04 13:05:30');
INSERT INTO `parameter` VALUES ('Convient Fee Setup', '500', '0', 'Convient Fee Setup', '2016-10-26 18:38:44');
INSERT INTO `parameter` VALUES ('ticket_reservation_holding_max_time', '5', '1', 'Minutes the a Ticket is to be left reserved for payment to be done otherwise opened for purchase', '2018-07-23 12:04:24');
INSERT INTO `parameter` VALUES ('teasypay_api_buygoods_soapaction', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA/buyGoods', '1', 'Teasy Pay Api URL', '2018-07-30 16:35:52');
INSERT INTO `parameter` VALUES ('teasypay_api_apipass', 'qQgGbv6Hj684p0', '1', 'Hash Key', '2018-07-30 18:15:41');
INSERT INTO `parameter` VALUES ('teasypay_api_apiuser', 'gWtIgw29tks1kz', '1', 'Api User', '2018-07-30 18:46:52');
INSERT INTO `parameter` VALUES ('teasypay_api_soapurl', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA?wsdl', NULL, NULL, NULL);
INSERT INTO `parameter` VALUES ('teasypay_api_balance_soapaction', 'http://41.220.65.180:8080/axis2/services/HRestAPITSHA/queryBalanceCustomer', NULL, NULL, NULL);
INSERT INTO `parameter` VALUES ('boarding_time_before_departure_time', '2000', NULL, 'Minutes to Allow For Booking before a schedule departure time', '2018-08-04 16:49:30');
INSERT INTO `parameter` VALUES ('login_keep_alive', '300', '1', 'Expiration time for a keep alive of user session', '2018-08-06 18:17:28');
INSERT INTO `parameter` VALUES ('softcom_api_push_ticket', 'https://abuja-metro.appspot.com/api/v1/tickets/new', NULL, 'Send New Tickets to the Validation System', '2018-08-14 16:56:35');
INSERT INTO `parameter` VALUES ('site_local_url', 'http://localhost/desdl/', '0', 'Page Live Url', '2022-08-15 22:11:11');
INSERT INTO `parameter` VALUES ('site_live_url', 'https://techhost7x.accessng.com/DESDL/', '0', 'Page Local URL', '2022-08-15 22:12:54');
INSERT INTO `parameter` VALUES ('FUEL_MOBILE_KEY', '3s6Y9yB&P)H@nRWfTjWmZq4O7w!Q%C*', NULL, NULL, NULL);
INSERT INTO `parameter` VALUES ('default_school_reg_amnt', '40000', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `label` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `operation_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `posted_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_userid` bigint NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'Role.role_list', 'Role List', 'all_op', '', '2022-07-14 04:30:04', 'adakj', '127.0.0.1', NULL, 1, NULL);
INSERT INTO `permissions` VALUES (2, 'Role.delete_role', 'Delete Role', 'all_op', '', '2022-07-14 04:34:17', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (3, 'Role.saveRole', 'Save New Role', 'new', 'User Role Creation', '2022-07-14 04:35:11', 'sam@mail.com', '127.0.0.1', NULL, 0, '2022-09-28 03:23:28');
INSERT INTO `permissions` VALUES (4, 'Role.saveRole', 'Update Role', 'edit', '', '2022-07-14 04:36:08', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (5, 'Permissions.savePermissions', 'Save New Permissions', 'new', '', '2022-07-14 04:47:34', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (6, 'Permissions.savePermissions', 'Update Permissions', 'edit', '', '2022-07-14 04:48:04', 'adakj', '127.0.0.1', NULL, 0, '2022-07-14 04:48:39');
INSERT INTO `permissions` VALUES (13, 'Permissions.permission_list', 'Permissions List', 'all_op', '', '2022-07-15 10:56:44', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (14, 'Permissions.loadPermissions', 'Load Permissions', 'all_op', 'Load Permissions', '2022-07-15 10:57:31', 'adakj', '127.0.0.1', NULL, 0, '2022-07-15 11:04:07');
INSERT INTO `permissions` VALUES (15, 'Permissions.saveActions', 'Save Permission Map', 'all_op', 'Save Permission Map', '2022-07-15 10:58:15', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (16, 'Permissions.deletePermission', 'Delete Permissions', 'all_op', 'Delete Permissions', '2022-07-15 11:00:05', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (17, 'Permissions.inVisibleActions', 'Load Visible Permissions', 'all_op', 'Load Visible Permissions', '2022-07-15 11:01:28', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (18, 'Permissions.visibleActions', 'Load Invisible Permissions', 'all_op', 'Load Invisible Permissions', '2022-07-15 11:02:31', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (19, 'Menu.loadmenus', 'Load Menus', 'all_op', NULL, '2022-07-15 12:33:14', 'nnpcretail', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (20, 'users.getActivityLog', 'Activity Logs', 'all_op', 'Load All Activities', '2022-07-15 13:04:17', 'nnpcretail', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (23, 'Users.userlist', 'User List', 'all_op', 'Load User List', '2022-07-15 13:55:34', 'nnpcretail', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (25, 'menu.saveMenu', 'Save Menu', 'new', 'Save Menu', '2022-07-15 13:59:39', 'nnpcretail', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (27, 'Users.saveUser', 'Save User', 'new', 'Save User', '2022-07-15 15:34:07', 'nnpcretail', '41.242.60.178', NULL, 0, '2022-07-15 03:49:59');
INSERT INTO `permissions` VALUES (28, 'Menu.generateMenu', 'Generate Navigation Menu', 'all_op', 'Generate Navigation Menu', '2022-07-15 12:53:14', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (29, 'Menu.saveMenu', 'Update Menu', 'edit', 'Update Menu', '2022-07-15 12:55:07', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (30, 'Menu.loadParentMenu', 'Load Parent Menu', 'all_op', '', '2022-07-15 01:16:14', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (31, 'Menu.deleteMenu', 'Delete Menu', 'all_op', '', '2022-07-15 01:17:17', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (32, 'Menu.menuList', 'Menu List', 'all_op', 'Menu List', '2022-07-15 01:18:13', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (33, 'Menu.visibleMenus', 'Load Visible Menu', 'all_op', 'Load Invisible Menu', '2022-07-15 01:23:44', 'adakj', '127.0.0.1', NULL, 0, '2022-07-15 01:25:11');
INSERT INTO `permissions` VALUES (34, 'Menu.inVisibleMenus', 'Load Invisible Menu', 'all_op', '', '2022-07-15 01:25:51', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (35, 'Menu.saveMenuGroup', 'Save Menu Group', 'all_op', '', '2022-07-15 02:19:49', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (78, 'Role.generateInvoice', 'Generate Invoice', 'all_op', '', '2022-07-15 04:41:28', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (116, 'Users.saveUser', 'Update User Profile', 'edit', '', '2022-07-15 06:59:16', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (117, 'Users.confirmCurrent', 'Confirm Current Password', 'all_op', '', '2022-07-15 07:02:42', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (120, 'Users.resetPassword', 'Users Reset Password', 'all_op', '', '2022-07-15 07:32:59', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (121, 'Users.doForgotPasswordChange', 'User Forgot Password Change', 'all_op', '', '2022-07-15 07:34:52', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (122, 'Users.generatePwdLink', 'Generate Password Link', 'all_op', '', '2022-07-15 07:36:12', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (123, 'Users.verifyLink', 'Verify Password Link', 'all_op', '', '2022-07-15 07:37:00', 'adakj', '127.0.0.1', NULL, 0, '2022-07-15 07:39:05');
INSERT INTO `permissions` VALUES (124, 'Users.getLgas', 'Get All LGAs', 'all_op', '', '2022-07-15 07:40:43', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (125, 'Users.profileEdit', 'User Profile Edit', 'edit', '', '2022-07-15 07:44:37', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (126, 'Users.emailPasswordReset', 'User Email Password Reset', 'all_op', '', '2022-07-15 08:00:09', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (127, 'Users.changeUserStatus', 'Disable/Enable Users', 'all_op', '', '2022-07-15 08:01:46', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (128, 'Users.unLockUser', 'Unlock Users Account', 'all_op', '', '2022-07-15 08:02:26', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (129, 'Users.passwordChange', 'Users Change Password', 'all_op', '', '2022-07-15 08:03:40', 'adakj', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (133, 'Users.userProfileUpdate', 'All User Profile Update ', 'edit', 'All User Profile Update', '2022-07-25 06:54:24', 'one@demo.com', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (134, 'Dashboard.carousel', 'Dashboard Carousel', 'all_op', '', '2022-08-01 07:56:11', '', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (135, 'Dashboard.remittance', 'Dashboard Remittance', 'all_op', '', '2022-08-01 07:57:42', '', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (136, 'Dashboard.topFiveChurches', 'Dashboard Top Churches', 'all_op', '', '2022-08-01 07:58:21', '', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (137, 'Users.sackUser', 'Sack Users', 'all_op', '', '2022-08-05 11:29:45', '', '127.0.0.1', NULL, 0, NULL);
INSERT INTO `permissions` VALUES (138, 'Users.sackUsers', 'Sack Usersrrr', 'edit', 'test', '2022-08-05 11:41:55', 'sam@mail.com', '127.0.0.1', NULL, 1, NULL);
INSERT INTO `permissions` VALUES (139, 'Users.doPasswordChange', 'User Password Change', 'all_op', '', '2022-08-06 08:23:48', 'sam@mail.com', '127.0.0.1', NULL, 0, NULL);

-- ----------------------------
-- Table structure for permissions_map
-- ----------------------------
DROP TABLE IF EXISTS `permissions_map`;
CREATE TABLE `permissions_map`  (
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_id` int NOT NULL,
  `created` datetime NULL DEFAULT NULL,
  `posted_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_userid` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `permission_id_fk`(`permission_id`) USING BTREE,
  CONSTRAINT `permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of permissions_map
-- ----------------------------
INSERT INTO `permissions_map` VALUES ('001', 1, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 2, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 3, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 4, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 5, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 6, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 13, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 14, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 15, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 16, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 17, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 18, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 19, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 20, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 23, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 25, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 27, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 28, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 29, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 30, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 31, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 32, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 33, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 34, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 35, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 78, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 116, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 117, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 120, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 121, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 122, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 123, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 124, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 125, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 126, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 127, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 128, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 129, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 133, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 134, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 135, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 136, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 137, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);
INSERT INTO `permissions_map` VALUES ('001', 139, '2022-08-06 08:24:11', 'sam@mail.com', '127.0.0.1', NULL);

-- ----------------------------
-- Table structure for poll
-- ----------------------------
DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hostId` bigint NOT NULL,
  `title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `type` smallint NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `publishedAt` datetime NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_poll_host`(`hostId`) USING BTREE,
  INDEX `idx_poll_published`(`published`) USING BTREE,
  CONSTRAINT `poll_ibfk_1` FOREIGN KEY (`hostId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poll
-- ----------------------------
INSERT INTO `poll` VALUES (10, 12345, 'survey', 'nimasa survey', 0, 1, '2024-10-10 13:29:15', '2024-10-10 13:29:06', NULL, NULL);
INSERT INTO `poll` VALUES (11, 12345, 'feedback', 'nimasa feedback', 0, 1, '2024-10-10 13:30:29', '2024-10-10 13:30:34', NULL, NULL);
INSERT INTO `poll` VALUES (14, 12345, 'complaint', 'nimasa complaint', 0, 1, '2024-10-10 13:31:20', '2024-10-10 13:31:24', NULL, NULL);

-- ----------------------------
-- Table structure for poll_answer
-- ----------------------------
DROP TABLE IF EXISTS `poll_answer`;
CREATE TABLE `poll_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pollId` bigint NOT NULL,
  `hasText` bigint NOT NULL DEFAULT 0,
  `questionId` bigint NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_answer_poll`(`pollId`) USING BTREE,
  INDEX `idx_answer_question`(`questionId`) USING BTREE,
  CONSTRAINT `poll_answer_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `poll_answer_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `poll_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poll_answer
-- ----------------------------

-- ----------------------------
-- Table structure for poll_meta
-- ----------------------------
DROP TABLE IF EXISTS `poll_meta`;
CREATE TABLE `poll_meta`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pollId` bigint NOT NULL,
  `poll_meta_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_poll_key`(`pollId`, `poll_meta_key`) USING BTREE,
  CONSTRAINT `poll_meta_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poll_meta
-- ----------------------------

-- ----------------------------
-- Table structure for poll_question
-- ----------------------------
DROP TABLE IF EXISTS `poll_question`;
CREATE TABLE `poll_question`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pollId` bigint NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `questionTypeId` bigint NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `isCompulsory` tinyint(1) NOT NULL DEFAULT 1,
  `customer_feedback` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionTypeId`(`questionTypeId`) USING BTREE,
  INDEX `idx_question_poll`(`pollId`) USING BTREE,
  CONSTRAINT `poll_question_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `poll` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `poll_question_ibfk_2` FOREIGN KEY (`questionTypeId`) REFERENCES `question_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poll_question
-- ----------------------------

-- ----------------------------
-- Table structure for poll_vote
-- ----------------------------
DROP TABLE IF EXISTS `poll_vote`;
CREATE TABLE `poll_vote`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pollId` bigint NOT NULL,
  `questionId` bigint NOT NULL,
  `answerId` bigint NOT NULL,
  `userId` bigint NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionId`(`questionId`) USING BTREE,
  INDEX `idx_vote_poll`(`pollId`) USING BTREE,
  INDEX `idx_vote_user`(`userId`) USING BTREE,
  INDEX `idx_vote_answer`(`answerId`) USING BTREE,
  CONSTRAINT `poll_vote_ibfk_1` FOREIGN KEY (`pollId`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `poll_vote_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `poll_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `poll_vote_ibfk_3` FOREIGN KEY (`answerId`) REFERENCES `poll_answer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `poll_vote_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poll_vote
-- ----------------------------

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionType` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES (1, 'Multiple Choice');
INSERT INTO `question_type` VALUES (2, 'Multiple Choice with');
INSERT INTO `question_type` VALUES (3, 'Linear Scale');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('001', 'Super Administrator', NULL, '2009-10-31 18:54:57');
INSERT INTO `role` VALUES ('014', 'Admin', '1', NULL);
INSERT INTO `role` VALUES ('015', 'User', '1', '2023-04-17 09:11:01');

-- ----------------------------
-- Table structure for transaction_table
-- ----------------------------
DROP TABLE IF EXISTS `transaction_table`;
CREATE TABLE `transaction_table`  (
  `transaction_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source_acct` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destination_acct` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `transaction_amount` decimal(50, 2) NULL DEFAULT NULL,
  `response_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `posted_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `settlement_status` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `settlement_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `session_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `debit_flag` int NOT NULL,
  `debit_flag_date` date NOT NULL,
  `reversal_flag` int NOT NULL,
  `reversal_flag_date` date NOT NULL,
  `trans_query_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_commission` decimal(50, 2) NULL DEFAULT NULL,
  `chargefee` decimal(50, 2) NULL DEFAULT NULL,
  `response_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_gateway` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validate_response` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `request_reversal` tinyint(1) NULL DEFAULT 0,
  `reversal_request_date` datetime NULL DEFAULT NULL,
  `reversal_approval_date` datetime NULL DEFAULT NULL,
  `reversal_approved_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_processed` tinyint(1) NULL DEFAULT 0,
  `payment_status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merchant_trans_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ussd_code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `revenue` decimal(50, 2) NULL DEFAULT NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `validate_response_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `phone_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_modified` datetime NULL DEFAULT NULL,
  `reference_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `channel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 4096 kB; InnoDB free: 3072 kB; InnoDB free: 307' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_table
-- ----------------------------
INSERT INTO `transaction_table` VALUES ('', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-06 16:59:03', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019052741279', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:27:56', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019056231964', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:33:48', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019058438370', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:37:33', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019060911252', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:42:27', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019065308416', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:48:58', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019068861224', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 00:54:52', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019356923635', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 08:54:56', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019360482431', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 09:00:53', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019364678763', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2023-12-07 09:07:59', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17019366187707', '', 'david@mail.com', '', NULL, 'Teacher Registration', 30000.00, '99', NULL, NULL, '2023-12-07 09:12:44', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17029953041994', '', 'david@mail.com', '', NULL, 'Teacher Registration', 50000.00, '99', NULL, NULL, '2023-12-19 15:15:11', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055259852428', '', 'david@mail.com', '', NULL, 'Teacher Registration', 30000.00, '99', NULL, NULL, '2024-01-17 22:13:59', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055621014099', '', 'david@mail.com', '', NULL, 'Teacher Registration', 30000.00, '99', NULL, NULL, '2024-01-18 08:16:16', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055635047407', '', 'david@mail.com', '', NULL, 'Teacher Registration', 250000.00, '99', NULL, NULL, '2024-01-18 08:40:48', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055638119579', '', 'david@mail.com', '', NULL, 'Teacher Registration', 30000.00, '99', NULL, NULL, '2024-01-18 08:45:19', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055648605876', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2024-01-18 09:01:03', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055678399742', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2024-01-18 09:50:43', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055686533248', '', 'david@mail.com', '', NULL, 'Teacher Registration', 250000.00, '99', NULL, NULL, '2024-01-18 10:05:40', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17055698224303', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2024-01-18 10:23:46', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17059165612602', '', 'david@mail.com', '', NULL, 'School Registration', 30000.00, '99', NULL, NULL, '2024-01-22 10:42:46', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');
INSERT INTO `transaction_table` VALUES ('TFTG17144691163017', '', 'david@mail.com', '', NULL, 'Teacher Registration', 30000.00, '99', NULL, NULL, '2024-04-30 10:25:38', NULL, 0, NULL, NULL, 0, '0000-00-00', 0, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `middleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passwordHash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hostId` tinyint(1) NOT NULL DEFAULT 0,
  `registeredAt` datetime NOT NULL DEFAULT current_timestamp,
  `lastLoginAt` datetime NULL DEFAULT NULL,
  `intro` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12346 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'John', NULL, 'Doe', '08035214555', 'john@example.com', '$2y$10$zNq7Ed9Uy8tIxb7SVArXt.ldo', 0, '2024-10-09 12:58:12', NULL, NULL, NULL);
INSERT INTO `user` VALUES (12345, 'nimasa', 'nimasa', 'nimasa', '08035214555', 'nimasa@nimasa.com', '$10$zNq7Ed9Uy8tIxb7SVArXt.ldo', 0, '2024-10-10 13:26:22', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for userdata
-- ----------------------------
DROP TABLE IF EXISTS `userdata`;
CREATE TABLE `userdata`  (
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_person` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `park_and_pay_operator_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_granted_from` datetime NULL DEFAULT NULL,
  `date_granted_to` datetime NULL DEFAULT NULL,
  `area_allocated` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cac_reg_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operator_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_link_used` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passchg_logon` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass_expire` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pass_dateexpire` date NULL DEFAULT NULL,
  `pass_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `user_disabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `user_locked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `day_1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_5` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_6` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_7` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pin_missed` int NOT NULL DEFAULT 0,
  `last_used` datetime NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `modified` datetime NULL DEFAULT NULL,
  `authorize_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hint_question` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hint_answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `override_wh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extend_wh` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `super_agent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `license_operator_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operation_status` int NOT NULL,
  `office_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_doc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posted_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `office_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `office_lga` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reg_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `file_upload` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `street_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `verification_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `invitation_link` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modified_date` datetime NULL DEFAULT NULL,
  `photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_pwd_link` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `invitation_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_email_successful` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qualification` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` int NOT NULL,
  `trcn_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; InnoDB free: 11264 kB; InnoDB free: 1' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userdata
-- ----------------------------
INSERT INTO `userdata` VALUES ('acc@mail.com', '0x13bf1080493306b1', '023', '', 'Ikechukwu', 'Chimalu', '', 'acc@mail.com', '08073624675', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-10-16 05:36:57', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'chimalupaul@gmail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('adaumeh@gmail.com', '', '', NULL, '', '', '', 'adaumeh@gmail.com', '', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '0x68c2c3fe1b2eaea779a36b259ceccb9a4ee8206d45f691e237e5ba6742a950f5b9bd1514e674e956', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('admin', '0xc33994f489aa82b4', '014', 'Admin', 'Admin', 'Admin', '', 'admin@gmail.com', '08107701730', '', '2023-04-17 00:00:00', '2023-04-17 00:00:00', '', '', '', '', '', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, '', NULL, NULL, NULL, NULL, '1', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('ali', '0x9ae78b05f9b59f91', '', NULL, 'ali', 'ali', '', 'ali@gmail.com', '08977654341', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2023-05-08 04:44:30', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'davidakanang@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('ayo', '0x90147481aac24714', '', NULL, 'ay', 'y', '', 'ayo@gmail.com', '0897765434', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2023-05-08 05:05:30', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nkem@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('buggershub@gmail.com', '0x612602d6fc868909', '014', 'Teacher', 'David', 'Akanang', '', 'buggershub@gmail.com', '', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2024-01-22 12:28:19', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, 'Certainly.docx', NULL, NULL, NULL, NULL, '1', '', '', '547186', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'NCE', 1, 'OS/S/2023');
INSERT INTO `userdata` VALUES ('davidakanang@gmail.com', '0x9daaa09f21d6b5cc', '014', 'Teacher', 'David', 'David', '', 'davidakanang@gmail.com', '', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2024-04-30 10:23:47', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, 'Certainly.docx', NULL, NULL, NULL, NULL, '1', '', '', '597786', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Bsc', 1, 'OS/S/2023');
INSERT INTO `userdata` VALUES ('dayousman@gmail.com', '', '', NULL, '', '', '', 'dayousman@gmail.com', '', '', NULL, NULL, '', '', '', '0', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '0x7beaf35af1781bb87a5f5e08b8bed0cc8b6827bcda53de31df111db260db809a22e166dbb14e775c', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('ezekialafolabi11@gmail.com', '0xa6c6586908f9c975', '014', 'Teacher', 'Musa', '', '', 'ezekialafolabi11@gmail.com', '', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2024-01-17 13:06:03', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, 'Subject.docx', NULL, NULL, NULL, NULL, '1', '', '', '728429', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Abdulasalam', 1, 'OS/S/2023');
INSERT INTO `userdata` VALUES ('fred', '0x7c550711398e0cd4', '', NULL, 'aa', 'aa', '', 'fred@gmail.com', '0909837950', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2023-05-08 03:53:16', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'davidakanang@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('hq@mail.com', '0xfa2754e5206604bd', '012', '', 'hqadmin', 'hqadmin', '', 'hq@mail.com', '08065555471', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-10-29 04:33:46', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('joy', '0xc5bce4a92a97c4c0', '', 'marshal', 'joy', 'j', '', 'joyj@gmail.com', '0909837950', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2023-05-08 05:18:45', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'davidakanang@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('okon@mail.com', '0x0b69394d5a8e0eb5', '003', '', 'Ikechukwu', 'Chimalu', '', 'okon@mail.com', '08073624675', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-10-18 11:37:47', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('parkservices247@gmail.com', '', '', NULL, '', '', '', 'parkservices247@gmail.com', '', '', NULL, NULL, '', '', '', '0', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '0xdde0c08da2ff9bc498755d08c6368fd579a36b259ceccb9a4ee8206d45f691e29eed615b3843cff034d10b5ae9c02681', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('roadmarshal@gmail.com', '0x51997808c3d50e95', '013', NULL, 'road', 'marshal', '', 'roadmarshal@gmail.com', '09098379501', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2023-04-05 11:00:02', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'davidakanang@gmail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('sam@mail.com', '0x3dd8ba2b49be532d', '001', 'ADMIN', 'Sam', 'James', '', 'sam@mail.com', '08107701731', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, '2024-07-18', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, '2018-04-06 16:59:19', '2018-03-09 16:32:05', '2022-08-05 19:00:40', NULL, NULL, 'jddjjjd', 'jdjdjjdd', '0', '1', NULL, '09874625477', 'jdjdjd', '', '', 0, 'hdhdhhf', '', 'GTB', 'sam@mail.com', 'FCT', 'AMAC', '1', '', '', '964373', '', '', 'male', NULL, 'sam@mail.com.png', '', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('sam@mail.comm', '0x3dd8ba2b49be532d', '006', NULL, 'Name', 'Empty', '', 'sam@mail.comm', '0349393939', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2022-08-18 09:39:47', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '<br />\r\n<b>Notice</b>:  Undefined variable: user in <b>C:\\laragon\\www\\access_framework\\setup\\pastor.php</b> on line <b>72</b><br />\r\n<br />\r\n<b>Notice</b>:  Trying to access array offset on value of type null in <b>C:\\laragon\\www\\access_framework\\setup\\pastor.php</b> on line <b>72</b><br />\r\n<br />\r\n<b>Notice</b>:  Trying to access array offset on value of type null in <b>C:\\laragon\\www\\access_framework\\setup\\pastor.php</b> on line <b>72</b><br />\r\n', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('sam_prosper@mail.com', '0x22770ec5b051cb39', '006', NULL, 'Prosper', 'Adakole', '', 'sam_prosper@mail.com', '90393939393', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2022-08-05 07:01:32', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '<br />\r\n<b>Warning</b>:  Undefined variable $user in <b>C:\\laragon\\www\\framework\\framework\\setup\\pastor.php</b> on line <b>73</b><br />\r\n<br />\r\n<b>Warning</b>:  Trying to access array offset on value of type null in <b>C:\\laragon\\www\\framework\\framework\\setup\\pastor.php</b> on line <b>73</b><br />\r\n<br />\r\n<b>Warning</b>:  Trying to access array offset on value of type null in <b>C:\\laragon\\www\\framework\\framework\\setup\\pastor.php</b> on line <b>73</b><br />\r\n', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('sasssm@mail.com', '0x3a46391500cbf610', '005', NULL, 'Mercy', 'John', '', 'sasssm@mail.com', '0904949494', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2023-01-23 12:49:46', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, NULL, NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('state_admin@mail.com', '0x036e826be07ed7c5', '006', '', 'Ikechukwu', 'Chimalu', '', 'state_admin@mail.com', '08073624675', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-10-30 09:26:55', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('test1@mail.com', '0x6e1d02c9bd721da3', '002', '', 'adsfdgfg', 'sdfgg', '', 'test1@mail.com', '025852222226', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-12-03 11:11:34', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'tlc01220pastor@tlc.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('test2@mail.com', '0x82e70b4331819111', '004', '', 'jh', 'gcfhvj', '', 'test2@mail.com', '0581052', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-12-03 11:12:22', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'tlc01220pastor@tlc.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('test3@mail.com', '0x82e70b4331819111', '008', '', 'ghjkl,mn', 'ghjknbvghj', '', 'test3@mail.com', '0205841205', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-12-03 11:12:55', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'tlc01220pastor@tlc.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00110pastor@tlc.com', '0x204379ec193a4e10', '003', '', 'default_name', 'default_name', '', 'tlc00110pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:48:42', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00111pastor@tlc.com', '0x8e70a90ba86bcb6d', '003', '', 'default_name', 'default_name', '', 'tlc00111pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:49:09', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00112pastor@tlc.com', '0x2a3ada1f153940ef', '003', '', 'default_name', 'default_name', '', 'tlc00112pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:49:20', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00113pastor@tlc.com', '0x24dd930d4556d90d', '003', '', 'default_name', 'default_name', '', 'tlc00113pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 08:24:26', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00116pastor@tlc.com', '0xb77aa57fe03465b2', '003', '', 'default_name', 'default_name', '', 'tlc00116pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-15 02:30:24', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00117pastor@tlc.com', '0x41357be1ca2a5b82', '003', '', 'default_name', 'default_name', '', 'tlc00117pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-15 02:35:33', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0013pastor@tlc.com', '0x253502bd56f0ea3163486462e0d6ab7b', '003', '', 'default_name', 'default_name', '', 'tlc0013pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:07:24', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0015pastor@tlc.com', '0xd646e5cd6187e92f66e01a5d9cdf2b64', '003', '', 'default_name', 'default_name', '', 'tlc0015pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:14:32', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', '2019-11-13 06:42:05', NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0016pastor@tlc.com', '0xb5e02f133489bfb6ed202ca628d9c98a', '003', '', 'default_name', 'default_name', '', 'tlc0016pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:44:05', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0017pastor@tlc.com', '0x8ef9621cd75d9641bd852d8e9406509e', '003', '', 'default_name', 'default_name', '', 'tlc0017pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:47:01', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0019pastor@tlc.com', '0x387db30f4ab25f9c', '003', '', 'default_name', 'default_name', '', 'tlc0019pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:48:21', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00214pastor@tlc.com', '0x9703deb303769b8f', '003', '', 'default_name', 'default_name', '', 'tlc00214pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-13 09:26:17', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', 'unknown', NULL, '', 0, NULL, '', '', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', '2019-11-13 07:12:09', NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00218pastor@tlc.com', '0xa2868718743504a2', '003', '', 'default_name', 'default_name', '', 'tlc00218pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-15 02:37:24', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0045512298', 'MALU JOSEPH UGO', NULL, '', 0, NULL, '', '044', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc00219pastor@tlc.com', '0xa2868718743504a2', '003', '', 'default_name', 'default_name', '', 'tlc00219pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-15 05:38:29', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0045512298', 'MALU JOSEPH UGO', NULL, '', 0, NULL, '', '044', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0021pastor@tlc.com', '0x2814d4a3425d8e82686a8036d2fec454', '003', '', 'default_name', 'default_name', '', 'tlc0021pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:05:44', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0022pastor@tlc.com', '0xb15fca6d59033b0da652162c3d383c7f', '003', '', 'default_name', 'default_name', '', 'tlc0022pastor@tlc.com', '07060000000', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:06:03', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '00000000000', 'unknown', NULL, '', 0, NULL, '', '00', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'm', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc0034pastor@tlc.com', '0x2eeb5a211c6b4afc24e0dafacd161199', '003', '', 'ugo c ugo', 'default_name', '', 'tlc0034pastor@tlc.com', '0706999999999', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '1', NULL, NULL, '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-11-12 07:09:30', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0045512298', 'MALU JOSEPH UGO', NULL, '', 0, NULL, '', '044', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', '2020-03-18 03:06:32', NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('tlc01220pastor@tlc.com', '0x143604d46bd69e23', '003', '', 'Joe', 'malu', '', 'tlc01220pastor@tlc.com', '07066665842', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-12-03 06:33:24', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0045512298', 'Could not resolve host: live.moneywaveapi.coUnable to verify account, try again.', NULL, '', 0, NULL, '', '044', 'sam@mail.com', NULL, NULL, '0', '', '', '', '', '', 'male', NULL, '', '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('wleader@mail.com', '0xc20f668ff50fd07d', '004', '', 'women', 'leader', '', 'wleader@mail.com', '07060760578', '', '2023-04-05 00:00:00', '2023-04-05 00:00:00', '', '', '', '', '0', NULL, NULL, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', 0, NULL, '2019-10-22 02:46:39', '2022-08-05 19:00:40', '0', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', 0, NULL, '', '', 'chimalupaul@gmail.com', NULL, NULL, '0', '', '', '', '', '', 'female', NULL, NULL, '0xf2adcf9db6eb6ce291c4f9c7e1c29aeda09aae3a0b23bb39a51e1ccb63b2c955abd285015048a913ec2c7b4a161608e591426ec6c9de62b9', NULL, NULL, '', 0, '');
INSERT INTO `userdata` VALUES ('yobo', '0xf8b83fee1bc110d9', '', 'marshal', 'yobo', 'y', '', 'yobo@gmail.com', '0909837950', '', NULL, NULL, '', '', '', '', '', NULL, NULL, '0', '0', '0', '', '', '', '', '', '', '', 0, NULL, '2023-05-08 04:08:33', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'davidakanang@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '');

-- ----------------------------
-- View structure for active_polls
-- ----------------------------
DROP VIEW IF EXISTS `active_polls`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_polls` AS select `p`.`id` AS `id`,`p`.`hostId` AS `hostId`,`p`.`title` AS `title`,`p`.`summary` AS `summary`,`p`.`type` AS `type`,`p`.`published` AS `published`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`p`.`content` AS `content`,`u`.`firstName` AS `firstName`,`u`.`lastName` AS `lastName` from (`poll` `p` join `user` `u` on((`p`.`hostId` = `u`.`id`))) where (`p`.`published` = 1) ;

-- ----------------------------
-- View structure for poll_statistics
-- ----------------------------
DROP VIEW IF EXISTS `poll_statistics`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `poll_statistics` AS select `p`.`id` AS `poll_id`,`p`.`title` AS `poll_title`,count(distinct `pv`.`userId`) AS `total_participants`,count(distinct `pq`.`id`) AS `total_questions`,count(distinct `pv`.`id`) AS `total_votes` from ((`poll` `p` left join `poll_question` `pq` on((`p`.`id` = `pq`.`pollId`))) left join `poll_vote` `pv` on((`p`.`id` = `pv`.`pollId`))) group by `p`.`id` ;

-- ----------------------------
-- Triggers structure for table poll
-- ----------------------------
DROP TRIGGER IF EXISTS `before_poll_update`;
delimiter ;;
CREATE TRIGGER `before_poll_update` BEFORE UPDATE ON `poll` FOR EACH ROW BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table poll_answer
-- ----------------------------
DROP TRIGGER IF EXISTS `before_answer_update`;
delimiter ;;
CREATE TRIGGER `before_answer_update` BEFORE UPDATE ON `poll_answer` FOR EACH ROW BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table poll_question
-- ----------------------------
DROP TRIGGER IF EXISTS `before_question_update`;
delimiter ;;
CREATE TRIGGER `before_question_update` BEFORE UPDATE ON `poll_question` FOR EACH ROW BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table poll_vote
-- ----------------------------
DROP TRIGGER IF EXISTS `before_vote_update`;
delimiter ;;
CREATE TRIGGER `before_vote_update` BEFORE UPDATE ON `poll_vote` FOR EACH ROW BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
