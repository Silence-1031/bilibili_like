package com.imooc.bilibili.controller;

import com.imooc.bilibili.dto.TagSuggestRequest;
import com.imooc.bilibili.dto.TagSuggestResponse;
import com.imooc.bilibili.service.TagSuggestService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/internal/ai/tags")
public class AiTagController {

    private final TagSuggestService tagSuggestService;

    public AiTagController(TagSuggestService tagSuggestService) {
        this.tagSuggestService = tagSuggestService;
    }

    @PostMapping("/suggest")
    public TagSuggestResponse suggest(@RequestBody @Valid TagSuggestRequest request) {
        List<String> tags = tagSuggestService.suggestTags(
                request.getDescription(),
                request.getMaxTags()
        );
        return new TagSuggestResponse(tags);
    }
}
