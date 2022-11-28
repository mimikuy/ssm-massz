package cn.massz.dao;

import cn.massz.model.Bar;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SearchMapper {
    List<Bar> searchByName(Bar bar);

}
