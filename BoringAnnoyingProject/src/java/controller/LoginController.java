package controller;

import dao.LoginDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Login;

@WebServlet(name = "Login", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/user.jsp";
    private static String LIST_PD = "/product.jsp";
    private LoginDao dao;

    public LoginController() {
        super();
        dao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try {
        Login login = new Login();
       
        login.setLg_nickname(request.getParameter("nickname"));
        login.setLg_password(request.getParameter("upass"));
        
        System.out.print(request.getParameter("nickname"));
        System.out.print(request.getParameter("upass"));
            boolean validLogin = dao.authUser(login);
            
                    if(validLogin == true){
        RequestDispatcher view = request.getRequestDispatcher(LIST_PD);
//        request.setAttribute("products", dao.getAllPd());
        view.forward(request, response);
        
        }else{
                    RequestDispatcher view = request.getRequestDispatcher(INSERT_OR_EDIT);      
                    }
                    
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
           
        }

        
    }
}