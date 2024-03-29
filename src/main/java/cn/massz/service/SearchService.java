package cn.massz.service;

import cn.massz.model.Bar;
import cn.massz.model.Posts;

import java.util.List;

public interface SearchService {
    List<Bar> searchByName(Bar bar);

    Bar toByBarName(String barName);

    List<Posts> getAllPostsByBarName(String barName);

    int insertFollowBar(Integer barId, Integer user_id);

    Boolean selfolbar(String barName, Integer user_id);
}
