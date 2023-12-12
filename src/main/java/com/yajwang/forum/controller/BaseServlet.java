package com.yajwang.forum.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;



@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {

    /**
     * 子类的Servlet被访问，会调用service方法，但是子类没有重写，那么就会调用母类的service方法
     *When the Servlet of the subclass is accessed, the service method will be called. However, if the subclass has not been overridden, the service method of the parent class will be called.
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String method = req.getParameter("method");

        if(method != null){
            try{

                //获得当前被访问对象的字节码对象，和字节码对象里指定的方法
                //Obtain the bytecode object of the currently accessed object and the method specified in the bytecode object
                Method targetMethod = this.getClass().getMethod(method, HttpServletRequest.class, HttpServletResponse.class);

                //执行对应方法
                //Execute the corresponding method
                targetMethod.invoke(this, req, resp);

            }catch (Exception e){
                e.printStackTrace();
            }

        }
    }
}
