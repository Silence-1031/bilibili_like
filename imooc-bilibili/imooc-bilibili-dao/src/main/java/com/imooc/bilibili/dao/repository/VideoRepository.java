package com.imooc.bilibili.dao.repository;

import com.imooc.bilibili.domain.Video;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface VideoRepository extends ElasticsearchRepository<Video, Long> {

    /**
     * 搜索视频
     * @param keyword
     * @return
     */
    Video findByTitleLike(String keyword);

    /**
     * 搜索视频
     * @param titleKeyword
     * @param DescriptionKeyword
     * @return
     */
    long countByTitleOrDescription(String titleKeyword, String DescriptionKeyword);

    /**
     * 分页搜索视频
     * @param title
     * @param description
     * @param pageRequest
     * @return
     */
    Page<Video> findByTitleOrDescriptionOrderByViewCountDesc(String title, String description,
                                                             PageRequest pageRequest);
    /**
      * 分页搜索视频
      * @param title
      * @param description
      * @param pageRequest
      * @return
      */
    Page<Video> findByTitleOrDescriptionOrderByCreateTimeDesc(String title, String description,
                                                              PageRequest pageRequest);

    Page<Video> findByTitleOrDescriptionOrderByDanmuCountDesc(String title, String description,
                                                              PageRequest pageRequest);
}
