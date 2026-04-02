package com.imooc.bilibili.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

public class TagSuggestRequest {

    @NotBlank(message = "description不能为空")
    private String description;

    @Min(value = 1, message = "maxTags最小为1")
    @Max(value = 20, message = "maxTags最大为20")
    private Integer maxTags = 10;

    /**
     * 固定关键词风格
     */
    private String style = "keyword";

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getMaxTags() {
        return maxTags;
    }

    public void setMaxTags(Integer maxTags) {
        this.maxTags = maxTags;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
