package com.ledao.conf;

import com.ledao.entity.User;
import com.ledao.service.UserService;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.annotation.Resource;

/**
 * spring security 配置
 *
 * @author
 * @company
 * @create 2024-01-14 1:58
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Resource
    private UserService userService;

    /**
     * 配置用户认证
     *
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(new CustomUserDetailsService())
                .passwordEncoder(new BCryptPasswordEncoder());
    }

    /**
     * 请求授权
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable().headers().disable()
                .authorizeRequests()
                // 配置不需要身份认证的请求地址
                .antMatchers("/", "/toLoginPage", "/toRegisterPage", "/toSearchPasswordPage", "/toUserBackstagePage", "/toPersonMessagePage", "/toPersonMessageUpdatePage", "/toWriteArticlePage", "/toArticleManagePage", "/toUpdateArticlePage", "/toArticleFailureManagePage", "/toCommentManagePage", "/toDownloadLink", "/checkPoints", "/checkIsDownload", "/toMyDownloadPage", "/toInformationPage", "/static/**", "/article/**", "/comment/**", "/user/**", "/drawImage").permitAll()
                .antMatchers("/admin", "/admin/**").hasRole("ADMIN")
                .and()
                .formLogin()
                // 指定登录请求地址
                .loginPage("/login")
                // 登录成功后的默认跳转页面
                .defaultSuccessUrl("/admin")
                .permitAll()
                .and()
                .logout()
                .logoutSuccessUrl("/login")
                .permitAll();
    }

    /**
     * 自定义UserDetailsService
     */
    public class CustomUserDetailsService implements UserDetailsService {
        @Override
        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            User user = userService.findByUserName(username);
            if (user == null) {
                throw new UsernameNotFoundException("User not found");
            }

            // 这里假设User类有getUsername, getPassword和getRole方法
            // 并且用户的角色为"ADMIN"时返回true
            if ("管理员".equals(user.getRoleName())) {
                return org.springframework.security.core.userdetails.User
                        .withUsername(user.getUserName())
                        .password(new BCryptPasswordEncoder().encode(user.getPassword()))
                        .roles("ADMIN")
                        .build();
            } else {
                throw new UsernameNotFoundException("User not authorized");
            }
        }
    }
}

//package com.ledao.conf;
//
//import com.ledao.entity.User;
//import com.ledao.service.UserService;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//import javax.annotation.Resource;
//
///**
// * spring security 配置
// *
// * @author
// * @company
// * @create 2024-01-14 1:58
// */
//@Configuration
//@EnableGlobalMethodSecurity(prePostEnabled = true)
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Resource
//    private UserService userService;
//
//    /**
//     * 配置用户认证
//     *
//     * @param auth
//     * @throws Exception
//     */
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        User user = userService.findByUserName("admin");
//        auth.inMemoryAuthentication()
//                .passwordEncoder(new BCryptPasswordEncoder())
//                .withUser("admin")
//                .password(new BCryptPasswordEncoder().encode(user.getPassword()))
//                .roles("ADMIN");
//    }
//
//    /**
//     * 请求授权
//     *
//     * @param http
//     * @throws Exception
//     */
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable().cors().disable().headers().disable()
//                .authorizeRequests()
//                // 配置不需要身份认证的请求地址
//                .antMatchers("/", "/toLoginPage", "/toRegisterPage", "/toSearchPasswordPage", "/toUserBackstagePage", "/toPersonMessagePage", "/toPersonMessageUpdatePage", "/toWriteArticlePage", "/toArticleManagePage", "/toUpdateArticlePage", "/toArticleFailureManagePage", "/toCommentManagePage", "/toDownloadLink", "/checkPoints", "/checkIsDownload", "/toMyDownloadPage", "/toInformationPage", "/static/**", "/article/**", "/comment/**", "/user/**", "/drawImage").permitAll()
//                .antMatchers("/admin", "/admin/**").hasRole("ADMIN")
//                .and()
//                .formLogin()
//                // 指定登录请求地址
//                .loginPage("/login")
//                // 登录成功后的默认跳转页面
//                .defaultSuccessUrl("/admin")
//                .permitAll()
//                .and()
//                .logout()
//                .logoutSuccessUrl("/login")
//                .permitAll();
//    }
//}
