package com.yajwang.forum.service.impl;

import com.yajwang.forum.dao.CategoryDao;
import com.yajwang.forum.dao.ReplyDao;
import com.yajwang.forum.dao.TopicDao;
import com.yajwang.forum.domain.Category;
import com.yajwang.forum.domain.Reply;
import com.yajwang.forum.domain.Topic;
import com.yajwang.forum.domain.User;
import com.yajwang.forum.dto.PageDTO;
import com.yajwang.forum.service.TopicService;

import java.util.Date;
import java.util.List;

public class TopicServiceImpl implements TopicService {
    private TopicDao topicDao = new TopicDao();
    private ReplyDao replyDao = new ReplyDao();
    private CategoryDao categoryDao = new CategoryDao();

    @Override
    public PageDTO<Topic> listTopicPageByCid(int cId, int page, int pageSize) {

        //查询总记录数
        //search thew total records number
        int totalRecordNum = topicDao.countTotalTopicByCid(cId);

        int from = (page-1) * pageSize;

        //分页查询
        //search every page by page number
        List<Topic> topicList = topicDao.findListByCid(cId, from, pageSize);

        PageDTO<Topic> pageDTO = new PageDTO<>(page, pageSize, totalRecordNum);

        pageDTO.setList(topicList);

        return pageDTO;





    }

    @Override
    public Topic findById(int topicId) {
        return topicDao.findById(topicId);
    }

    @Override
    public PageDTO<Reply> findReplyPageByTopicId(int topicId, int page, int pageSize) {
        //查询回复总记录数
        //search the total numbers of reply of one post
        int totalReplyNum = replyDao.countTotalReplyByTopicId(topicId);

        int from = (page-1) * pageSize;

        //分页查询
        //search every page by page number
        List<Reply> replyList = replyDao.findListByTopicId(topicId, from, pageSize);

        PageDTO<Reply> pageDTO = new PageDTO<>(page, pageSize, totalReplyNum);

        pageDTO.setList(replyList);



        return pageDTO;
    }

    @Override
    public int addTopic(User loginUser, String title, String content, int cId) {
        Category category = categoryDao.findById(cId);
        if(category == null){ return 0; }

        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        topic.setPv(1);
        topic.setDelete(0);
        topic.setcId(cId);
        topic.setUserId(loginUser.getId());
        topic.setUsername(loginUser.getUsername());
        topic.setUserImg(loginUser.getImg());
        topic.setHot(0);

        int rows = 0;
        try {
            rows = topicDao.save(topic);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows;
    }

    /**
     * 查找最新楼层
     * find the latest floor
     * @param loginUser
     * @param topicId
     * @param content
     * @return
     */
    @Override
    public int replyByTopicId(User loginUser, int topicId, String content) {
        //要找到最新的楼层
        int floor = topicDao.findLatestFloorByTopicId(topicId);
        int rows;

        Reply reply = new Reply();

        reply.setContent(content);
        reply.setTopicId(topicId);
        reply.setFloor(floor+1);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        reply.setUserId(loginUser.getId());
        reply.setUsername(loginUser.getUsername());
        reply.setUserImg(loginUser.getImg());
        reply.setDelete(0);

        if(content != null) {

            rows = replyDao.save(reply);

        }else{
            rows = 0;
        }
        return rows;
    }

    @Override
    public void addOnePV(int topicId) {
        Topic topic = topicDao.findById(topicId);

        int newPV = topic.getPv()+1;

        topicDao.updatePV(topicId, newPV, topic.getPv());
    }
}
