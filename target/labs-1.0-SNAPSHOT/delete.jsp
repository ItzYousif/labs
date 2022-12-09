<%-- 
    Document   : delete
    Created on : 09-Dec-2022, 10:30:27 AM
    Author     : 236369
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title class="center">Delete</title>
    <link rel="stylesheet"  href="CSS/layout.css" />
    <script type="text/javascript" src="JS/index.js" defer></script>
</head>
<body>
    <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
    <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
        <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
    </jsp:useBean>
    <div>
        <nav>
            <!-- <h1 class="homepage" style="text-align: left">Home page</h1> -->
            <div class="container-fluid">
                <div class="navbar-header navbar-left" style="text-align: center">
                    <li>
                        <a class="button" href="logout.jsp">logout</a>&nbsp;
                        <a class="button" href="account.jsp">account</a>
                    </li>
                </div>
            </div>
        </nav>
    </div>
    <div class="center"><p>Are you sure you want to delete your account?</p>
        <li>
            <a class="button" href="index.jsp" <% User user = (User) session.getAttribute("user");
            Users users = userDAO.getUsers();
            users.remove(user);
            userDAO.save(users, filename);
            session.setAttribute("users", users);
        %>>YES</a>&nbsp;
            <a class="button" href="account.jsp">NO</a>
        </li>
        


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
