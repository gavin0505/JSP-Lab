package icu.zxb996.service;

import icu.zxb996.entity.User;
import icu.zxb996.repository.UserRepositoryImpl;

/**
 * @author gavin
 * @date 2022/4/18 10:15
 */
public class UserServiceImpl implements UserService {

    private UserRepositoryImpl userRepository = new UserRepositoryImpl();
    @Override
    public void addUser(User user) {

    }

    /**
     * 登录判断
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        return userRepository.login(username, password);
    }
}
