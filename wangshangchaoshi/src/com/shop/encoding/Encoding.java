package com.shop.encoding;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class Encoding
 */
@WebFilter("/Encoding")
public class Encoding implements Filter {
	private FilterConfig filterconfig = null;
	private String encoding = null;
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.filterconfig=fConfig;
		this.encoding=filterconfig.getInitParameter("encoding");
		
	}
    /**
     * Default constructor. 
     */
    public Encoding() {
        // TODO Auto-generated constructor stub
    }
    public String getEncoding(){
    	return this.encoding;
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

			String encoding = getEncoding();
			response.setCharacterEncoding("utf-8");
				request.setCharacterEncoding("utf-8"); 
			response.setContentType(encoding);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */


}
