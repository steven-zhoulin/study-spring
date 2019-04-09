package com.steven.devops.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * Spring 会发现它，并用它在 Web 容器中注册 DelegatingFilterProxy，并不需要重载任何方法。
 */
public class SecurityWebInitializer extends AbstractSecurityWebApplicationInitializer {

}
