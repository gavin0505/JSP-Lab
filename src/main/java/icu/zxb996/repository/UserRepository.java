package icu.zxb996.repository;

import icu.zxb996.entity.User;

/**
 * @author gavin
 * @date 2022/4/18 10:39
 */
public interface UserRepository {

    void addUser(User user);

    User login(String username, String password);
}
