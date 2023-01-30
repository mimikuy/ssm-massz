package cn.massz.service;

import cn.massz.model.Bar;
import cn.massz.model.History;
import cn.massz.model.Posts;
import cn.massz.model.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyService {

    List<Users> findFollow(Integer userId);

    List<Users> findFans(Integer userId);

    List<Bar> findBar(Integer userId);

    History findHistory(Integer post_id,Integer user_id);

    int insertHistory(Integer post_id,Integer user_id);

    Boolean updateHistory(Integer post_id,Integer user_id);

    List<Posts> findHistoryById(Integer user_id);

    List<Posts> findAllCollection(@Param("user_id") Integer user_id);


}
