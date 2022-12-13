<%-- 
    Document   : loginAction
    Created on : Nov 22, 2022, 2:50:51 PM
    Author     : George
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/index.js"></script>
        <title>Login Action</title>
    </head>
    <body>
        <div>
            <nav>
                <div class="container-fluid">
                    <div class="navbar-header navbar-left" style="text-align: center">
                        <li>
                            <a class="button" href="logout.jsp">logout</a>
                            <a class="button" href="main.jsp">main</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>
        <div style="align-content: center">
            <div>
                <%!
                    User user;
                %>
                <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
                <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
                    <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
                </jsp:useBean>
                <%

                    String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
                    String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";

                    String submitted = request.getParameter("submitted");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    if (!email.matches(emailRegEx) && (!password.matches(passRegEx))) {
                        session.setAttribute("emailPassError", "Incorrect email & password format");
                        response.sendRedirect("login.jsp");

                    } else {

                        if (!email.matches(emailRegEx)) {
                            session.setAttribute("emailError", "Incorrect email format");
                            response.sendRedirect("login.jsp");
                        } else if (!password.matches(passRegEx)) {
                            session.setAttribute("passError", "Incorrect password format");
                            response.sendRedirect("login.jsp");
                        } else {
                            Users users = userDAO.getUsers();

                            User user = users.user(email, password);

                            if (user != null) {
                                session.setAttribute("user", user);
                            } else {
                                session.setAttribute("error", "User does not exist");
                                response.sendRedirect("login.jsp");
                            }
                        }
                    }%>
            </div>
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
