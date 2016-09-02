<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/jquery_dataTables.css">
<script src="${ pageContext.request.contextPath}/resources/js/jquery.js"></script>
<!--  <script src="${ pageContext.request.contextPath}/resources/js/jquery_dataTables.js"></script>-->

<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="bar.jsp" />
<div class="col-md-6 col-md-offset-3">
<h3>Students Information Table</h3>
<table id ="studTable" border="1" class="table table-striped" >
	<thead>
		<tr>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Rollno</th>
			<th>Subject</th>
			<th>College</th>
			<th >Manupulation</th>
		</tr>
	</thead>
	
	<tbody>
			<c:forEach var="row" items="${studentList}">
			
			<tr>
				<td>${row.firstName }</td>
				<td>${row.lastName }</td>
				<td>${row.rollNo }</td>
				<td>${row.subject }</td>
				<td>${row.collegeName }</td>
				<td>
					<button class="btn btn-success" onClick="editStud(${row.id})"  >
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
					</button>
					<button class="btn btn-danger" onClick="deleteStud(${row.id})">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</td>
				
			
			</c:forEach>
	</tbody>
</table>


<c:forEach var="i" begin="1" end="${pageCount }">
   
   <a href="${pageContext.request.contextPath}/liststudent/?offset=${i-1}">${i}</a>
</c:forEach>



</div>

<script type="text/javascript">
		function editStud(id){
			location.href = "${pageContext.request.contextPath}/stud/" + id + "/edit";
		}
	
		function deleteStud(id){
			var r = confirm("Are you sure you want to delete this recored?");
			if (r == true) {
				window.location = "${pageContext.request.contextPath}/" + id + "/delete";
			} 
		}
		
		$(document).ready(function(){
		    $('#studTable').DataTable();
		});
		
		
	</script>
</body>
</html>