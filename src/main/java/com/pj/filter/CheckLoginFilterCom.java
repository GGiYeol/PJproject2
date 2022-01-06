package com.pj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pj.domain.community.CommunityFreeMemberVO;

/**
 * Servlet Filter implementation class CheckLoginFilterCom
 */
public class CheckLoginFilterCom implements Filter {

    /**
     * Default constructor. 
     */
    public CheckLoginFilterCom() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		CommunityFreeMemberVO vo = (CommunityFreeMemberVO) session.getAttribute("loggedInMember");
		
		if (vo == null) {
			// 없으면 /member/login 으로 redirect
			String location = req.getContextPath() + "/community/communityMember/community_login";
			
			HttpServletResponse res = (HttpServletResponse) response;
			res.sendRedirect(location);
			
		} else {
			// 있으면(로그인된 상태이면)
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
