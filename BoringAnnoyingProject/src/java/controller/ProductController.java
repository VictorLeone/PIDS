package controller;


import dao.ProductDao;
import dao.UserDao;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;


@WebServlet(name = "Produtos", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/view-prd.jsp";
    private static String LIST_PD = "/product.jsp";
        private static String LIST_USER_PD = "/principal.jsp";
    private static String EDIT_PD = "/edit-prd.jsp";
    private static String VIEW_PD = "/view-prd.jsp";
    private ProductDao dao;
    private UserDao dao_usr;

    public ProductController() {
        super();
        dao = new ProductDao();
        dao_usr = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            dao.deletePd(pdid);
            forward = VIEW_PD;
            request.setAttribute("products", dao.getAllPd()); 
            }else if (action.equalsIgnoreCase("addToUser")){
            int usrid = Integer.parseInt(request.getParameter("userid"));
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            String nickname = (request.getParameter("nickname"));
            dao.addToUser(usrid, pdid);
            forward = LIST_USER_PD;
            request.setAttribute("currentUser", dao_usr.getUserData(request.getParameter("nickname")));
            request.setAttribute("products", dao.getAllUserPd(request.getParameter("nickname")));         
        }else if (action.equalsIgnoreCase("delFromUser")){
            int usrid = Integer.parseInt(request.getParameter("userid"));
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            String nickname = (request.getParameter("nickname"));
            dao.deletePdFromUser(usrid, pdid);
            forward = LIST_USER_PD;
            request.setAttribute("currentUser", dao_usr.getUserData(request.getParameter("nickname")));
            request.setAttribute("products", dao.getAllUserPd(request.getParameter("nickname"))); 
        } else if (action.equalsIgnoreCase("edit")){
            forward = EDIT_PD;
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            Product product = dao.getPdById(pdid);
            request.setAttribute("product", product);
        } else if (action.equalsIgnoreCase("listPd")){
            forward = LIST_PD;
            request.setAttribute("products", dao.getAllPd());
        }else if(action.equalsIgnoreCase("listUserPd")){
            forward = LIST_USER_PD;
            request.setAttribute("userProducts", dao.getAllUserPd(request.getParameter("nickname")));
        }else if (action.equalsIgnoreCase("viewEditPd")){
            forward = VIEW_PD;
            request.setAttribute("products", dao.getAllPd());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        
        product.setPdName(request.getParameter("pkgname"));
        product.setPdPrice(request.getParameter("pkgvalue"));
        product.setPdDesc(request.getParameter("pkgdescription"));
        product.setPdImg(request.getParameter("pkgimgpath"));

        String pdid = request.getParameter("prdid");
        
        if(pdid == null || pdid.isEmpty())
        {
            dao.addPd(product);
        }
        else
        {
            product.setPdid(Integer.parseInt(pdid));
            dao.updatePd(product);
        }
        RequestDispatcher view = request.getRequestDispatcher(VIEW_PD);
        request.setAttribute("products", dao.getAllPd());
        request.setAttribute("currentUser", dao_usr.getUserData(request.getParameter("nickname")));
        view.forward(request, response);
    }
    
    
}