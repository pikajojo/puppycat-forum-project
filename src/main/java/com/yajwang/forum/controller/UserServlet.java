package com.yajwang.forum.controller;


import com.yajwang.forum.domain.User;
import com.yajwang.forum.service.UserService;
import com.yajwang.forum.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "userServlet", urlPatterns = {"/user"})
public class UserServlet extends BaseServlet {
    UserService userService = new UserServiceImpl();


    public void login(HttpServletRequest req, HttpServletResponse rep) throws IOException, ServletException {

        String phone = req.getParameter("phone");
        String pwd = req.getParameter("pwd");

        User user = userService.login(phone, pwd);

        if(user != null){
            req.getSession().setAttribute("loginUser",user);
            //跳转页面
            //go to another site
            rep.sendRedirect("/topic?method=list&c_id=1");


        }else{

            req.setAttribute("msg","username or password is wrong.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, rep);
        }


    }

    /**
     * 退出登录
     * log out
     * @param req
     * @param rep
     */
    public void logout(HttpServletRequest req, HttpServletResponse rep) throws IOException {
        req.getSession().invalidate();

        //页面跳转
        //website dispatch todo
        rep.sendRedirect("/topic?method=list&c_id=1");
    }

    public void register(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {

        User user = new User();

        Map<String, String[]> map= req.getParameterMap();

        //把map数据自动映射到user里面
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        int i = userService.register(user);

        if(i>0){
            //注册成功，跳转到登录界面 todo
            //registered successfully, go to the log in page
            req.getRequestDispatcher("/user/login.jsp").forward(req, rep);

        }else{
            //注册失败，跳转到注册界面 todo
            //failed to register, go to the register page
            req.getRequestDispatcher("/user/register.jsp").forward(req, rep);
        }

    }
}
