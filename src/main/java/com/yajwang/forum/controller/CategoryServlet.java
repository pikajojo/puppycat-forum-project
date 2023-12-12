package com.yajwang.forum.controller;

import com.yajwang.forum.domain.Category;
import com.yajwang.forum.service.CategoryService;
import com.yajwang.forum.service.impl.CategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "categoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends BaseServlet{

    private CategoryService categoryService = new CategoryServiceImpl();

/**return the all categories
 * http://localhost:8080/category?method=list*/

    public void list(HttpServletRequest req, HttpServletResponse resp){
//
        List<Category> list = categoryService.list();

        System.out.println(list.toString());

        req.setAttribute("categoryList", list);
    }
}
