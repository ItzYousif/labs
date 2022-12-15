<%-- 
    Document   : login
    Created on : Nov 22, 2022, 2:46:16 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/index.js"></script>
        <title>Login</title>
    </head>
    <body>
        <div>
            <nav>
                <div class="container-fluid">
                    <div class="navbar-header navbar-left" style="text-align: center">
                        <li>
                            <a class="button" href="index.jsp">home</a> &nbsp;
                            <a class="button" href="strings.jsp">strings</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>
        <%
            String exist = (String) session.getAttribute("error");
        %>
        <div style="margin: auto;">
            <form method="POST" action="adminAction.jsp">
                <table class="table">
                    <caption>Sign In <span class="message"><%= (exist != null) ? exist : ""%></span></caption>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="Enter your email" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="Enter your password" /></td></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                            <input class="button" type="submit" value="Sign In" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <% exist = "";%>
        <div id="clock" class="footer"></div>
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
