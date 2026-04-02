package com.imooc.bilibili.dto;

import java.util.List;

public class TagSuggestResponse {

    private List<String> tags;

    public TagSuggestResponse() {
    }

    public TagSuggestResponse(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}
