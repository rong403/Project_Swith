package kh.team2.swith.member.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kh.team2.swith.member.model.service.MemberService;
import kh.team2.swith.member.util.MessageUtils;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	private String member_id;
    private String member_pwd;
    private String ERRORMSG;
    private String defaultFailureUrl;
	
    @Autowired
    private MemberService memberService;
    
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String username = request.getParameter(member_id);
        String password = request.getParameter(member_pwd);
        String errormsg = exception.getMessage();
        System.out.println("#######################1");
		System.out.println(username);
        if(exception instanceof BadCredentialsException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof DisabledException) {
            errormsg = MessageUtils.getMessage("error.Disaled");
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = MessageUtils.getMessage("error.CredentialsExpired");
        }
        
        request.setAttribute(member_id, username);
        request.setAttribute(member_pwd, password);
        request.setAttribute(ERRORMSG, errormsg);
 
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
	
	protected void loginFailureCount(String username) {
		memberService.countFailure(username);
        int cnt = memberService.checkFailureCount(username);
        if(cnt==3) {
        	memberService.disabledUsername(username);
        }
    }
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getERRORMSG() {
		return ERRORMSG;
	}

	public void setERRORMSG(String eRRORMSG) {
		ERRORMSG = eRRORMSG;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
}
