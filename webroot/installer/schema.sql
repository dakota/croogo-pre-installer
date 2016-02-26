CREATE TABLE IF NOT EXISTS `acos` (
`id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'controllers', 1, 564),
(2, 1, NULL, NULL, 'Pages', 2, 5),
(3, 2, NULL, NULL, 'display', 3, 4),
(4, 1, NULL, NULL, 'Acl', 6, 7),
(5, 1, NULL, NULL, 'Croogo\\Acl', 8, 45),
(6, 5, NULL, NULL, 'Admin', 9, 44),
(7, 6, NULL, NULL, 'Permissions', 10, 23),
(8, 7, NULL, NULL, 'index', 11, 12),
(9, 7, NULL, NULL, 'toggle', 13, 14),
(10, 7, NULL, NULL, 'upgrade', 15, 16),
(11, 7, NULL, NULL, 'securityError', 17, 18),
(12, 7, NULL, NULL, 'getProperty', 19, 20),
(13, 7, NULL, NULL, 'setProperty', 21, 22),
(14, 6, NULL, NULL, 'Actions', 24, 43),
(15, 14, NULL, NULL, 'index', 25, 26),
(16, 14, NULL, NULL, 'add', 27, 28),
(17, 14, NULL, NULL, 'edit', 29, 30),
(18, 14, NULL, NULL, 'delete', 31, 32),
(19, 14, NULL, NULL, 'move', 33, 34),
(20, 14, NULL, NULL, 'generate', 35, 36),
(21, 14, NULL, NULL, 'securityError', 37, 38),
(22, 14, NULL, NULL, 'getProperty', 39, 40),
(23, 14, NULL, NULL, 'setProperty', 41, 42),
(24, 1, NULL, NULL, 'Croogo\\Blocks', 46, 89),
(25, 24, NULL, NULL, 'Admin', 47, 88),
(26, 25, NULL, NULL, 'Blocks', 48, 71),
(27, 26, NULL, NULL, 'toggle', 49, 50),
(28, 26, NULL, NULL, 'index', 51, 52),
(29, 26, NULL, NULL, 'add', 53, 54),
(30, 26, NULL, NULL, 'edit', 55, 56),
(31, 26, NULL, NULL, 'delete', 57, 58),
(32, 26, NULL, NULL, 'moveup', 59, 60),
(33, 26, NULL, NULL, 'movedown', 61, 62),
(34, 26, NULL, NULL, 'process', 63, 64),
(35, 26, NULL, NULL, 'securityError', 65, 66),
(36, 26, NULL, NULL, 'getProperty', 67, 68),
(37, 26, NULL, NULL, 'setProperty', 69, 70),
(38, 25, NULL, NULL, 'Regions', 72, 87),
(39, 38, NULL, NULL, 'index', 73, 74),
(40, 38, NULL, NULL, 'add', 75, 76),
(41, 38, NULL, NULL, 'edit', 77, 78),
(42, 38, NULL, NULL, 'delete', 79, 80),
(43, 38, NULL, NULL, 'securityError', 81, 82),
(44, 38, NULL, NULL, 'getProperty', 83, 84),
(45, 38, NULL, NULL, 'setProperty', 85, 86),
(46, 1, NULL, NULL, 'Croogo\\Comments', 90, 123),
(47, 46, NULL, NULL, 'Comments', 91, 104),
(48, 47, NULL, NULL, 'index', 92, 93),
(49, 47, NULL, NULL, 'add', 94, 95),
(50, 47, NULL, NULL, 'delete', 96, 97),
(51, 47, NULL, NULL, 'securityError', 98, 99),
(52, 47, NULL, NULL, 'getProperty', 100, 101),
(53, 47, NULL, NULL, 'setProperty', 102, 103),
(54, 46, NULL, NULL, 'Admin', 105, 122),
(55, 54, NULL, NULL, 'Comments', 106, 121),
(56, 55, NULL, NULL, 'index', 107, 108),
(57, 55, NULL, NULL, 'edit', 109, 110),
(58, 55, NULL, NULL, 'delete', 111, 112),
(59, 55, NULL, NULL, 'process', 113, 114),
(60, 55, NULL, NULL, 'securityError', 115, 116),
(61, 55, NULL, NULL, 'getProperty', 117, 118),
(62, 55, NULL, NULL, 'setProperty', 119, 120),
(63, 1, NULL, NULL, 'Croogo\\Contacts', 124, 161),
(64, 63, NULL, NULL, 'Admin', 125, 160),
(65, 64, NULL, NULL, 'Messages', 126, 141),
(66, 65, NULL, NULL, 'index', 127, 128),
(67, 65, NULL, NULL, 'edit', 129, 130),
(68, 65, NULL, NULL, 'delete', 131, 132),
(69, 65, NULL, NULL, 'process', 133, 134),
(70, 65, NULL, NULL, 'securityError', 135, 136),
(71, 65, NULL, NULL, 'getProperty', 137, 138),
(72, 65, NULL, NULL, 'setProperty', 139, 140),
(73, 64, NULL, NULL, 'Contacts', 142, 159),
(74, 73, NULL, NULL, 'index', 143, 144),
(75, 73, NULL, NULL, 'add', 145, 146),
(76, 73, NULL, NULL, 'edit', 147, 148),
(77, 73, NULL, NULL, 'delete', 149, 150),
(78, 73, NULL, NULL, 'view', 151, 152),
(79, 73, NULL, NULL, 'securityError', 153, 154),
(80, 73, NULL, NULL, 'getProperty', 155, 156),
(81, 73, NULL, NULL, 'setProperty', 157, 158),
(82, 1, NULL, NULL, 'Croogo\\Core', 162, 177),
(83, 82, NULL, NULL, 'CroogoError', 163, 164),
(84, 82, NULL, NULL, 'Admin', 165, 176),
(85, 84, NULL, NULL, 'LinkChooser', 166, 175),
(86, 85, NULL, NULL, 'linkChooser', 167, 168),
(87, 85, NULL, NULL, 'securityError', 169, 170),
(88, 85, NULL, NULL, 'getProperty', 171, 172),
(89, 85, NULL, NULL, 'setProperty', 173, 174),
(90, 1, NULL, NULL, 'Croogo\\Extensions', 178, 251),
(91, 90, NULL, NULL, 'Admin', 179, 250),
(92, 91, NULL, NULL, 'ExtensionsThemes', 180, 199),
(93, 92, NULL, NULL, 'index', 181, 182),
(94, 92, NULL, NULL, 'activate', 183, 184),
(95, 92, NULL, NULL, 'admin_add', 185, 186),
(96, 92, NULL, NULL, 'admin_editor', 187, 188),
(97, 92, NULL, NULL, 'admin_save', 189, 190),
(98, 92, NULL, NULL, 'admin_delete', 191, 192),
(99, 92, NULL, NULL, 'securityError', 193, 194),
(100, 92, NULL, NULL, 'getProperty', 195, 196),
(101, 92, NULL, NULL, 'setProperty', 197, 198),
(102, 91, NULL, NULL, 'ExtensionsLocales', 200, 217),
(103, 102, NULL, NULL, 'admin_index', 201, 202),
(104, 102, NULL, NULL, 'admin_activate', 203, 204),
(105, 102, NULL, NULL, 'admin_add', 205, 206),
(106, 102, NULL, NULL, 'admin_edit', 207, 208),
(107, 102, NULL, NULL, 'admin_delete', 209, 210),
(108, 102, NULL, NULL, 'securityError', 211, 212),
(109, 102, NULL, NULL, 'getProperty', 213, 214),
(110, 102, NULL, NULL, 'setProperty', 215, 216),
(111, 91, NULL, NULL, 'ExtensionsPlugins', 218, 239),
(112, 111, NULL, NULL, 'admin_index', 219, 220),
(113, 111, NULL, NULL, 'admin_add', 221, 222),
(114, 111, NULL, NULL, 'admin_delete', 223, 224),
(115, 111, NULL, NULL, 'admin_toggle', 225, 226),
(116, 111, NULL, NULL, 'admin_migrate', 227, 228),
(117, 111, NULL, NULL, 'admin_moveup', 229, 230),
(118, 111, NULL, NULL, 'admin_movedown', 231, 232),
(119, 111, NULL, NULL, 'securityError', 233, 234),
(120, 111, NULL, NULL, 'getProperty', 235, 236),
(121, 111, NULL, NULL, 'setProperty', 237, 238),
(122, 91, NULL, NULL, 'Dashboard', 240, 249),
(123, 122, NULL, NULL, 'index', 241, 242),
(124, 122, NULL, NULL, 'securityError', 243, 244),
(125, 122, NULL, NULL, 'getProperty', 245, 246),
(126, 122, NULL, NULL, 'setProperty', 247, 248),
(127, 1, NULL, NULL, 'Croogo\\FileManager', 252, 301),
(128, 127, NULL, NULL, 'Admin', 253, 300),
(129, 128, NULL, NULL, 'FileManager', 254, 281),
(130, 129, NULL, NULL, 'index', 255, 256),
(131, 129, NULL, NULL, 'browse', 257, 258),
(132, 129, NULL, NULL, 'editFile', 259, 260),
(133, 129, NULL, NULL, 'upload', 261, 262),
(134, 129, NULL, NULL, 'deleteFile', 263, 264),
(135, 129, NULL, NULL, 'deleteDirectory', 265, 266),
(136, 129, NULL, NULL, 'rename', 267, 268),
(137, 129, NULL, NULL, 'createDirectory', 269, 270),
(138, 129, NULL, NULL, 'createFile', 271, 272),
(139, 129, NULL, NULL, 'chmod', 273, 274),
(140, 129, NULL, NULL, 'securityError', 275, 276),
(141, 129, NULL, NULL, 'getProperty', 277, 278),
(142, 129, NULL, NULL, 'setProperty', 279, 280),
(143, 128, NULL, NULL, 'Attachments', 282, 299),
(144, 143, NULL, NULL, 'index', 283, 284),
(145, 143, NULL, NULL, 'add', 285, 286),
(146, 143, NULL, NULL, 'edit', 287, 288),
(147, 143, NULL, NULL, 'delete', 289, 290),
(148, 143, NULL, NULL, 'browse', 291, 292),
(149, 143, NULL, NULL, 'securityError', 293, 294),
(150, 143, NULL, NULL, 'getProperty', 295, 296),
(151, 143, NULL, NULL, 'setProperty', 297, 298),
(152, 1, NULL, NULL, 'Croogo\\Menus', 302, 347),
(153, 152, NULL, NULL, 'Admin', 303, 346),
(154, 153, NULL, NULL, 'Menus', 304, 321),
(155, 154, NULL, NULL, 'Toggle', 305, 306),
(156, 154, NULL, NULL, 'index', 307, 308),
(157, 154, NULL, NULL, 'add', 309, 310),
(158, 154, NULL, NULL, 'edit', 311, 312),
(159, 154, NULL, NULL, 'delete', 313, 314),
(160, 154, NULL, NULL, 'securityError', 315, 316),
(161, 154, NULL, NULL, 'getProperty', 317, 318),
(162, 154, NULL, NULL, 'setProperty', 319, 320),
(163, 153, NULL, NULL, 'Links', 322, 345),
(164, 163, NULL, NULL, 'toggle', 323, 324),
(165, 163, NULL, NULL, 'index', 325, 326),
(166, 163, NULL, NULL, 'add', 327, 328),
(167, 163, NULL, NULL, 'edit', 329, 330),
(168, 163, NULL, NULL, 'delete', 331, 332),
(169, 163, NULL, NULL, 'admin_moveup', 333, 334),
(170, 163, NULL, NULL, 'admin_movedown', 335, 336),
(171, 163, NULL, NULL, 'process', 337, 338),
(172, 163, NULL, NULL, 'securityError', 339, 340),
(173, 163, NULL, NULL, 'getProperty', 341, 342),
(174, 163, NULL, NULL, 'setProperty', 343, 344),
(175, 1, NULL, NULL, 'Croogo\\Meta', 348, 349),
(176, 1, NULL, NULL, 'Croogo\\Nodes', 350, 399),
(177, 176, NULL, NULL, 'Nodes', 351, 368),
(178, 177, NULL, NULL, 'index', 352, 353),
(179, 177, NULL, NULL, 'term', 354, 355),
(180, 177, NULL, NULL, 'promoted', 356, 357),
(181, 177, NULL, NULL, 'search', 358, 359),
(182, 177, NULL, NULL, 'view', 360, 361),
(183, 177, NULL, NULL, 'securityError', 362, 363),
(184, 177, NULL, NULL, 'getProperty', 364, 365),
(185, 177, NULL, NULL, 'setProperty', 366, 367),
(186, 176, NULL, NULL, 'Admin', 369, 398),
(187, 186, NULL, NULL, 'Nodes', 370, 397),
(188, 187, NULL, NULL, 'toggle', 371, 372),
(189, 187, NULL, NULL, 'index', 373, 374),
(190, 187, NULL, NULL, 'create', 375, 376),
(191, 187, NULL, NULL, 'add', 377, 378),
(192, 187, NULL, NULL, 'edit', 379, 380),
(193, 187, NULL, NULL, 'update_paths', 381, 382),
(194, 187, NULL, NULL, 'delete', 383, 384),
(195, 187, NULL, NULL, 'delete_meta', 385, 386),
(196, 187, NULL, NULL, 'add_meta', 387, 388),
(197, 187, NULL, NULL, 'process', 389, 390),
(198, 187, NULL, NULL, 'securityError', 391, 392),
(199, 187, NULL, NULL, 'getProperty', 393, 394),
(200, 187, NULL, NULL, 'setProperty', 395, 396),
(201, 1, NULL, NULL, 'Croogo\\Settings', 400, 449),
(202, 201, NULL, NULL, 'Admin', 401, 448),
(203, 202, NULL, NULL, 'Languages', 402, 423),
(204, 203, NULL, NULL, 'index', 403, 404),
(205, 203, NULL, NULL, 'add', 405, 406),
(206, 203, NULL, NULL, 'edit', 407, 408),
(207, 203, NULL, NULL, 'delete', 409, 410),
(208, 203, NULL, NULL, 'moveup', 411, 412),
(209, 203, NULL, NULL, 'movedown', 413, 414),
(210, 203, NULL, NULL, 'select', 415, 416),
(211, 203, NULL, NULL, 'securityError', 417, 418),
(212, 203, NULL, NULL, 'getProperty', 419, 420),
(213, 203, NULL, NULL, 'setProperty', 421, 422),
(214, 202, NULL, NULL, 'Settings', 424, 447),
(215, 214, NULL, NULL, 'index', 425, 426),
(216, 214, NULL, NULL, 'view', 427, 428),
(217, 214, NULL, NULL, 'add', 429, 430),
(218, 214, NULL, NULL, 'edit', 431, 432),
(219, 214, NULL, NULL, 'delete', 433, 434),
(220, 214, NULL, NULL, 'prefix', 435, 436),
(221, 214, NULL, NULL, 'moveup', 437, 438),
(222, 214, NULL, NULL, 'movedown', 439, 440),
(223, 214, NULL, NULL, 'securityError', 441, 442),
(224, 214, NULL, NULL, 'getProperty', 443, 444),
(225, 214, NULL, NULL, 'setProperty', 445, 446),
(226, 1, NULL, NULL, 'Croogo\\Taxonomy', 450, 509),
(227, 226, NULL, NULL, 'Admin', 451, 508),
(228, 227, NULL, NULL, 'Types', 452, 467),
(229, 228, NULL, NULL, 'index', 453, 454),
(230, 228, NULL, NULL, 'add', 455, 456),
(231, 228, NULL, NULL, 'edit', 457, 458),
(232, 228, NULL, NULL, 'delete', 459, 460),
(233, 228, NULL, NULL, 'securityError', 461, 462),
(234, 228, NULL, NULL, 'getProperty', 463, 464),
(235, 228, NULL, NULL, 'setProperty', 465, 466),
(236, 227, NULL, NULL, 'Vocabularies', 468, 487),
(237, 236, NULL, NULL, 'index', 469, 470),
(238, 236, NULL, NULL, 'add', 471, 472),
(239, 236, NULL, NULL, 'edit', 473, 474),
(240, 236, NULL, NULL, 'delete', 475, 476),
(241, 236, NULL, NULL, 'moveup', 477, 478),
(242, 236, NULL, NULL, 'movedown', 479, 480),
(243, 236, NULL, NULL, 'securityError', 481, 482),
(244, 236, NULL, NULL, 'getProperty', 483, 484),
(245, 236, NULL, NULL, 'setProperty', 485, 486),
(246, 227, NULL, NULL, 'Terms', 488, 507),
(247, 246, NULL, NULL, 'index', 489, 490),
(248, 246, NULL, NULL, 'add', 491, 492),
(249, 246, NULL, NULL, 'edit', 493, 494),
(250, 246, NULL, NULL, 'delete', 495, 496),
(251, 246, NULL, NULL, 'moveup', 497, 498),
(252, 246, NULL, NULL, 'movedown', 499, 500),
(253, 246, NULL, NULL, 'securityError', 501, 502),
(254, 246, NULL, NULL, 'getProperty', 503, 504),
(255, 246, NULL, NULL, 'setProperty', 505, 506),
(256, 1, NULL, NULL, 'Croogo\\Theme', 510, 511),
(257, 1, NULL, NULL, 'Croogo\\Users', 512, 539),
(258, 257, NULL, NULL, 'Users', 513, 538),
(259, 258, NULL, NULL, 'index', 514, 515),
(260, 258, NULL, NULL, 'add', 516, 517),
(261, 258, NULL, NULL, 'activate', 518, 519),
(262, 258, NULL, NULL, 'edit', 520, 521),
(263, 258, NULL, NULL, 'forgot', 522, 523),
(264, 258, NULL, NULL, 'reset', 524, 525),
(265, 258, NULL, NULL, 'login', 526, 527),
(266, 258, NULL, NULL, 'logout', 528, 529),
(267, 258, NULL, NULL, 'view', 530, 531),
(268, 258, NULL, NULL, 'securityError', 532, 533),
(269, 258, NULL, NULL, 'getProperty', 534, 535),
(270, 258, NULL, NULL, 'setProperty', 536, 537),
(271, 1, NULL, NULL, 'Croogo\\Wysiwyg', 540, 541),
(272, 1, NULL, NULL, 'CvoTechnologies\\Bootstrap', 542, 543),
(273, 1, NULL, NULL, 'DebugKit', 544, 559),
(274, 273, NULL, NULL, 'Requests', 545, 548),
(275, 274, NULL, NULL, 'view', 546, 547),
(276, 273, NULL, NULL, 'Panels', 549, 554),
(277, 276, NULL, NULL, 'index', 550, 551),
(278, 276, NULL, NULL, 'view', 552, 553),
(279, 273, NULL, NULL, 'Toolbar', 555, 558),
(280, 279, NULL, NULL, 'clearCache', 556, 557),
(281, 1, NULL, NULL, 'Migrations', 560, 561),
(282, 1, NULL, NULL, 'Search', 562, 563);

CREATE TABLE IF NOT EXISTS `aros` (
`id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, 2, 'Roles', 1, 'Role-admin', 3, 6),
(2, 3, 'Roles', 2, 'Role-registered', 2, 7),
(3, NULL, 'Roles', 3, 'Role-public', 1, 8),
(4, 1, 'Users', 1, 'Croogo', 4, 5);

CREATE TABLE IF NOT EXISTS `aros_acos` (
`id` int(10) NOT NULL,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `_read` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `_update` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `_delete` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(1, 3, 35, '1', '1', '1', '1'),
(2, 3, 36, '1', '1', '1', '1'),
(3, 2, 37, '1', '1', '1', '1'),
(4, 3, 44, '1', '1', '1', '1'),
(5, 3, 125, '1', '1', '1', '1'),
(6, 3, 126, '1', '1', '1', '1'),
(7, 3, 127, '1', '1', '1', '1'),
(8, 3, 128, '1', '1', '1', '1'),
(9, 3, 129, '1', '1', '1', '1'),
(10, 2, 185, '1', '1', '1', '1'),
(11, 3, 186, '1', '1', '1', '1'),
(12, 3, 187, '1', '1', '1', '1'),
(13, 2, 188, '1', '1', '1', '1'),
(14, 3, 189, '1', '1', '1', '1'),
(15, 3, 190, '1', '1', '1', '1'),
(16, 3, 191, '1', '1', '1', '1'),
(17, 2, 192, '1', '1', '1', '1'),
(18, 2, 193, '1', '1', '1', '1'),
(19, 3, 183, '1', '1', '1', '1'),
(20, 2, 242, '1', '1', '1', '1'),
(21, 2, 243, '1', '1', '1', '1'),
(22, 3, 242, '1', '1', '1', '1'),
(23, 3, 243, '1', '1', '1', '1'),
(24, 2, 125, '1', '1', '1', '1'),
(25, 2, 3284, '1', '1', '1', '1'),
(26, 2, 3276, '1', '1', '1', '1'),
(27, 2, 3596, '-1', '-1', '-1', '-1'),
(28, 3, 3606, '1', '1', '1', '1'),
(29, 2, 3606, '1', '1', '1', '1'),
(30, 2, 3607, '1', '1', '1', '1'),
(31, 3, 3596, '-1', '-1', '-1', '-1'),
(32, 3, 3597, '-1', '-1', '-1', '-1'),
(33, 2, 3597, '-1', '-1', '-1', '-1'),
(34, 3, 3800, '-1', '-1', '-1', '-1'),
(35, 3, 3723, '-1', '-1', '-1', '-1'),
(36, 3, 3729, '-1', '-1', '-1', '-1'),
(37, 3, 3728, '-1', '-1', '-1', '-1'),
(38, 3, 3727, '-1', '-1', '-1', '-1'),
(39, 3, 3668, '-1', '-1', '-1', '-1'),
(40, 2, 3668, '-1', '-1', '-1', '-1'),
(41, 2, 3669, '-1', '-1', '-1', '-1'),
(42, 3, 3669, '-1', '-1', '-1', '-1'),
(43, 3, 3475, '1', '1', '1', '1'),
(44, 3, 3733, '1', '1', '1', '1');

CREATE TABLE IF NOT EXISTS `blocks` (
`id` int(20) NOT NULL,
  `region_id` int(20) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `element` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility_roles` text COLLATE utf8_unicode_ci,
  `visibility_paths` text COLLATE utf8_unicode_ci,
  `visibility_php` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(20) NOT NULL,
  `parent_id` int(20) DEFAULT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Node',
  `foreign_key` int(20) NOT NULL,
  `user_id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `comment_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'comment',
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `address2` text COLLATE utf8_unicode_ci,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_status` tinyint(1) NOT NULL DEFAULT '1',
  `message_archive` tinyint(1) NOT NULL DEFAULT '1',
  `message_count` int(11) NOT NULL DEFAULT '0',
  `message_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `message_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `message_notify` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `contacts` (`id`, `title`, `alias`, `body`, `name`, `position`, `address`, `address2`, `state`, `country`, `postcode`, `phone`, `fax`, `email`, `message_status`, `message_archive`, `message_count`, `message_spam_protection`, `message_captcha`, `message_notify`, `status`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Contact', 'contact', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', NULL);

CREATE TABLE IF NOT EXISTS `dashboards` (
`id` int(20) NOT NULL,
  `alias` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `column` int(20) NOT NULL DEFAULT '0',
  `weight` int(20) NOT NULL DEFAULT '0',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `languages` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `languages` (`id`, `title`, `native`, `alias`, `status`, `weight`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'English', 'English', 'eng', 1, 1, '2009-11-02 21:37:38', NULL, '2009-11-02 20:52:00', NULL);

CREATE TABLE IF NOT EXISTS `links` (
`id` int(20) NOT NULL,
  `parent_id` int(20) DEFAULT NULL,
  `menu_id` int(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `visibility_roles` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `links` (`id`, `parent_id`, `menu_id`, `title`, `class`, `description`, `link`, `target`, `rel`, `status`, `lft`, `rght`, `visibility_roles`, `params`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, NULL, 1, 'Promoted', 'home', NULL, 'prefix:false|plugin:Croogo/Nodes|controller:Nodes|action:promoted', NULL, NULL, 1, 5, 6, NULL, NULL, NULL, NULL, '2015-09-03 21:41:11', NULL, '2009-09-06 21:32:54', NULL);

CREATE TABLE IF NOT EXISTS `menus` (
`id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `link_count` int(11) NOT NULL,
  `params` text COLLATE utf8_unicode_ci,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `menus` (`id`, `title`, `alias`, `class`, `description`, `status`, `weight`, `link_count`, `params`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Main Menu', 'main', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2015-09-03 21:35:30', NULL, '2009-07-22 01:49:53', NULL);

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `meta` (
`id` int(20) NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Node',
  `foreign_key` int(20) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `weight` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `model_taxonomies` (
`id` int(20) NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Node',
  `foreign_key` int(20) NOT NULL DEFAULT '0',
  `taxonomy_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `nodes` (
`id` int(20) NOT NULL,
  `parent_id` int(20) DEFAULT NULL,
  `user_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT NULL,
  `mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_status` int(1) NOT NULL DEFAULT '1',
  `comment_count` int(11) DEFAULT '0',
  `promote` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `terms` text COLLATE utf8_unicode_ci,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `visibility_roles` text COLLATE utf8_unicode_ci,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'node',
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `nodes` (`id`, `parent_id`, `user_id`, `title`, `slug`, `body`, `excerpt`, `status`, `mime_type`, `comment_status`, `comment_count`, `promote`, `path`, `terms`, `sticky`, `lft`, `rght`, `visibility_roles`, `type`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, NULL, 1, 'Hello World', 'hello-world', '<p>Welcome to Croogo. This is your first post. You can edit or delete it from the admin panel.</p>', NULL, 1, NULL, 2, 1, 1, '/page/hello-world', NULL, 0, 1, 2, NULL, 'page', NULL, NULL, '2009-12-25 11:00:00', NULL, '2009-12-25 11:00:00', NULL);

CREATE TABLE IF NOT EXISTS `regions` (
`id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `block_count` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `regions` (`id`, `title`, `alias`, `description`, `block_count`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(3, 'none', 'none', NULL, 0, '2015-09-03 18:33:16', NULL, '2015-09-03 18:33:16', NULL),
(4, 'right', 'right', NULL, 0, '2015-09-03 18:33:16', NULL, '2015-09-03 18:33:16', NULL),
(6, 'left', 'left', NULL, 0, '2015-09-03 18:33:16', NULL, '2015-09-03 18:33:16', NULL),
(7, 'header', 'header', NULL, 0, '2015-09-03 18:33:16', NULL, '2015-09-03 18:33:16', NULL),
(8, 'footer', 'footer', NULL, 0, '2015-09-03 18:33:16', NULL, '2015-09-03 18:33:16', NULL);

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles` (`id`, `title`, `alias`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(1, 'Admin', 'admin', '2009-04-05 00:10:34', NULL, '2009-04-05 00:10:34', NULL),
(2, 'Registered', 'registered', '2009-04-05 00:10:50', NULL, '2009-04-06 05:20:38', NULL),
(3, 'Public', 'public', '2009-04-05 00:12:38', NULL, '2009-04-07 01:41:45', NULL);

CREATE TABLE IF NOT EXISTS `roles_users` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `granted_by` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `schema_migrations` (
`id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO `schema_migrations` (`id`, `class`, `type`, `created`) VALUES
(1, 'InitMigrations', 'Migrations', '2015-09-03 18:33:06'),
(2, 'ConvertVersionToClassNames', 'Migrations', '2015-09-03 18:33:06'),
(3, 'IncreaseClassNameLength', 'Migrations', '2015-09-03 18:33:06'),
(4, 'FirstMigrationSettings', 'Settings', '2015-09-03 18:33:06'),
(5, 'SettingsTrackableFields', 'Settings', '2015-09-03 18:33:07'),
(6, 'AddedAssetTimestampSetting', 'Settings', '2015-09-03 18:33:07'),
(7, 'ExposeSiteThemeAndLocaleAndHomeUrl', 'Settings', '2015-09-03 18:33:07'),
(8, 'FirstMigrationAcl', 'Acl', '2015-09-03 18:33:07'),
(9, 'FirstMigrationBlocks', 'Blocks', '2015-09-03 18:33:07'),
(10, 'BlocksTrackableFields', 'Blocks', '2015-09-03 18:33:08'),
(11, 'BlocksPublishingFields', 'Blocks', '2015-09-03 18:33:08'),
(12, 'FirstMigrationComments', 'Comments', '2015-09-03 18:33:08'),
(13, 'CommentsTrackableFields', 'Comments', '2015-09-03 18:33:08'),
(14, 'AddCommentsForeignKeys', 'Comments', '2015-09-03 18:33:09'),
(15, 'FirstMigrationContacts', 'Contacts', '2015-09-03 18:33:09'),
(16, 'ContactsTrackableFields', 'Contacts', '2015-09-03 18:33:09'),
(17, 'FirstMigrationMenus', 'Menus', '2015-09-03 18:33:09'),
(18, 'MenusTrackableFields', 'Menus', '2015-09-03 18:33:10'),
(19, 'MenusPublishingFields', 'Menus', '2015-09-03 18:33:11'),
(20, 'FirstMigrationMeta', 'Meta', '2015-09-03 18:33:11'),
(21, 'MetaTrackableFields', 'Meta', '2015-09-03 18:33:11'),
(22, 'FirstMigrationNodes', 'Nodes', '2015-09-03 18:33:11'),
(23, 'NodesTrackableFields', 'Nodes', '2015-09-03 18:33:11'),
(24, 'NodesPublishingFields', 'Nodes', '2015-09-03 18:33:12'),
(25, 'FirstMigrationTaxonomy', 'Taxonomy', '2015-09-03 18:33:12'),
(26, 'TaxonomyTrackableFields', 'Taxonomy', '2015-09-03 18:33:13'),
(27, 'RenameNodesTaxonomy', 'Taxonomy', '2015-09-03 18:33:13'),
(28, 'AddModelTaxonomyForeignKey', 'Taxonomy', '2015-09-03 18:33:13'),
(29, 'AddWysisygEnableField', 'Taxonomy', '2015-09-03 18:33:13'),
(30, 'FirstMigrationUsers', 'Users', '2015-09-03 18:33:13'),
(31, 'UsersTrackableFields', 'Users', '2015-09-03 18:33:14'),
(32, 'UsersEnlargeTimezone', 'Users', '2015-09-03 18:33:14'),
(33, 'FirstMigrationDashboard', 'Dashboards', '2015-09-03 18:33:14');

CREATE TABLE IF NOT EXISTS `settings` (
`id` int(20) NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `input_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(11) DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- INSERT INTO `settings` (`id`, `key`, `value`, `title`, `description`, `input_type`, `editable`, `weight`, `params`, `created`, `created_by`, `updated`, `updated_by`) VALUES
-- (6, 'Site.title', 'Croogo', '', '', '', 1, 1, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (7, 'Site.tagline', '', '', '', 'textarea', 1, 2, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (8, 'Site.email', '', '', '', '', 1, 3, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (9, 'Site.status', '1', '', '', 'checkbox', 1, 6, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (12, 'Meta.robots', 'index, follow', '', '', '', 1, 6, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (13, 'Meta.keywords', 'croogo, Croogo', '', '', 'textarea', 1, 7, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (14, 'Meta.description', 'Croogo - A CakePHP powered Content Management System', '', '', 'textarea', 1, 8, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (15, 'Meta.generator', 'Croogo - Content Management System', '', '', '', 0, 9, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (16, 'Service.akismet_key', 'your-key', '', '', '', 1, 11, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (17, 'Service.recaptcha_public_key', 'your-public-key', '', '', '', 1, 12, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (18, 'Service.recaptcha_private_key', 'your-private-key', '', '', '', 1, 13, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (19, 'Service.akismet_url', 'http://your-blog.com', '', '', '', 1, 10, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (20, 'Site.theme', 'Croogo/Core', '', '', '', 0, 14, '', '2015-09-03 18:33:17', 1, '2015-09-03 18:33:17', 1),
-- (21, 'Site.feed_url', '', '', '', '', 0, 15, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (22, 'Reading.nodes_per_page', '5', '', '', '', 1, 16, '', '2015-09-03 18:33:17', NULL, '2015-09-03 20:24:24', 1),
-- (23, 'Writing.wysiwyg', '1', 'Enable WYSIWYG editor', '', 'checkbox', 1, 17, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (24, 'Comment.level', '1', '', 'levels deep (threaded comments)', '', 1, 18, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (25, 'Comment.feed_limit', '10', '', 'number of comments to show in feed', '', 1, 19, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (26, 'Site.locale', 'eng', '', '', 'text', 1, 20, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (27, 'Reading.date_time_format', 'd M, y', '', '', '', 1, 21, '', '2015-09-03 18:33:17', NULL, '2015-09-03 20:24:24', 1),
-- (28, 'Comment.date_time_format', 'M d, Y', '', '', '', 1, 22, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (29, 'Site.timezone', 'UTC', '', 'Provide a valid timezone identifier as specified in https://php.net/manual/en/timezones.php', '', 1, 4, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (32, 'Hook.bootstraps', 'Croogo/Settings,Croogo/Comments,Croogo/Contacts,Croogo/Nodes,Croogo/Meta,Croogo/Menus,Croogo/Users,Croogo/Blocks,Croogo/Taxonomy,Croogo/FileManager,Croogo/Wysiwyg', '', '', '', 0, 23, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', 1),
-- (33, 'Comment.email_notification', '1', 'Enable email notification', '', 'checkbox', 1, 24, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (34, 'Access Control.multiRole', '0', 'Enable Multiple Roles', '', 'checkbox', 1, 25, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (35, 'Access Control.rowLevel', '0', 'Row Level Access Control', '', 'checkbox', 1, 26, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (36, 'Access Control.autoLoginDuration', '', '"Remember Me" Duration', 'Eg: +1 day, +1 week. Leave empty to disable.', 'text', 1, 27, '', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (37, 'Access Control.models', '', 'Models with Row Level Acl', 'Select models to activate Row Level Access Control on', 'multiple', 1, 26, 'multiple=checkbox\noptions={"Nodes.Node": "Node", "Blocks.Block": "Block", "Menus.Menu": "Menu", "Menus.Link": "Link"}', '2015-09-03 18:33:17', NULL, '2015-09-03 18:33:17', NULL),
-- (38, 'Site.ipWhitelist', '127.0.0.1', 'Whitelisted IP Addresses', 'Separate multiple IP addresses with comma', 'text', 1, 27, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (39, 'Site.asset_timestamp', '1', 'Asset timestamp', 'Appends a timestamp which is last modified time of the particular file at the end of asset files URLs (CSS, JavaScript, Image). Useful to prevent visitors to visit the site with an outdated version of these files in their browser cache.', 'radio', 1, 28, 'options={"0": "Disabled", "1": "Enabled in debug mode only", "force": "Always enabled"}', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (40, 'Site.admin_theme', 'Croogo/Core', 'Administration Theme', '', 'text', 1, 29, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (41, 'Site.home_url', '', 'Home Url', 'Default action for home page in link string format.', 'text', 1, 30, '', '2015-09-03 18:33:17', 1, '2015-09-03 21:42:20', 1),
-- (42, 'Croogo.installed', '1', '', '', '', 0, 31, '', '2015-09-03 18:33:29', NULL, '2015-09-03 18:33:29', NULL),
-- (43, 'Croogo.version', '3.0.0', '', '', '', 0, 32, '', '2015-09-03 18:38:48', 1, '2015-09-03 18:38:48', 1),
-- (44, 'Site.acl_plugin', 'Croogo/Acl', '', '', 'text', 1, NULL, '', NULL, NULL, NULL, NULL);

CREATE TABLE IF NOT EXISTS `taxonomies` (
`id` int(20) NOT NULL,
  `parent_id` int(20) DEFAULT NULL,
  `term_id` int(10) NOT NULL,
  `vocabulary_id` int(10) NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `terms` (
`id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `types` (
`id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `format_show_author` tinyint(1) NOT NULL DEFAULT '1',
  `format_show_date` tinyint(1) NOT NULL DEFAULT '1',
  `format_use_wysiwyg` tinyint(1) NOT NULL DEFAULT '1',
  `comment_status` int(1) NOT NULL DEFAULT '1',
  `comment_approve` tinyint(1) NOT NULL DEFAULT '1',
  `comment_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `comment_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8_unicode_ci,
  `plugin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `types` (`id`, `title`, `alias`, `description`, `format_show_author`, `format_show_date`, `format_use_wysiwyg`, `comment_status`, `comment_approve`, `comment_spam_protection`, `comment_captcha`, `params`, `plugin`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Page', 'page', 'A page is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a page entry does not allow visitor comments.', 0, 0, 1, 0, 1, 0, 0, NULL, NULL, '2009-09-09 00:23:24', NULL, '2009-09-02 18:06:27', NULL);

CREATE TABLE IF NOT EXISTS `types_vocabularies` (
`id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `vocabulary_id` int(10) NOT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
`id` int(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `name`, `email`, `website`, `activation_key`, `image`, `bio`, `status`, `updated`, `updated_by`, `created`, `timezone`, `created_by`) VALUES
(1, 1, '{{admin-username}}', '{{admin-password}}', 'Croogo developer', '{{site-email}}', '', '', NULL, NULL, 1, '{{date}}', NULL, '{{date}}', '310', NULL);

CREATE TABLE IF NOT EXISTS `vocabularies` (
`id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `tags` tinyint(1) NOT NULL DEFAULT '0',
  `plugin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `acos`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `aros`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `aros_acos`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `blocks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `block_alias` (`alias`);

ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `comments_fk` (`model`,`foreign_key`);

ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `dashboards`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `languages`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `links`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `menus`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `menu_alias` (`alias`);

ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `meta`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `model_taxonomies`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `nodes`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `regions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `region_alias` (`alias`);

ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `role_alias` (`alias`);

ALTER TABLE `roles_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `pk_role_users` (`user_id`,`role_id`);

ALTER TABLE `schema_migrations`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key` (`key`);

ALTER TABLE `taxonomies`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `terms`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `slug` (`slug`);

ALTER TABLE `types`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `type_alias` (`alias`);

ALTER TABLE `types_vocabularies`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `vocabularies`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `vocabulary_alias` (`alias`);


ALTER TABLE `acos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=283;
ALTER TABLE `aros`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
ALTER TABLE `aros_acos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
ALTER TABLE `blocks`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
ALTER TABLE `comments`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `contacts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `dashboards`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `languages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `links`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `menus`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `meta`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `model_taxonomies`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `nodes`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
ALTER TABLE `regions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `roles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
ALTER TABLE `roles_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `schema_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
ALTER TABLE `settings`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
ALTER TABLE `taxonomies`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `terms`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `types`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `types_vocabularies`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `vocabularies`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
