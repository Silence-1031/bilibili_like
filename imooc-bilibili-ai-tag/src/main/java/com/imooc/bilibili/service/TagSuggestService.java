package com.imooc.bilibili.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.imooc.bilibili.util.TagSanitizer;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class TagSuggestService {

    private final ChatClient chatClient;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public TagSuggestService(ChatClient chatClient) {
        this.chatClient = chatClient;
    }

    public List<String> suggestTags(String description, int maxTags) {
        String systemPrompt = """
                你是一个短视频平台的标签生成助手。
                你的任务是根据视频描述，提取适合作为站内搜索和内容分类的关键词标签。
                                
                输出要求：
                1. 只输出严格 JSON，格式必须是：{"tags":["标签1","标签2","标签3"]}
                2. 不要输出 markdown
                3. 不要输出解释
                4. 不要输出多余字段
                5. 标签必须是关键词风格，不是句子风格
                6. 每个标签尽量简短，建议 2 到 8 个字
                7. 标签应聚焦主题、技术点、领域词、场景词
                8. 禁止输出无意义泛词，例如：视频、作品、分享、记录、精彩、推荐
                9. 禁止输出完整句子
                10. 标签不要重复
                11. 标签数量不要超过用户要求
                                
                示例：
                输入描述：今天讲解 Java 并发编程中的线程池、Future 和 CompletableFuture
                正确输出：{"tags":["Java","并发编程","线程池","Future","CompletableFuture"]}
                """;

        String userPrompt = """
                视频描述：
                %s
                                
                请生成不超过 %d 个关键词标签。
                """.formatted(description, maxTags);

        String content = chatClient.prompt()
                .system(systemPrompt)
                .user(userPrompt)
                .call()
                .content();

        List<String> rawTags = parseTags(content);
        return TagSanitizer.sanitize(rawTags, maxTags);
    }

    private List<String> parseTags(String content) {
        if (content == null || content.trim().isEmpty()) {
            return Collections.emptyList();
        }

        try {
            JsonNode root = objectMapper.readTree(content);
            JsonNode tagsNode = root.get("tags");
            List<String> list = new ArrayList<>();

            if (tagsNode != null && tagsNode.isArray()) {
                for (JsonNode node : tagsNode) {
                    if (node.isTextual()) {
                        list.add(node.asText());
                    }
                }
            }
            return list;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }
}
