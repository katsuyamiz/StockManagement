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
public class User {
    private String userId;
    private String userPass;
    private String userName;
  
    
    public User(){
    }
//    getter setter
    public String getName(){
        return userName;
    }
    public void setName(String newName){
        this.userName = newName;
    }
    
    public String getId(){
        return userId;
    }
    public void setId(String newId){
        this.userId = newId;
    }
    
}
