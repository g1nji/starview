package yewon.logging;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void logBefore(JoinPoint joinPoint) {
		logger.debug("##### {} 시작", joinPoint.getSignature().toShortString());
	}
	
	@After("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	public void logAfter(JoinPoint joinPoint) {
		logger.debug("##### {} 종료", joinPoint.getSignature().toShortString());
	}
	
}