<%-- 
    Document   : account
    Created on : Nov 29, 2022, 11:15:21 AM
    Author     : George
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="CSS/layout.css"/>
        <script type="text/javascript" src="JS/index.js"></script>
    </head>
    <body>
        <div>
            <nav>
                <!-- <h1 class="homepage" style="text-align: left">Home page</h1> -->
                <div class="container-fluid">
                    <div class="navbar-header navbar-left" style="text-align: center">
                        <li>
                            <a class="button" href="main.jsp">main</a>&nbsp;
                            <a class="button" href="logout.jsp">logout</a>
                        </li>
                    </div>
                </div>
            </nav>
        </div>
        <%!
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String submitted = request.getParameter("submitted");

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                user = (User) session.getAttribute("user");
                user.update(ID, name, email, password, dob);
                
                Users users = userDAO.getUsers();
                userDAO.update(users, user);
                session.setAttribute("user", user);
            } else {
                user = (User) session.getAttribute("user");
            }
        %>
        <div style="margin: auto;">
            <form method="POST" action="account.jsp">
                <table class="table">
                    <caption>Edit User <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></caption>
                    <tr><td>ID: </td><td><input type="text" name="ID" value="${user.ID}" readonly="true" /></td></tr>
                    <tr><td>Name: </td><td><input type="text" name="name" value="${user.name}" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" value="${user.email}" readonly="true"/></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" value="${user.password}" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDOB()%>"/></td></tr>
                    <tr><input type="hidden" name="submitted" value="submitted"></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="button" href="main.jsp">Main</a>
                            <input class="button" type="submit" value="Update" />
                        </td>
                    </tr>
                </table>
            </form>
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

