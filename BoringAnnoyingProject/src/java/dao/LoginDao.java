package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DbUtil;
import model.Login;

public class LoginDao {

    private Connection connection;

    public LoginDao() {
        connection = DbUtil.getConnection();
    }

    public boolean authUser(Login login) throws SQLException {

        boolean result = false;
        PreparedStatement preparedStatement = connection.prepareStatement("select * from users where nickname=? and u_pass=?");

        preparedStatement.setString(1, login.getLg_nickname());
        preparedStatement.setString(2, login.getLg_password());

        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            result = true;
        }
        
        rs.close();
        preparedStatement.close();
        return result;
    }
}
