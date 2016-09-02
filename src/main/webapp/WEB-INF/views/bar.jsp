<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

	<nav class="navbar navbar-default">

	<div class=" container-fluid">
		<div class="collapse navbar-collapse">
			<a class="navbar-brand" href="#">student Information </a>
			<ul class="nav navbar-nav  navbar-right">

				<li><a href="${pageContext.request.contextPath }/stud"> <span
						class="glyphicon glyphicon-plus" aria-hidden="true"></span>add new
						student
				</a></li>
				<li><a href="${pageContext.request.contextPath }/profile">
						<span class="glyphicon glyphicon-list" aria-hidden="true"></span>view
						All student
				</a></li>
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false"> <span
						class="glyphicon glyphicon-user" aria-hidden="true"></span> <%=session.getAttribute("activeUser")%>
						<span class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="${pageContext.request.contextPath }/login"><span
								class="glyphicon glyphicon-off" aria-hidden="true"></span>logout
						</a></li>
					</ul></li>

			</ul>
		</div>
	</div>
	</nav>



</body>
</html>