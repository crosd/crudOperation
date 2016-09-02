<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
<jsp:include page="bar.jsp" />
<div class=" col-md-6 col-md-offset-3 panel panel-default" style="margin-top: 4%">
<div class="panel-heading">
	<h2 class="">Student Detail:</h2>
</div >
<div class= "panel-body">
<form:form action="${pageContext.request.contextPath }/stud" method="POST"  modelAttribute="student">

		<div class="form-group">
			<form:label path="firstName"  for ="firstName">First Name</form:label>
			<form:input path="firstName"  class="form-control" placeholder="first name" required="required"/>
		</div>
		<div class="form-group">
				<form:label path="lastName" for ="lastName">Last Name</form:label>
				<form:input path="lastName" class="form-control" placeholder=" Last name" />
		</div>
		<div class="form-group">
				<form:label path="rollNo" for ="rollNo">Roll No</form:label>
				<form:input path="rollNo" class="form-control"  placeholder="Roll No"/>
		</div>	
		<div class="form-group">
				<form:label path="collegeName" for ="collegeName">College Name</form:label>
				<form:input path="collegeName" class="form-control" placeholder="College Name" />
		</div>	
		<div class="form-group" >
				<form:label path="subject" for ="subject">Subject</form:label>
				<form:input path="subject"  class="form-control"  placeholder="Subject"/>
		</div>	
				<td colspan="2"><input class="btn btn-info col-md-1 col-md-offset-11" type="submit" value="Save" />
			
	
	
	

<form:hidden path="id"/>

</form:form> 
</div>
</div>
<!--  
<h1>Students Information</h1>
<div style ="width:600px">
<table id ="studTable" border="1" class="table table-striped" style="border-collapse:collapse">
	<thead>
		<tr>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Rollno</th>
			<th>Subject</th>
			<th>College</th>
			<th>Manupulation</th>
		</tr>
	</thead>
	
	<tbody>
	
	
	
			<c:forEach var="row" items="${studentList}">
			
			<tr>
				<td>"${row.firstName }"</td>
				<td>"${row.lastName }"</td>
				<td>"${row.rollNo }"</td>
				<td>"${row.subject }"</td>
				<td>"${row.collegeName }"</td>
				<td>
					<button class="btn btn-success" onClick="editStud(${row.id})"  >Edit</button>
					<button class="btn btn-danger" onClick="deleteStud(${row.id})">Delete</button>
				</td>
				
			
			</c:forEach>
				
	
	</tbody>
</table>
</div>
-->


<!--  
<script type="text/javascript">
		function editStud(id){
			location.href = "${pageContext.request.contextPath}/stud/" + id + "/edit";
		}
	
		function deleteStud(id){
			var r = confirm("Are you sure you want to delete this recored?");
			if (r == true) {
				window.location = "${pageContext.request.contextPath}/stud/" + id + "/delete";
			} 
		}
		
		$(document).ready(function(){
		    $('#studTable').DataTable();
		});
		
	</script>
	-->

</body>



</html>