/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.DbUtil;

public class UserDao {

    private Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into users(user_document,nickname,u_pass,firstname,lastname,dob,adress,phone,email,user_img_dir) values (?,?,?,?,?,?,?,?,?,?)");
            // Parameters start with 1
            preparedStatement.setString(1, user.getDocument());
            preparedStatement.setString(2, user.getNickname());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getFirstName());
            preparedStatement.setString(5, user.getLastName());
            System.out.println(user.getImgDir());
            preparedStatement.setDate(6, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(7, user.getAdress());
            preparedStatement.setString(8, user.getPhone());
            preparedStatement.setString(9, user.getEmail());
            preparedStatement.setString(10, user.getImgDir());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from users where userid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update users set user_document=?, nickname=?, u_pass=?, firstname=?, lastname=?, dob=?, adress=?, phone=?, email=?, usr_img_dir=?" +
                            "where userid=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getDocument());
            preparedStatement.setString(2, user.getNickname());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getFirstName());
            preparedStatement.setString(5, user.getLastName());
            preparedStatement.setDate(6, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(7, user.getAdress());
            preparedStatement.setString(8, user.getPhone());
            preparedStatement.setString(9, user.getEmail());
            preparedStatement.setString(10, user.getImgDir());
            preparedStatement.setInt(11, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> listaDeUsuario = new ArrayList<User>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from users");
            while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("u_pass"));
                user.setDocument(rs.getString("user_document"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setAdress(rs.getString("adress"));
                user.setPhone(rs.getString("phone"));
                user.setImgDir(rs.getString("user_img_dir"));
                user.setEmail(rs.getString("email"));
                user.setAdmin(rs.getBoolean("adm"));
                listaDeUsuario.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaDeUsuario;
    }
    
    	public User consultar(User user_form) {
          try{
            Statement stmt = connection.createStatement();
                        PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from users where nickname=?");
                                ResultSet rs = stmt.executeQuery("select * from users where nickname=?");	
	    
            preparedStatement.setString(1, user_form.getNickname());
            
		User user = new User();
		while(rs.next()){
                user.setUserid(rs.getInt("userid"));
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("u_pass"));
                user.setDocument(rs.getString("user_document"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setAdress(rs.getString("adress"));
                user.setPhone(rs.getString("phone"));
                user.setImgDir(rs.getString("user_img_dir"));
                user.setEmail(rs.getString("email"));
                user.setAdmin(rs.getBoolean("adm"));
		}
		rs.close();
		stmt.close();
                return user;
          }catch(SQLException e) {
            e.printStackTrace();
        }
	return user_form;
	}

    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where userid=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setNickname(rs.getString("nickname"));
                user.setPassword(rs.getString("password"));
                user.setDocument(rs.getString("document"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setAdress(rs.getString("adress"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}