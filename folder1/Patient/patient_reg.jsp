<%-- 
    Document   : patient_reg
    Created on : 12 Aug, 2019, 3:05:04 PM
    Author     : Madhav Maheta
--%>
<%@ page import ="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign up</title>
</head>
  
        <form method="post" action="">
        <br><br>
                <h3>Fill in  Information</h3>
                    
                  <label>Name</label>
                      <input type="text" name="name" placeholder="Enter your name">
                   </br>
                    
                    
                  <label>Password</label>
                      <input type="text" name="pwd" placeholder="Enter a password">
                   </br> 
                    <label>Contact number</label>
                    <input type="number" name="pno" placeholder="phone number">
                   </br> 
                    <label for="pemail">Email id</label>
                    <input type="text" name="pemail" id="pemail" placeholder="email id">
                </br>
                  <label>Patient Address</label>
                    <input type="text" name="street" placeholder="Street Address">
                      <label for="area">Locality/Area</label>
                      <input type="text" name="area" id="area" placeholder="Area">
                      <label for="aadhar">Aadhaar</label>
                      <input type="number" name="aadhar" id="aadhar" placeholder="Aadhaar Number">
                   </br> 
                    <label>State</label>
                    <select  name="state">
                      <option value="state" >State</option>
                  <option value="AP">Andhra Pradesh</option>
                  <option value="Arunachal">Arunachal pradesh</option>
                  <option value="Assam">Assam</option>
                  <option value="KA">Karnataka</option>
                  <option value="GJ">Gujarat</option>
                  <option value="RJ">Rajasthan</option>
                  <option value="MH">Maharashtra</option>
                  <option value="DL">Delhi</option>
                  <option value="GA">Goa</option>
                  <option value="UP">UttarPradesh</option>
                  </select>
                   </br>
                    <label>Country</label>
                    
                    <select  name="country">
                      <option value="country">Country</option>
                  <option value="India">India</option>
                    </select>
                   </br>
                   
                   <center><input type="submit" name="submit"></center>
                    </a>
       </br>
              </form>
            
</body>
</html>
<%
        String pswd=request.getParameter("pwd");
	String country=request.getParameter("country");
	String aadhar=request.getParameter("aadhar");
	String locality=request.getParameter("area");
	String street=request.getParameter("street");
	String pemail=request.getParameter("pemail");
	String pno=request.getParameter("pno");
	String state=request.getParameter("state");
	String name=request.getParameter("name");
	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root",""); 
        Statement stmt= con.createStatement(); 
        if(name!=null&& pemail!=null&& pno!=null&& street!=null&& locality!=null&& aadhar!=null&& state!=null&&country!=null&&pswd!=null)
        {
         int flag = stmt.executeUpdate("INSERT INTO `patients_info` (`name`, `email`, `contact_no`, `street`, `locality`, `aadhar`, `state`, `country`, `password`) VALUES ('"+name+"','"+pemail+"',"+pno+",'"+street+"','"+locality+"', '"+aadhar+"','"+state+"','"+country+"','"+pswd+"')");
         if(flag>0)
         {
            out.print("Registered");
          }
        }
%>