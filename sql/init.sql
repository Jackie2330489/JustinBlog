#数据库初始化脚本
#创建数据库
CREATE DATABASE JustinBlog;
use JustinBlog;
#创建表

#用户表
CREATE TABLE BlogUser(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	avatar VARCHAR(200) NOT NULL,
	password VARCHAR(20) NOT NULL,
	cretime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY(id),
	KEY idx_name(name)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
#博文表
CREATE TABLE BlogPost(
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	text TEXT,
	cretime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	readtimes INT DEFAULT 0,
	PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
#评论表
CREATE TABLE Comment(
	id INT NOT NULL AUTO_INCREMENT,
	blogpostid INT NOT NULL,
	activeid INT NOT NULL,
	passiveid INT NOT NULL,
	text VARCHAR(200),
	cretime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY(id),
	KEY idx_blogpostid(blogpostid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
#点赞表
CREATE TABLE Zan(
	userid INT NOT NULL,
	blogpostid INT NOT NULL,
	cretime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY(userid,blogpostid),
	KEY idx_blogpostid(blogpostid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#标签表
CREATE TABLE Tag(
	id INT NOT NULL,
	tagname VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#标签博文中间表
CREATE TABLE BlogPost_to_Tag(
	id INT NOT NULL AUTO_INCREMENT,
	blogpostid INT NOT NULL,
	tagid INT NULL NULL,
	PRIMARY KEY(id),
	KEY idx_blogpostid(blogpostid),
	KEY idx_tagid(tagid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;