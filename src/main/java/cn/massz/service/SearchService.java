package cn.massz.service;

import cn.massz.model.Bar;

import java.util.List;

public interface SearchService {
    List<Bar> searchByName(Bar bar);
}
