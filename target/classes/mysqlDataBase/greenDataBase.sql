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
  `id` VARCHAR(60) NOT NULL COMMENT '아이디',
  `pw` VARCHAR(100) NOT NULL COMMENT '비밀번호',
  `name` VARCHAR(20) NOT NULL COMMENT '이름',
  `birth` VARCHAR(10) NULL DEFAULT NULL COMMENT '생년월일',
  `phone` VARCHAR(20) NOT NULL COMMENT '전화번호',
  `email1` VARCHAR(30) NOT NULL COMMENT '이메일',
  `email2` VARCHAR(20) NOT NULL COMMENT '이메일',
  `zipCode` VARCHAR(10) NULL DEFAULT NULL COMMENT '우편번호',
  `addr1` VARCHAR(20) NULL DEFAULT NULL COMMENT '기본주소',
  `addr2` VARCHAR(40) NULL DEFAULT NULL COMMENT '나머지주소',
  `addr3` VARCHAR(40) NULL DEFAULT NULL COMMENT '참조주소',
  `grade` VARCHAR(15) NOT NULL DEFAULT 'new' COMMENT '회원등급\\\\\\\\n(신규 : new\\\\\\\\n일반 : general\\\\\\\\n우수 : vip\\\\n관리자:master)',
  `mileage` INT(11) NULL DEFAULT '0' COMMENT '적립금',
  `orderPriceSum` INT(11) NULL DEFAULT '0' COMMENT '누적 구매 금액',
  `masterYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT '회원권한 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n관리자 : M\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n일반회원: N',
  `joinDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일자',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `green`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `green`.`product` (
  `productId` VARCHAR(40) NOT NULL COMMENT '상품아이디  (상품구분-000001)',
  `p_group` VARCHAR(20) NOT NULL COMMENT '상품 구분 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n-----------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n하드케이스: hard\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n젤케이스: gel\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n카드케이스: card\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n에어팟케이스: airPods\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n버즈케이스: buds\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n키링: keyring\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n스마트톡:smart',
  `productName` VARCHAR(80) NOT NULL COMMENT '상품명',
  `price` INT(11) NOT NULL COMMENT '판매가',
  `discount` INT(11) NULL DEFAULT '0' COMMENT '할인가',
  `productMileage` INT(11) NULL DEFAULT '0' COMMENT '상품 적립금',
  `salesSum` INT(11) NULL DEFAULT '0' COMMENT '누적판매수량',
  `discountYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT '할인 여부 (Y ,N)',
  `productDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
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
  `id` VARCHAR(20) NOT NULL COMMENT '회원아이디',
  `productId` VARCHAR(40) NOT NULL COMMENT '상품앙디',
  `s_optionId` VARCHAR(80) NULL DEFAULT NULL COMMENT '장바구니에 담을 사용자가 선택한 옵션',
  `s_stock` INT(11) NULL DEFAULT NULL COMMENT '장바구니에 담을 사용자가 선택한 상품 갯수',
  `cartType` VARCHAR(5) NOT NULL COMMENT '찜/장바구니 선택',
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
  `questionNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Q&A 글번호',
  `id` VARCHAR(20) NOT NULL,
  `productId` VARCHAR(40) NULL DEFAULT NULL,
  `questionTitle` VARCHAR(100) NOT NULL COMMENT 'Q&A 타이틀',
  `questionContent` TEXT NULL DEFAULT NULL COMMENT '내용',
  `questionHits` INT(11) NOT NULL DEFAULT '0' COMMENT '조회수',
  `commentCount` INT(11) NOT NULL DEFAULT '0' COMMENT '댓글 수',
  `questionPw` VARCHAR(20) NULL DEFAULT NULL COMMENT '글 비밀번호',
  `pwYN` VARCHAR(5) NOT NULL DEFAULT 'N' COMMENT '비밀글 여부 (Y, N)',
  `questionDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
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
  `commentNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `QnANum` INT(11) NOT NULL,
  `id` VARCHAR(20) NOT NULL COMMENT '관리자만 가능',
  `commentContent` TEXT NOT NULL COMMENT '댓글 내용',
  `commentDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 작성일',
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
  `couponId` VARCHAR(40) NOT NULL COMMENT '쿠폰아이디 (c-0000000)',
  `couponName` VARCHAR(80) NOT NULL COMMENT '쿠폰명',
  `couponContent` VARCHAR(100) NULL DEFAULT NULL COMMENT '쿠폰 혜택',
  `discountType` VARCHAR(20) NOT NULL,
  `couponPay` INT(11) NOT NULL DEFAULT '0' COMMENT '쿠폰 할인금액',
  `couponPeriod_start` VARCHAR(20) NULL DEFAULT NULL COMMENT '쿠폰 사용기간(시작)',
  `couponPeriod_end` VARCHAR(20) NULL DEFAULT NULL COMMENT '쿠폰 사용기간(끝)',
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
  `withdrawDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '탈퇴날짜',
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
  `eventNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '이벤트 글번호',
  `id` VARCHAR(20) NOT NULL,
  `eventTitle` VARCHAR(100) NOT NULL COMMENT '이벤트 타이틀',
  `eventContent` TEXT NULL DEFAULT NULL COMMENT '내용',
  `eventDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
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
  `productId` VARCHAR(40) NOT NULL COMMENT '상품아이디',
  `imgType` VARCHAR(20) NOT NULL COMMENT '이미지 구분\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n------------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n상품메인:product_M\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n상품세부:product_S\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n메인화면이미지:main\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n팝업이미지:popup',
  `imgURL` VARCHAR(100) NOT NULL COMMENT '이미지 URL',
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
  `id` VARCHAR(20) NOT NULL COMMENT '회원아이디',
  `couponId` VARCHAR(40) NOT NULL COMMENT '쿠폰아이디',
  `couponYN` VARCHAR(5) NULL DEFAULT 'N' COMMENT '쿠폰 사용여부 (Y, N)',
  `couponUseDate` DATETIME NULL DEFAULT NULL COMMENT '쿠폰 사용일',
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
  `noticeNum` INT(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항 글번호',
  `id` VARCHAR(20) NOT NULL,
  `noticeTitle` VARCHAR(100) NOT NULL COMMENT '공지사항 타이틀',
  `noticeContent` TEXT NULL DEFAULT NULL COMMENT '내용',
  `noticeDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
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
  `orderNum` VARCHAR(40) NOT NULL COMMENT '주문번호',
  `id` VARCHAR(20) NOT NULL COMMENT '회원아이디',
  `impUid` VARCHAR(30) NOT NULL,
  `recipient` VARCHAR(20) NOT NULL COMMENT '받으시는 분',
  `order_zipCode` VARCHAR(10) NOT NULL COMMENT '주문_우편번호',
  `order_addr1` VARCHAR(20) NOT NULL COMMENT '주문_기본주소',
  `order_addr2` VARCHAR(40) NOT NULL COMMENT '주문_나머지주소',
  `order_addr3` VARCHAR(40) NOT NULL COMMENT '주문_참조 주소',
  `order_phone` VARCHAR(20) NOT NULL COMMENT '주문_전화번호',
  `order_email1` VARCHAR(20) NULL DEFAULT NULL COMMENT '주문_이메일1',
  `order_email2` VARCHAR(20) NULL DEFAULT NULL COMMENT '주문_이메일2',
  `shipMsg` TEXT NULL DEFAULT NULL COMMENT '배송메시지',
  `orderDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주문서 작성일',
  `mileageUse` INT(11) NULL DEFAULT NULL,
  `useCouponId` VARCHAR(40) NULL DEFAULT NULL,
  `payMethod` VARCHAR(45) NOT NULL,
  `duePayment` INT(11) NOT NULL COMMENT '결제예정금액',
  `shipStatus` VARCHAR(20) NULL DEFAULT NULL COMMENT '배송상태\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n------------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n(취소 : D / 교환 : C / 반품 : R)',
  `orderStatus` VARCHAR(20) NOT NULL COMMENT '주문처리 상태\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n----------------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n입금전 : 1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n배송준비중 : 2\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n배송중 : 3\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n배송완료 : 4',
  `totalMileage` INT(11) NULL DEFAULT NULL COMMENT '적립예정인 마일리지',
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
  `productId` VARCHAR(40) NOT NULL COMMENT '상품아이디',
  `p_option` VARCHAR(80) NOT NULL COMMENT '선택옵션',
  `p_stock` INT(11) NOT NULL DEFAULT '0' COMMENT '재고수량',
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
  `reviewNum` INT(11) NOT NULL COMMENT '리뷰 글번호',
  `id` VARCHAR(20) NOT NULL,
  `productId` VARCHAR(40) NOT NULL,
  `reviewTitle` VARCHAR(100) NOT NULL COMMENT '리뷰 타이틀',
  `reviewContent` TEXT NULL DEFAULT NULL COMMENT '내용',
  `reviewHits` INT(11) NOT NULL DEFAULT '0' COMMENT '조회수',
  `reviewDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
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
	IN showYN VARCHAR(5),				-- 활성화여부
    IN p_group VARCHAR(20),				-- 상품구분
    IN productName VARCHAR(80),			-- 상품명
    IN price INT(11),					-- 판매가
    IN discountYN VARCHAR(5),			-- 할인여부
    IN discount INT(11),				-- 할인가
    IN productMileage INT(11)			-- 상품적입금
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
    IN couponName VARCHAR(80),                -- 쿠폰명
    IN couponContent VARCHAR(100),            -- 쿠폰 혜택
    IN discountType VARCHAR(20),            -- 할인타입
    IN couponPay INT(11),                    -- 할인금액
    IN couponPeriod_start VARCHAR(10),                -- 시작일
    IN couponPeriod_end VARCHAR(10),                -- 종료일
    IN useYN VARCHAR(5)                        -- 사용여부
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
declare userId varchar(20); -- id 저장할 변수 
declare g varchar(15); -- 등급 저장할 변수 
declare total int; -- 합계 저장할 변수 
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
case -- 등급구별 
when(total>=300000) then set g = '우수'; 
when(total>=10000) then set g = '일반'; 
else set g = '신규'; 
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
    IN productId VARCHAR(40)    -- 상품 아아디
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
    IN p_group VARCHAR(20),                -- 상품구분
    IN productName VARCHAR(80)            -- 상품명
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
