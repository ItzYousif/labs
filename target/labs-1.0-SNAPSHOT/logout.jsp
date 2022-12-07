<%-- 
    Document   : logout
    Created on : Nov 23, 2022, 12:01:33 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/layout.css"/>
        <link rel="stylesheet"  href="CSS/layout.css" />
        <script type="text/javascript" src="JS/index.js" defer></script>
        <title>Logout Page</title>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid" style="text-align: center">
                    <div class="navbar-header navbar-left">
                        <li>
                            <a class="button" href="index.jsp">home</a>   
                        </li>
                    </div>
                </div>
            </nav>
        </div>
        <div class="message" style="text-align: center">
            <p>You have been logged out - Thank you!</p>
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
