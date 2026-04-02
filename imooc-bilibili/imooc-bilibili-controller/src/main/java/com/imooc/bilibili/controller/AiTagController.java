package com.imooc.bilibili.controller;

import com.imooc.bilibili.domain.JsonResponse;
import com.imooc.bilibili.service.AiTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class AiTagController {

    @Autowired
    private AiTagService aiTagService;

    @PostMapping("/ai/video-tags")
    public JsonResponse<Map<String, Object>> suggestVideoTags(@RequestBody Map<String, Object> body) {
        String description = String.valueOf(body.getOrDefault("description", "")).trim();

        int maxTags = 10;
        Object maxTagsObj = body.get("maxTags");
        if (maxTagsObj != null) {
            try {
                maxTags = Integer.parseInt(String.valueOf(maxTagsObj));
            } catch (Exception ignored) {
            }
        }

        List<String> tags = aiTagService.suggestTags(description, maxTags);

        Map<String, Object> result = new HashMap<>();
        result.put("tags", tags);

        return new JsonResponse<>(result);
    }
}
