package icu.zxb996.service;

import icu.zxb996.entity.Address;

import java.util.List;

/**
 * @author gavin
 * @date 2022/4/18 10:15
 */
public interface AddressService {

    /**
     * 添加地址
     * @param address
     */
    void addAddress(Address address);

    /**
     * 查询地址
     * @param userId
     * @return
     */
    List<Address> getUserAddresses(int userId);

    /**
     * 删除地址
     * @param addressId
     */
    void deleteAddress(Integer addressId);

    /**
     * 创建默认地址
     * @param address
     */
    void makeDefaultAddress(Address address);
}
