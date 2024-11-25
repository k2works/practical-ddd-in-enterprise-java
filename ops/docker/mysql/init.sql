CREATE DATABASE IF NOT EXISTS cargotracker;
USE cargotracker;

## Cargo テーブルのDDL
CREATE TABLE `cargo` (
                         `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                         `BOOKING_ID` varchar(20) NOT NULL COMMENT '予約ID',
                         `TRANSPORT_STATUS` varchar(100) NOT NULL COMMENT '輸送ステータス',
                         `ROUTING_STATUS` varchar(100) NOT NULL COMMENT 'ルーティングステータス',
                         `spec_origin_id` varchar(20) DEFAULT NULL COMMENT '特定の出発地ID',
                         `spec_destination_id` varchar(20) DEFAULT NULL COMMENT '特定の目的地ID',
                         `SPEC_ARRIVAL_DEADLINE` date DEFAULT NULL COMMENT '到着期限',
                         `origin_id` varchar(20) DEFAULT NULL COMMENT '出発地ID',
                         `BOOKING_AMOUNT` int(11) NOT NULL COMMENT '予約金額',
                         `handling_event_id` int(11) DEFAULT NULL COMMENT '取り扱いイベントID',
                         `next_expected_location_id` varchar(20) DEFAULT NULL COMMENT '次の予想される場所ID',
                         `next_expected_handling_event_type` varchar(20) DEFAULT NULL COMMENT '次の予想される取り扱いイベントタイプ',
                         `next_expected_voyage_id` varchar(20) DEFAULT NULL COMMENT '次の予想される航海ID',
                         `last_known_location_id` varchar(20) DEFAULT NULL COMMENT '最後に確認された場所ID',
                         `current_voyage_number` varchar(100) DEFAULT NULL COMMENT '現在の航海番号',
                         `last_handling_event_id` int(11) DEFAULT NULL COMMENT '最後の取り扱いイベントID',
                         `last_handling_event_type` varchar(20) DEFAULT NULL COMMENT '最後の取り扱いイベントタイプ',
                         `last_handling_event_location` varchar(20) DEFAULT NULL COMMENT '最後の取り扱いイベントの場所',
                         `last_handling_event_voyage` varchar(20) DEFAULT NULL COMMENT '最後の取り扱いイベントの航海',
                         PRIMARY KEY (`ID`)
) COMMENT '貨物テーブル' ENGINE=InnoDB AUTO_INCREMENT=2923 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Leg テーブルのDDL
CREATE TABLE `LEG` (
                       `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                       `LOAD_TIME` timestamp NULL DEFAULT NULL COMMENT '積載時間',
                       `UNLOAD_TIME` timestamp NULL DEFAULT NULL COMMENT '荷降ろし時間',
                       `load_location_id` varchar(20) DEFAULT NULL COMMENT '積載場所ID',
                       `unload_location_id` varchar(20) DEFAULT NULL COMMENT '荷降ろし場所ID',
                       `voyage_number` varchar(100) DEFAULT NULL COMMENT '航海番号',
                       `CARGO_ID` int(11) DEFAULT NULL COMMENT '貨物ID',
                       PRIMARY KEY (`ID`)
) COMMENT '運送区間テーブル' ENGINE=InnoDB AUTO_INCREMENT=3095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Location テーブルのDDL
CREATE TABLE `location` (
                            `ID` int(11) DEFAULT NULL COMMENT '場所ID',
                            `NAME` varchar(50) DEFAULT NULL COMMENT '場所の名前',
                            `UNLOCODE` varchar(100) DEFAULT NULL COMMENT 'UNLOCODE'
) COMMENT '場所テーブル' ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Voyage テーブルのDDL
CREATE TABLE `voyage` (
                          `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                          `voyage_number` varchar(20) NOT NULL COMMENT '航海番号',
                          PRIMARY KEY (`Id`)
) COMMENT '航海テーブル' ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Carrier Movement テーブルのDDL
CREATE TABLE `carrier_movement` (
                                    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                                    `arrival_location_id` varchar(100) DEFAULT NULL COMMENT '到着場所ID',
                                    `departure_location_id` varchar(100) DEFAULT NULL COMMENT '出発場所ID',
                                    `voyage_id` int(11) DEFAULT NULL COMMENT '航海ID',
                                    `arrival_date` date DEFAULT NULL COMMENT '到着日',
                                    `departure_date` date DEFAULT NULL COMMENT '出発日',
                                    PRIMARY KEY (`Id`)
) COMMENT '運送経路テーブル' ENGINE=InnoDB AUTO_INCREMENT=1358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Routing 作業確認のデータ
insert voyage (Id, voyage_number) values (3, '0100S');
insert voyage (Id, voyage_number) values (4, '0101S');
insert voyage (Id, voyage_number) values (5, '0102S');

insert into carrier_movement (Id, arrival_location_id, departure_location_id, voyage_id, arrival_date, departure_date) values (1355, 'CNHGH', 'CNHKG', 3, '2019-08-28', '2019-08-25');
insert into carrier_movement (Id, arrival_location_id, departure_location_id, voyage_id, arrival_date, departure_date) values (1356, 'JNTKO', 'CNHGH', 4, '2019-09-10', '2019-09-01');
insert into carrier_movement (Id, arrival_location_id, departure_location_id, voyage_id, arrival_date, departure_date) values (1357, 'USNYC', 'JNTKO', 5, '2019-09-25', '2019-09-15');

## Tracking Activity テーブルのDDL
CREATE TABLE `tracking_activity` (
                                     `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                                     `tracking_number` varchar(20) NOT NULL COMMENT 'トラッキング番号',
                                     `booking_id` varchar(20) DEFAULT NULL COMMENT '予約ID',
                                     PRIMARY KEY (`Id`)
) COMMENT 'トラッキングアクティビティテーブル' ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Tracking Handling Events テーブルのDDL
CREATE TABLE `tracking_handling_events` (
                                            `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                                            `tracking_id` int(11) DEFAULT NULL COMMENT 'トラッキングID',
                                            `event_type` varchar(225) DEFAULT NULL COMMENT 'イベントタイプ',
                                            `event_time` timestamp NULL DEFAULT NULL COMMENT 'イベント時間',
                                            `location_id` varchar(100) DEFAULT NULL COMMENT '場所ID',
                                            `voyage_number` varchar(20) DEFAULT NULL COMMENT '航海番号',
                                            PRIMARY KEY (`Id`)
) COMMENT 'トラッキングハンドリングイベントテーブル' ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

## Handling Activity テーブルのDDL
CREATE TABLE `handling_activity` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動インクリメントのID',
                                     `event_completion_time` timestamp NULL DEFAULT NULL COMMENT 'イベント終了時間',
                                     `event_type` varchar(225) DEFAULT NULL COMMENT 'イベントタイプ',
                                     `booking_id` varchar(20) DEFAULT NULL COMMENT '予約ID',
                                     `voyage_number` varchar(100) DEFAULT NULL COMMENT '航海番号',
                                     `location` varchar(100) DEFAULT NULL COMMENT '場所',
                                     PRIMARY KEY (`id`)
) COMMENT 'ハンドリングアクティビティテーブル' ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;