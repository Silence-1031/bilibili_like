package com.imooc.bilibili.service;

import com.imooc.bilibili.service.feign.AiTagFeignClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AiTagService {

    @Autowired
    private AiTagFeignClient aiTagFeignClient;

    @SuppressWarnings("unchecked")
    public List<String> suggestTags(String description, int maxTags) {
        try {
            Map<String, Object> request = new HashMap<>();
            request.put("description", description);
            request.put("maxTags", maxTags);
            request.put("style", "keyword");

            Map<String, Object> response = aiTagFeignClient.suggest(request);
            Object tagsObject = response.get("tags");

            if (tagsObject instanceof List) {
                return (List<String>) tagsObject;
            }
        } catch (Exception e) {
            // 生产环境建议记录日志
        }

        return Collections.emptyList();
    }
}
