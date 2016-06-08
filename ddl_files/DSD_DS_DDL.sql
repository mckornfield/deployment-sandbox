/*
Data Store: DSD_DS
Created: 2016-06-07T18:22:05.423Z
By: christopher.smith
Appian Version: 16.2.0.0
Target Database: MySQL 5.7.13
Database Driver: MySQL Connector Java mysql-connector-java-5.1.38 ( Revision: fe541c166cec739c74cc727c5da96c1028b4834a )
*/

/* UPDATE DDL */
    create table `AllPrimitiveTypes` (
        `id` integer not null auto_increment,
        `bool` boolean,
        `date` date,
        `datetime` datetime,
        `double` double precision,
        `int` integer,
        `text` varchar(255),
        `time` datetime,
        `product_cdt_id` integer,
        `retailer_nestedcdt_id` integer,
        primary key (`id`)
    ) ENGINE=InnoDB;

    create table `product` (
        `id` integer not null auto_increment,
        `name` varchar(255),
        primary key (`id`)
    ) ENGINE=InnoDB;

    create table `retailer` (
        `id` integer not null auto_increment,
        `name` varchar(255),
        `product_product_id` integer,
        primary key (`id`)
    ) ENGINE=InnoDB;

    alter table `AllPrimitiveTypes` 
        add index allprimitivetypes_cdt (`product_cdt_id`), 
        add constraint allprimitivetypes_cdt 
        foreign key (`product_cdt_id`) 
        references `product` (`id`);

    alter table `AllPrimitiveTypes` 
        add index allprimitivetypes_nestedcdt (`retailer_nestedcdt_id`), 
        add constraint allprimitivetypes_nestedcdt 
        foreign key (`retailer_nestedcdt_id`) 
        references `retailer` (`id`);

    alter table `retailer` 
        add index retailer_product (`product_product_id`), 
        add constraint retailer_product 
        foreign key (`product_product_id`) 
        references `product` (`id`);

/* DROP AND CREATE DDL */
/* WARNING: The DDL commented out below will drop and re-create all tables.
    alter table `AllPrimitiveTypes` 
        drop 
        foreign key allprimitivetypes_cdt;

    alter table `AllPrimitiveTypes` 
        drop 
        foreign key allprimitivetypes_nestedcdt;

    alter table `retailer` 
        drop 
        foreign key retailer_product;

    drop table if exists `AllPrimitiveTypes`;

    drop table if exists `product`;

    drop table if exists `retailer`;

    create table `AllPrimitiveTypes` (
        `id` integer not null auto_increment,
        `bool` boolean,
        `date` date,
        `datetime` datetime,
        `double` double precision,
        `int` integer,
        `text` varchar(255),
        `time` datetime,
        `product_cdt_id` integer,
        `retailer_nestedcdt_id` integer,
        primary key (`id`)
    ) ENGINE=InnoDB;

    create table `product` (
        `id` integer not null auto_increment,
        `name` varchar(255),
        primary key (`id`)
    ) ENGINE=InnoDB;

    create table `retailer` (
        `id` integer not null auto_increment,
        `name` varchar(255),
        `product_product_id` integer,
        primary key (`id`)
    ) ENGINE=InnoDB;

    alter table `AllPrimitiveTypes` 
        add index allprimitivetypes_cdt (`product_cdt_id`), 
        add constraint allprimitivetypes_cdt 
        foreign key (`product_cdt_id`) 
        references `product` (`id`);

    alter table `AllPrimitiveTypes` 
        add index allprimitivetypes_nestedcdt (`retailer_nestedcdt_id`), 
        add constraint allprimitivetypes_nestedcdt 
        foreign key (`retailer_nestedcdt_id`) 
        references `retailer` (`id`);

    alter table `retailer` 
        add index retailer_product (`product_product_id`), 
        add constraint retailer_product 
        foreign key (`product_product_id`) 
        references `product` (`id`);
*/
