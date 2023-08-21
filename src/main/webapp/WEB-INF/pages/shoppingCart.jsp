<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Shopping Cart</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>

   <jsp:include page="_header.jsp" />
  
   <fmt:setLocale value="en_US" scope="session"/>
 
   <div class="bg-dark pt-4 pb-4 text-center">
   <h3>My Cart</h3>
   </div>
 
   <c:if test="${empty cartForm or empty cartForm.cartLines}">
   <div class="container mt-4 mb-4">
       <h2 class="mt-4 mb-4">There is no items in Cart</h2>
       <a href="${pageContext.request.contextPath}/productList">Show
           Product List</a>
         </div>
   </c:if>
 
   <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
       <form:form method="POST" modelAttribute="cartForm"
           action="${pageContext.request.contextPath}/shoppingCart">
           
           <div class="row mt-5 mb-5 text-center">
 
           <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
               varStatus="varStatus">
               <div class="product-preview-container col-lg-4 col-sm-6">
                   <ul>
                       <li><img class="product-image"
                           src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
                       </li>
                       <li>Code: ${cartLineInfo.productInfo.code} <form:hidden
                               path="cartLines[${varStatus.index}].productInfo.code" />
 
                       </li>
                       <li>Name: ${cartLineInfo.productInfo.name}</li>
                       <li>Price: <span class="price">
                      
                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                        
                       </span></li>
                       <li>Quantity: <form:input
                               path="cartLines[${varStatus.index}].quantity" /></li>
                       <li>Subtotal:
                         <span class="subtotal">
                        
                            <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                      
                         </span>
                       </li>
                       <li><a
                           href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                               Delete </a></li>
                   </ul>
               </div>
           </c:forEach>
           </div>
           
           <div class="bg-light text-center">
           <input class="button-update-sc btn" type="submit" value="Update Quantity" />
           
           
           <c:choose>
           
           	<c:when test="${pageContext.request.userPrincipal.name == null}">
           
           		<a class="navi-item btn"
               		href="${pageContext.request.contextPath}/login">BUY NOW</a>
               		
               <!--   <script type="text/javascript">
                	alert("Please login first!");
                </script>  -->
           	
           	</c:when>
           	<c:otherwise>
           	
           		<a class="navi-item btn"
               		href="${pageContext.request.contextPath}/shoppingCartCustomer">BUY NOW</a>
           	
           	</c:otherwise>
           </c:choose>
           
               
           <a class="navi-item btn"
               href="${pageContext.request.contextPath}/productList">Continue
               Buy</a>
               
               </div>
       </form:form>
 
 
   </c:if>
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>