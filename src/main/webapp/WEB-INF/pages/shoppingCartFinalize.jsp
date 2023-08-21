<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Shopping Cart Finalize</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
   <jsp:include page="_header.jsp" />
   
   <div class="bg-dark pt-4 pb-4 text-center">
   <h3>Finalize</h3>
   </div>
  
   <div class="container pt-4">
       <h3 class="mt-4 mb-4">Thank you for Order</h3>
       Your order number is: ${lastOrderedCart.orderNum}
   </div>
   <div class="container text-center">
   <a class="navi-item btn"
               href="${pageContext.request.contextPath}/productList">Continue
               Shopping</a>
 </div>
   <jsp:include page="_footer.jsp" />
 
</body>
</html>