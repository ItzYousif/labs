<%-- 
    Document   : index.jsp
    Created on : 23-Nov-2022, 2:51:17 PM
    Author     : 236369
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title class="center">Home</title>
        <link rel="stylesheet"  href="CSS/layout.css" />
        <script type="text/javascript" src="JS/index.js" defer></script>
    </head>
    <body>
        <div>
            <nav>
                <!-- <h1 class="homepage" style="text-align: left">Home page</h1> -->
                <div class="container-fluid">
                    <div class="navbar-header navbar-left" style="text-align: center">
                        <li>
                            <a class="button" href="register.jsp">register</a>&nbsp;
                            <a class="button" href="login.jsp">login</a>&nbsp;
                            <a class="button" href="strings.jsp">strings</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>


        <footer>
            <div id="displayTime">
                <div class="clock">
                    <span id="hours">00</span>
                    <span>:</span>
                    <span id="minutes">00</span>
                    <span>:</span>
                    <span id="seconds">00</span>
                    <span id="session">AM</span>
                </div>
            </div>
        </footer>
    </body>
</html>