CREATE TABLE `manufacturers` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
    `country` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
    `deleted` tinyint DEFAULT '0',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `cars` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
    `deleted` tinyint NOT NULL DEFAULT '0',
    `manufacturer_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cars_manufacturer_fk` (`manufacturer_id`),
    CONSTRAINT `cars_manufacturer_fk` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `drivers` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `license_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `deleted` tinyint DEFAULT '0',
    `username` varchar(45) COLLATE utf8_bin NOT NULL,
    `password` varchar(45) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `cars_drivers` (
                                `car_id` bigint NOT NULL,
                                `driver_id` bigint NOT NULL,
                                KEY `cars_drivers_cars_fk` (`car_id`),
    KEY `cars_drivers_drivers_fk` (`driver_id`),
    CONSTRAINT `cars_drivers_cars_fk` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
    CONSTRAINT `cars_drivers_drivers_fk` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


