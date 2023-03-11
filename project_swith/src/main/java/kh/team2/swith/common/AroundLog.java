package kh.team2.swith.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundLog {
	
	@Pointcut("execution(public * kh.team2.swith..*Controller.* (..))")
	public void commonControllerPointcut() {}
	@Pointcut("execution(public * kh.team2.swith..*Service.*(..))")
	public void commonServicePointcut() {}
	@Pointcut("execution(public * kh.team2.swith..*Dao.* (..))")
	public void commonDaoPointcut() {}
	
	@Around("commonControllerPointcut()")
	public Object aroundCtrlLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t[Ctr시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\tCtr Args[" + i + "]: " + args[i] + ",\n");
		}

		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();
		sw.stop();

		if (ro != null) {
			System.out.println("\tCtr Ret: " + ro.toString());
		}
		System.out.println("\t[Ctr끝: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
	@Around("commonServicePointcut()")
	public Object aroundSrvLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t\t[Srv시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\t\tSrv Args[" + i + "]: " + args[i] + ",\n");
		}

		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();
		sw.stop();

		if (ro != null) {
			System.out.println("\t\tSrv Ret: " + ro.toString());
		}
		System.out.println("\t\t[Srv끝: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
	@Around("commonDaoPointcut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t\t\t[Dao시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\t\t\tDao Args[" + i + "]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();
		sw.stop();
		
		if (ro != null) {
			System.out.println("\t\t\tDao Ret: " + ro.toString());
		}
		System.out.println("\t\t\t[Dao끝: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
}