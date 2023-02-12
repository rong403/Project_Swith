package kh.team2.swith.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kh.team2.swith.member.model.dao.MemberAuthDao;
import kh.team2.swith.member.model.vo.CustomMemberDetails;

public class CustomMemberDetailsService implements UserDetailsService{
	
	@Autowired
    private MemberAuthDao userAuthDAO;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomMemberDetails user = userAuthDAO.getUserById(username);
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        return user;
    }
}
