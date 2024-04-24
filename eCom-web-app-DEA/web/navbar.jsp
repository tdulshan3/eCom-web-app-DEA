
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="navbar.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet"/>
    </head>
    <body>
        <div id="page" class="site">
            <header>
              <div class="header-top">
                <div class="container">
                  <div class="wrapper flexitem">
                      <div class="left">
                          <ul class="flexitem main-links">
                               <li><a href="./index.jsp">Home</a></li>
                             <li><a href="./products/productsMain.jsp">All Products</a></li>
                             <li><a href="#">About</a></li>
                          </ul>
                      </div>
                      <div class="right">
                          <ul class="flexitem main-links">
                             <li><a href="./login&signup.jsp">Sign In / Sign Up</a></li>
                             <li><a href="#">My Account</a></li>
                            </li>
                          </ul>
                      </div>
                 </div>
               </div>
            </div>
    <div class="header-nav">
      <div class="container">
         <div class="wrapper flexitem">
    
              <div class="left flexitem">
                  <div class="logo"><a href=""><span class="circle"></span>.Store</a></div>
                 </div>
           <div class="right">
             <ul class="flexitem second-links">
               <li class="mobile-hide"><a href="#">
                 <div class="icon-large"><i class="ri-heart-line"></i></div>
                    <div class="fly-item"><span class="item-number">0</span></div>
                      </a></li>
                    <li><a href="./cart.jsp" class="iscart">
                        <div class="icon-large">
                            <i class="ri-shopping-cart-line"></i>
                            <div class="fly-item"><span class="item-number">0</span></div>
                        </div>
                        <div class="icon-text">
                            <div class="mini-text">Total</div>
                            <div class="cart-total">$0.00</div>
                        </div>
                        </a></li>
              </ul>
            </div>
          </div>
        </div>
       </div>
   </header>
  </div>
        
        <script></script>
    </body>
</html>