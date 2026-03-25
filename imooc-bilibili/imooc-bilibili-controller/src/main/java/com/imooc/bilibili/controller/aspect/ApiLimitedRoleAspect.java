package com.imooc.bilibili.controller.aspect;

import com.imooc.bilibili.controller.support.UserSupport;
import com.imooc.bilibili.domain.annotation.ApiLimitedRole;
import com.imooc.bilibili.domain.auth.UserRole;
import com.imooc.bilibili.domain.exception.ConditionException;
import com.imooc.bilibili.service.UserRoleService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
/*
这段代码定义了一个名为 ApiLimitedRole 的自定义注解，用于限制特定角色访问方法。
用途：开发者可以在 Controller 层或 Service 层的方法上使用 @ApiLimitedRole。
功能：通过指定 limitedRoleCodeList 属性，可以限制只有特定角色才能调用该方法。
实现原理：结合 Spring AOP（面向切面编程），在方法执行前拦截请求，读取注解中的角色列表，判断当前登录用户的角色是否在列表中，从而决定是否放行。
*/

@Order(1)  // 优先级最高，最先执行
@Component
@Aspect
public class ApiLimitedRoleAspect {

    @Autowired
    private UserSupport userSupport;

    @Autowired
    private UserRoleService userRoleService;

    // 定义切点：匹配所有使用了 @ApiLimitedRole 注解的方法
    @Pointcut("@annotation(com.imooc.bilibili.domain.annotation.ApiLimitedRole)")
    public void check(){
    }

    // 前置通知：在目标方法执行前执行
    @Before("check() && @annotation(apiLimitedRole)")
    public void doBefore(JoinPoint joinPoint, ApiLimitedRole apiLimitedRole){
        // 步骤 1：从 ThreadLocal 获取当前登录用户的 ID
        Long userId = userSupport.getCurrentUserId();
        // 步骤 2：查询用户的所有角色
        List<UserRole> userRoleList = userRoleService.getUserRoleByUserId(userId);
        // 步骤 3：从注解中获取受限的角色编码列表
        String[] limitedRoleCodeList = apiLimitedRole.limitedRoleCodeList();
        Set<String> limitedRoleCodeSet = Arrays.stream(limitedRoleCodeList).collect(Collectors.toSet());
        // 步骤 4：提取用户的角色编码集合
        Set<String> roleCodeSet = userRoleList.stream().map(UserRole::getRoleCode).collect(Collectors.toSet());
        // 步骤 5：取交集（如果用户的角色在受限列表中，说明没有权限）
        roleCodeSet.retainAll(limitedRoleCodeSet);
        // 步骤 6：判断是否有权限 如果交集为空，说明用户有权限，继续执行目标方法
        if(roleCodeSet.size() > 0){
            throw new ConditionException("权限不足！");
        }
    }
}
