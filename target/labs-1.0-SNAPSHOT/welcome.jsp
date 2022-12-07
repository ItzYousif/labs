<%-- 
    Document   : welcome
    Created on : Nov 23, 2022, 11:35:43 AM
    Author     : George
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/layout.css" />
        <script type="text/javascript" src="JS/index.js" defer></script>
        <title class="center">welcome</title>
    </head>
    <body><% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
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
        <div>
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");

                String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
                String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";

                if (!email.matches(emailRegEx)) {
                    session.setAttribute("emailError", "Incorrect email format");
                    response.sendRedirect("register.jsp");
                } else if (!password.matches(passRegEx)) {
                    session.setAttribute("passError", "Incorrect password format");
                    response.sendRedirect("register.jsp");
                } else {
                    User user = new User(name, email, password, dob);
                    Users users = userDAO.getUsers();

                    User userXML = users.user(user.getEmail());

                    if (userXML != null) {
                        session.setAttribute("error", "User already exists");
                        response.sendRedirect("register.jsp");
                    } else {
                        users.add(user);
                        userDAO.save(users, filename);
                        session.setAttribute("user", user);
                    }
                }
            %>

            <table class="table">
                <% if ((name.length() != 0) && (password.length() != 0)) %><% {%>
                <caption>User Information</caption>
                <tr><td>Name: </td><td> <%= name%></td></tr>
                <tr><td>Email: </td><td> <%= email%></td></tr>
                <tr><td>D.O.B.: </td><td> <%= dob%></td></tr>
                <% } else { %>
                <div class="message" style="text-align: center" ><br><br> 
                    <% out.println("have not logged in!"); %>
                </div>
                <% }%>
            </table>
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
