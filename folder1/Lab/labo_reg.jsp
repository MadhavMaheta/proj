<%-- 
    Document   : labo_reg
    Created on : 15 Jul, 2019, 5:51:27 PM
    Author     : Madhav Maheta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" type="text/css" href="labo_reg.css">
    </head>
    <body>
         <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo bac_img">
             <div class="wrapper wrapper--w680">
                <div class="card card-1">
                    <div class="card-heading">e-HealthCare</div>
       <form method="post" action="" name="laboReg">
             <p><b>Registration Form</b></p>
             Laboratry Name:<input type="text" name="labName"/><br/><br/>
             ISO number:<input type="text" name="labISO"/><br/><br/>
             Address:<input type="text" name="labAdd"/><br/><br/>
             City:<input type="text" name="labCity"/><br/><br/>
             State:<input type="text" name="labState"/><br/><br/>
             Pincode:<input type="text" name="labPin"/><br/><br/>
             Phone Number:<input type="text" name="labPhone"/><br/><br/>
             Establishment year:<input type="text" name="labEst"/><br/><br/>
                       <div class="p-t-20">
                            <button class="btn btn--radius btn--green" type="submit">Submit</button>
                        </div>
             <a href="">About us</a>
          </form>
           </div>
             </div>
             </div>
    </body>
</html>


<% 
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HMS","root","");
               Statement stmt=con.createStatement();
               
               String labName = request.getParameter("labName");
               String labISO = request.getParameter(request.getParameter("labISO"));
               String labAdd =request.getParameter(request.getParameter("labAdd"));
               String labCity = request.getParameter("labCity");
               String labState = request.getParameter("labState");
               String labPin = request.getParameter("labPin");
               String labPh = request.getParameter("labPhone");
               String labEst = request.getParameter("labEst");
               
               int row=stmt.executeUpdate("INSERT INTO lab_detail (lab_name,lab_ISO,lab_add,lab_city,lab_state,lab_pin,lab_ph,lab_eyear) "+ "VALUES ('"+labName+"','"+labISO+"','"+labAdd+"','"+labCity+"','"+labState+"','"+labPin+"','"+labPh+"','"+labEst+"')");
               if(row>0){
                              out.print("registered");    
               }
%>