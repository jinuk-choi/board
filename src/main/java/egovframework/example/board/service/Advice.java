package egovframework.example.board.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

 

public class Advice {
    public Object printMethodName(ProceedingJoinPoint pjp) throws Throwable{
        String method = pjp.getSignature().getName();
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Object returnObj = pjp.proceed();
        stopWatch.stop();
        System.out.println("#  "+method+"() Method Performance time : "+stopWatch.getTotalTimeMillis()+"(ms)");
        return returnObj; 

}

}




