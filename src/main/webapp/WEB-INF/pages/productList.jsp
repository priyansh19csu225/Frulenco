<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
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
   <h3>Product List</h3>
   <p class="subtext">(Rates mentioned here are on monthly basis.)</p>
   </div>
 
 <div class="container-fluid text-center bg-light pt-3 pb-3">
   
   <form method="POST"
           action="${pageContext.request.contextPath}/category">
          
  <span class="cat-opt mr-5">Choose category: </span>
  
  <input class="cat-opt-item" type="submit"  name="test1" value="Bedroom">
  
  <input class="cat-opt-item" type="submit" name="test1" value="Kitchen">
 
  <input class="cat-opt-item" type="submit" name="test1" value="All">
 

          
       </form>
   
   </div>
   
   
   
	 <div class="row mt-5 mb-5 text-center">

   <c:forEach items="${paginationProducts.list}" var="prodInfo">
       <div class="product-preview-container col-lg-4 col-sm-6">
           <ul>
               <li><img class="product-image"
                   src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" /></li>
               <li>Code: ${prodInfo.code}</li>
               <li>Name: ${prodInfo.name}</li>
               <li>Price: <fmt:formatNumber value="${prodInfo.price}" type="currency"/></li>
               <li><a
                   href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
                       Buy Now</a></li>
                       
               
               <security:authorize  access="hasRole('ROLE_MANAGER')">
                 <li><a style="color:red;"
                     href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                       Edit Product</a></li>
                       <li><a style="color:red;"
                     href="${pageContext.request.contextPath}/deleteProduct?code=${prodInfo.code}">
                       Delete Product</a></li>
               </security:authorize>
           </ul>
       </div>
 
   </c:forEach>
   
</div>   
  
   <br/>
  
 
   <c:if test="${paginationProducts.totalPages > 1}">
       <div class="page-navigator text-center">
          <c:forEach items="${paginationProducts.navigationPages}" var = "page">
          <div class="border border-dark rounded pageNo ml-3 mr-3">
              <c:if test="${page != -1 }">
                <a href="productList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
              </div>
          </c:forEach>
          
       </div>
   </c:if>
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>