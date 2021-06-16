package egovframework.example.board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;


@Aspect
public class Advice{
	BoardVO boardVO = null;

	@Pointcut("execution(* egovframework.example..web.*Controller.*(..))")
	private void test(){}

	@Around(value="test()")
	public Object trace(ProceedingJoinPoint joinPoint
						) throws Throwable{
	
		HttpServletRequest request= null;
			for(Object o:joinPoint.getArgs()){
				if(o instanceof HttpServletRequest){
					request = (HttpServletRequest) o;
				}
			}
			
		if(request!= null){
			String strUrl = request.getRequestURL().toString();
			if(!strUrl.endsWith("/login.do") && !strUrl.endsWith("/list.do")){
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("userId");
		
				if(loginId == null || "".equals(loginId)){
					return "board/index";	
				}
			}
		}
				Object result = joinPoint.proceed();
				return result;
	}
	
	
	
}






	

 

	