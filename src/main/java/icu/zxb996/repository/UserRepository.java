package icu.zxb996.repository;

import icu.zxb996.entity.User;

/**
 * @author gavin
 * @date 2022/4/18 10:39
 */
public interface UserRepository {

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

    /**
     * 查找用户
     */
    String findUser(String username);
}
