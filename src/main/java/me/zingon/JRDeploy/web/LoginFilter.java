package me.zingon.JRDeploy.web;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ZTC on 12/5/2016.
 */
public class LoginFilter implements Filter{
    List<String> ignoreList = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ignoreList= Arrays.asList(filterConfig.getInitParameter("ignoreList").split(","));
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest) request;
        HttpServletResponse resp= (HttpServletResponse) response;
        HttpSession session=req.getSession(true);
        String uri=req.getRequestURI();
        String u= (String) session.getAttribute("user");
        if(isIgnored(uri)){
            chain.doFilter(request,response);
            return;
        }
        if(u==null) {
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
            return;
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }

    private boolean isIgnored(String uri) {
        for (String ignore : ignoreList) {
            if (uri.contains(ignore)) {
                return true;
            }
        }
        return false;
    }
}
