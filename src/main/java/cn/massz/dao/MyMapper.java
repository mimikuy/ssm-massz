package cn.massz.dao;

import cn.massz.model.Bar;
import cn.massz.model.History;
import cn.massz.model.Posts;
import cn.massz.model.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyMapper {

    List<Users> findFollow(Integer userId);

    List<Users> findFans(Integer userId);

    List<Bar> findBar(Integer userId);

    int insertHistory(Integer post_id,Integer user_id);

    Boolean updateHistory(Integer post_id,Integer user_id);

    History findHistory(Integer post_id, Integer user_id);

    List<Posts> findHistoryById(Integer user_id);

    List<Posts> findAllCollection(@Param("user_id") Integer user_id);


}
