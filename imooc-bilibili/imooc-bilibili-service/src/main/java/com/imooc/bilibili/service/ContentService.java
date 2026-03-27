package com.imooc.bilibili.service;

import com.imooc.bilibili.dao.ContentDao;
import com.imooc.bilibili.domain.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContentService {

    @Autowired
    private ContentDao contentDao;
    public Long addContent(Content content) {
        Long id = contentDao.addContent(content);
        content.setId(id); // 将返回的ID设置到content对象
        return id;
    }
}
