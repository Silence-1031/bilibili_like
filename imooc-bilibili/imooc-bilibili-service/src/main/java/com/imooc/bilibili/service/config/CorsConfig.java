package com.imooc.bilibili.service.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 跨域解决配置
 *
 * 跨域概念：
 *      出于浏览器的同源策略限制，同源策略会阻止一个域的javascript脚本和另外一个域的内容进行交互。
 *      所谓同源就是指两个页面具有相同的协议（protocol），主机（host）和端口号（port）
 *
 * 非同源的限制：
 *  【1】无法读取非同源网页的 Cookie、LocalStorage 和 IndexedDB
 *  【2】无法接触非同源网页的 DOM
 *  【3】无法向非同源地址发送 AJAX 请求
 *
 *  spingboot解决跨域方案：CORS 是跨域资源分享（Cross-Origin Resource Sharing）的缩写。
 *  它是 W3C 标准，属于跨源 AJAX 请求的根本解决方法。
 *
 *
 *  Filter是用来过滤任务的，既可以被使用在请求资源，也可以是资源响应，或者二者都有
 *  Filter使用doFilter方法进行过滤
 */
@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*") // 这里必须用这个！
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .exposedHeaders("*", "Accept-Ranges", "Content-Range", "Content-Type", "Content-Disposition")
                .allowCredentials(false) // 视频播放必须关闭！
                .maxAge(3600);
    }
}
