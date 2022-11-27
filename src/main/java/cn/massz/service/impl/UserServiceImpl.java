package cn.massz.service.impl;

import cn.massz.dao.UserMapper;
import cn.massz.model.Users;
import cn.massz.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;


    public Users findByName(Users users) {
        return mapper.findByName(users);
    }

    public Boolean upDateMI(Users users) {
        return mapper.upDateMI(users);
    }

     public Users findById(Integer id){
        return mapper.findById(id);
     }

    public Boolean updateImg(Users users) {

        return mapper.updateImg(users);

    }

    public Users findUsersByUserName(String user_name) {
        return mapper.findUsersByUserName(user_name);
    }

    public int insertUsers(Users users) {
        return mapper.insertUsers(users);
    }
}
