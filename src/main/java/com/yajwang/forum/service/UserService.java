package com.yajwang.forum.service;

import com.yajwang.forum.domain.User;

public interface UserService {

    int register(User user);

    User login(String phone, String pwd);
}
