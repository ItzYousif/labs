<%-- 
    Document   : register.jsp
    Created on : Nov 23, 2022, 11:28:30 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/index.js"></script>
    </head>
    <body>
        <div>
            <nav>
                <div class="container-fluid">
                    <div class="navbar-header navbar-left" style="text-align: center">
                        <li>
                            <a class="button" href="index.jsp">home</a> &nbsp;
                            <a class="button" href="login.jsp">login</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>


        <div style="margin: auto;">
            <%
                String emailError = (String) session.getAttribute("emailError");
                String passError = (String) session.getAttribute("passError");
                String exist = (String) session.getAttribute("existError");
                String emailPassError = (String) session.getAttribute("emailPassError");
            %>
            <form method="POST" action="welcome.jsp">
                <table class="table" >
                    <caption>Sign Up<br>
                        <span class="message">
                            <%= (exist != null) ? exist : ""%>
                            <%= (emailPassError != null) ? emailPassError : ""%>
                            <%= (emailError != null) ? emailError : ""%>
                            <%= (passError != null) ? passError :""%>
                    </caption>

                    <tr><td>Name: </td><td><input type="text" name="name" placeholder="Enter your name" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="Enter you email" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="Enter your password" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob"/></td></tr>
                    <tr style="text-align: right">
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                        </td>
                        <td>
                            <input class="button" type="submit" value="Sign Up" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <% emailError = "";
            passError = "";
            emailPassError = "";
            exist = "";
            session.setAttribute("emailError", "");
            session.setAttribute("passError", "");
            session.setAttribute("emailPassError", "");
            session.setAttribute("exist", "");
        %>
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
