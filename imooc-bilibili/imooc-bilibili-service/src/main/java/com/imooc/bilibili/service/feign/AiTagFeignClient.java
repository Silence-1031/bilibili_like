package com.imooc.bilibili.service.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

@FeignClient(
        name = "imooc-bilibili-ai-tag",
        url = "${ai.tag.service.url}"
)
public interface AiTagFeignClient {

    @PostMapping("/internal/ai/tags/suggest")
    Map<String, Object> suggest(@RequestBody Map<String, Object> request);
}
