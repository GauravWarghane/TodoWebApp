package com.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.DB.DBConnect;


@WebServlet("/add_todo")
public class AddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username=req.getParameter("username");
		String todo=req.getParameter("todo");
		String status=req.getParameter("status");
		//System.out.println(username+" "+todo+" "+status);
		//sending data into database
		
		TodoDAO dao=new TodoDAO(DBConnect.getconn());
		boolean f=dao.addTodo(username,todo,status);
		
		HttpSession session=req.getSession();
		
		
		if(f==true) {
			session.setAttribute("sucMsg","To Do Addes Successfully!");
			//System.out.println("Data Insert Successfully");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("failed","To Do not  Addes Successfully!");
			//System.out.println("Error to inserting data");
			resp.sendRedirect("index.jsp");	
		}
		 
		
		
	}
	

}
