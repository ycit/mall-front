package com.ycit.bean.criteria;

/**
 * 密码修改表单
 *
 * @author xlch
 * @Date 2018-04-11 13:19
 */
public class PasswordForm {

    private String oldPw;
    private String newPw;
    private String reNewPw;

    public String getOldPw() {
        return oldPw;
    }

    public void setOldPw(String oldPw) {
        this.oldPw = oldPw;
    }

    public String getNewPw() {
        return newPw;
    }

    public void setNewPw(String newPw) {
        this.newPw = newPw;
    }

    public String getReNewPw() {
        return reNewPw;
    }

    public void setReNewPw(String reNewPw) {
        this.reNewPw = reNewPw;
    }
}
