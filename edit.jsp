<%@ page import=" com.entity.TodoDtls" %>
<%@ page import=" java.util.List" %>
<%@ page import="com.DAO.TodoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/all_css.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

<%@include file="component/navbar.jsp" %> 
<div class="container">
<div class="row p-5 ">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<div class="text-center text-success">ADD TODO</div>

<% int id=Integer.parseInt(request.getParameter("id"));
TodoDAO dao=new TodoDAO (DBConnect.getconn());
TodoDtls t=dao.getTodoById(id);
%>

<form  action="update" method="post">
<input type="hidden" value="<%=t.getId()%>" name="id">


<div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username"
    value="<%=t.getName() %>">
    
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">TODO</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="todo" value="<%=t.getTodo() %>" >
    
  </div>
  <div class="form-group ">
      <label for="inputState">Status</label>
      <select id="inputState" class="form-control" name="status" >
      <%  if("Pending".equals(t.getStatus()))
      {%>
      <option value="Pending">Pending</option>
         <option value="Complete">Complete</option>
    	  
     <% }else
      {%><option value="Complete">Complete</option>
    	  <option value="Pending">Pending</option>
         
      <% }
      %>
      
     
        
      </select>
    </div>
    
    
  <div class="text-center">
  <button type="submit" class="btn btn-primary">UPDATE</button>
  </div>
  
</form>

</div>
</div>
</div>



</div>
</div>
</body>
</html>