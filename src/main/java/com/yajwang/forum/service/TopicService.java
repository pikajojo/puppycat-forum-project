package com.yajwang.forum.service;

import com.yajwang.forum.domain.Reply;
import com.yajwang.forum.domain.Topic;
import com.yajwang.forum.domain.User;
import com.yajwang.forum.dto.PageDTO;

public interface TopicService {

    PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize);

    Topic findById(int topicId);

    PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize);

    int addTopic(User loginUser, String title, String content, int cId);

    int replyByTopicId(User loginUser, int topicId, String content);

    void addOnePV(int topicId);
}
