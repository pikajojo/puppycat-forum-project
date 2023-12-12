package com.yajwang.forum.dao;

import com.yajwang.forum.domain.Category;
import com.yajwang.forum.util.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class CategoryDao {

    QueryRunner queryRunner = new QueryRunner(DataSourceUtil.getDataSource());

    //开启驼峰映射
    //Turn on camel mapping
    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);


    /**
     * 根据id找分类
     * find the category based on the id
     * @param id
     * @return
     */
    public Category findById(int id){
        String sql = "select * from category where id = ?";

        Category category = null;
        try {
            category = queryRunner.query(sql, new BeanHandler<>(Category.class, processor), id);
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return category;

    }


    /**
     * 返回全部列表
     * return the whole category list
     * @param
     */
    public List<Category> list(){
        String sql = "select * from category order by weight desc";

        List<Category> list = null;
        try {
            list = queryRunner.query(sql, new BeanListHandler<>(Category.class, processor));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}
