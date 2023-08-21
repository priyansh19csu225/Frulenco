<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>

	<jsp:include page="login-header.jsp" />
 
 <div class="bg-dark pt-4 pb-4 text-center">
    <h3>Register Here!</h3>
   </div>

	<div class="container text-center">
	<form:form method="POST" modelAttribute="accountInfo"
       action="${pageContext.request.contextPath}/RegistrationSuccess">
           <div class="row justify-content-center mt-5">
    <div class="col-auto">
      <table class="table table-responsive">
               <tr>
                   <td>User Name *</td>
                   <td><input name="userName" /></td>
                   <td><form:errors path="userName" cssClass="error-message" /></td>
                   <c:if test="${not empty error}">
                   <p class="error-message">Error: ${error}</p>
                   </c:if>
               </tr>
 
               <tr>
                   <td>Password *</td>
                   <td><input type="password" name="password" /></td>
                   <td><form:errors path="password" cssClass="error-message" /></td>
               </tr>
 
                
               
               <tr>
                   <td>&nbsp;</td>
                   <td class="text-left"><input type="submit" value="Register" /> <input type="reset"
                       value="Reset" /></td>
               </tr>
           </table>
           <input type="hidden" name="active" value="1" />
           <input type="hidden" name="userRole"  value="USER" />
    </div>
  </div>
       </form:form>
       
       If already registered, <a href="login">Sign in</a>
       
       </div>

</body>
</html>