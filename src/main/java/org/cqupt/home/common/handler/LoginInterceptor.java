//package org.cqupt.home.common.handler;
//
//import org.cqupt.home.model.Users;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class LoginInterceptor implements HandlerInterceptor {
//
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        HttpSession session = request.getSession();
//        Users u = (Users) session.getAttribute("users");
//        String url = request.getRequestURI();
//        if (url.indexOf("/login") >= 0) {
//            return true;
//        }
//        if (url.indexOf("/subLogin") >= 0) {
//            return true;
//        }
//        if (u == null) {
//            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//            return false;
//        }
//        return true;
//    }
//    //返回modelAndView之前执行
//
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//
//        // System.out.println("postHandle");
//    }
//    //执行Handler完成执行此方法
//
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//
////        System.out.println("afterCompletion");
//    }
//}