package com.imooc.bilibili.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

public class TagSanitizer {

    /**
     * 允许中文、英文、数字、下划线、短横线
     * 长度控制在 1~20
     */
    private static final Pattern ALLOW_PATTERN =
            Pattern.compile("^[\\p{IsHan}a-zA-Z0-9_-]{1,20}$");

    public static List<String> sanitize(List<String> rawTags, int maxTags) {
        if (rawTags == null || rawTags.isEmpty()) {
            return Collections.emptyList();
        }

        Set<String> result = new LinkedHashSet<>();

        for (String item : rawTags) {
            if (item == null) {
                continue;
            }

            String tag = item.trim();
            if (tag.isEmpty()) {
                continue;
            }

            // 去掉常见前后缀符号
            tag = tag.replaceAll("^[#\\s\"'“”‘’]+", "");
            tag = tag.replaceAll("[#\\s\"'“”‘’,.，;；]+$", "");

            // 去掉内部多余空格
            tag = tag.replaceAll("\\s+", "");

            // 过滤明显不适合做关键词的长句
            if (tag.length() > 20) {
                continue;
            }

            // 白名单过滤
            if (!ALLOW_PATTERN.matcher(tag).matches()) {
                continue;
            }

            result.add(tag);

            if (result.size() >= maxTags) {
                break;
            }
        }

        return new ArrayList<>(result);
    }

    private TagSanitizer() {
    }
}
