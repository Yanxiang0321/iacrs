package com.iacrs.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/*
 * User info banner
 */
@Component(value = "userDetailsProvider")
public class UserDetailsProvider implements UserDetailsService
{
    private static Logger log = LoggerFactory.getLogger(UserDetailsProvider.class);
    
    @Autowired
    private ISecurityService securityService;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException
    {
    	//get user by username only
        log.info("load user by username:{}", username);
        SecurityUserModel model = securityService.getSecurityUserModel(username);
        
        if (null == model)
        {
            log.warn("Can not found user for username:{}", username);
            throw new UsernameNotFoundException("");
        }
        
        return model;
    }
}
