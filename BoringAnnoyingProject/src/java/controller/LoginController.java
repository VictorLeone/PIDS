package controller;

import dao.LoginDao;
import dao.ProductDao;
import dao.UserDao;
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
    private static String USER_INDEX = "/principal.jsp";
    private static String ADMIN_INDEX = "/adm-principal.jsp";
    private static String INDEX = "/index.jsp";
    private LoginDao dao;
    private ProductDao dao_pd;
    private UserDao dao_usr;

    public LoginController() {
        super();
        dao = new LoginDao();
        dao_pd = new ProductDao();
        dao_usr = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Login login = new Login();

            login.setLg_nickname(request.getParameter("nickname"));
            login.setLg_password(request.getParameter("upass"));

            System.out.print(request.getParameter("nickname"));
            System.out.print(request.getParameter("upass"));
            boolean validLogin = dao.authUser(login);
            boolean isAdmin = dao.isAdmin(login);

            if ((validLogin == true) && (isAdmin == true)) {
                RequestDispatcher view = request.getRequestDispatcher(ADMIN_INDEX);
                request.setAttribute("currentUser", dao_usr.getUserData(request.getParameter("nickname")));
                view.forward(request, response);

            } else if ((validLogin == true) && (isAdmin == false)) {
                RequestDispatcher view = request.getRequestDispatcher(USER_INDEX);
                request.setAttribute("currentUser", dao_usr.getUserData(request.getParameter("nickname")));
                request.setAttribute("products", dao_pd.getAllUserPd(request.getParameter("nickname")));
                view.forward(request, response);
            } else {
                RequestDispatcher view = request.getRequestDispatcher(INDEX);
                view.forward(request, response);

            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);

        }

    }
}
