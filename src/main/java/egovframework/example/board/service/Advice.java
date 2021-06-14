package egovframework.example.board.service;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

import com.google.gson.Gson;

 
public class Advice {
    public Object sessionChk(ProceedingJoinPoint pjp) throws Throwable{
        System.out.println("advice");
        HttpServletRequest request = null;
        Model m = null;
        String method = pjp.getSignature().getName();
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        
        for(Object o:pjp.getArgs()){
            if(o instanceof HttpServletRequest){
                request = (HttpServletRequest) o;
            }else if(o instanceof Model){
                m = (Model) o;
            }
        }
        if(request != null){
            HttpSession session = request.getSession();
            OprSet set = (OprSet) session.getAttribute("oprInfo");
 
            if(set == null){
                return "redirect:/";
            }
            if(m != null){
                Gson gson = new Gson();
                m.addAttribute("menuInfo", gson.toJson(set.getPageInfo()));
                m.addAttribute("oprInfo", gson.toJson(set.getOprInfo()));
            }
        }
        
        Object returnObj = pjp.proceed();
        stopWatch.stop();
        System.out.println("#############  "+method+"() Method Performance time : "+stopWatch.getTotalTimeMillis()+"(ms)  #############");
        return returnObj; 
    }
}





/*
 * public Object printMethodName(ProceedingJoinPoint pjp) throws Throwable{
 * String method = pjp.getSignature().getName(); StopWatch stopWatch = new
 * StopWatch(); stopWatch.start(); Object returnObj = pjp.proceed();
 * stopWatch.stop();
 * System.out.println("#  "+method+"() Method Performance time : "+stopWatch.
 * getTotalTimeMillis()+"(ms)"); return returnObj;
 * 
 * }
 */