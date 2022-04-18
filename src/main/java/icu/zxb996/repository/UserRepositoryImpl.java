package icu.zxb996.repository;

import icu.zxb996.entity.User;
import icu.zxb996.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author gavin
 * @date 2022/4/18 10:40
 */
public class UserRepositoryImpl implements  UserRepository{
    @Override
    public void addUser(User user) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "insert into user(username, name, password, phone) value(?,?,?,?)";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
    }

    @Override
    public User login(String username, String password) {
        Connection connection = JDBCTools.getConnection();
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
            JDBCTools.release(connection,preparedStatement, resultSet);
        }
        return user;
    }
}
