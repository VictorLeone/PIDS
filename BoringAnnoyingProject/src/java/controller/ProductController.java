package controller;


import dao.ProductDao;
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
    private static String INSERT_OR_EDIT = "/user.jsp";
    private static String LIST_PD = "/product.jsp";
    private ProductDao dao;

    public ProductController() {
        super();
        dao = new ProductDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            dao.deletePd(pdid);
            forward = LIST_PD;
            request.setAttribute("products", dao.getAllPd());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int pdid = Integer.parseInt(request.getParameter("pdid"));
            Product product = dao.getPdById(pdid);
            request.setAttribute("product", product);
        } else if (action.equalsIgnoreCase("listPd")){
            forward = LIST_PD;
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
        product.setPdPrice("R$ "+(request.getParameter("pkgvalue")+",00"));
        product.setPdDesc(request.getParameter("pkgdescription"));
        product.setPdImg(request.getParameter("pkgimgpath"));

        String pdid = request.getParameter("pdid");
        if(pdid == null || pdid.isEmpty())
        {
            dao.addPd(product);
        }
        else
        {
            product.setPdid(Integer.parseInt(pdid));
            dao.updatePd(product);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_PD);
        request.setAttribute("products", dao.getAllPd());
        view.forward(request, response);
    }
}