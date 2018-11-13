package com.baizhi.entrty;

import java.util.Date;

public class User {
    private String id;
    private String phoneNum;
    private String username;
    private String password;
    private String salt;
    private String province;
    private String city;
    private String niclName;
    private String sex;
    private String sign;
    private String headPic;
    private String status;
    private Date userDate;



    public User(String phoneNum, String username, String password, String province, String city, String niclName, String sex, String sign, String headPic, String status) {
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.province = province;
        this.city = city;
        this.niclName = niclName;
        this.sex = sex;
        this.sign = sign;
        this.headPic = headPic;
        this.status = status;
    }



    public User(String id, String phoneNum, String username, String password, String salt, String province, String city, String niclName, String sex, String sign, String headPic, String status, Date userDate) {
        this.id = id;
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.salt = salt;
        this.province = province;
        this.city = city;
        this.niclName = niclName;
        this.sex = sex;
        this.sign = sign;
        this.headPic = headPic;
        this.status = status;
        this.userDate = userDate;
    }

    public User(String password) {
        this.password = password;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", niclName='" + niclName + '\'' +
                ", sex='" + sex + '\'' +
                ", sign='" + sign + '\'' +
                ", headPic='" + headPic + '\'' +
                ", status='" + status + '\'' +
                ", userDate=" + userDate +
                '}';
    }

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

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

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNiclName() {
        return niclName;
    }

    public void setNiclName(String niclName) {
        this.niclName = niclName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getUserDate() {
        return userDate;
    }

    public void setUserDate(Date userDate) {
        this.userDate = userDate;
    }
}
