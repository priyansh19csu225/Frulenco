<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Login</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="login-header.jsp" />
 
 <div class="bg-dark pt-4 pb-4 text-center">
    <h3>Enter username and password</h3>
   </div>


 
   <div class="container text-center justify-content-center">
 
       
       
       <c:if test="${param.error == 'true'}">
           <div style="color: red; margin: 10px 0px;">
 
               Login Failed!!!<br /> Reason :
               ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
 
           </div>
       </c:if>
 
       <form:form method="POST"
           action="${pageContext.request.contextPath}/j_spring_security_check">
          <div class="row justify-content-center mt-5">
    <div class="col-auto">
      <table class="table table-responsive">
               <tr>
                   <td>User Name *</td>
                   <td><input name="userName" /></td>
               </tr>
 
               <tr>
                   <td>Password *</td>
                   <td><input type="password" name="password" /></td>
               </tr>
 
               <tr>
                   <td>&nbsp;</td>
                   <td class="text-left"><input type="submit" value="Login" /> <input type="reset"
                       value="Reset" /></td>
               </tr>
           </table>
    </div>
  </div>
       </form:form>
 
       <span class="error-message">${error }</span>
       
       If not already registered, <a href="Registration">Sign up</a>
       
   </div>
   
   
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>