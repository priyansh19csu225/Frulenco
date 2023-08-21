<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Account Info</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
 
   <div class="bg-dark pt-4 pb-4 text-center">
    <h3>Account Info</h3>
   </div>
   
   <div class="row justify-content-left mt-5">
    <div class="col-auto">
      <table class="table table-responsive">
      	<tr>
      		<td>User Name:</td>
      		<td>${pageContext.request.userPrincipal.name}</td>
      	</tr>
      	<tr>
      		<td>Role:</td>
      	<c:forEach items="${userDetails.authorities}" var="auth">
      		
            	<td>${auth.authority }</td>
            </tr>
        </c:forEach>
      </table>
      </div>
      </div>
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>