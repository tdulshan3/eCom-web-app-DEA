<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tec</title>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="include.js" defer></script>
</head>
<body>
    <nav>
        <div class="topnav" id="myTopnav">
            <a href="index.html"><img class="logo" src="./logo.jpeg" alt="Logo"></a>
            <a href="#about"><b>About</b></a>
            <a href="#services"><b>Services</b></a>
            <a href="#contact"><b>Contact</b></a>
            <a href="#categouirs"><b>Categouirs <i class="fa fa-caret-down"></i></b></a>
            <div class="dropdown-content">
               
            </div>

         
            <div class="contact-info"><i class="bi bi-phone"></i>Contact: +1234567890</div>
            <div class="search-container">
                <form action="/search" method="GET">
                    <div class="contact-info"><i class="bi bi-search "></i><input type="text" placeholder="Search..." name="search">
                    <button type="submit"></button>

                </form>
            </div>
           <div class="menu">
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>
    </nav>
    <div class="cart">
        <div class="signup">
            <a href="#signup">   signup   </a>
            <div class="contact-info2"><i class="bi bi-cart-dash-fill"></i>

            </div>
            </div>
        </div></div>
    

    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
</body>
</html>

