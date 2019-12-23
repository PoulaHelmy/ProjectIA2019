

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*if user has logged in redirect it to the home page based on type*/
if(session.getAttribute("username")!=null)
{
    if(session.getAttribute("usertype")=="candidate")
    {
        response.sendRedirect("candidateHome.jsp");
    }
    else if(session.getAttribute("usertype")=="hr")
    {
        response.sendRedirect("hrHome.jsp");
    }
}

    /*else redirect to the login page*/
response.sendRedirect("login.jsp");

%>