package com.master4.AOP;

import com.master4.controllers.ArticleController;
import com.master4.controllers.TagController;
import com.master4.controllers.UserController;
import com.master4.services.UserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Aspect
@Component
public class AspectManager {

    @Autowired
    private UserController userController;

    @Autowired
    private TagController tagController;

    @Autowired
    private ArticleController articleController;

    HttpSession session;


    @Around("execution(* com.master4.controllers.ArticleController.delete(..)) || execution(* com.master4.controllers.ArticleController.add(..)) || execution(* com.master4.controllers.ArticleController.saveArticle(..)) ")
    public String ArticleFilter(ProceedingJoinPoint jp) throws Throwable {
        Object[] args = jp.getArgs();
        if (session.getAttribute("role") != null) {
            String role = (String) session.getAttribute("role");
            if (!role.contains("Admin") && !role.contains("Writer")) {
                System.err.println("No permission for you!");
                session.setAttribute("Error", "Ssory no permission for you!");
            } else
                jp.proceed();
        } else {
            return articleController.redirect("article");
        }
        return userController.redirect("");
    }


    @Around("execution(* com.master4.controllers.UserController.delete(..)) || execution(* com.master4.controllers.UserController.add(..)) || execution(* com.master4.controllers.UserController.edit(..)) || execution(* com.master4.controllers.UserController.saveUser(..))")
    public String UserFilter(ProceedingJoinPoint jp) throws Throwable {
        Object[] args = jp.getArgs();
        if (session.getAttribute("role") != null) {
            String role = (String) session.getAttribute("role");
            if (!role.contains("Admin")) {
                System.err.println("No permission for you!");
                session.setAttribute("Error", "Ssory no permission for you!");
            } else
                jp.proceed();
        } else {
            return articleController.redirect("article");
        }
        return userController.redirect("");
    }

    @Around("execution(* com.master4.controllers.TagController.delete(..)) || execution(* com.master4.controllers.TagController.add(..)) || execution(* com.master4.controllers.TagController.saveTag(..)) ")
    public String TagFilter(ProceedingJoinPoint jp) throws Throwable {
        Object[] args = jp.getArgs();
        if (session.getAttribute("role") != null) {
            String role = (String) session.getAttribute("role");
            if (!role.contains("Admin") && !role.contains("Writer")) {
                System.err.println("No permission for you!");
                session.setAttribute("Error", "Ssory no permission for you!");
            } else
                jp.proceed();
        } else {
            return articleController.redirect("article");
        }
        return userController.redirect("");
    }





}

