<%-- 
    Document   : strings
    Created on : 23-Nov-2022, 8:30:36 PM
    Author     : 236369
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/layout.css" />
        <script type="text/javascript" src="JS/index.js" defer></script>
        <title>strings</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left" style="text-align: center">
                    <a class="button" href="index.jsp">home</a>      
                </div>
                <div class="navbar navbar-dark bg-dark">
                    <form class="navbar-form navbar-left" action="strings.jsp">
                        <div class="input-group" style="text-align: right; margin-right: 2.5%">
                            <input id="S"  type="text" name="S" class="form-control" placeholder="entre a text..." autofocus>                   
                        </div>
                    </form>
                </div>
            </div>

        </nav>

        <div class="container-fluid">
            <jsp:include page="vowels.jsp" flush="true"/>
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
