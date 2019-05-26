<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                String sql = "SELECT * FROM image_table";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String filename = rs.getString("filename");
                    String path = rs.getString("path");
        %>

        <table style="width:100%" border="2">
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Image</th>
                <th>Path</th>
            </tr>
            <tr>
                <td><%=id%></td>
                <td><%=firstname%></td>
                <td><%=lastname%></td>
                <td><image src="<%=filename%>" width="150" height="200"/></td>
                <td><%=path%></td>
            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
