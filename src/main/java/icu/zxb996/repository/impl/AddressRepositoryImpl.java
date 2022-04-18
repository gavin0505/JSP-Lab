package icu.zxb996.repository.impl;

import com.mysql.cj.jdbc.JdbcConnection;
import icu.zxb996.entity.Address;
import icu.zxb996.repository.AddressRepository;
import icu.zxb996.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author gavin
 * @date 2022/4/18 12:00
 */
public class AddressRepositoryImpl implements AddressRepository {

    /**
     * 增加收货地址
     * @param address
     */
    @Override
    public void addAddress(Address address) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO address(province, city, district, street, detail, name, phone, type, user_id) " +
                "VALUE(?,?,?,?,?,?,?,?,?)";

        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, address.getProvince());
            preparedStatement.setString(2, address.getCity());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getStreet());
            preparedStatement.setString(5, address.getDetail());
            preparedStatement.setString(6,address.getName());
            preparedStatement.setString(7, address.getPhone());
            preparedStatement.setInt(8, address.getType());
            preparedStatement.setInt(9, address.getUserId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection, preparedStatement, null);
        }
    }

    /**
     * 获取用户所有的收获地址
     * @param userId
     * @return
     */
    @Override
    public List<Address> getUserAddresses(int userId) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM address WHERE user_id = ?";
        List<Address> list = new ArrayList<>();

        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                list.add(new Address(resultSet.getInt(1), resultSet.getString(2),resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7), resultSet.getString(8), resultSet.getInt(9),
                        resultSet.getInt(10)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection, preparedStatement, resultSet);
        }
        return list;
    }

    /**
     * 删除收货地址
     * @param addressId
     */
    @Override
    public void deleteAddress(Integer addressId) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM address WHERE id = ?";

        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, addressId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection, preparedStatement, null);
        }
    }

    /**
     * 设置默认收货地址
     * @param id
     */
    @Override
    public void makeDefaultAddress(Integer id) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE address SET type = 1 WHERE id = ?";

        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection, preparedStatement, null);
        }
    }

    /**
     * 取消user的默认收货地址
     * @param userId
     */
    @Override
    public void setNotDefaultAddress(Integer userId) {
        Connection connection = DBUtil.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "UPDATE address SET type = 0 where user_id = ? and type = 1";

        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.release(connection, preparedStatement, null);
        }
    }
}
