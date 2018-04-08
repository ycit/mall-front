package com.ycit.bean.modal;

import com.ycit.bean.criteria.RegForm;
import org.springframework.beans.BeanUtils;

/**
 * 用户
 *
 * @author xlch
 * @Date 2018-03-21 12:29
 */
public class User extends Admin {

    private String nickname;
    private int sex;
    private String birthday;
    private String img;
    private int balance;

    public static User fromBean(RegForm regForm) {
        User user = new User();
        BeanUtils.copyProperties(regForm, user);
        return user;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
}
