-- CREATE DATABASE IF NOT EXISTS `sentimental-connect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
CREATE DATABASE IF NOT EXISTS `sentimental-connect` DEFAULT CHARACTER
SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sentimental-connect`;
CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `industry` enum ('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de table sentimental-connect. company_affiliation
CREATE TABLE IF NOT EXISTS `company_affiliation` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `company_id` INT (10) UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY (`id`)
);
-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de table sentimental-connect. schools
CREATE TABLE IF NOT EXISTS `schools` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `type` enum ('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(45) NOT NULL,
    `year_founded` SMALLINT (6) NOT NULL,
    PRIMARY KEY (`id`)
);
-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de table sentimental-connect. users
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(40) NOT NULL,
    `last_name` VARCHAR(40) NOT NULL,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `user_id` INT (10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_user_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);
-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de table sentimental-connect. school_affiliation
CREATE TABLE IF NOT EXISTS `school_affiliation` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `school_id` INT (10) UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `degree_type` VARCHAR(10) NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_company_affiliation_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `FK_school_affiliation_schools` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
);
CREATE INDEX `fk_user_user` ON `users`(`user_id`);
CREATE INDEX `FK_user_affiliation_users` ON `school_affiliation` (`user_id`);
CREATE INDEX `FK_school_affiliation_schools` ON `school_affiliation` (`school_id`);
CREATE INDEX `FK_company_affiliation_users` ON `company_affiliation` (`user_id`);
CREATE INDEX `FK_company_affiliation_schools` ON `company_affiliation` (`company_id`);
