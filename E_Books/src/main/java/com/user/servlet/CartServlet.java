package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
			BookDtls b=dao.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			
			CartDaoImpl dao2=new CartDaoImpl(DBConnect.getCon());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("addCart", "Added To Cart");
				resp.sendRedirect("all_new_book.jsp");
			}else {
				session.setAttribute("failedCart", "Something went wrong on Server");
				resp.sendRedirect("all_new_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
