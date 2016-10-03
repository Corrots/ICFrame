-- 数据库
create database ic charset utf8;
-- 选择数据库
use ic;

-- 创建用户表
create table user(
id int unsigned primary key auto_increment,
username varchar(20) not null,
password char(32) not null,
role char(10) not null default 'ROLE_USER',
email varchar(50) not null default '',
nickname varchar(20) not null default '',
age tinyint unsigned not null default 18,
register_time int not null
)charset utf8;

-- 用户表新增rand_code字段
alter table user add column `rand_code` char(16) not null default '';

-- 用户表新增head_img字段
alter table user add column `head_img` varchar(200) not null default '';


-- 创建测试用户数据
insert into user (id,username,password,role,email,nickname,age,register_time) values(null,'admin',md5('qaz123'),'ROLE_ADMIN','qaz@126.com','Qaz',20,1473947859);
insert into user (id,username,password,role,email,nickname,age,register_time) values(null,'user',md5('qaz123'),'ROLE_USER','user001@126.com','user001',28,1473947916);
-- 

-- 创建分类表
create table category(
id int unsigned primary key auto_increment,
name varchar(20) not null,
parent_id int unsigned not null default 0,
sort int unsigned not null default 0
)charset utf8;

-- 创建分类表测试数据
INSERT INTO `category` VALUES
(1, '美食', 0, 999),
(2, '乳鸽', 1, 999),
(3, '烧鹅', 1, 999),
(4, '双皮奶', 1, 999),
(5, '技术', 0, 999),
(6, 'PHP', 5, 999),
(7, 'H5', 5, 999),
(8, 'C++', 5, 999),
(9, '汇编', 5, 999);

-- 用户表新增字段 rand_code 用于存储用户
alter table `user` add column `rand_code` char(16) not null default '';


-- 创建博文表
create table `blog`(
id int unsigned primary key auto_increment,
user_id int unsigned not null comment'用户表id',
category_id int unsigned not null comment'分类表id',
title varchar(50) not null comment'博文标题',
content text not null comment'博文内容',
status tinyint not null default 2 comment'1:草稿;2:公开;3:隐藏',
publish_time int not null comment'博文发布时间',
toped tinyint not null default 2 comment'1:置顶;2:不置顶'
)charset utf8;
-- 博文表新增字段tags
alter table `blog` add column `tags` varchar(100) not null default '' ;
-- 博文表新增字段commend_num
alter table `blog` add column `commend_num` int not null default 0;



-- 添加博文表测试数据
insert into `blog` values(null,1,5,'PHP中的MVC','MVC开发模式具有哪些优势?',2,1474283605,2);
insert into `blog` values(null,2,1,'今日美食','大十尖馄饨',2,1474283615,2);
insert into `blog` values(null,3,6,'PHP超全局预定义变量','PHP中有哪些常用到的超全局预定义变量?',2,1474283725,2);


insert into blog values(null,3,5,'闷声发大财','才是醉好的',1,1474250136,1,'');

-- 创建评论表 `comment`
create table `comment`(
id int unsigned primary key auto_increment,
user_id int unsigned not null,
blog_id int unsigned not null,
content varchar(255) not null,
publish_time int unsigned not null
)charset utf8;

-- 添加评论测试数据
insert into comment values(null,2,3,'兰州烧饼',1474373221);
insert into comment values(null,1,4,'沙发',1474373263);
insert into comment values(null,4,5,'好,非常好!',1474373336);

insert into comment values(null,5,3,'血源诅咒官方设定集好顶赞!',1474373454);
insert into comment values(null,4,5,'PHP和MySQL开发',1474373510);

-- 创建博文点赞表
create table commend(
id int unsigned primary key auto_increment,
user_id int unsigned not null,
blog_id int unsigned not null
)charset utf8;