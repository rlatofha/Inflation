<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	<!-- String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String phone = request.getParameter("phone");	 -->
		
//------
	String url_mysql = "jdbc:mysql://localhost/coffee?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
    String WhereDefault = "select * from allcoffee where district like %" search "%";
    int count = 0;

	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // &quot;
        
        int count = 0;
%>
    {"results" :
  	    [ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%           
            }
            count++;                 
%>
			{
			"district" : "<%=rs.getString(1) %>",
			"cafe" : "<%=rs.getInt(2) %>",
			"restaurant" : "<%=rs.getInt(3) %>",
			"bakery" : "<%=rs.getInt(4) %>"
            }    
<%            
            }
%>          
		]
    }
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>