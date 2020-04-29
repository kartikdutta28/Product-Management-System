package com.example.demo.security;

import com.example.demo.model.Users;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.demo.model.Users;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class MyUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	private String username;
    private String password;
    private boolean active;
    private String email;
    private int id;
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	private List<GrantedAuthority> authorities;

    public MyUserDetails(Users user){
        this.username=user.getUsername();
        this.password=user.getPassword();
        this.active=user.isActive();
        this.email=user.getEmail();
        this.id= user.getId();
        this.authorities=Arrays.stream(user.getRole().split(",")).map(SimpleGrantedAuthority::new)
        .collect(Collectors.toList());
        
    }
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public MyUserDetails(){

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
