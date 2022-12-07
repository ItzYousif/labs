<%-- 
    Document   : square
    Created on : Nov 23, 2022, 1:46:27 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% String s = request.getParameter("S"); %>
        <%!
            int freq(char c, String s) {
                s.toLowerCase();
                int count = 0;
                for (int i = 0; i < s.length(); i++) {
                    if (c == s.charAt(i)) {
                        count++;
                    }
                }
                return count;
            }


        %>
        <% String vowels = "aioue";

            char a = vowels.charAt(0);
            int aFreq = freq(vowels.charAt(0), s);

            char i = vowels.charAt(1);
            int iFreq = freq(vowels.charAt(1), s);

            char o = vowels.charAt(2);
            int oFreq = freq(vowels.charAt(2), s);

            char u = vowels.charAt(3);
            int uFreq = freq(vowels.charAt(3), s);

            char e = vowels.charAt(4);
            int eFreq = freq(vowels.charAt(4), s);


        %>

        <table  class="myTable">
            <caption>vowels frequency</caption>
            <thead><th>I</th><th>vowels</th></thead>

        <tr class="myTable">
            <td><%= a%></td>
            <td><%= aFreq%></td>
        </tr>
        <tr class="myTable">
            <td><%= i%></td>
            <td><%= iFreq%></td>
        </tr>
        <tr class="myTable">
            <td><%= o%></td>
            <td><%= oFreq%></td>
        </tr>
        <tr class="myTable">
            <td><%= u%></td>
            <td><%= uFreq%></td>
        </tr>
        <tr class="myTable">
            <td><%= e%></td>
            <td><%= eFreq%></td>
        </tr>
    </tr>

</table>
<table class="myTable">
    <thead style="text-align: center"><th>compressed string</th><th>number of spaces</th></thead>
<td style="color: cyan; text-align: center"> <%= s.replaceAll("\\s+", "")%> </td>
<td style="color: cyan; text-align: center"><%= s.length() - s.replaceAll(" ", "").length()%></td>
</table>

</body>
</html>
