package egovframework.example.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

public class SessionAdvice  {
	public Object aroundRoleProcess(ProceedingJoinPoint joinPoint) throws Throwable{
		Object proceedObj = null;

		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		HttpServletResponse response = null;
		if(joinPoint.getArgs().length >= 2)
		response = (HttpServletResponse)joinPoint.getArgs()[1];
		

		// Role과 Session은 여기서 체크한다.

		try{
		// 요청 Method를 실행한다.
		proceedObj = joinPoint.proceed();
		} catch(Throwable e){
		// Method 실행시 오류가 났을 경우
		throw e;
		}
		return proceedObj;
		}
}		
	
	
	
	
	
	/*public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			response.sendRedirect(request.getContextPath()+"/board/index.jsp");
			return false;
		}
		
		return true;
	}*/
	


