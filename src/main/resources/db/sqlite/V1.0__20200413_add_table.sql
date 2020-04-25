CREATE TABLE `users` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `user_code` varchar(255) DEFAULT NULL,
                       `password` varchar(255) DEFAULT NULL,
                       `role_id` int(11) DEFAULT NULL,
                       `name` varchar(255) DEFAULT NULL,
                       `email` varchar(255) DEFAULT NULL,
                       `phone` varchar(255) DEFAULT NULL,
                       `create_time` timestamp NULL DEFAULT NULL,
                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `users_role` (
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
                      `order_users_id` int(11) DEFAULT NULL,
                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `home_stay` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `house_name` varchar(255) DEFAULT NULL,
                           `create_time` timestamp NULL DEFAULT NULL,
                           `address` varchar(255) DEFAULT NULL,
                           `house_owner_id` int(11) DEFAULT NULL,
                           `description` varchar(255) DEFAULT NULL,
                           `picture` varchar(255) DEFAULT NULL,
                           `city` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `booking` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `room_id` int(11) DEFAULT NULL,
                         `users_id` int(11) DEFAULT NULL,
                         `into_time` timestamp NULL DEFAULT NULL,
                         `leave_time` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `home_stay`.`users_role`(`id`, `role_name`) VALUES (1, '管理员');
INSERT INTO `home_stay`.`users_role`(`id`, `role_name`) VALUES (2, '房主');
INSERT INTO `home_stay`.`users_role`(`id`, `role_name`) VALUES (3, '租户');

INSERT INTO `home_stay`.`users`(`id`, `user_code`, `password`, `role_id`, `name`, `email`, `phone`, `create_time`) VALUES (1, '1', '1', 1, 'admin', NULL, NULL, '2020-04-18 16:28:07');


