package cn.massz.dao;

import cn.massz.model.Users;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    Users findByName(Users users);

    Boolean upDateMI(Users users);

    Users findById(Integer id);

    Boolean updateImg(Users users);

    // 根据用户名查询用户信息
    Users findUsersByUserName(String user_name);
    // 新增
    int insertUsers(Users users);


    Users findUserInfo(Integer user_id);

    Users findUserInformation(Integer user_id);
}
