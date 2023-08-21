<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">

</head>

<body>


  <jsp:include page="loc-header.jsp" />



  <section id="location">
    <div class="container-fluid mt-5 mb-5">

      <div class="container city-selector">
        <div class=" container city-selector-top pt-5 pb-5 mb-5">
          <h3>Please Select Your City</h3>
        </div>



        <div class="location-form">
          <form method="POST" action="${pageContext.request.contextPath}/location">


            <div class="row mt-3 mb-5">

              <div class="col-lg-6 text-center loc-col ">
                <!-- <i class="fas fa-check-circle fa-4x mb-3"></i>
                <p class="pl-4 pr-4">Delhi</p> -->

                <label>
                  <br>
                  <img class="loc-img img-fluid rounded border border-dark mb-4" src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Findiaongo.in%2Fwp-content%2Fuploads%2F2016%2F08%2Findia-gate.jpg&f=1&nofb=1">
                  <br>
                  <input type="submit" name="test" value="Delhi" checked>
                  <br>
                </label>
              </div>

              <div class="col-lg-6 text-center loc-col ">
                <!-- <i class="fas fa-bullseye fa-4x mb-3"></i>
                <p class="pl-4 pr-4">Faridabad</p> -->


                <label>
                  <br>
                  <img class="loc-img img-fluid rounded border border-dark mb-4" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-s%2F05%2F09%2F7e%2F7e%2Fraja-nahar-singh-palace.jpg&f=1&nofb=1">
                  <br>
                  <input type="submit" name="test" value="Faridabad">
                  <br>
                </label>
              </div>


            </div>
          </form>

          <div class="text-center mb-3">
            <span class="error-message text-center">${error }</span>
          </div>


        </div>

      </div>

    </div>


    <jsp:include page="_footer.jsp" />

</body>

</html>

 