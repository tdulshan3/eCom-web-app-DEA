
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       
        HttpSession session1 = request.getSession(false);

        
        if (session1 != null) {
            
            session1.removeAttribute("userId");

           
            session1.invalidate();
        }

      
        response.sendRedirect("index.jsp");
    %>
    </body>
</html>
