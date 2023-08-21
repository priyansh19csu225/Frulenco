<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Shopping Cart Confirmation</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
  <jsp:include page="_header.jsp" />
  <fmt:setLocale value="en_US" scope="session"/>
 

 <div class="bg-dark pt-4 pb-4 text-center">
   <h3>Confirmation</h3>
   </div>
 
 
 
 	<div class="row mt-5 mb-5 text-center">
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
          <div class="product-preview-container col-lg-4 col-sm-6">
              <ul>
                  <li><img class="product-image"
                      src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></li>
                  <li>Code: ${cartLineInfo.productInfo.code} <input
                      type="hidden" name="code" value="${cartLineInfo.productInfo.code}" />
                  </li>
                  <li>Name: ${cartLineInfo.productInfo.name}</li>
                  <li>Price: <span class="price">
                     <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                  </span>
                  </li>
                  <li>Quantity: ${cartLineInfo.quantity}</li>
                  <li>Subtotal:
                    <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                    </span>
                  </li>
              </ul>
          </div>
      </c:forEach>
 
  </div>
 
 
  <div class="container">
      <h3>Customer Information:</h3>
      
      
      
      <table class="mt-4 mb-4 ml-5">
      	<tr class="mt-2 mb-2">
      		<td>Name:</td>
      		<td>${myCart.customerInfo.name}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Email:</td>
      		<td>${myCart.customerInfo.email}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Phone:</td>
      		<td>${myCart.customerInfo.phone}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Address:</td>
      		<td>${myCart.customerInfo.address}</td>
      	</tr>
      </table>
      
      <h3 class="mb-3">Cart Summary:</h3>
      
      
      <table class="mt-4 mb-4 ml-5">
      	<tr class="mt-2 mb-2">
      		<td>Quantity:</td>
      		<td>${myCart.quantityTotal}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Total:</td>
      		<td><span class="total">
            <fmt:formatNumber value="${myCart.amountTotal}" type="currency"/>
          </span></td>
      	</tr>
      </table>
  </div>
 
  <form method="POST"
      action="${pageContext.request.contextPath}/shoppingCartConfirmation">
 <div class="bg-light text-center">
      <!-- Edit Cart -->
      <a class="navi-item btn"
          href="${pageContext.request.contextPath}/shoppingCart">Edit Cart</a>
 
      <!-- Edit Customer Info -->
      <a class="navi-item btn"
          href="${pageContext.request.contextPath}/shoppingCartCustomer">Edit
          Customer Info</a>
 
      <!-- Send/Save -->
      <input type="submit" value="Confirm" class="button-send-sc btn" />
      </div>
  </form>
 
  
 
  <jsp:include page="_footer.jsp" />
 
</body>
</html>