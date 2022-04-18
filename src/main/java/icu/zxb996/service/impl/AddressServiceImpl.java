package icu.zxb996.service.impl;

import icu.zxb996.entity.Address;
import icu.zxb996.repository.impl.AddressRepositoryImpl;
import icu.zxb996.service.AddressService;

import java.util.List;

/**
 * @author gavin
 * @date 2022/4/18 10:18
 */
public class AddressServiceImpl implements AddressService {
    private AddressRepositoryImpl addressRepository = new AddressRepositoryImpl();
    private static final int DEFAULT_STATUS = 1;
    /**
     * 添加地址
     * @param address
     */
    @Override
    public void addAddress(Address address) {
        Integer type = address.getType();
        if(type == DEFAULT_STATUS) {
            setNotDefaultAddress(address.getUserId());
        }
        addressRepository.addAddress(address);
    }

    /**
     * 查询地址
     * @param userId
     * @return
     */
    @Override
    public List<Address> getUserAddresses(int userId) {
        return addressRepository.getUserAddresses(userId);
    }

    /**
     * 删除地址
     * @param addressId
     */
    @Override
    public void deleteAddress(Integer addressId) {
        addressRepository.deleteAddress(addressId);
    }

    /**
     * 设置默认地址，选中的地址type设置1
     * @param id
     */
    @Override
    public void makeDefaultAddress(Integer id) {
        addressRepository.makeDefaultAddress(id);
    }

    /**
     * 取消user的默认收货地址
     * @param userId
     */
    @Override
    public void setNotDefaultAddress(Integer userId) {
        addressRepository.setNotDefaultAddress(userId);
    }
}
