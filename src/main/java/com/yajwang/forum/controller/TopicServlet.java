package com.yajwang.forum.controller;


import com.yajwang.forum.domain.Reply;
import com.yajwang.forum.domain.Topic;
import com.yajwang.forum.domain.User;
import com.yajwang.forum.dto.PageDTO;
import com.yajwang.forum.service.CategoryService;
import com.yajwang.forum.service.TopicService;
import com.yajwang.forum.service.impl.CategoryServiceImpl;
import com.yajwang.forum.service.impl.TopicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "topicServlet", urlPatterns = {"/topic"})

public class TopicServlet extends BaseServlet {

    private TopicService topicService = new TopicServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();


    /**
     * 默认分页大小
     * the default size of every page
     */
    private static final int pageSize = 5;


    public void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cId = Integer.parseInt(req.getParameter("c_id"));

        //默认显示第一页
        //the default page is 1st page
        int page = 1;

        String currentPage = req.getParameter("page");

        if(currentPage != null && currentPage != ""){
            page = Integer.parseInt(currentPage);

        }

        PageDTO<Topic> pageDTO = topicService.listTopicPageByCid(cId,page,pageSize);

//        System.out.println(pageDTO.toString());

        req.getSession().setAttribute("categoryList", categoryService.list());

        req.setAttribute("topicPage", pageDTO);

        req.getRequestDispatcher("/index.jsp").forward(req, resp);

    }

    /**
     * 帖子内页的开发
     * the inner page of one post
     * @param req
     * @param rep
     */
    public void findDetailById(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        //获取topic id
        int topicId = Integer.parseInt(req.getParameter("topic_id"));

        //默认显示第一页
        //the default page is 1st page
        int page = 1;

        String currentPage = req.getParameter("page");

        if(currentPage != null && currentPage != ""){
            page = Integer.parseInt(currentPage);

        }

        //处理浏览量，一个session内部的算一次
        //calculate the number of views, if multiple views are in the same session, they only count once
        String sessionReadKey = "is_read"+topicId;
        Boolean isRead = (Boolean) req.getSession().getAttribute(sessionReadKey);
        if(isRead == null){
            req.getSession().setAttribute(sessionReadKey,true);

            //新增一个pv
            //pv plus one
            topicService.addOnePV(topicId);

        }

        Topic topic = topicService.findById(topicId);

        PageDTO<Reply> pageDTO = topicService.findReplyPageByTopicId(topicId,page,pageSize);

//        System.out.println(pageDTO.toString());

        req.setAttribute("topic", topic);
        req.setAttribute("replyPage", pageDTO);

        req.getRequestDispatcher("/topic_detail.jsp").forward(req, rep);

    }

    /**
     * 发布主题帖子
     * post one topic
     * @param req
     * @param rep
     */
    public void addTopic(HttpServletRequest req, HttpServletResponse rep) throws IOException {

        User loginUser = (User)req.getSession().getAttribute("loginUser");
        if(loginUser == null){
            req.setAttribute("msg","please log in first");
            rep.sendRedirect("/user/login.jsp");
        }

        String title = req.getParameter("title");
        String content = req.getParameter("content");
        int cId = Integer.parseInt(req.getParameter("c_id"));

        int rows = topicService.addTopic(loginUser, title, content, cId);

        //发布主题成功
        //post successfully
        rep.sendRedirect("/topic?method=list&c_id="+cId);


    }


    /**
     * 盖楼回复
     * reply to one specific topic
     * @param req
     * @param rep
     */
    public void replyByTopicId(HttpServletRequest req, HttpServletResponse rep) throws IOException {
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            req.setAttribute("msg", "please log in first");
            return;
            //页面跳转
            //go to another website todo
        }

        int topicId = Integer.parseInt(req.getParameter("topic_id"));
        String content = req.getParameter("content");

        int rows = topicService.replyByTopicId(loginUser, topicId, content);


        //发布回复成功
        //reply successfully

        rep.sendRedirect("/topic?method=findDetailById&topic_id="+topicId+"&page=1");


    }

}
