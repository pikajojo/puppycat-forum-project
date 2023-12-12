package com.yajwang.forum.service;

import com.yajwang.forum.domain.Category;

import java.util.List;

public interface CategoryService {

    /**
     * 全部分类
     * all categories
     * @return
     */
    List<Category> list();
}
