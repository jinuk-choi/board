package egovframework.example.board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.ProceedingJoinPoint;


@Aspect
public class Advice {
	@Pointcut("execution(* egovframework.example..web.*Controller.*(..))")
	private void test(){}
	
	@Around(value="test()")

	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
		HttpServletRequest request= null;

		for(Object o:joinPoint.getArgs()){
			if(o instanceof HttpServletRequest){
				request = (HttpServletRequest) o;
			}
		}

	//로그인을 체크해야 하는 페이지
	if(request!= null){
		String strUrl = request.getRequestURL().toString();

	//로그인 페이지 제외
		if(!strUrl.endsWith("/index.do")){
			//세션체킹
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("userId");
	
			if(loginId == null || "".equals(loginId)){
	
				return "로그인 페이지";

			}
		}
	}//request가 null이 아니라면
	//controller에서 httprequest가 없거나 /login페이지라면
	Object result = joinPoint.proceed();
	return result;

	}

}



	
    
/*  public Object printMethodName(ProceedingJoinPoint pjp) throws Throwable{
  String method = pjp.getSignature().getName(); StopWatch stopWatch = new
  StopWatch(); stopWatch.start(); Object returnObj = pjp.proceed();
  stopWatch.stop();
  System.out.println("#  "+method+"() Method Performance time : "+stopWatch.
  getTotalTimeMillis()+"(ms)"); return returnObj;
  
  }*/

	
	
	