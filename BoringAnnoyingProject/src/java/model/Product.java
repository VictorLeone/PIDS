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
public class Product {
    private int pdid;
    private String pdName;
    private String pdPrice;
    private String pdDesc;
    private String pdImg;

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getPdName() {
        return pdName;
    }

    public void setPdName(String pdName) {
        this.pdName = pdName;
    }

    public String getPdPrice() {
        return pdPrice;
    }

    public void setPdPrice(String pdPrice) {
        this.pdPrice = pdPrice;
    }

    public String getPdDesc() {
        return pdDesc;
    }

    public void setPdDesc(String pdDesc) {
        this.pdDesc = pdDesc;
    }

    public String getPdImg() {
        return pdImg;
    }

    public void setPdImg(String pdImg) {
        this.pdImg = pdImg;
    }
    
        @Override
    public String toString() {
        return "Product [pdid=" + pdid + ", pdName=" + pdName + ", pdPrice=" + pdPrice
                + ", pdDesc=" + pdDesc + ", pdImg=" + pdImg + "]";
    }
    
}
