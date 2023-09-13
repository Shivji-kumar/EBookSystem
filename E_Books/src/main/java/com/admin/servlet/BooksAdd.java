package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.dao.BookDaoImpl;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");
			String status=req.getParameter("status");
			//String photoName=req.getParameter("bimg");
			
			Part part=req.getPart("bimg");
			String photoName=part.getSubmittedFileName();
			
			BookDtls b=new BookDtls(bookName,author,price,categories,status,photoName,"admin");
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
			
			boolean f=dao.addBooks(b);
			
			HttpSession session=req.getSession();
			if(f) {
				String path=getServletContext().getRealPath("")+"book";
				
				File file=new File(path);
				part.write(path+File.separator+photoName);
								
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}else {
				session.setAttribute("faildMsg", "Something went wrong on Server");
				resp.sendRedirect("admin/add_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
