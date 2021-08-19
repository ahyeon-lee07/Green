-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema green
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema green
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `green` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `green` ;

-- -----------------------------------------------------
-- Table `green`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`member` (
  `id` VARCHAR(60) NOT NULL COMMENT '���̵�',
  `pw` VARCHAR(100) NOT NULL COMMENT '��й�ȣ',
  `name` VARCHAR(20) NOT NULL COMMENT '�̸�',
  `birth` VARCHAR(10) NULL DEFAULT NULL COMMENT '�������',
  `phone` VARCHAR(20) NOT NULL COMMENT '��ȭ��ȣ',
  `email1` VARCHAR(30) NOT NULL COMMENT '�̸���',
  `email2` VARCHAR(20) NOT NULL COMMENT '�̸���',
  `zipCode` VARCHAR(10) NULL DEFAULT NULL COMMENT '�����ȣ',
  `addr1` VARCHAR(20) NULL DEFAULT NULL COMMENT '�⺻�ּ�',
  `addr2` VARCHAR(40) NULL DEFAULT NULL COMMENT '�������ּ�',
  `addr3` VARCHAR(40) NULL DEFAULT NULL COMMENT '�����ּ�',
  `grade` VARCHAR(15) NOT NULL DEFAULT 'new' COMMENT 'ȸ�����\\\\\\\\n(�ű� : new\\\\\\\\n�Ϲ� : general\\\\\\\\n��� : vip\\\\n������:master)',
  `mileage` INT(11) NULL DEFAULT '0' COMMENT '������',
  `orderPriceSum` INT(11) NULL DEFAULT '0' COMMENT '���� ���� �ݾ�',
  `masterYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT 'ȸ������ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n������ : M\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�Ϲ�ȸ��: N',
  `joinDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ȸ����������',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`product` (
  `productId` VARCHAR(40) NOT NULL COMMENT '��ǰ���̵�  (��ǰ����-000001)',
  `p_group` VARCHAR(20) NOT NULL COMMENT '��ǰ ���� \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n-----------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�ϵ����̽�: hard\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�����̽�: gel\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nī�����̽�: card\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n���������̽�: airPods\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�������̽�: buds\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nŰ��: keyring\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n����Ʈ��:smart',
  `productName` VARCHAR(80) NOT NULL COMMENT '��ǰ��',
  `price` INT(11) NOT NULL COMMENT '�ǸŰ�',
  `discount` INT(11) NULL DEFAULT '0' COMMENT '���ΰ�',
  `productMileage` INT(11) NULL DEFAULT '0' COMMENT '��ǰ ������',
  `salesSum` INT(11) NULL DEFAULT '0' COMMENT '�����Ǹż���',
  `discountYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT '���� ���� (Y ,N)',
  `productDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�������',
  `showYN` VARCHAR(5) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`productId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`cart` (
  `cartNum` INT(11) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(20) NOT NULL COMMENT 'ȸ�����̵�',
  `productId` VARCHAR(40) NOT NULL COMMENT '��ǰ�ӵ�',
  `s_optionId` VARCHAR(80) NULL DEFAULT NULL COMMENT '��ٱ��Ͽ� ���� ����ڰ� ������ �ɼ�',
  `s_stock` INT(11) NULL DEFAULT NULL COMMENT '��ٱ��Ͽ� ���� ����ڰ� ������ ��ǰ ����',
  `cartType` VARCHAR(5) NOT NULL COMMENT '��/��ٱ��� ����',
  PRIMARY KEY (`cartNum`),
  INDEX `fk_Product_has_Member_Member1_idx` (`id` ASC) VISIBLE,
  INDEX `fk_Product_has_Member_Product1_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Member_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`),
  CONSTRAINT `fk_Product_has_Member_Product1`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`qna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`qna` (
  `questionNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Q&A �۹�ȣ',
  `id` VARCHAR(20) NOT NULL,
  `productId` VARCHAR(40) NULL DEFAULT NULL,
  `questionTitle` VARCHAR(100) NOT NULL COMMENT 'Q&A Ÿ��Ʋ',
  `questionContent` TEXT NULL DEFAULT NULL COMMENT '����',
  `questionHits` INT(11) NOT NULL DEFAULT '0' COMMENT '��ȸ��',
  `commentCount` INT(11) NOT NULL DEFAULT '0' COMMENT '��� ��',
  `questionPw` VARCHAR(20) NULL DEFAULT NULL COMMENT '�� ��й�ȣ',
  `pwYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT '��б� ���� (Y, N)',
  `questionDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���',
  PRIMARY KEY (`questionNum`),
  INDEX `fk_QnA_Product1_idx` (`productId` ASC) VISIBLE,
  INDEX `fk_QnA_Member1_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_QnA_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`),
  CONSTRAINT `fk_QnA_Product1`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`comment` (
  `commentNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '��� ��ȣ',
  `QnANum` INT(11) NOT NULL,
  `id` VARCHAR(20) NOT NULL COMMENT '�����ڸ� ����',
  `commentContent` TEXT NOT NULL COMMENT '��� ����',
  `commentDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��� �ۼ���',
  PRIMARY KEY (`commentNum`),
  INDEX `fk_Comment_QnA1_idx` (`QnANum` ASC, `id` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_QnA1`
    FOREIGN KEY (`QnANum`)
    REFERENCES `green`.`qna` (`questionNum`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`coupon` (
  `couponId` VARCHAR(40) NOT NULL COMMENT '�������̵� (c-0000000)',
  `couponName` VARCHAR(80) NOT NULL COMMENT '������',
  `couponContent` VARCHAR(100) NULL DEFAULT NULL COMMENT '���� ����',
  `discountType` VARCHAR(20) NOT NULL,
  `couponPay` INT(11) NOT NULL DEFAULT '0' COMMENT '���� ���αݾ�',
  `couponPeriod_start` VARCHAR(20) NULL DEFAULT NULL COMMENT '���� ���Ⱓ(����)',
  `couponPeriod_end` VARCHAR(20) NULL DEFAULT NULL COMMENT '���� ���Ⱓ(��)',
  `couponDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `useYN` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`couponId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`deletedmember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`deletedmember` (
  `id` VARCHAR(60) NOT NULL,
  `pw` VARCHAR(30) NULL DEFAULT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `birth` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email1` VARCHAR(30) NULL DEFAULT NULL,
  `email2` VARCHAR(20) NULL DEFAULT NULL,
  `zipCode` VARCHAR(10) NULL DEFAULT NULL,
  `addr1` VARCHAR(20) NULL DEFAULT NULL,
  `addr2` VARCHAR(40) NULL DEFAULT NULL,
  `addr3` VARCHAR(40) NULL DEFAULT NULL,
  `grade` VARCHAR(15) NULL DEFAULT NULL,
  `mileage` INT(11) NULL DEFAULT NULL,
  `masterYN` VARCHAR(5) NULL DEFAULT NULL,
  `joinDate` DATETIME NULL DEFAULT NULL,
  `withdrawDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ż��¥',
  `deletedNO` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`deletedNO`),
  INDEX `fk_deletedMember_Member1_idx` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`event` (
  `eventNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '�̺�Ʈ �۹�ȣ',
  `id` VARCHAR(20) NOT NULL,
  `eventTitle` VARCHAR(100) NOT NULL COMMENT '�̺�Ʈ Ÿ��Ʋ',
  `eventContent` TEXT NULL DEFAULT NULL COMMENT '����',
  `eventDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���',
  `eventHits` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventNum`),
  INDEX `fk_Event_Member1_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`image` (
  `imgId` INT(11) NOT NULL AUTO_INCREMENT,
  `productId` VARCHAR(40) NOT NULL COMMENT '��ǰ���̵�',
  `imgType` VARCHAR(20) NOT NULL COMMENT '�̹��� ����\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n------------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n��ǰ����:product_M\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n��ǰ����:product_S\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n����ȭ���̹���:main\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�˾��̹���:popup',
  `imgURL` VARCHAR(100) NOT NULL COMMENT '�̹��� URL',
  PRIMARY KEY (`imgId`),
  INDEX `fk_Image_Product1_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `fk_Image_Product1`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 200
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`member_has_coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`member_has_coupon` (
  `hasCouponNum` INT(11) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(20) NOT NULL COMMENT 'ȸ�����̵�',
  `couponId` VARCHAR(40) NOT NULL COMMENT '�������̵�',
  `couponYN` VARCHAR(5) NULL DEFAULT 'N' COMMENT '���� ��뿩�� (Y, N)',
  `couponUseDate` DATETIME NULL DEFAULT NULL COMMENT '���� �����',
  PRIMARY KEY (`hasCouponNum`),
  INDEX `fk_Member_has_Coupon_Coupon1_idx` (`couponId` ASC) VISIBLE,
  INDEX `fk_Member_has_Coupon_Member1_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Member_has_Coupon_Coupon1`
    FOREIGN KEY (`couponId`)
    REFERENCES `green`.`coupon` (`couponId`),
  CONSTRAINT `fk_Member_has_Coupon_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 122
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`notice` (
  `noticeNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '�������� �۹�ȣ',
  `id` VARCHAR(20) NOT NULL,
  `noticeTitle` VARCHAR(100) NOT NULL COMMENT '�������� Ÿ��Ʋ',
  `noticeContent` TEXT NULL DEFAULT NULL COMMENT '����',
  `noticeDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���',
  `noticeHits` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`noticeNum`),
  INDEX `fk_Notice_Member1_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Notice_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`order` (
  `orderNum` VARCHAR(40) NOT NULL COMMENT '�ֹ���ȣ',
  `id` VARCHAR(20) NOT NULL COMMENT 'ȸ�����̵�',
  `impUid` VARCHAR(30) NOT NULL,
  `recipient` VARCHAR(20) NOT NULL COMMENT '�����ô� ��',
  `order_zipCode` VARCHAR(10) NOT NULL COMMENT '�ֹ�_�����ȣ',
  `order_addr1` VARCHAR(20) NOT NULL COMMENT '�ֹ�_�⺻�ּ�',
  `order_addr2` VARCHAR(40) NOT NULL COMMENT '�ֹ�_�������ּ�',
  `order_addr3` VARCHAR(40) NOT NULL COMMENT '�ֹ�_���� �ּ�',
  `order_phone` VARCHAR(20) NOT NULL COMMENT '�ֹ�_��ȭ��ȣ',
  `order_email1` VARCHAR(20) NULL DEFAULT NULL COMMENT '�ֹ�_�̸���1',
  `order_email2` VARCHAR(20) NULL DEFAULT NULL COMMENT '�ֹ�_�̸���2',
  `shipMsg` TEXT NULL DEFAULT NULL COMMENT '��۸޽���',
  `orderDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ֹ��� �ۼ���',
  `mileageUse` INT(11) NULL DEFAULT NULL,
  `useCouponId` VARCHAR(40) NULL DEFAULT NULL,
  `payMethod` VARCHAR(45) NOT NULL,
  `duePayment` INT(11) NOT NULL COMMENT '���������ݾ�',
  `shipStatus` VARCHAR(20) NULL DEFAULT NULL COMMENT '��ۻ���\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n------------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n(��� : D / ��ȯ : C / ��ǰ : R)',
  `orderStatus` VARCHAR(20) NOT NULL COMMENT '�ֹ�ó�� ����\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n----------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n�Ա��� : 1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n����غ��� : 2\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n����� : 3\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n��ۿϷ� : 4',
  `totalMileage` INT(11) NULL DEFAULT NULL COMMENT '���������� ���ϸ���',
  PRIMARY KEY (`orderNum`),
  INDEX `fk_Order_Member1_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`order_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`order_has_product` (
  `num` INT(11) NOT NULL AUTO_INCREMENT,
  `orderNum` VARCHAR(40) NOT NULL,
  `productId` VARCHAR(40) NOT NULL,
  `s_optionId` VARCHAR(80) NOT NULL,
  `s_stock` INT(11) NOT NULL,
  PRIMARY KEY (`num`),
  INDEX `fk_order_has_product_product1_idx` (`productId` ASC) VISIBLE,
  INDEX `fk_order_has_product_order1_idx` (`orderNum` ASC) VISIBLE,
  CONSTRAINT `fk_order_has_product_order1`
    FOREIGN KEY (`orderNum`)
    REFERENCES `green`.`order` (`orderNum`),
  CONSTRAINT `fk_order_has_product_product1`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`product_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`product_option` (
  `p_optionId` INT(11) NOT NULL AUTO_INCREMENT,
  `productId` VARCHAR(40) NOT NULL COMMENT '��ǰ���̵�',
  `p_option` VARCHAR(80) NOT NULL COMMENT '���ÿɼ�',
  `p_stock` INT(11) NOT NULL DEFAULT '0' COMMENT '������',
  PRIMARY KEY (`p_optionId`),
  INDEX `fk_Product_option_Product_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `fk_Product_option_Product`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 318
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`review` (
  `reviewNum` INT(11) NOT NULL COMMENT '���� �۹�ȣ',
  `id` VARCHAR(20) NOT NULL,
  `productId` VARCHAR(40) NOT NULL,
  `reviewTitle` VARCHAR(100) NOT NULL COMMENT '���� Ÿ��Ʋ',
  `reviewContent` TEXT NULL DEFAULT NULL COMMENT '����',
  `reviewHits` INT(11) NOT NULL DEFAULT '0' COMMENT '��ȸ��',
  `reviewDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���',
  PRIMARY KEY (`reviewNum`),
  INDEX `fk_Review_Member1_idx` (`id` ASC) VISIBLE,
  INDEX `fk_Review_Product1_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Member1`
    FOREIGN KEY (`id`)
    REFERENCES `green`.`member` (`id`),
  CONSTRAINT `fk_Review_Product1`
    FOREIGN KEY (`productId`)
    REFERENCES `green`.`product` (`productId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `green` ;

-- -----------------------------------------------------
-- procedure addProductEdit
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProductEdit`(
	IN showYN VARCHAR(5),				-- Ȱ��ȭ����
    IN p_group VARCHAR(20),				-- ��ǰ����
    IN productName VARCHAR(80),			-- ��ǰ��
    IN price INT(11),					-- �ǸŰ�
    IN discountYN VARCHAR(5),			-- ���ο���
    IN discount INT(11),				-- ���ΰ�
    IN productMileage INT(11)			-- ��ǰ���Ա�
)
BEGIN
	SET @N_day = DATE_FORMAT(NOW(), '%Y%m%d');
    SET @groupNumbering = (SELECT COUNT(*) FROM product WHERE product.p_group = p_group);
	SET @rand = (SELECT FLOOR(1 + (RAND() * 9)));
    SET @num = LPAD(@groupNumbering+1, '4', '0');
    SET @productId = CONCAT(p_group, '-', @N_day, @rand, @num);
    
	INSERT INTO product
    (
		productId,
        p_group,
        productName,
        price,
        discount,
        productMileage,
        discountYN,
        showYN
    ) VALUES (
		@productId,
        p_group,
        productName,
        price,
        discount,
        productMileage,
        discountYN,
        showYN
    );
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure couponAdd_PRO
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `couponAdd_PRO`(
    IN couponName VARCHAR(80),                -- ������
    IN couponContent VARCHAR(100),            -- ���� ����
    IN discountType VARCHAR(20),            -- ����Ÿ��
    IN couponPay INT(11),                    -- ���αݾ�
    IN couponPeriod_start VARCHAR(10),                -- ������
    IN couponPeriod_end VARCHAR(10),                -- ������
    IN useYN VARCHAR(5)                        -- ��뿩��
)
BEGIN
    SET @N_day = DATE_FORMAT(NOW(), '%Y%m%d');
    SET @groupNumbering = (SELECT COUNT(*) FROM coupon);
    SET @rand = (SELECT FLOOR(1 + (RAND() * 9)));
    SET @num = LPAD(@groupNumbering+1, '4', '0');
    SET @couponId = CONCAT('coupon', '-', @N_day, @rand, @num);

    INSERT INTO coupon
    (
        couponId,
        couponName,
        couponContent,
        discountType,
        couponPay,
        couponPeriod_start,
        couponPeriod_end,
        useYN
    ) VALUES (
        @couponId,
        couponName,
        couponContent,
        discountType,
        couponPay,
        IF(couponPeriod_start='0000-00-00', NULL, couponPeriod_start),
        IF(couponPeriod_end='0000-00-00', NULL, couponPeriod_end),
        useYN
    );
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure deleteCoupon
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCoupon`()
BEGIN
DELETE FROM coupon 
WHERE STR_TO_DATE(couponPeriod_end, '%Y-%m-%d') < DATE_SUB(now(), INTERVAL 6 MONTH) ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure deleteOrderSheet
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrderSheet`()
BEGIN
DELETE FROM green.order 
WHERE STR_TO_DATE(orderDate, '%Y-%m-%d') < DATE_SUB(now(), INTERVAL 6 MONTH) ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure gradeUpProc
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gradeUpProc`()
begin 
declare userId varchar(20); -- id ������ ���� 
declare g varchar(15); -- ��� ������ ���� 
declare total int; -- �հ� ������ ���� 
declare endofRow boolean default false; 
declare usercursor cursor for 
select M.id , sum(duePayment) 
from green.order O 
right outer join green.member M 
on O.id = M.id 
group by M.id; 
declare continue handler for 
not found set endofRow = true; 
open usercursor;  
cursor_loop : loop 
fetch usercursor into userId, total; 
if endofRow = true 
then 
leave cursor_loop; 
end if; 
case -- ��ޱ��� 
when(total>=300000) then set g = '���'; 
when(total>=10000) then set g = '�Ϲ�'; 
else set g = '�ű�'; 
end case;
update member set grade = g where id = userID; 
end loop cursor_loop; 
close usercursor;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productDelete
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productDelete`(
    IN productId VARCHAR(40)    -- ��ǰ �ƾƵ�
)
BEGIN
    DELETE FROM image
    WHERE image.productId = productId;

    DELETE FROM product_option
    WHERE product_option.productId = productId;

    DELETE FROM product
    WHERE product.productId = productId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure selectProductId
-- -----------------------------------------------------

DELIMITER $$
USE `green`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectProductId`(
    IN p_group VARCHAR(20),                -- ��ǰ����
    IN productName VARCHAR(80)            -- ��ǰ��
)
BEGIN
    SET @groupNumbering = (SELECT COUNT(*) FROM product WHERE product.p_group = p_group);
    SET @num = LPAD(@groupNumbering, '4', '0');

    SELECT
        productId
    FROM
        product
    WHERE
        product.productId LIKE CONCAT(p_group, '%') AND product.productId LIKE CONCAT('%', @num) AND product.productName = productName;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
