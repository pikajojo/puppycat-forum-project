package com.yajwang.forum.domain;

import java.util.Date;

/*
*CREATE TABLE `topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT 'category',
  `title` varchar(128) DEFAULT NULL COMMENT 'title',
  `content` varchar(1024) DEFAULT NULL COMMENT 'content',
  `pv` int(11) DEFAULT NULL COMMENT 'views',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `user_img` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `hot` int(2) DEFAULT '0' COMMENT 'popularity: 1 is popular',
  `delete` int(11) DEFAULT '0' COMMENT '0 means not deleted, 1 means deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*
* */
public class Topic {

    private int id;

    private int cId;

    private String title;

    private String content;

    private int pv;

    private int userId;

    private String username;

    private String userImg;

    private Date createTime;

    private Date updateTime;

    private int hot;

    private int delete;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPv() {
        return pv;
    }

    public void setPv(int pv) {
        this.pv = pv;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public int getDelete() {
        return delete;
    }

    public void setDelete(int delete) {
        this.delete = delete;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "id=" + id +
                ", cId=" + cId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", pv=" + pv +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", userImg='" + userImg + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", hot=" + hot +
                ", delete=" + delete +
                '}';
    }
}
