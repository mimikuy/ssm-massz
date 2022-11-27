package cn.massz.service.impl;

import cn.massz.dao.PostImgMapper;
import cn.massz.dao.PostMapper;
import cn.massz.model.PostImg;
import cn.massz.service.PostImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostImgServiceImpl implements PostImgService {
    @Autowired
    private PostImgMapper mapper;

    public int insertPostImg(PostImg postImg){
        return mapper.insertPostImg(postImg);
    };
}
