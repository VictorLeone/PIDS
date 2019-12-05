/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author iingr
 */
public class Login {
private String lg_nickname;
private String lg_password;
private String lg_admin;

    public String getLg_nickname() {
        return lg_nickname;
    }

    public void setLg_nickname(String lg_nickname) {
        this.lg_nickname = lg_nickname;
    }

    public String getLg_password() {
        return lg_password;
    }

    public void setLg_password(String lg_password) {
        this.lg_password = lg_password;
    }

    public String getLg_admin() {
        return lg_admin;
    }

    public void setLg_admin(String lg_admin) {
        this.lg_admin = lg_admin;
    }

        @Override
    public String toString() {
        return "User [lg_nickname=" + lg_nickname + ", lg_password=" + lg_password + ", lg_admin=" + lg_admin
                + "]";
}
}