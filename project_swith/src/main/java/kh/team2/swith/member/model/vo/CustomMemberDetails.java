package kh.team2.swith.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Component
public class CustomMemberDetails implements UserDetails{

	private String member_id;
	private String member_pwd;
	private String member_name;
	private String email;
	private String hnd_no;
	private String post_no;
	private String add1;
	private String add2;
	private String agree1;
	private String agree2;
	private String agree3;
	private String member_auth;
	private boolean enabled;
	private Date status_date;
	
	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(member_auth));
        return auth;
    }
 
    @Override
    public String getPassword() {
        return member_pwd;
    }
 
    @Override
    public String getUsername() {
        return member_id;
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
        return enabled;
    }

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHnd_no() {
		return hnd_no;
	}

	public void setHnd_no(String hnd_no) {
		this.hnd_no = hnd_no;
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getAgree1() {
		return agree1;
	}

	public void setAgree1(String agree1) {
		this.agree1 = agree1;
	}

	public String getAgree2() {
		return agree2;
	}

	public void setAgree2(String agree2) {
		this.agree2 = agree2;
	}

	public String getAgree3() {
		return agree3;
	}

	public void setAgree3(String agree3) {
		this.agree3 = agree3;
	}

	public Date getStatus_date() {
		return status_date;
	}

	public void setStatus_date(Date status_date) {
		this.status_date = status_date;
	}
    
}
