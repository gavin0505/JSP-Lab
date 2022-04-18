package icu.zxb996.repository;

import icu.zxb996.entity.Address;

import java.util.List;

/**
 * @author gavin
 * @date 2022/4/18 10:40
 */
public interface AddressRepository {

    /**
     * 增加收货地址
     * @param address
     */
    void addAddress(Address address);

    /**
     * 获取用户所有的收获地址
     * @param userId
     * @return
     */
    List<Address> getUserAddresses(int userId);

    /**
     * 删除收货地址
     * @param addressId
     */
    void deleteAddress(Integer addressId);

    /**
     * 设置默认收货地址
     * @param id
     */
    void makeDefaultAddress(Integer id);

    /**
     * 取消user的默认收货地址
     * @param userId
     */
    void setNotDefaultAddress(Integer userId);
}
