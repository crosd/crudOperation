<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/jquery_dataTables.css">

<script src="${ pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/jquery_dataTables.js"></script>

<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<!--<link  rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">    -->
</head>
<body>
	
	
	<h3 style="color:red"> ${loginError }</h3>
	
	<section class=" loginform cf">
	<div class="col-md-4 col-md-offset-4 panel panel-default" style="margin-top: 10%;">
		
		<form action="profile" method="post" model="users" accept-charset="utf-8" class="">
			
				<div class ="form-group">	
					<label for="username"   >Username</label>
					<input type="text" class="form-control"  name="username" placeholder="username" required>
				</div>
				<div>
					<label for="password">Password</label>
					<input type="password" name="password"  class="form-control " placeholder="password" required><br>
				</div>
					<input type="submit" class=" col-md-2 col-md-offset-5 btn btn-info" value="Login">
				
		</form>
		
		</div>
	 </section>
	
	
	
	
</body>
</html>