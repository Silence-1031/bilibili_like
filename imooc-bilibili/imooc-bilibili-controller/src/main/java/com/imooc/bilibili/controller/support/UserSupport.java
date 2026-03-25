package com.imooc.bilibili.controller.support;

import com.imooc.bilibili.domain.exception.ConditionException;
import com.imooc.bilibili.service.UserService;
import com.imooc.bilibili.service.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Component
public class UserSupport {

    @Autowired
    private UserService userService;

    public Long getCurrentUserId() {
        // 步骤 1：从请求头获取 Access Token
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();

        // 步骤 2：验证 Access Token 是否有效，获取 userId
        String token = request.getHeader("token");
        Long userId = TokenUtil.verifyToken(token);
        if(userId < 0) {
            throw new ConditionException("非法用户");
        }

        // 步骤 3：二次验证 Refresh Token（关键！）
        this.verifyRefreshToken(userId);
        return userId;
    }

    //验证refresh token
    private void verifyRefreshToken(Long userId){
        // 1. 从请求头获取前端传来的 Refresh Token
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        // 2. 从数据库查询存储的 Refresh Token
        String refreshToken = requestAttributes.getRequest().getHeader("refreshToken");
        String dbRefreshToken = userService.getRefreshTokenByUserId(userId);

        // 3. 验证 Refresh Token 是否匹配
        if(!dbRefreshToken.equals(refreshToken)){
            throw new ConditionException("非法用户！");
        }
    }


}
