package com.ycit.bean.criteria;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * 注册表单
 *
 * @author xlch
 * @Date 2018-03-21 15:32
 */
public class RegForm {

    @NotEmpty
    @Length(min = 4, max = 12)
    private String username;
    @NotBlank
    @Length(min = 4, max = 12)
    private String password;
    @NotBlank
    @Length(min = 4, max = 12)
    private String rePassword;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

}
