package icu.zxb996.service.impl;

import icu.zxb996.entity.User;
import icu.zxb996.repository.impl.UserRepositoryImpl;
import icu.zxb996.service.UserService;

/**
 * @author gavin
 * @date 2022/4/18 10:15
 */
public class UserServiceImpl implements UserService {

    private UserRepositoryImpl userRepository = new UserRepositoryImpl();

    /**
     * 注册
     * @param user
     */
    @Override
    public boolean addUser(User user) {

        // 判断重名
        if (!isName(user.getUsername())) {
            userRepository.addUser(user);
            return true;
        }
        return false;
    }

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        return userRepository.login(username, password);
    }

    /**
     * 判断重名 重名返回true
     * @param username
     * @return
     */
    @Override
    public boolean isName(String username) {
        return username.equals(userRepository.findUser(username));
    }
}
