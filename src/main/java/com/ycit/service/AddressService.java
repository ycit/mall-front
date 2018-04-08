package com.ycit.service;

import com.ycit.bean.modal.Address;
import com.ycit.bean.modal.User;
import com.ycit.mapper.AddressMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 配送地址业务层
 *
 * @author xlch
 * @Date 2018-04-08 11:49
 */
@Service
public class AddressService {

    private AddressMapper addressMapper;

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setAddressMapper(AddressMapper addressMapper) {
        this.addressMapper = addressMapper;
    }

    public Address findById(int id) {
        return addressMapper.findById(id);
    }

    public Address insert(Address address) {
        addressMapper.insert(address);
        return this.findById(address.getId());
    }

    public int updateById(Address address) {
        return addressMapper.updateById(address);
    }

    public List<Address> findByUserId(int userId) {
        return addressMapper.findByUserId(userId);
    }

    public int updateDefault(int id, int statusBef, int statusAft) {
        return addressMapper.updateDefualtAddrById(id);
    }

    public int deleteById(int id) {
        return addressMapper.deleteById(id);
    }

    public int doUpdateDefault(int id) {
        User user = userService.getCurrent();
        addressMapper.updateDefualtAddrByUser(user.getId());
        return addressMapper.updateDefualtAddrById(id);
    }
}
