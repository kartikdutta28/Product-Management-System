package com.example.demo.security;

import java.io.IOException;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler{

    @Autowired HttpSession session; //autowiring session

    @Autowired
    com.example.demo.dao.UsersRepository repository; //autowire the user repo


    private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
    	
    	Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
    	 
        if (roles.contains("ROLE_ADMIN")) {
            response.sendRedirect("/adminHome");
        } else {
            response.sendRedirect("/tempUserHome");
        }
        MyUserDetails userName;
        String name="";
        int id=0;
        if(authentication.getPrincipal() instanceof MyUserDetails) {
            userName = (MyUserDetails) authentication.getPrincipal();
            name=userName.getEmail();
            id=userName.getId();
        }
        logger.info("user: " + name+" logged In");
        //HttpSession session = request.getSession();
        session.setAttribute("userMail", name);
        session.setAttribute("userId", id);

    }

}
