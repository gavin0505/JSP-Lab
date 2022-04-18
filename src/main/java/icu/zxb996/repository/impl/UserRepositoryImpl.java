package icu.zxb996.repository.impl;

import icu.zxb996.entity.User;
import icu.zxb996.repository.UserRepository;
import icu.zxb996.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author gavin
 * @date 2022/4/18 10:40
 */
public class UserRepositoryImpl implements UserRepository {

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void addUser(User user) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "insert into user(username, name, password, phone) value(?,?,?,?)";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection,preparedStatement,null);
        }
    }

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement= null;
        String sql = "select * from user where username = ? and password = ?";
        ResultSet resultSet = null;
        User user = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                user = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3)
                , resultSet.getString(4), resultSet.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection,preparedStatement, resultSet);
        }
        return user;
    }

    /**
     * 查找用户
     * @param username
     * @return
     */
    @Override
    public String findUser(String username) {
         Connection connection = DBUtil.getConnection();
         PreparedStatement preparedStatement = null;
         String sql = "SELECT username from User WHERE username = ?";
         ResultSet resultSet = null;
         String res = null;

         try{
             preparedStatement = connection.prepareStatement(sql);
             preparedStatement.setString(1, username);
             resultSet = preparedStatement.executeQuery();
             if(resultSet.next()) {
                 res = resultSet.getString(1);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }finally {
             DBUtil.release(connection, preparedStatement, resultSet);
         }
         return res;
    }
}
