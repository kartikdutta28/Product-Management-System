package com.example.demo.security;

import com.example.demo.dao.UsersRepository;
import com.example.demo.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    UsersRepository userRepository;
    HttpServletRequest request;
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Optional<Users> user=userRepository.findByUsername(s);
        user.orElseThrow(()->new UsernameNotFoundException("Not Found " +s));
        @SuppressWarnings("unused")
		MyUserDetails user1=user.map(MyUserDetails::new).get();
        return user.map(MyUserDetails::new).get();

    }
}
