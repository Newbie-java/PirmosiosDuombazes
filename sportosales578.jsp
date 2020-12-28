<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			
			body {
				font-family: arial black;
				text-shadow: 4px 4px 4px  #cce6ff;
				font-size: 12px;
				color:white;
				background-image: url(https://cdn.thespaces.com/wp-content/uploads/2020/01/Gymshark-hero-crop.jpg);
				background-repeat: no-repeat;
				background-size:cover;
				background-attachment:fixed;
				background-position:center;
				background-color:black;
			}
			
			th {
				background-color: #66ccff
			}
		</style>
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "sportosales";
	String userId = "root";
	String password = "";
/*
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
*/
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	Statement statement_take = null;

/*
	2	id		int(10)
	3	sporto_klubas	 varchar(24)	utf8_lithuanian_ci
	5	treneris varchar(24)	utf8_lithuanian_ci
	6	rezultatas varchar(24)		utf8_lithuanian_ci
*/
%>
<h2 align="center"><strong>Duomenys nuskaityti iš duomenų bazės: <p>
sportosales</p></strong></h2>

<center><div class ="col-md-4">
		<form method="post" action="">
			<input type="text" name="klausimas" placeholder="Paieska...">
			<p>
			<input type="submit" name="search" value="Ieskoti">
			</p>
		</form>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>id</th>
	<th>sporto_klubas</th>
	<th>treneris</th>
	<th>rezultatas</th>
	<th>visi_treneriai</th>
</tr>
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
	

	try{ 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String ivestis = request.getParameter ("search");
		String data;
		String ieskomas_klubas = "WHERE 1";
		
		if ( ivestis != null ) {
		
			data = request.getParameter ("klausimas");		
			ieskomas_klubas += " AND `sporto_klubai`.`pav` = '"+ data +"' OR `treneriai`.`treneris` = '"+ data +"'";	
		 } 
		
		String duomenys = "SELECT `treneriai`.*"
			+ ", COUNT(`sporto_klubai`.`id`) AS `rezultatas`"
			+ ", GROUP_CONCAT( CONCAT( `treneriai`.`treneris` )) AS `visi_treneriai`"
			+ "FROM `treneriai`"
			+ "LEFT JOIN `sporto_klubai` ON (`sporto_klubai`.`pav`=`treneriai`.`sporto_klubas`)" 
			+ ieskomas_klubas 
			+ "GROUP BY `treneriai`.`sporto_klubas`";

			statement_take = connection.createStatement();	
			resultSet = statement_take.executeQuery(duomenys);
		while( resultSet.next() ){
%>
<tr style="background-color: #6699ff">
	<td><%= resultSet.getString ( "id" ) %></td>
	<td><%= resultSet.getString ( "sporto_klubas" ) %></td>
	<td><%= resultSet.getString  ("treneris" ) %></td>
	<td><%=resultSet.getString ( "rezultatas" ) %></td>
	<td><%=resultSet.getString ( "visi_treneriai" ) %></td>
</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>
</div>

</body>