package cn.massz.dao;

import cn.massz.model.Bar;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BarMapper {
    @Select("select bar_id barId,bar_name barName from bar order by bar_name")
    List<Bar> getBarAll();

    @Select("select bar_id barId,bar_name barName from bar where bar_name = #{barName}")
    List<Bar> getBarByName(String barName);
}
