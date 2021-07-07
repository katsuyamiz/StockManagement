/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;
/**
 *
 * @author kmiz
 */

public class Functions {
    
    public boolean registerValidate(String id) throws ClassNotFoundException, SQLException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "SELECT * FROM users WHERE userId=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                return false;
            }
            return true;
    }
    
    public void register(String id, String password, String lName, String fName) throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "INSERT INTO users(userId, userPass, userLName, userFName) VALUES(?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, password);
            statement.setString(3, lName);
            statement.setString(4, fName);
            
            statement.executeUpdate();
            conn.close();
        
    }
    
    public boolean isNumeric(String value){
       try{
        double d = Double.parseDouble(value);
       }catch(NumberFormatException e){
           return false;
         }
       return true;
    }
    
    public User validate(String id, String pass) throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "SELECT * FROM users WHERE userId = ? and userPass = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, pass);
            
            ResultSet result = statement.executeQuery();
            User user = null;
            
            if (result.next()){
                user = new User();
                user.setName(result.getString("userFName") + " " + result.getString("userLName"));
            }
            conn.close();
            return user;
        }
    
    public void insert(String id, String name, String brand, String price) throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "INSERT INTO products(prodId, prodName, prodPrice, prodBrand) VALUES(?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, name);
            statement.setString(3, price);
            statement.setString(4, brand);
            
            statement.executeUpdate();
            conn.close();
    } 
    

        public void update(String id, String name, String brand, String price) throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "UPDATE products SET prodName=?, prodBrand=?, prodPrice=? WHERE prodId = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, brand);
            statement.setString(3, price);
            statement.setString(4, id);
            
            statement.executeUpdate();
            conn.close();
    }
        public void delete(String id) throws SQLException, ClassNotFoundException{
//            int opt = JOptionPane.showConfirmDialog(null, "Are you sure to delete?", "Delete", JOptionPane.YES_NO_OPTION);
//            if(opt == 0){
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/dbs","kmiz","12345");
            String sql = "Delete FROM products WHERE prodId = ? ";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
            conn.close();
    } 
    }


