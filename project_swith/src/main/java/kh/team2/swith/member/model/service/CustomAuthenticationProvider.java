package kh.team2.swith.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import kh.team2.swith.member.model.vo.CustomMemberDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	private UserDetailsService userDeSer;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		CustomMemberDetails user = (CustomMemberDetails) userDeSer.loadUserByUsername(username);
		
		
		//계정비활성 체크
		if(!user.isEnabled()||user.isCredentialsNonExpired()) {
			throw new AuthenticationCredentialsNotFoundException(username);
		}
		//패스워드 체크
		if(!matchPassword(password, user.getPassword())) {
			throw new BadCredentialsException(username);
		}
		

		return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	}

	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
