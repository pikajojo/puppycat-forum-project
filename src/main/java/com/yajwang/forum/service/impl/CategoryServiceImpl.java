package com.yajwang.forum.service.impl;

import com.yajwang.forum.dao.CategoryDao;
import com.yajwang.forum.domain.Category;
import com.yajwang.forum.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao = new CategoryDao();
    @Override
    public List<Category> list() {
        return categoryDao.list();
    }
}
