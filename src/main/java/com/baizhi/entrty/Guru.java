package com.baizhi.entrty;

import java.util.List;

public class Guru {
    private String id;
    private String name;
    private String headPic;
    private String sex;
    private List<Article> list;

    public Guru() {
    }

    public Guru(String id, String name, String headPic, String sex) {
        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.sex = sex;
    }

    public Guru(String id, String name, String headPic, String sex, List<Article> list) {
        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.sex = sex;
        this.list = list;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public List<Article> getList() {
        return list;
    }

    public void setList(List<Article> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", headPic='" + headPic + '\'' +
                ", sex='" + sex + '\'' +
                ", list=" + list +
                '}';
    }
}
