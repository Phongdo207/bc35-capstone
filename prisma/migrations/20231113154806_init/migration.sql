-- CreateTable
CREATE TABLE `binh_luan` (
    `binh_luan_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ngay_binh_luan` DATETIME(0) NULL,
    `noi_dung` VARCHAR(999) NULL,
    `nguoi_dung_id` INTEGER NULL,
    `hinh_id` INTEGER NULL,

    INDEX `hinh_id`(`hinh_id`),
    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`binh_luan_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hinh_anh` (
    `hinh_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ten_hinh` VARCHAR(255) NULL,
    `duong_dan` VARCHAR(255) NULL,
    `mo_ta` VARCHAR(255) NULL,
    `nguoi_dung_id` INTEGER NULL,
    `tinh_trang` BOOLEAN NULL,

    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`hinh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `luu_anh` (
    `luu_anh_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nguoi_dung_id` INTEGER NULL,
    `hinh_id` INTEGER NULL,

    INDEX `hinh_id`(`hinh_id`),
    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`luu_anh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nguoi_dung` (
    `nguoi_dung_id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NULL,
    `mat_khau` VARCHAR(255) NULL,
    `ho_ten` VARCHAR(255) NULL,
    `tuoi` VARCHAR(255) NULL,
    `anh_dai_dien` VARCHAR(255) NULL,

    PRIMARY KEY (`nguoi_dung_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `hinh_anh` ADD CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
