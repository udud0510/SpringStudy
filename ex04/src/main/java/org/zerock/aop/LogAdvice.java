package org.zerock.aop;

import lombok.extern.log4j.Log4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Log4j
@Component
public class LogAdvice {
    @Before("execution(* org.zerock.service.SampleService*.*(..))")
    public void logBefore() {
        log.info("=================================");
    }
}
