CREATE TABLE `users` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `user_code` varchar(255) DEFAULT NULL,
                       `password` varchar(255) DEFAULT NULL,
                       `role_name` varchar(255) DEFAULT NULL,
                       `name` varchar(255) DEFAULT NULL,
                       `create_time` timestamp NULL DEFAULT NULL,
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `user_role` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `role_name` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `room` (
                      `id` int(11) NOT NULL AUTO_INCREMENT,
                      `room_name` varchar(255) DEFAULT NULL,
                      `price` double(10,2) DEFAULT NULL,
                      `home_id` int(11) DEFAULT NULL,
                      `create_time` timestamp NULL DEFAULT NULL,
                      `used` int(255) DEFAULT NULL,
                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `home_stay` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `house_name` varchar(255) DEFAULT NULL,
                           `create_time` timestamp NULL DEFAULT NULL,
                           `address` varchar(255) DEFAULT NULL,
                           `price` double(10,2) DEFAULT NULL,
                           `house_owner_id` int(11) DEFAULT NULL,
                           `describe` varchar(255) DEFAULT NULL,
                           `picture` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `booking` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `room_id` int(11) DEFAULT NULL,
                         `users_id` int(11) DEFAULT NULL,
                         `create_time` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;