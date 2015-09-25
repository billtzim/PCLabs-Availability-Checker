CREATE DATABASE `pclabs_freepcs`

CREATE TABLE `pclabs_labs` (
  `labOUName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `labFullName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labCapacity` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labOUName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `pclabs_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pcStatus` enum('free','taken') COLLATE utf8_unicode_ci NOT NULL,
  `pcName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pcLabOUName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
