<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
    </head>
    <body>
        <%

            
               
               Connection conn = null;
               String url="jdbc:mysql://localhost:3306/";
               String dbName ="database2";
               String  driver="com.mysql.jdbc.Driver";
               String userName="root";
               String password="";
               Statement st;
             try{
                Class.forName(driver).newInstance();
                conn= DriverManager.getConnection(url+dbName,userName,password);
                st=conn.createStatement();
                int imageid = Integer.parseInt(request.getParameter("id"));
                String sql = "SELECT filename FROM image_table where id=" + imageid + "";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>

        <table style="width:100%">
            <tr>
                <th>Id</th>
                <th>Image</th>

            </tr>
            <tr>
                <td><%=imageid%></td><td>
                <td><td><image src="<%=filename%>" width="200" height="200"/></td>

            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %><br>
    <center><a href="viewAll.jsp">View All </a></center>
</body>
</html>
