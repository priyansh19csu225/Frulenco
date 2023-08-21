<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
 
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;900&family=Ubuntu:wght@300;400;700&display=swap" rel="stylesheet">

  <!-- CSS Stylesheets -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="styles.css">

  <!-- Font Awesome -->
  <script src="https://kit.fontawesome.com/1c9ad4b785.js" crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

  <section id="title">

  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Frenlco</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/productList">Product List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/shoppingCart">My Cart</a>
      </li>
      <security:authorize access="hasAnyRole('ROLE_USER','ROLE_MANAGER','ROLE_EMPLOYEE')">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/orderList">Order List</a>
        </li>
      </security:authorize>
      <security:authorize access="hasAnyRole('ROLE_MANAGER')">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/product">Create Product</a>
        </li>
      </security:authorize>

      <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/Registration">Sign Up</a>
        </li>
      </c:if>

      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/accountInfo">
                ${pageContext.request.userPrincipal.name} </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
        </li>
      </c:if>

    </ul>
    </div>

  </nav>

  </section>