package com.baizhi.service;

import com.baizhi.entrty.Guru;

import java.util.List;

public interface GuruService extends BaseService<Guru> {

    List<Guru> findAll();
}


