package com.baizhi.dao;

import com.baizhi.entrty.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDAO<T> {
    void insert(T t);
    void delete(String id);
    void update(T t);
    T queryByid(String id);
    T queryLogin(T t);
    List<T> queryAll();

    List<T> queryPage(@Param("start") Integer start, @Param("rows") Integer rows);
    Long total();

    T queryUsername(User user);
    T queryPassword(User user);

}
