//SELECT * FROM USER_HAS_PD 
//JOIN USERS ON USERID = FK_USERID
//JOIN PRODUCTS ON PD_ID = FK_PRDID
//WHERE USERID = 97;

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
import model.Product;
import util.DbUtil;

public class ProductDao {

    private Connection connection;

    public ProductDao() {
        connection = DbUtil.getConnection();
    }

    public void addPd(Product product) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into products(pd_name,pd_price,pd_desc,pd_img) values (?,?,?,?)");
            // Parameters start with 1
            preparedStatement.setString(1, product.getPdName());
            preparedStatement.setString(2, product.getPdPrice());
            preparedStatement.setString(3, product.getPdDesc());
            preparedStatement.setString(4, product.getPdImg());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePd(int pdid) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from products where pd_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, pdid);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
        public void deletePdFromUser(int usrid, int pdid) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from user_has_pd where fk_userid=? and fk_prdid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, usrid);
            preparedStatement.setInt(2, pdid);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePd(Product product) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update products set pd_name=?, pd_price=?, pd_desc=?, pd_img=?" +
                            "where pd_id=?");
            // Parameters start with 1
            preparedStatement.setString(1, product.getPdName());
            preparedStatement.setString(2, product.getPdPrice());
            preparedStatement.setString(3, product.getPdDesc());
            preparedStatement.setString(4, product.getPdImg());
            preparedStatement.setInt(5, product.getPdid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void addToUser(int user, int product) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into user_has_pd(fk_userid,fk_prdid) values (?,?)");
            // Parameters start with 1
            preparedStatement.setInt(1, user);
            preparedStatement.setInt(2, product);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    public List<Product> getAllPd() {
        List<Product> listaDeProdutos = new ArrayList<Product>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from products");
            while (rs.next()) {
                Product product = new Product();
                product.setPdid(rs.getInt("pd_id"));
                product.setPdName(rs.getString("pd_name"));
                product.setPdPrice(rs.getString("pd_price"));
                product.setPdDesc(rs.getString("pd_desc"));
                product.setPdImg(rs.getString("pd_img"));
                listaDeProdutos.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaDeProdutos;
    }
    
    
    public List<Product> getAllUserPd(String nickname) {
        List<Product> listaDeProdutosDoUsuario = new ArrayList<Product>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from products where pd_id in(select fk_prdid from user_has_pd where fk_userid in (select userid from users where nickname = ?))");
            preparedStatement.setString(1, nickname);
            System.out.print(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setPdid(rs.getInt("pd_id"));
                product.setPdName(rs.getString("pd_name"));
                product.setPdPrice(rs.getString("pd_price"));
                product.setPdDesc(rs.getString("pd_desc"));
                product.setPdImg(rs.getString("pd_img"));
                listaDeProdutosDoUsuario.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaDeProdutosDoUsuario;
    }

    public Product getPdById(int pdid) {
        Product product = new Product();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from products where pd_id=?");
            preparedStatement.setInt(1, pdid);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                product.setPdid(rs.getInt("pd_id"));
                product.setPdName(rs.getString("pd_name"));
                product.setPdPrice(rs.getString("pd_price"));
                product.setPdDesc(rs.getString("pd_desc"));
                product.setPdImg(rs.getString("pd_img"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }
}