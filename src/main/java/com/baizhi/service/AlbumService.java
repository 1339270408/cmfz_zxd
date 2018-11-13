package com.baizhi.service;

import com.baizhi.entrty.Album;

import java.util.List;

public interface AlbumService extends BaseService<Album>{

    List<Album> findAll();

}
