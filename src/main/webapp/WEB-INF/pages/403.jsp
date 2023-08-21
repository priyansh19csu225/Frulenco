<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Access Denied</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
 
  
   
    <div class="bg-danger pt-4 pb-4 text-center">
    <h3>Access Denied!</h3>
   </div>
  
  <div class="container text-center mt-5 pt-4">
   <h3>Sorry, you can not access this page!</h3>
   <br>
   <br>
   <a class="btn" href="${pageContext.request.contextPath}/">Back to home page</a>
  </div>
  
  
  
   <jsp:include page="_footer.jsp" />
 
</body>
</html>