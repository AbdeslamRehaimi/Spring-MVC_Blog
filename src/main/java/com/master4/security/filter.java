package com.master4.security;

import com.master4.entities.User;
import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/MonFilter")
public class filter implements Filter {

    private static final Logger logger = Logger.getLogger(filter.class.getName());
    private FilterConfig filterConfig ;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req1 = (HttpServletRequest) request;
        HttpServletResponse res1 = (HttpServletResponse) response;
        
        User sessionUser = (User) req1.getSession().getAttribute("User");
        String currentPath = req1.getRequestURL().toString();
        String webOrigen = req1.getServletPath();
        System.out.println("URL Mapping by Filter: "+currentPath);
        //resp.sendRedirect(req.getContextPath() + "/");
        if (sessionUser != null) {
            if (currentPath.contains("SecurityAuthetification-war/index.jsf")) {
                res1.sendRedirect(req1.getContextPath() + "/home.jsf");
            } else if (currentPath.contains("SecurityAuthetification-war/login.jsf"))  {
                res1.sendRedirect(req1.getContextPath() + "/home.jsf");
            } else if (currentPath.contains("SecurityAuthetification-war/register.jsf"))  {
                res1.sendRedirect(req1.getContextPath() + "/home.jsf");
            } else {
                chain.doFilter(request, response);
                logger.info("\npasa por AuthFilter chain.doFilter\n");
            }
        } else {
            if (currentPath.contains("home.jsf") || webOrigen.startsWith("/*")) {
                res1.sendRedirect(req1.getContextPath() + "/index.jsf");
            } else {
                chain.doFilter(request, response);
            }
        }

    }

    @Override
    public void destroy() {
        this.filterConfig = null;
    }

}
