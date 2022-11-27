package cn.massz.dao;


import cn.massz.model.PostImg;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface PostImgMapper {
    @Insert("insert into post_img(pic_name,post_id) values(#{picName},#{postId})")
    int insertPostImg(PostImg postImg);
}
