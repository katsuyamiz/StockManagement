/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

/**
 *
 * @author kmiz
 */
public class Products {
    String pID;
    String pName;
    String pBrand;
    String pPrice;
    
    public Products(){
        
    }
    
    public Products(String pID, String pName,String pBrand, String pPrice){
        this.pID = pID;
        this.pName = pName;
        this.pBrand = pBrand;
        this.pPrice = pPrice;
    }
//    undefined
    public Products(Products products){
        this.pID = products.pID;
        this.pName = products.pName;
        this.pBrand = products.pBrand;
        this.pPrice = products.pPrice;
    }
    
    public String getID(){
        return pID;
    }
    
    public void setID(String newPID){
        this.pID = newPID;
    }
    
    public String getName(){
        return pName;
    }
    
    public void setName(String newPName){
        this.pName = newPName;
    }
    
    public String getBrand(){
        return pBrand;
    }
    
    public void setBrand(String newPBrand){
        this.pBrand = newPBrand;
    }
    
    public String getPrice(){
        return pPrice;
    }
    
    public void setPrice(String newPPrice){
        this.pPrice = newPPrice;
    }
    
    
    
}
