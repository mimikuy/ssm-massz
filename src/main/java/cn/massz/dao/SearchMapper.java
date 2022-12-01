package cn.massz.dao;

import cn.massz.model.Bar;
import cn.massz.model.Posts;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SearchMapper {
    List<Bar> searchByName(Bar bar);

    Bar toByBarName(String barName);

    List<Posts> getAllPostsByBarName(String barName);
}
