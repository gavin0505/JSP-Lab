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

    @Override
    public void addAddress(Address address) {
        addressRepository.addAddress(address);
    }

    @Override
    public List<Address> getUserAddresses(int userId) {
        return addressRepository.getUserAddresses(userId);
    }

    @Override
    public void deleteAddress(Integer addressId) {
        addressRepository.deleteAddress(addressId);
    }

    @Override
    public void makeDefaultAddress(Address address) {
        addressRepository.makeDefaultAddress(address);
    }
}
