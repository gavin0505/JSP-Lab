package icu.zxb996.service;

import icu.zxb996.entity.User;

/**
 * @author gavin
 * @date 2022/4/18 10:13
 */
public interface UserService {
    /**
     * 注册 成功返回true
     * @param user
     */
    boolean addUser(User user);

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);

    /**
     * 判断重名 重名返回true
     * @param username
     * @return
     */
    boolean isName(String username);
}
