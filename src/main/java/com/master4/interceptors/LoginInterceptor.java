package com.master4.interceptors;
import com.master4.entities.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle (HttpServletRequest request, HttpServletResponse response,  Object handler) throws Exception {

        //Not implemented for this project !!!
        RequestMapping requestMapping = ((HandlerMethod) handler).getMethodAnnotation(RequestMapping.class);
        User sessionUser = (User) request.getSession().getAttribute("ConnectedUser");
        //check user logged
        boolean alreadyLoggedIn = request.getSession() .getAttribute("ConnectedUser") != null;
        boolean loginPageRequested = requestMapping != null && requestMapping.value().length > 0 && "login".equals(requestMapping.value()[0] ) && "register".equals(requestMapping.value()[0] );

        if (alreadyLoggedIn && loginPageRequested) {
            response.sendRedirect(request.getRequestURI());
            return false;
        } else if (!alreadyLoggedIn && !loginPageRequested) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        return true;
    }
}
