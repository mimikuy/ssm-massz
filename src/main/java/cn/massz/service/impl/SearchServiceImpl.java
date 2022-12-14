package cn.massz.service.impl;

import cn.massz.dao.SearchMapper;
import cn.massz.model.Bar;
import cn.massz.service.SearchService;
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
}
