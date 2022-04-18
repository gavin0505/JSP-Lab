package icu.zxb996.service;

import icu.zxb996.entity.User;

/**
 * @author gavin
 * @date 2022/4/18 10:13
 */
public interface UserService {
    /**
     * 添加用户
     * @param user
     */
    void addUser(User user);

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);
}
