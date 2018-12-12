package com.lhrsite.demo1.service;

import com.lhrsite.demo1.entity.User;

import java.util.List;

public interface UserService {

    List<User> getUser();


    User saveUser(User user);

    /**
     * 定义删除方法
     *
     * @param uid 用户id
     */
    void delete(Integer uid);

}
