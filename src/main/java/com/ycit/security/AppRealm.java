package com.ycit.security;

import com.ycit.bean.modal.User;
import com.ycit.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

/**
 * shiro custom realm
 *
 * @author xlch
 * @Date 2018-03-21 11:45
 */
public class AppRealm extends AuthorizingRealm {

    private static final  Logger LOGGER = LoggerFactory.getLogger(AuthorizingRealm.class);

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = principals.getPrimaryPrincipal().toString();
        User user = userService.findByUsername(username);
        if (user != null) {
            SimpleAuthorizationInfo authcInfo = new SimpleAuthorizationInfo();
            authcInfo.addRole("");
            authcInfo.addStringPermission("");
            return authcInfo;
        }
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        User user= userService.findByUsername(upToken.getUsername());
        LOGGER.debug("upToken is ======{}", ((UsernamePasswordToken) token).getUsername());
        if (user != null) {
            return new SimpleAuthenticationInfo(upToken.getUsername(), user.getPassword(), getName());
        }
        return null;
    }

}
