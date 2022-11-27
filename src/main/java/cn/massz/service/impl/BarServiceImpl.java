package cn.massz.service.impl;

import cn.massz.dao.BarMapper;
import cn.massz.model.Bar;
import cn.massz.service.BarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BarServiceImpl implements BarService {

    @Autowired
    private BarMapper mapper;

    public List<Bar> getBarAll() {
        return mapper.getBarAll();
    }
}
