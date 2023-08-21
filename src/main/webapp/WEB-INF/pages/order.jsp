<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
   <jsp:include page="_header.jsp" />
    
   <fmt:setLocale value="en_US" scope="session"/>
 
   
   <div class="bg-dark pt-4 pb-4 text-center">
   <h3>Order Info</h3>
   </div>
   
   <div class="container mt-4 ml-3">
   
   <c:set value = "${fn:split(orderInfo.customerName, '_')}" var="names" />
      <h3>Customer Information:</h3>
      
      
      
      <table class="mt-4 mb-4 ml-5">
      	<tr class="mt-2 mb-2">
      		<td>Name:</td>
      		<td>${names[fn:length(names)-1]}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Email:</td>
      		<td>${orderInfo.customerEmail}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Phone:</td>
      		<td>${orderInfo.customerPhone}</td>
      	</tr>
      	<tr class="mt-2 mb-2">
      		<td>Address:</td>
      		<td>${orderInfo.customerAddress}</td>
      	</tr>
      </table>
      
      <h3 class="mb-3">Order Summary:</h3>
      
      
      <table class="mt-4 mb-4 ml-5">
      	<tr class="mt-2 mb-2">
      		<td>Total:</td>
      		<td><span class="total">
           <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
           </span></td>
      	</tr>
      </table>
  </div>
 
   
    
   <br/>
    
    <div class="container">
   <table border="1" style="width:100%">
       <tr>
           <th>Product Code</th>
           <th>Product Name</th>
           <th>Quantity</th>
           <th>Price</th>
           <th>Amount</th>
       </tr>
       <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
           <tr>
               <td>${orderDetailInfo.productCode}</td>
               <td>${orderDetailInfo.productName}</td>
               <td>${orderDetailInfo.quanity}</td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.price}" type="currency"/>
               </td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.amount}" type="currency"/>
               </td>  
           </tr>
       </c:forEach>
   </table>
   
   </div>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
            
       </div>
   </c:if>
 
 
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>