package cn.massz.service.impl;

import cn.massz.dao.MyMapper;
import cn.massz.model.Bar;
import cn.massz.model.History;
import cn.massz.model.Posts;
import cn.massz.model.Users;
import cn.massz.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyServiceImpl implements MyService {
    @Autowired
    private MyMapper myMapper;

    public List<Users> findFollow(Integer userId) {
        return myMapper.findFollow(userId);
    }

    public List<Users> findFans(Integer userId) {
        return myMapper.findFans(userId);
    }

    public List<Bar> findBar(Integer userId) {
        return myMapper.findBar(userId);
    }

    public History findHistory(Integer post_id, Integer user_id) {
        return myMapper.findHistory(post_id, user_id);
    }

    public int insertHistory(Integer post_id, Integer user_id) {
        return myMapper.insertHistory(post_id, user_id);
    }

    public Boolean updateHistory(Integer post_id, Integer user_id) {
        return myMapper.updateHistory(post_id, user_id);
    }

    public List<Posts> findHistoryById(Integer user_id) {
        return myMapper.findHistoryById(user_id);
    }

    public List<Posts> findAllCollection(Integer user_id) {
        return myMapper.findAllCollection(user_id);
    }


}
