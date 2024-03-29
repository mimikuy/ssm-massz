package cn.massz.service.impl;

import cn.massz.dao.SearchMapper;
import cn.massz.model.Bar;
import cn.massz.model.Posts;
import cn.massz.service.SearchService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchMapper searchMapper;

    public List<Bar> searchByName(Bar bar) {
        return searchMapper.searchByName(bar);
    }

    public Bar toByBarName(String barName) {
        return searchMapper.toByBarName(barName);
    }

    public List<Posts> getAllPostsByBarName(String barName) {
        return searchMapper.getAllPostsByBarName(barName);
    }

    public int insertFollowBar(Integer barId,Integer user_id) {
        return searchMapper.insertFollowBar(barId,user_id);
    }

        public Boolean selfolbar(String barName, Integer user_id) {
        return searchMapper.selfolbar(barName,user_id);
    }
}
