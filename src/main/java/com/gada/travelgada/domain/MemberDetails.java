package com.gada.travelgada.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class MemberDetails implements UserDetails, OAuth2User{
	
	private Map<Integer, Integer> cart = new HashMap<>();
	private int planner_id;
	private MemberVO member;
	private Map<String, Object> attributes;
	
	public Map<Integer, Integer> getCart() {
		return cart;
	}
	
	public void insertIntoCart(ProductVO product) {
		int product_id = product.getProduct_id();
		if(cart.get(product_id) == null) {
			cart.put(product_id, 1);
		} else {
			cart.put(product_id, cart.get(product_id) + 1);
		}
	} 
	
	public void setPlanner_id(int planner_id) {
		this.planner_id = planner_id;
	}
	
	public int getPlanner_id() {
		return planner_id;
	}
	
	public MemberDetails(MemberVO member) {
		this.member = member;
	}
	
	public MemberDetails(MemberVO member, Map<String, Object> attributes) {
		this.member = member;
		this.attributes = attributes;
	}

	@Override
	public Map<String, Object> getAttributes() { 
		return attributes;
	}

	@Override
	public String getName() {
		return null;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (AuthVO auth : member.getAuthList()) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuthority()));
		}
		
		return authorities;
	}

	@Override
	public String getPassword() {
		return member.getPw();
	}

	@Override
	public String getUsername() {
		return member.getMember_id();
	}
	
	public String getProfile() {
		return member.getProfile_img_path();
	}
	
	public void setProfile(String profile_img_path) {
		member.setProfile_img_path(profile_img_path);
	}
	
	public boolean canAccess() {
		if(member.getWithdrawal_flag() == 0) {
			return true;
		} else {
			return false;
		}
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
		return true;
	}

}
 