<%-- 
    Document   : login
    Created on : 28-Nov-2022, 8:20:37 PM
    Author     : 236369
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                            <a class="button" href="strings.jsp">strings</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>
        <div style="margin: auto;">
            <%  String exist = (String) session.getAttribute("error");
                String emailError = (String) session.getAttribute("emailError");
                String passError = (String) session.getAttribute("passError");
            %>
            <form method="POST" action="loginAction.jsp">
                <table class="table" >
                    <caption>Sign In <span class="message"><%= (exist != null) ? exist : ""%></span></caption>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="<%= (emailError != null) ? emailError : "Enter your email"%>" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="<%= (passError != null) ? passError : "Enter your password"%>" /></td></tr>
                    <tr style="text-align: right">
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                        </td>
                        <td>
                            <input class="button" type="submit" value="Sign In" />
                        </td>
                    </tr>

                </table>
            </form>
        </div>
        <% emailError = "";
            passError = "";
            session.setAttribute("emailError", emailError);
            session.setAttribute("passError", passError);
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
